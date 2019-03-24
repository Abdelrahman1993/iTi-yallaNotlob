class GroupsController < ApplicationController
    
    def index
        @groups =Group.all
        @group = Group.new
        @user=User.new
       
    end

    def create
        # render plain: params.inspect
        @user_id=1;
        @group = Group.new(group_params)
        @group.user_id=@user_id
        @group.save
        # render plain: params.inspect
        redirect_to groups_path
    end


    def show  
        @groups =Group.all
        @group = Group.new
        @groupId = Group.find(params[:id])  
        $test =  @groupId.id
        p"---------"
        p @groupId.id
    end

    # def edit

    # end

    # def update

    # end

    def destroy
      @groupId = Group.find(params[:id])
      @users = UserGroup.where(group_id: @groupId.id)
      @users.each do |user|
        user.destroy
      end
      @groupId.destroy
      redirect_to groups_path
    end

    

    def addUserGroup
        # @userId = User.where(name: name)
        # usergroup_params[:name]
        #  link_to group_path(group) , method: :get, class: group_path(group) do 
        # @groupId = Group.find(params[:id])
        @usergroup = UserGroup.new
        @usergroup.user_id = User.find_by(name: params[:name]).id
        @usergroup.group_id=$test
        @usergroup.save
        #     # render plain: params.inspect
        redirect_to groups_path
        end
    
        def deleteUserGroup
            @userGroup=UserGroup.find(params[:id])
            @userGroup.destroy
            redirect_to groups_path

        end
    private 
        def group_params
            params.require(:group).permit(:name,:user_id)
        end


end
