class RepliesController < ApplicationController
  load_and_authorize_resource
  load_and_authorize_resource :ticket

  def create
    @reply = Reply.create params[:reply] do
      @reply.ticket = @ticket
    end
  end
end
