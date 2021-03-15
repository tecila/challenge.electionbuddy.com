# frozen_string_literal: true

class Audit < ApplicationRecord
  belongs_to :user
  belongs_to :auditable, polymorphic: true

  validates :user, :auditable_id, :auditable_type, :modifications, presence: true
end
