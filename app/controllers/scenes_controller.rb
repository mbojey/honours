class ScenesController < ApplicationController
  protect_from_forgery with: :exception

  def tutorial 
  	if user_signed_in?
      @user = current_user
      @scene = Scene.new
      @scene.creator_id = @user.id
      @scene.question = 1
      @scene.created_at = DateTime.now
      @scene.save
      @node = Node.new
    end
  end

  def addtofront 
    if user_signed_in?
      @user = current_user
      @scene = Scene.new
      @scene.creator_id = @user.id
      @scene.question = 2
      @scene.created_at = DateTime.now
      @scene.save
      @node = Node.new
    end
  end

  def addtomiddle 
    if user_signed_in?
      @user = current_user
      @scene = Scene.new
      @scene.creator_id = @user.id
      @scene.question = 3
      @scene.created_at = DateTime.now
      @scene.save
      @node = Node.new
    end
  end

  def removefromback 
    if user_signed_in?
      @user = current_user
      @scene = Scene.new
      @scene.creator_id = @user.id
      @scene.question = 4
      @scene.created_at = DateTime.now
      @scene.save
      @node = Node.new
    end
  end

  def removefromlist 
    if user_signed_in?
      @user = current_user
      @scene = Scene.new
      @scene.creator_id = @user.id
      @scene.question = 5
      @scene.created_at = DateTime.now
      @scene.save
      @node = Node.new
    end
  end

  def update
    @scene = Scene.find(params[:id])
    @error = ""
    @correct = true
    if @scene.question == 1
      @error, @correct = checkTutorial(@scene)
    elsif @scene.question == 2
      @error, @correct = checkAddToFront(@scene)
    elsif @scene.question == 3
      @error, @correct = checkAddToMiddle(@scene)
    elsif @scene.question == 4
      @error, @correct = checkRemoveFromBack(@scene)
    elsif @scene.question == 5
      @error, @correct = checkRemoveFromList(@scene)
    end
  end

  def checkTutorial(scene)
    @scene = scene
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

        if @nodes.nil? || @nodes.length < 3
          @error = "You need to have 3 nodes in your list"
          @correct = false
        end
        #Check that nodes are in order
        @firstnode = Node.find_by(scene_id: @scene.id, scene_count: @head.next_pointer_target_id)

        if @firstnode.nil?
          p "First!!!!!~~~~~"
          @secondnode = nil
        else
          @secondnode = Node.find_by(scene_id: @scene.id, scene_count: @firstnode.next_pointer_target_id)
        end
        if @secondnode.nil?
          p "Second!!!!!~~~~~"
          @thirdnode = nil
        else
          @thirdnode = Node.find_by(scene_id: @scene.id, scene_count: @secondnode.next_pointer_target_id)
        end
        if @firstnode.nil? || @secondnode.nil? || @thirdnode.nil?
          @error = "You need to have the nodes in your list connected and pointing to the next node"
          @correct = false
        #Check that each node has the correct instance data
        elsif @firstnode.datatype1 != "String" || @secondnode.datatype1 != "String" || @thirdnode.datatype1 != "String"
          @error = "You need to have the correct instance data in each of your nodes"
          @correct = false
        end
        @error = "You nailed it! Way to go!"  
      end
    else
      @error = "You are not signed in"
    end
    return @error, @correct
  end

  def checkAddToFront(scene)
    @scene = scene
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
        @error = "Make sure that you list head is pointing to the beginning of your list. 
        If you try to point to the node you want to add make sure you don't drop the rest of the list."
        @correct = false
        #Check that there are 3 nodes in the list
        @nodes = Node.where(scene_id: @scene.id, head: false)
      else
        if @nodes.nil? || @nodes.length < 3
          @error = "You need to have 3 nodes in your list.  Make sure you don't drop the rest of your list."
          @correct = false
        end
        #Check that nodes are in order
        @firstnode = Node.find_by(scene_id: @scene.id, scene_count: @head.next_pointer_target_id)

        if @firstnode.nil?
          @secondnode = nil
        elsif !@firstnode.scene_count == 4
          @error = "You didn't add the node to the front of the list.  Make sure that you put the node right after 
          the list head and before any other nodes."
        @correct = false
        else
          @secondnode = Node.find_by(scene_id: @scene.id, scene_count: @firstnode.next_pointer_target_id)
        end
        if @secondnode.nil?
          @thirdnode = nil
        else
          @thirdnode = Node.find_by(scene_id: @scene.id, scene_count: @secondnode.next_pointer_target_id)
        end
        if @firstnode.nil? || @secondnode.nil? || @thirdnode.nil?
          @error = "You need to have the nodes in your list connected and pointing to the next node"
          @correct = false
        end
        @error = "You nailed it! Way to go!"
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkAddToMiddle(scene)
    @scene = scene
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
        @error = "Make sure that you list head is pointing to the beginning of your list. 
        If you try to point to the node you want to add make sure you don't drop the rest of the list."
        @correct = false
      else
        #Check that there are 3 nodes in the list
        @nodes = Node.where(scene_id: @scene.id, head: false)
        if @nodes.nil? || @nodes.length < 3
          @error = "You need to have 3 nodes in your list.  Make sure you don't drop the rest of your list."
          @correct = false
        elsif
          #Check that nodes are in order
          @firstnode = Node.find_by(scene_id: @scene.id, scene_count: @head.next_pointer_target_id)
          if @firstnode.nil?
            @secondnode = nil
          else
            @secondnode = Node.find_by(scene_id: @scene.id, scene_count: @firstnode.next_pointer_target_id)
          end
          if @secondnode.nil?
            @thirdnode = nil
          else
            @thirdnode = Node.find_by(scene_id: @scene.id, scene_count: @secondnode.next_pointer_target_id)
          end
          if @firstnode.nil? || @secondnode.nil? || @thirdnode.nil?
            @error = "You need to have the nodes in your list connected and pointing to the next node"
            @correct = false
          end
          if @correct && !(@firstnode.data1 < @secondnode.data1 && @secondnode.data1 < @thirdnode.data1)
            @error = "Make sure that the nodes are in the correct numerical order"
          else
            @error = "You nailed it! Way to go!"
          end
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkRemoveFromBack(scene)
    @scene = scene
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
        @error = "Make sure that you list head is pointing to the beginning of your list. 
        If you try to point to the node you want to add make sure you don't drop the rest of the list."
        @correct = false
        #Check that there are 3 nodes in the list
        @nodes = Node.where(scene_id: @scene.id, head: false)
      else
        if @nodes.nil? || !@nodes.length == 2
          @error = "You need to have 2 nodes in your list.  Make sure you don't drop the rest of your list."
          @correct = false
        end
        #Check that nodes are in order
        @firstnode = Node.find_by(scene_id: @scene.id, scene_count: @head.next_pointer_target_id)

        if @firstnode.nil?
          @secondnode = nil
        elsif !@firstnode.scene_count == 4
          @error = "You didn't add the node to the front of the list.  Make sure that you put the node right after 
          the list head and before any other nodes."
        @correct = false
        else
          @secondnode = Node.find_by(scene_id: @scene.id, scene_count: @firstnode.next_pointer_target_id)
        end
        if @firstnode.nil? || @secondnode.nil?
          @error = "You need to have the nodes in your list connected and pointing to the next node"
          @correct = false
        end
        @error = "You nailed it! Way to go!"
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkRemoveFromList(scene)
    @scene = scene
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
        @error = "Make sure that you list head is pointing to the beginning of your list. 
        Don't drop the whole list unless you need to."
        @correct = false
        #Check that there are 3 nodes in the list
        @nodes = Node.where(scene_id: @scene.id, head: false)
      else
        if !@head.next_pointer_target_id == 2
          @error = "Don't remove nodes from the list if they have an even value stored in them as instance data."
          @correct = false;
        else
          if Node.find_by(scene_id: @scene.id, scene_count: 2).next_pointer_target_id == 3
            @error = "Remove all nodes from the list if they have an odd value stored in them as instance data."
            @correct = false;
          elsif Node.find_by(scene_id: @scene.id, scene_count: 2).next_pointer_target_id == 4
            if Integer(Node.find_by(scene_id: @scene.id, scene_count: 4).data1).even?
              @error = "Correct, good job!"
              @correct = true
            else
              @error = "Remove all nodes from the list if they have an odd value stored in them as instance data."
              @correct = false;
            end
          else
            if Integer(Node.find_by(scene_id: @scene.id, scene_count: 4).data1).even?
              @error = "Don't remove nodes from the list if they have an even value stored in them as instance data. "
              @correct = false;
            else
              @error = "Correct, good job!"
              @correct = true
            end
          end
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

end
