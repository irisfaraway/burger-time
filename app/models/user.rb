class User < ActiveRecord::Base
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false }

  private

  class << self
    def find_or_create_user(username)
      uri = URI.parse('http://www.bath.ac.uk/personfinder/dataquery/api.php?search=true&type=json&terms=' + username)
      http = Net::HTTP.new(uri.host, uri.port)

      User.find_or_create_by(username: username) do |u|
        response = http.request(Net::HTTP::Get.new(uri.request_uri))
        if response.code == '200'
          person_finder_data = JSON.parse(response.body)
          u.display_name = person_finder_data['people'][0]['displayname']
        end
      end
    end
  end
end
