class RedirectionsController < ApplicationController
  def new
    redirect_to new_domain_path, notice: "create a domain first" if Domain.all.empty?
    @redirection = Redirection.new
    @domains = Domain.all
  end
  
  def create
    @redirection = Redirection.new(redirection_params)
    if @redirection.save
      redirect_to :redirections
    else
      render 'new'
    end
  end
  
  def edit
    @redirection = Redirection.find(params[:id])
    @domains = Domain.all
  end
  
  def update
    @redirection = Redirection.find(params[:id])
    if @redirection.update(redirection_params)
      redirect_to :redirections
    else
      render 'edit'
    end
  end

  def index
    @redirections = Redirection.all
  end
  
  def destroy
    @redirection = Redirection.find(params[:id])
    @redirection.destroy
      redirect_to :redirections
  end
  
  private
    def redirection_params
      params.require(:redirection).permit(:source,:destination,:domain_id)
    end
end
