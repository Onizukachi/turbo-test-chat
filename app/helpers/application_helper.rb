module ApplicationHelper
  def render_turbo_stream_flash_messages
    turbo_stream.replace 'flash', partial: 'shared/flashes'
  end
end
