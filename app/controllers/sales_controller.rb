class SalesController < ApplicationController
def index

end
def show
  @last_sale = Sale.last
end
  def new
  end

  def create
    sale = Sale.new
    sale.detail = params[:sale][:detail]
    sale.value = params[:sale][:value]
    sale.category = params[:sale][:category]
    sale.discount = params[:sale][:discount]
    sale.total = params[:sale][:value].to_f * (1 - params[:sale][:discount].to_f/100)
    if params[:sale][:tax] != '1'
        sale.total = sale.total * 1.19
        sale.tax = 19
    end
    redirect_to sales_path if sale.save
  end
  def get_form
    @search = Search.new
    @search.search_string = params[:my_form][:search]
    @message = @search.save ? 'Formulario guardado exitosamente' : 'Algo salió mal'
  end
end
