class MessagesController < ApplicationController
  before_action :json_format, only: :message_data

  def index
  end

  def demo
  end

  def message_data
    @messages = Message.all
  end

private

  def json_format
    request.format = :json
  end
end
