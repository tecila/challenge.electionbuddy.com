# frozen_string_literal: true

class AuditsController < ApplicationController
  before_action :authenticate_user!
  before_action :audit_resource

  def index
    @audits = @resource.audits
  end

  private

  def audit_resource
    if params[:election_id].present?
      @resource = Election.find(params[:election_id])
    elsif params[:question_id].present?
      @resource = Question.find(params[:question_id])
    elsif params[:answer_id].present?
      @resource = Answer.find(params[:answer_id])
    end
  end
end
