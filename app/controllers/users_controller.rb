class UsersController < ApplicationController

    def show
        @prototypes = Prototype.all 
        # @prototypes = @user.prototypes
        @user = User.find(params[:id])
        @name = current_user.name
        @profile = current_user.profile
        @occupation = current_user.occupation
        @position = current_user.position
    end

      private

      def message_params
        params.require(:prototype).permit(:image).merge(user_id: current_user.id)
      end
    end
    
