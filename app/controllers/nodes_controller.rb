class NodesController < ApplicationController
  protect_from_forgery with: :exception

  skip_before_filter :verify_authenticity_token, :only => [:create]

  def create
    respond_to do |format|
      format.html{
      	if user_signed_in?
            @user = current_user
            @node = Node.new
            @node.creator_id = @user.id
            @node.scene_id = params[:id]
    	      @node.created_at = DateTime.now
            @node.scene_count = params[:scene_count]
            @node.head = params[:head]
            if(params[:temp])
              @node.temp = params[:temp]
            end
            @node.x = params[:x]
            @node.y = params[:y]
            @node.next_pointer = params[:next_pointer]
    	      @node.save
      	end
      }
      format.js{
        @node = Node.find_by(scene_id: params[:id], scene_count: params[:scene_count])
        @node.data = params[:data]
        @node.save
      }
    end
  end

  def index
    @node = Node.find_by(scene_id: params[:id], scene_count: params[:scene_count])
    if params[:next_pointer]
      @node.next_pointer = params[:next_pointer]=='true'
    elsif params[:prev_pointer]
      @node.prev_pointer = params[:prev_pointer]=='true'
    elsif params[:next_pointer_target]
      @node.next_pointer_target_id = params[:next_pointer_target]
    elsif params[:datatype1]
      @node.datatype1 = params[:datatype1]
      @node.datatype2 = params[:datatype2]
      @node.data1 = params[:data1]
      @node.data2 = params[:data2]
    elsif params[:visible]
      @node.visible = false
    elsif params[:x]
      @node.x = params[:x]
      @node.y = params[:y]
    end
    @node.save
  end

  def data
    @node = Node.find_by(scene_id: params[:id], scene_count: params[:scene_count])
  end
end
