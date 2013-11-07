class MessagesController < ApplicationController

  def new
    @message = Message.new
    @recipient = User.find(params[:recipient_id]) if params[:recipient_id]
  end

  def create
    @message = current_user.sent_messages.build(message_params)
    @valid = @message.save
    respond_to do |format|
      format.html do
        redirect_to @message
      end
      format.js do
      end
    end
  end

  def destroy
    redirect_to :back
  end

  def mass_destroy
    Message.remove_user(current_user, params[:user_ids])
    redirect_to messages_path
  end

  def index
    @contacts = current_user.contacts
  end

  def poll # format.js
    case params[:parent_action]
    when 'show'
      new_messages = current_user.received_messages.where(
        sender_id: params[:contact_id], read: false
      )
      @new_messages = new_messages.order('created_at ASC').all
      new_messages.update_all(read: true)
    else
    end
    render 'application/poll'
  end

  def show
    contact = if params[:contact_id]
      User.find(params[:contact_id])
    else
      message = Message.find(params[:id])
      message.sender == current_user ? message.recipient : message.sender
    end
    if current_user.contacts.include? contact
      set = [contact, current_user]
      @messages = Message.where(sender_id: set, recipient_id: set).order('created_at ASC')
      Message.where(sender_id: contact, recipient_id: current_user).update_all(read: true)
      @message = Message.new
      @recipient = User.find(contact)
    else
      redirect_to messages_path
    end
  end

private

  def message_params
    params.require(:message).permit(:sender_id, :recipient_username, :recipient_id, :content)
  end

end
