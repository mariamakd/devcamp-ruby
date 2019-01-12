class PortfoliosController < ApplicationController
	before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]
	def index
		@portfolio_items=Portfolio.all
	end	

	def new
		@portfolio_item = Portfolio.new
	end	

	def show
    end

	def edit
 	end

	def create
		@portfolio_item = Portfolio.new(portfolio_params)
		respond_to do |format|
	       if @portfolio_item.save
	        format.html { redirect_to portfolios_path, notice: 'Portfolio Item was successfully created.' }

	       end
		end
	end	

	def update
		respond_to do |format|
		    if @portfolio_item.update(portfolio_params)
		        format.html { redirect_to @portfolio_item, notice: 'Portfolio Item successfully updated.' }
		    end
    	end
	end

	def destroy
	    @portfolio_item.destroy
	    respond_to do |format|
	      format.html { redirect_to portfolios_url, notice: 'Portfolio Item successfully destroyed.' }
	    end
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end

	# Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body)
    end

end
