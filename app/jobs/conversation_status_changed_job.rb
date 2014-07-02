class ConversationStatusChangedJob < Struct.new(:conversation_id, :current_user_id, :community_id)

  include DelayedAirbrakeNotification

  # This before hook should be included in all Jobs to make sure that the service_name is
  # correct as it's stored in the thread and the same thread handles many different communities
  # if the job doesn't have host parameter, should call the method with nil, to set the default service_name
  def before(job)
    # Set the correct service name to thread for I18n to pick it
    BaseHelper.store_community_service_name_to_thread_from_community_id(community_id)
  end

  def perform
    community = Community.find(community_id)
    conversation = Conversation.find(conversation_id)
    current_user = Person.find(current_user_id)
    if conversation.other_party(current_user).should_receive?("email_when_conversation_#{conversation.status}")
      PersonMailer.conversation_status_changed(conversation, community).deliver
    end
  end

end
