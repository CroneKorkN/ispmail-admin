class DomainsController < ApplicationController
  def new
    @domain = Domain.new
  end
  
  def create
    @domain = Domain.new(domain_params)
    if @domain.save
      redirect_to :domains
    else
      render 'new'
    end
  end
  
  def edit
    @domain = Domain.find(params[:id])
  end
  
  def update
    @domain = Domain.find(params[:id])
    if @domain.update(domain_params)
      redirect_to :domains
    else
      render 'edit'
    end
  end

  def index
    @domains = Domain.all
  end
  
  def destroy
    @domain = Domain.find(params[:id])
    @domain.destroy
    redirect_to :domains
  end
  
  private
    def domain_params
      params.require(:domain).permit(:name)
    end
end
