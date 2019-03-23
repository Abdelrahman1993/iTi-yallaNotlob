class GroupsController < ApplicationController
   
 
   
    def index
        @groups =Group.all
        @group = Group.new
        
        
    end

    def new 
        # @group = Group.new(group_params)
        @group = Group.new
    end

    def create
        @user_id=1;
        puts @user_id
        @group = Group.new
        @group.user_id=@user_id
        @group.save
        render plain: params.inspect
        # redirect_to groups_path
    end

    def show
      @group = Group.find(params[:id])       
    end

    # def edit

    # end

    # def update

    # end

    def destroy
      @group = Group.find(params[:id])
      @group.destroy
      redirect_to groups_path
    end


    private 
        def group_params
            p "==================="
        #    puts params.require(:group)
           p "==================="
        end

end
