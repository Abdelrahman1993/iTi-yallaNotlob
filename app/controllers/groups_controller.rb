class GroupsController < ApplicationController

  def index
    @groups = Group.where(user_id: current_user.id)
    @group = Group.new
    @user = User.new
  end

  def create
    @group = Group.new(group_params)
    @groups = Group.where(user_id: current_user.id)
  
    @groupName=@group.name
    @group.user_id = current_user.id
    if(@group.save)
      redirect_to groups_path
    else
      $Error=[]
      $Error.push( @group.errors.full_messages);
      p "=============================="
      # p $nameErr
      p "=============================="

      redirect_to groups_path
    end
     
  

  
  end

  def show
    @groups = Group.where(user_id: current_user.id)
    @group = Group.new

# debugger
    if(UserGroup.where(user_id: current_user.id).where(group_id: params[:id]))
      @groupId = Group.find_by(id: params[:id])
      if(@groupId)
        $test =  @groupId.id
        p '---------'
      end
      p '------======================================---'
      p @groupId;
     
    
    end


  end

  # def edit

  # end

  # def update

  # end

  def destroy
    @groupId = Group.find(params[:id])
    @users = UserGroup.where(group_id: @groupId.id)
    @users.each(&:destroy)
    @groupId.destroy
    redirect_to groups_path
  end

 def addUserGroup

        @friends = params[:friends].split(',')

        @friends.each do |friend|
      
          @usergroup = UserGroup.new
          @usergroup.user_id = friend.to_i
          @usergroup.group_id=$test
          if @usergroup.save
          else
            $Error.push(@usergroup.errors.full_messages)
          end
          redirect_to groups_path

      end
    end
    
   
    private 
        def group_params
            params.require(:group).permit(:name)
        end   

end