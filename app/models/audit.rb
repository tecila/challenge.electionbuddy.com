# frozen_string_literal: true

class Audit < ApplicationRecord
  belongs_to :user
  belongs_to :auditable, polymorphic: true
end
