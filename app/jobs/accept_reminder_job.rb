class AcceptReminderJob < Struct.new(:conversation_id, :recipient_id, :community_id)

  include DelayedAirbrakeNotification

  # This before hook should be included in all Jobs to make sure that the service_name is
  # correct as it's stored in the thread and the same thread handles many different communities
  # if the job doesn't have community_id parameter, should call the method with nil, to set the default service_name
  def before(job)
    # Set the correct service name to thread for I18n to pick it
    BaseHelper.store_community_service_name_to_thread_from_community_id(community_id)
  end

  def perform
    conversation = Conversation.find(conversation_id)
    community = Community.find(community_id)
    if conversation.status.eql?("pending")
      PersonMailer.send("accept_reminder", conversation, conversation.listing.author, community).deliver
    end
  end

end
