class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  include ClientsHelper

  def index
    @clients = User.find(current_user.id).clients.public_send(date_scope).search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(per_page: 50, page: params[:page])
  end

  def show
  end

  def new
    @client = User.find(current_user.id).clients.new
  end

  def edit
  end

  def create
    @client = User.find(current_user.id).clients.new(client_params)
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render action: 'show', status: :created, location: @client }
      else
        format.html { render action: 'new' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  private

  def set_client
    @client = User.find(current_user.id).clients.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :guests_of_honor, :phone_number,
                                   :date_of_event, :date_booked, :type_of_event,
                                   :minimum_guarantee, :amount_of_guests, :base_price,
                                   :additional_charges, :deposit, :payment_1_date, :payment_2_date,
                                   :final_payment_date, :payment_1, :payment_2, :menu, :user_id)
  end
end
