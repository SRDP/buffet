class DashboardsController < ApplicationController
  before_action :set_dashboard, only: [:show, :edit, :update, :destroy]

  # GET /dashboards
  # GET /dashboards.json
  def index

    if(params['search'] != "1")
      @dashboards = Dashboard.all
      @select = @dashboards.last.attributes.keys - ["id","created_at","updated_at"]
      @group_inv = @dashboards.last.attributes.keys - ["id","created_at","updated_at"]
    else

      hostname = params['hostname'] if !params['hostname'].blank?
      ipaddress = params['ipaddress'] if !params['ipaddress'].blank?
      stat = params['stat'].split(',') if !params['stat'].blank?
      query = ""
      query_data = ""
      query = query + 'hostname ILIKE ?' if !hostname.blank?
      query = query +  'and ipaddress LIKE ?' if !ipaddress.blank? && !query.blank?
      query = query + 'ipaddress LIKE ?' if !ipaddress.blank? && query.blank?


      @dashboards =   Dashboard.where("hostname ILIKE ?","%#{hostname}%") if !hostname.blank? && ipaddress.blank?
      @dashboards =   Dashboard.where("ipaddress LIKE ?","%#{ipaddress}%") if hostname.blank? && ipaddress.blank?
      @dashboards =   Dashboard.where("hostname ILIKE ? and ipaddress LIKE ? ","%#{hostname}%","%#{ipaddress}%") if !hostname.blank? && !ipaddress.blank?


    end
  end

  # GET /dashboards/1
  # GET /dashboards/1.json
  def show
  end

  # GET /dashboards/new
  def new
    @dashboard = Dashboard.new
  end

  # GET /dashboards/1/edit
  def edit
  end

  # POST /dashboards
  # POST /dashboards.json
  def create
    @dashboard = Dashboard.new(dashboard_params)

    respond_to do |format|
      if @dashboard.save
        format.html { redirect_to @dashboard, notice: 'Dashboard was successfully created.' }
        format.json { render :show, status: :created, location: @dashboard }
      else
        format.html { render :new }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboards/1
  # PATCH/PUT /dashboards/1.json
  def update
    respond_to do |format|
      if @dashboard.update(dashboard_params)
        format.html { redirect_to @dashboard, notice: 'Dashboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @dashboard }
      else
        format.html { render :edit }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboards/1
  # DELETE /dashboards/1.json
  def destroy
    @dashboard.destroy
    respond_to do |format|
      format.html { redirect_to dashboards_url, notice: 'Dashboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dashboard
      @dashboard = Dashboard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_params
        params.require(:dashboard).permit("hostname", "kernel_version", "ipaddress", "macaddress", "cpuidle", "total_memory", "used_memory", "free_memory", "total_swap", "used_swap", "free_swap", "userslist", "disk_free_space", "disk_Used_space","stat","search")
    end
end
