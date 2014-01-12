class ClientsController < ApplicationController
  helper_method :sort_column, :sort_direction, :date_scope
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /clients
  # GET /clients.json
  def index
    @clients = User.find(current_user.id).clients.send(date_scope).search(params[:search]).order(sort_column + " " + sort_direction).paginate(per_page: 50, page: params[:page]) 
 
  end

  def show
  end

  # GET /clients/new
  def new
    @client = User.find(current_user.id).clients.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
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

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
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

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = User.find(current_user.id).clients.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :guests_of_honor, :phone_number, :date_of_event, :date_booked, :type_of_event, :minimum_guarantee, :amount_of_guests, :base_price, :additional_charges, :deposit, :payment_1_date, :payment_2_date, :final_payment_date, :payment_1, :payment_2, :menu, :user_id)
    end

    def sort_column
      Client.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] :  "asc"
    end
    
    def date_scope
      %w[past future load].include?(params[:datescope]) ? params[:datescope] : "load"
    end
end
