class ScenesController < ApplicationController
  protect_from_forgery with: :exception

  def index 
  	if user_signed_in?
      @user = current_user
      @scene = Scene.new
      @scene.creator_id = @user.id
      @scene.question = params[:question]
      @scene.created_at = DateTime.now
      @scene.save
      @node = Node.new
    end
  end

  def update
    @scene = Scene.find(params[:id])
    @correct = true
    @error = ""
    if user_signed_in? && @scene.creator_id == current_user.id
      #Check if there is a list head
      @head = Node.find_by(scene_id: @scene.id, head: true)
      if @head.nil?
        @error = "You need a list head"
        @correct = false
      #Check that the list head points to something
      elsif @head.next_pointer_target_id.nil?
        @error = "Make sure that you list head is pointing to the beginning of your list"
        @correct = false
      #Check that there are 3 nodes in the list
      @nodes = Node.where(scene_id: @scene.id, head: false)  
      elsif @nodes.nil? || @nodes.length < 3
        @error = "You need to have 3 nodes in your list"
        @correct = false
      #Check that nodes are in order
      @firstnode = Node.find_by(scene_id: @scene_id, scene_count: @head.next_pointer_target_id)
      if @firstnode.nil?
        @secondnode = nil
      else
        @secondnode = Node.find_by(scene_id: @scene_id, scene_count: @firstnode.next_pointer_target_id)
      end
      if @secondnode.nil?
        @thirdnode = nil
      else
        @thirdnode = Node.find_by(scene_id: @scene_id, scene_count: @seondnode.next_pointer_target_id)
      end
      elsif @firstnode.nil? || @secondnode.nil? || @thirdnode.nil?
        @error = "You need to have the nodes in your list connected and pointing to the next node"
        @correct = false
      #Check that each node has the correct instance data
      elsif @firstnode.datatype1 != "String" || @secondnode.datatype1 != "String" || @thirdnode.datatype1 != "String"
        @error = "You need to have the correct instance data in each of your nodes"
        @correct = false
      end  
    end
  end
end
