class MesasController < ApplicationController
  before_action :set_mesa, only: %i[ show edit update destroy ]

  # GET /mesas or /mesas.json
  def index
    @mesas = Mesa.all
  end

  # GET /mesas/1 or /mesas/1.json
  def show
  end

  # GET /mesas/new
  def new
    @mesa = Mesa.new
  end

  # GET /mesas/1/edit
  def edit
  end

  # POST /mesas or /mesas.json
  def create
    @mesa = Mesa.new(mesa_params)

    respond_to do |format|
      if @mesa.save
        format.html { redirect_to @mesa, notice: "Mesa was successfully created." }
        format.json { render :show, status: :created, location: @mesa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mesas/1 or /mesas/1.json
  def update
    respond_to do |format|
      if @mesa.update(mesa_params)
        format.html { redirect_to @mesa, notice: "Mesa was successfully updated." }
        format.json { render :show, status: :ok, location: @mesa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mesas/1 or /mesas/1.json
  def destroy
    @mesa.destroy!

    respond_to do |format|
      format.html { redirect_to mesas_path, status: :see_other, notice: "Mesa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mesa
      @mesa = Mesa.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def mesa_params
      params.expect(mesa: [ :numero, :disponibilidad, :capacidad ])
    end
end
