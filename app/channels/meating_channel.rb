# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MeatingChannel < ApplicationCable::Channel
  
 	before_action: authenticate_user!, :only => :subscribed


  def subscribed
     stream_from 'current_meeting' # _'#{meeting_id}'
  end

  def speak(data)
  	ApplicationCable.server.broadcast('current_meeting',
  		message: render_message(data['current_meeting']))

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def join
  end
  
  private

  def render_meeting('current_meeting')
  	ApplicationController.render(partial: 'meetings/meeting',
  									locals: {meeting: current_meeting})
  end


end
