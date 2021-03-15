module Auditable
  extend ActiveSupport::Concern

  included do
    has_many :audits, as: :auditable

    after_save :create_audit
  end

  def create_audit
    self.audits.create(
      user: User.first,
      changes: self.saved_changes
    )
  end
end
