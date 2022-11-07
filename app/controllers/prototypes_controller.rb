class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  # before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else   
      render :new
    end  
  end 

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end  
  end

  def edit
    @prototype = Prototype.find(params[:id])
    unless @prototype.user_id == current_user.id
      redirect_to action: :index
    end  
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit
    end
  end
 
  def show
    @comment = Comment.new
    @prototype = Prototype.find(params[:id])
    @comments = @prototype.comments.includes(:user)
  end

    private
    def prototype_params
      params.require(:prototype).permit(:prototype_name, :catchcopy, :concept, :image).merge(user_id: current_user.id)
    end 

    def set_prototype
      @prototype = Prototype.find(params[:id])
    end

    def move_to_index
      unless user_signed_in?
        redirect_to action: :index
      end
    end
end