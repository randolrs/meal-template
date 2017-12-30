class MealTemplatesController < ApplicationController
  before_action :set_meal_template, only: [:show, :embed_show, :edit, :update, :destroy]

  # GET /meal_templates
  # GET /meal_templates.json
  def index
    @meal_templates = MealTemplate.all
  end

  # GET /meal_templates/1
  # GET /meal_templates/1.json
  def show
  end

  def show_embed
    @meal_template = MealTemplate.find(params[:id])
    @hide_navigation = true
  end

  # GET /meal_templates/new
  def new
    @meal_template = MealTemplate.new
  end

  # GET /meal_templates/1/edit
  def edit
  end

  # POST /meal_templates
  # POST /meal_templates.json
  def create
    @meal_template = MealTemplate.new(meal_template_params)

    respond_to do |format|
      if @meal_template.save
        format.html { redirect_to @meal_template, notice: 'Meal template was successfully created.' }
        format.json { render :show, status: :created, location: @meal_template }
      else
        format.html { render :new }
        format.json { render json: @meal_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meal_templates/1
  # PATCH/PUT /meal_templates/1.json
  def update
    respond_to do |format|
      if @meal_template.update(meal_template_params)
        format.html { redirect_to @meal_template, notice: 'Meal template was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal_template }
      else
        format.html { render :edit }
        format.json { render json: @meal_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_templates/1
  # DELETE /meal_templates/1.json
  def destroy
    @meal_template.destroy
    respond_to do |format|
      format.html { redirect_to meal_templates_url, notice: 'Meal template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_template
      @meal_template = MealTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_template_params
      params.require(:meal_template).permit(:name)
    end
end
