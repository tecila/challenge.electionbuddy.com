module Auditable
  extend ActiveSupport::Concern

  included do
    has_many :audits, as: :auditable

    after_save :create_audit

    attr_accessor :user
  end

  def create_audit
    self.audits.create(
      user: user,
      modifications: self.saved_changes.except!('updated_at')
    )
  end
end
