class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototype.all
    # @prototypes = Prototype.includes(:user)
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
    # @user = @prototype.user
    # binding.pry

  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.user != current_user
      redirect_to new_prototype_path
    else
      @prototype.destroy
      redirect_to @prototype
    end  
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