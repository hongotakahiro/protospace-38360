class UsersController < ApplicationController

    def show
        # @prototypes = Prototype.all 
        @user = User.find(params[:id])
        # prototypes = Prototypes.find(params[:id])

        # prototypes = user.prototypes        
        # @name = user.name
        # @profile = user.profile
        # @occupation = user.occupation
        # @position = user.position
    end

      private

      def message_params
        params.require(:prototype).permit(:image).merge(user_id: current_user.id)
      end
    end
    
