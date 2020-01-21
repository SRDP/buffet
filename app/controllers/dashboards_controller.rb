class DashboardsController < ApplicationController
  require "json"
  before_action :set_dashboard, only: [:show, :edit, :update, :destroy]

  # GET /dashboards
  # GET /dashboards.json
  def index

    @select = Dashboard.new.attributes.keys - ["id","created_at","updated_at"]
    @select_html =""
    @select.each do |dsv|
      @select_html += "<option id="+ "dates-field2" + "class=" + "multiselect-ui form-control" + "multiple=" + "multiple" +  "value=" + dsv + ">" + dsv.camelcase + "</option>"
     end
    if(params['search'] != "1")
      @dashboards = Dashboard.all

    else
      file = File.open "/Users/sreedeepkumar/Workspace/COE/hackthon/data/data.json"
      data = JSON.load file
      data_value_array = data.values
      data_to_be_saved = []

      data_template = {
        :hostname => "",
        :kernel_version => "",
        :ipaddress => "",
        :macaddress => "",
        :cpuidle => "",
        :total_memory => "",
        :used_memory => "",
        :free_memory => "",
        :total_swap => "",
        :used_swap => "",
        :free_swap => "",
        :userslist => "",
        :disk_free_space => "",
        :disk_Used_space => "",
        :cpucount => "",
        :top_cpu_process => "",
        :top_memory_process => "",
        :current_logged_in_users => "",
        :users_password_expired => "",
        :password_expire_date => "",

        :ls_output => "",
        :hosts_file => "",
        :services_status => "",
        :pvs => "",
        :vgs => "",
        :lvs => "",
        :disk_utilization => "",
        :ifconfig => "",
        :ports_listening => ""

      }

      data_value_array.each do |d|
         ul = []
         data_template[:hostname] = d['hostname']
         data_template[:kernel_version] = d['kernel_version']
         data_template[:ipaddress] = d['ipaddress']
         data_template[:macaddress] = d['macaddress']
         data_template[:cpuidle] = d['cpuidle']
         data_template[:total_memory] = d['total_memory']
         data_template[:used_memory] =  d['used_memory']
         data_template[:free_memory] =  d['free_memory']
         data_template[:used_swap] = d['used_swap']
         data_template[:free_swap] = d['free_swap']
         data_template[:disk_free_space] = d['disk_free_space']
         data_template[:disk_Used_space] = d['disk_Used_space']
         data_template[:cpucount] = d['cpucount']

        data_template[:current_logged_in_users] = d['current_logged_in_users']
        data_template[:users_password_expired] = d['users_password_expired']
        data_template[:password_expire_date] = d['password_expire_date']
        data_template[:ls_output] = d['ls_output']
        data_template[:hosts_file] = d['hosts_file']
        data_template[:services_status] = d['services_status']
        data_template[:pvs] = d['pvs']
        data_template[:vgs] = d['vgs']
        data_template[:lvs] = d['lvs']
        data_template[:disk_utilization] = d['disk_utilization']
        data_template[:ifconfig] = d['ifconfig']
        data_template[:ports_listening] = d['ports_listening']

         d['users_list'].split(",").map {|x| ul << x.split('u').compact}
         data_template[:userslist] = ul.compact.join(",")
         top_cpu_process = "" + "<br>"
         top_cpu_process += d['top_cpu_process'].split(",")[0] + "<br>"
         top_cpu_process += d['top_cpu_process'].split(",")[1] + "<br>"
         top_cpu_process += d['top_cpu_process'].split(",")[2] + "<br>"

         data_template[:top_cpu_process] = top_cpu_process
         password_expire_date = ""
        d['password_expire_date'].split(',').each do | pxd|
          password_expire_date += pxd  + "<br>"
        end
        ls_output =""
         d['ls_output'].split(',').each do | pxd|
           ls_output += pxd  + "<br>"
        end
        services_status = ""
        d['services_status'].split(',').each do | pxd|
          services_status += pxd  + "<br>"
       end
       ports_listening =""
       d['ports_listening'].split(',').each do | pxd|
         ports_listening += pxd  + "<br>"
      end
        data_template[:password_expire_date] = password_expire_date.gsub!("				"," ")
        data_template[:ls_output] = ls_output.gsub!("				"," ")
        data_template[:ports_listening] = ports_listening.gsub!("				","")
        puts ports_listening.inspect
         data_to_be_saved << data_template
      end
Dashboard.create(data_to_be_saved)
#puts data_template

      puts"-------------------data-----------------------------------"
      hostname = params['hostname'] if !params['hostname'].blank?
      ipaddress = params['ipaddress'] if !params['ipaddress'].blank?
      @stat = params['stat'] if !params['stat'].blank?

      query = ""
      query_data = ""
      query = query + 'hostname ILIKE ?' if !hostname.blank?
      query = query +  'and ipaddress LIKE ?' if !ipaddress.blank? && !query.blank?
      query = query + 'ipaddress LIKE ?' if !ipaddress.blank? && query.blank?


      @dashboards =   Dashboard.where("hostname ILIKE ?","%#{hostname}%") if !hostname.blank? && ipaddress.blank?
      @dashboards =   Dashboard.where("ipaddress LIKE ?","%#{ipaddress}%") if hostname.blank? && !ipaddress.blank?
      @dashboards =   Dashboard.where("hostname ILIKE ? and ipaddress ILIKE ? ","%#{hostname}%","%#{ipaddress}%") if !hostname.blank? && !ipaddress.blank?

      @dashboards


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
