class Reservation < Conversation
end

class FavorRequest < Conversation
end

class Favor < ActiveRecord::Base
  belongs_to :owner, :class_name => "Person", :foreign_key => "owner_id"
end

class Item < ActiveRecord::Base
  belongs_to :owner, :class_name => "Person", :foreign_key => "owner_id"
end

class KassiEventParticipation < ActiveRecord::Base
  belongs_to :person
  belongs_to :kassi_event
end

class KassiEvent < ActiveRecord::Base
  has_many :person_comments
  has_many :kassi_event_participations
  has_many :participants, :through => :kassi_event_participations, :source => :person
  #belongs_to :eventable, :polymorphic => true
end

class PersonComment < ActiveRecord::Base
end

class PersonConversation < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :person
end

class ItemReservation < ActiveRecord::Base
end

class Notification < ActiveRecord::Base
end

class CommunityCategory < ActiveRecord::Base
  attr_accessor :category, :share_type, :community_id
end

class ShareType < ActiveRecord::Base
  attr_accessor :name, :icon, :parent
end

class Organization < ActiveRecord::Base
end

Community.class_eval do
  def self.find_by_domain(domain_string)
    if domain_string =~ /\:/ #string includes port which should be removed
      domain_string = domain_string.split(":").first
    end

    # search for exact match or then match by first part of domain string.
    # first priority is the domain, then domain_alias
    return Community.where(["domain = ?", domain_string]).first ||
           Community.where(["domain = ?", domain_string.split(".").first]).first
  end
end