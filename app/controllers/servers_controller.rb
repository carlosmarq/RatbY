class ServersController < ApplicationController
  before_action :set_server, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :except => [:listen, :listenu, :listenp]

  CookieSec = "123456789"

  # GET /servers
  # GET /servers.json
  def index
    @servers = Server.all
  end

  # GET /servers/1
  # GET /servers/1.json
  def show
    @server = Server.find(params[:id])
    @users = User.where(hostname: @server.hostname)
    @pids = Pid.where(hostname: @server.hostname)
  end

  # GET /servers/new
  def new
    @server = Server.new
  end

  # GET /servers/1/edit
  def edit
  end

  # POST /servers
  # POST /servers.json
  def create
    @server = Server.new(server_params)

    respond_to do |format|
      if @server.save
        format.html { redirect_to @server, notice: 'Server was successfully created.' }
        format.json { render :show, status: :created, location: @server }
      else
        format.html { render :new }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servers/1
  # PATCH/PUT /servers/1.json
  def update
    respond_to do |format|
      if @server.update(server_params)
        format.html { redirect_to @server, notice: 'Server was successfully updated.' }
        format.json { render :show, status: :ok, location: @server }
      else
        format.html { render :edit }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.json
  def destroy
    @server.destroy
    respond_to do |format|
      format.html { redirect_to servers_url, notice: 'Server was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def listen

    if request.headers["Cookie"].to_s == CookieSec
      puts "Authorized"

      @server = Server.new(server_params)
      respond_to do |format|
        if @server.save
          format.html { redirect_to @server, notice: 'Server was successfully created.' }
          format.json { render :show, status: :created, location: @server }
        else
          format.html { render :new }
          format.json { render json: @server.errors, status: :unprocessable_entity }
        end
      end

    else
      puts "Not Authorized"
    end

  end

  def listenu

    if request.headers["Cookie"].to_s == CookieSec
      puts "Authorized"

      @user = User.new(user_params)
      @server = Server.find_by hostname: (params[:hostname])
      @user.server_id=@server.id
      @user.save
    else
      puts "Not Authorized"
    end
  end

  def listenp

    if request.headers["Cookie"].to_s == CookieSec
      puts "Authorized"

      @pid = Pid.new(pid_params)
      puts ""
      puts @pid.inspect
      @server = Server.find_by hostname: (params[:hostname])
      puts "El id del server es"
      puts @server.id
      @pid.server_id=@server.id
      puts "Inspeccionando antes de guardar"
      puts @pid.inspect
      @pid.save
    else
      puts "Not Authorized"
    end

  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_server
    @server = Server.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def server_params
    params.require(:server).permit(:hostname, :Caption, :CSDVersion,
    :BuildNumber, :OSArchitecture, :WindowsDirectory, :OSLanguage,
    :CurrentTimeZone, :CountryCode, :InstallDate, :LastBootUpTime,
    :LocalDateTime)
  end


  def user_params
    params.permit(:hostname, :Caption, :Description, :Disabled,
    :FullName, :LocalAccount, :Lockout, :Name,
    :PasswordChangeable, :PasswordExpires, :PasswordRequired,
    :SID, :server_id, :server)
  end

  def pid_params
    params.permit(:hostname, :Name, :Description, :ExecutablePath,
    :ProcessId)
  end

end
