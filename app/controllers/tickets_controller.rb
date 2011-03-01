class TicketsController < ApplicationController
  load_and_authorize_resource

  def index
    @tickets = Ticket.unassigned.page(params[:page])
    render :index
  end

  def open
    @tickets = Ticket.open.page(params[:page])
    render :index
  end

  def on_hold
    @tickets = Ticket.on_hold.page(params[:page])
    render :index
  end

  def closed
    @tickets = Ticket.closed.page(params[:page])
    render :index
  end

  def new
    redirect_to [:tickets] if user_signed_in?
  end

  def create
    @ticket = Ticket.create params[:ticket]
    respond_with @ticket
  end

  def update
    @ticket.update_attributes params[:ticket]
    @ticket.replies.create :body => @ticket.reply, :user => current_user
    respond_with @ticket
  end

  def take_ownership
    if user_signed_in?
      @ticket.update_attribute :user, current_user
    end
    redirect_to @ticket
  end

  def search
    redirect_to [:tickets]
  end
end
