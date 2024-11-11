class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    if params[:category].present?
      category = Category.find_by(name: params[:category])
      @products = category ? Product.where(category_id: category.id) : Product.none
    else
      @products = Product.all # Retorna todos os produtos se não houver filtro de categoria
    end
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def upload_csv
  end

  def import_csv
    file = params[:file]

    if file.nil?
      flash[:alert] = "Por favor, selecione um arquivo CSV."
      return redirect_to upload_csv_products_path
    end

    begin
      Product.import_from_csv(file.path)
      flash[:notice] = "Produtos importados com sucesso!"
    rescue StandardError => e
      flash[:alert] = "Erro ao importar produtos: #{e.message}"
    end

    redirect_to upload_csv_products_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:nome, :preco, :estoque, :category_id, :imagem)
    end
end
