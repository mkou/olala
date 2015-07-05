module Olala
  class LabelsController < ApplicationController
    include ApplicationHelper

    before_filter :check_admin_right
    protect_from_forgery :except => :create

    def check_admin_right
      if !session[:admin]
        raise 'Access denied'
      end
    end

    def create
      params.permit(:label, :content)
      label = Label.where(label: params[:label]).first_or_create
      label.content = params[:content] if params[:content]
      label.save
      render text: 'ok'
    end
  end
end