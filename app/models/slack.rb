class Slack
  def initialize token
    @token = token
  end

  def id_of_room room_name
    room_list = call "channels.list"
    found = room_list["channels"].find { |c| c["name"] == room_name }
    found["id"]
  end

  def messages_from_room room_name
    resp = call "channels.history", channel: id_of_room(room_name)
    resp["messages"]
  end

private

  def call endpoint, options={}
    options[:token] = @token
    HTTParty.post "https://slack.com/api/#{endpoint}", query: options
  end
end
