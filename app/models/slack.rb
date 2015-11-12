class Slack
  def initialize token
    @token = token
  end

  def id_of_room room_name
    room_list = HTTParty.post "https://slack.com/api/channels.list",
      query: { token: @token }
    found = room_list["channels"].find { |c| c["name"] == room_name }
    found["id"]
  end

  def messages_from_room room_name
    resp = HTTParty.post "https://slack.com/api/channels.history",
      query: { token: @token, channel: id_of_room(room_name) }
    resp["messages"]
  end
end
