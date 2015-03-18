class ScenesController < ApplicationController
  protect_from_forgery with: :exception

  def tutorial 
  	if user_signed_in?
      @user = current_user
      @scene = Scene.new
      @scene.creator_id = @user.id
      @scene.question = 1
      @scene.created_at = DateTime.now-8.hours
      @scene.step = 0
      @scene.save
      @node = Node.new
      @user.update_attribute(:current_scene, @scene.id)
      @instruction = ["In this exercise you need to make a list with a list head and 3 
      nodes that are all connected via pointers. Start by creating a list head.", "Good job!  Now create 3 nodes."]
      @step = 0
    end
  end

  def tutorial2 
    if user_signed_in?
      @user = current_user
      @scene = Scene.new
      @scene.creator_id = @user.id
      @scene.question = 1
      @scene.created_at = DateTime.now-8.hours
      @scene.step = 1
      @scene.save
      @node = Node.new
      @user.update_attribute(:current_scene, @scene.id)
      @instruction = ["In this exercise you need to make a list with a list head and 3 
      nodes that are all connected via pointers. Start by creating a list head.", "Good job!  Now create 3 nodes."]
      @step = 0
    end
  end

  def tutorial3 
    if user_signed_in?
      @user = current_user
      @scene = Scene.new
      @scene.creator_id = @user.id
      @scene.question = 1
      @scene.created_at = DateTime.now-8.hours
      @scene.step = 2
      @scene.save
      @node = Node.new
      @user.update_attribute(:current_scene, @scene.id)
      @instruction = ["In this exercise you need to make a list with a list head and 3 
      nodes that are all connected via pointers. Start by creating a list head.", "Good job!  Now create 3 nodes."]
      @step = 0
    end
  end

  def tutorial4 
    if user_signed_in?
      @user = current_user
      @scene = Scene.new
      @scene.creator_id = @user.id
      @scene.question = 1
      @scene.created_at = DateTime.now-8.hours
      @scene.step = 3
      @scene.save
      @node = Node.new
      @user.update_attribute(:current_scene, @scene.id)
      @instruction = ["In this exercise you need to make a list with a list head and 3 
      nodes that are all connected via pointers. Start by creating a list head.", "Good job!  Now create 3 nodes."]
      @step = 0
    end
  end

  def tutorial5 
    if user_signed_in?
      @user = current_user
      @scene = Scene.new
      @scene.creator_id = @user.id
      @scene.question = 1
      @scene.created_at = DateTime.now-8.hours
      @scene.step = 4
      @scene.save
      @node = Node.new
      @user.update_attribute(:current_scene, @scene.id)
      @instruction = ["In this exercise you need to make a list with a list head and 3 
      nodes that are all connected via pointers. Start by creating a list head.", "Good job!  Now create 3 nodes."]
      @step = 0
    end
  end
  
  def tutorial6 
    if user_signed_in?
      @user = current_user
      @user.update_attribute(:tutorial_done, true)
      @scene = Scene.new
      @scene.creator_id = @user.id
      @scene.question = 1
      @scene.created_at = DateTime.now-8.hours
      @scene.step = 5
      @scene.save
      @node = Node.new
      @user.update_attribute(:current_scene, @scene.id)
      @instruction = ["In this exercise you need to make a list with a list head and 3 
      nodes that are all connected via pointers. Start by creating a list head.", "Good job!  Now create 3 nodes."]
      @step = 0
    end
  end

  def show
    @scene = Scene.find(params[:id])
    if(params[:hint])
      @scene.update_attribute(:hint, true)
    else
      case @scene.question
      when 1
        update_tutorial
      when 2
        update_addtofront
      when 3
        update_addtofront2
      when 4
        update_addtofront3
      when 5
        update_addtomiddle
      when 6
        update_addtomiddle2
      when 7
        update_addtomiddle3
      when 8
        update_addtoback
      when 9
        update_addtoback2
      when 10
        update_addtoback3
      when 11
        update_removefromback
      when 12
        update_removefromback2
      when 13
        update_removefromback3
      when 14
        update_removefromlist
      when 15
        update_removefromlist2
      when 16
        update_removefromlist3
      when 17
        update_removefromfront
      when 18
        update_removefromfront2
      when 19
        update_removefromfront3
      when 20
        update_sort
      when 21
        update_sort2
      when 22
        update_sort3
      when 23
        update_reverse
      when 24
        update_reverse2
      when 25
        update_reverse3
      end
    end
  end

  def update_tutorial
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :tutorial
        }
      end
  end

  def update_addtofront
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :addtofront
        }
      end
  end

  def addtofront 
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 2
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 2, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_addtofront2
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :addtofront2
        }
      end
  end

  def addtofront2 
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 3
        @scene.created_at = DateTime.now-8.hours
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 3, hint: true).nil?
          @scene.hint = true;
        end
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end
  
  def update_addtofront3
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :addtofront3
        }
      end
  end

  def addtofront3 
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 4
        @scene.created_at = DateTime.now-8.hours
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 4, hint: true).nil?
          @scene.hint = true;
        end
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_addtomiddle
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :addtomiddle
        }
      end
  end

  def addtomiddle 
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 5
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 5, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end
  
  def update_addtomiddle2
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :addtomiddle2
        }
      end
  end

  def addtomiddle2 
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 6
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 6, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_addtomiddle3
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :addtomiddle3
        }
      end
  end

  def addtomiddle3
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 7
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 7, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_addtoback
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :addtoback
        }
      end
  end

  def addtoback 
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 8
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 8, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end
  
  def update_addtoback2
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :addtoback2
        }
      end
  end

  def addtoback2 
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 9
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 9, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_addtoback3
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :addtoback3
        }
      end
  end

  def addtoback3
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 10
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 10, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_removefromback
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :removefromback
        }
      end
  end

  def removefromback 
   if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 11
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 11, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_removefromback2
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :removefromback2
        }
      end
  end
  
  def removefromback2
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 12
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 12, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_removefromback3
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :removefromback3
        }
      end
  end
  
  def removefromback3 
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 13
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 13, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_removefromlist
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :removefromlist
        }
      end
  end

  def removefromlist 
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 14
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 14, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_removefromlist2
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :removefromlist2
        }
      end
  end

  def removefromlist2
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 15
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 15, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_removefromlist3
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :removefromlist3
        }
      end
  end

  def removefromlist3
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 16
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 16, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_removefromfront
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :removefromfront
        }
      end
  end

  def removefromfront 
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 17
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 17, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_removefromfront2
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :removefromfront2
        }
      end
  end
  
  def removefromfront2
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 18
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 18, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_removefromfront3
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :removefromfront3
        }
      end
  end
  
  def removefromfront3 
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 19
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 19, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_sort
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :sort
        }
      end
  end

  def sort 
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 20
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 20, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_sort2
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :sort2
        }
      end
  end
  
  def sort2
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 21
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 21, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_sort3
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :sort3
        }
      end
  end
  
  def sort3 
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 22
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 22, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_reverse
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    p "~~~~~HERE~~~~~~~"
    p @nodes
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :reverse
        }
      end
  end

  def reverse 
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 23
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 23, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_reverse2
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :reverse2
        }
      end
  end
  
  def reverse2
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 24
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 24, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def update_reverse3
    @scene = Scene.find(params[:id])
    @nodes = Node.where(scene_id: @scene.id, visible: true)
    @nodes = @nodes.to_json
    respond_to do |format|
        format.js { 
          render :reverse3
        }
      end
  end
  
  def reverse3 
    if user_signed_in?
      @user = current_user
      if(@user.current_scene.nil? || @user.current_scene = 0)
        @scene = Scene.new
        @scene.creator_id = @user.id
        @scene.question = 25
        @scenes = Scene.where("creator_id = ? or collab_id = ?", @user.id, @user.id)
        if !@scenes.find_by(question: 25, hint: true).nil?
          @scene.hint = true;
        end
        @scene.created_at = DateTime.now-8.hours
        @scene.save
        @node = Node.new
        @user.update_attribute(:current_scene, @scene.id)
        if !@user.partner_id.nil?
          @message = Message.new(sender_id: @user.id, receiver_id: @user.partner_id, 
            sent_at: DateTime.now-8.hours, 
            message: "I am working on question "+(@scene.question-1).to_s+", come join!", 
            sceneinvitation: true, scene_id: @scene.id )
          @message.save
        end
      else
        @scene = Scene.find(@user.current_scene)
      end
    end
  end

  def add_collab
    if user_signed_in?
      @user = current_user
      @scene = Scene.find(params[:scene])
      User.find(@user.partner_id).update_attribute(:pending_invitation, true)
      User.find(@user.partner_id).update_attribute(:inviter, @user.id)
      @online = User.where(last_seen_at: (Time.now-7.hours-15.seconds..Time.now-7.hours), available: true).where.not(id: @user.id)    
      @node = Node.new
      respond_to do |format|
        format.js { 
            render "layouts/online"
        }
      end
    end
  end

  def decline_inv
      @message = Message.find(params[:id])
      @scene = Scene.find(@message.scene_id)
      @receiver = User.find(@message.receiver_id)
      @response = Message.new(sender_id: @receiver.id, receiver_id: @message.sender_id, 
          sent_at: DateTime.now-8.hours, 
          message: "I don't want to work on that question right now.")
      @response.save
  end

  def accept_inv
    if user_signed_in?
      @user = current_user
      @message = Message.find(params[:id])
      @scene = Scene.find(@message.scene_id)
      @scene.collab_id = @message.receiver_id
      @scene.save
      @receiver = User.find(@message.receiver_id)
      @receiver.update_attribute(:current_scene, @scene.id)
      @response = Message.new(sender_id: @receiver.id, receiver_id: @message.sender_id, 
          sent_at: DateTime.now-8.hours, 
          message: "On my way!")
      @response.save
      @online = User.where(last_seen_at: (Time.now-7.hours-15.seconds..Time.now-7.hours), available: true).where.not(id: @user.id)    
      @node = Node.new
      @nodes = Node.where(scene_id: @scene.id)
      @nodes = @nodes.to_json
      case @scene.question
        when 2
          render :addtofront
        when 3
          render :addtofront2
        when 4
          render :addtofront3
        when 5
          render :addtomiddle
        when 6
          render :addtomiddle2
        when 7
          render :addtomiddle3
        when 8
          render :addtoback
        when 9
          render :addtoback2
        when 10
          render :addtoback3
        when 11
          render :removefromback
        when 12
          render :removefromback2
        when 13
          render :removefromback3
        when 14
          render :removefromlist
        when 15
          render :removefromlist2
        when 16
          render :removefromlist3
        when 17
          render :removefromfront
        when 18
          render :removefromfront2
        when 19
          render :removefromfront3
        when 20
          render :sort
        when 21
          render :sort2
        when 22
          render :sort3
        when 23
          render :reverse
        when 24
          render :reverse2
        when 25
          render :reverse3
      end
    end
  end

  def update
    if params[:id]
      @scene = Scene.find(params[:id])
      @error = ""
      @correct = true
      case @scene.question
      when 1
        @error, @correct = checkTutorial(@scene)
      when 2
        @error, @correct = checkAddToFront(@scene)
      when 3
        @error, @correct = checkAddToFront2(@scene)
      when 4
        @error, @correct = checkAddToFront3(@scene)
      when 5
        @error, @correct = checkAddToMiddle(@scene)
      when 6
        @error, @correct = checkAddToMiddle2(@scene)
      when 7
        @error, @correct = checkAddToMiddle3(@scene) 
      when 8
        @error, @correct = checkAddToBack(@scene)
      when 9
        @error, @correct = checkAddToBack2(@scene) 
      when 10
        @error, @correct = checkAddToBack3(@scene)   
      when 11
        @error, @correct = checkRemoveFromBack(@scene)
      when 12
        @error, @correct = checkRemoveFromBack2(@scene)
      when 13
        @error, @correct = checkRemoveFromBack3(@scene)
      when 14
        @error, @correct = checkRemoveFromList(@scene)
      when 15
        @error, @correct = checkRemoveFromList2(@scene)
      when 16
        @error, @correct = checkRemoveFromList3(@scene)
      when 17
        @error, @correct = checkRemoveFromFront(@scene)
      when 18
        @error, @correct = checkRemoveFromFront2(@scene)
      when 19
        @error, @correct = checkRemoveFromFront3(@scene)
      when 20
        @error, @correct = checkSort3(@scene)
      when 21
        @error, @correct = checkSort2(@scene)
      when 22
        @error, @correct = checkSort3(@scene)
      when 23
        @error, @correct = checkReverse(@scene)
      when 24
        @error, @correct = checkReverse2(@scene)
      when 25
        @error, @correct = checkReverse3(@scene)
      end
      @scene.update_attribute(:correct, @correct)
      @scene.update_attribute(:submitted_at, DateTime.now-8.hours)
    end
  end

  def checkAddToFront(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
      #Check if there is a list head
      @head = Node.find_by(scene_id: @scene.id, head: true)
      @nodes = Node.where(scene_id: @scene.id, head: false, visible: true)
      if @head.nil?
        @error = "You need a list head"
        @correct = false
      #Check that the list head points to something
      elsif @head.next_pointer_target_id.nil?
        @error = "Make sure that you list head is pointing to the beginning of your list. 
        If you try to point to the node you want to add make sure you don't drop the rest of the list."
        @correct = false
      else
        if @nodes.nil? || @nodes.length < 3
          @error = "You need to have 3 nodes in your list.  Make sure you don't drop the rest of your list."
          @correct = false
        else
          #Check that nodes are in order
          @firstnode = Node.find_by(scene_id: @scene.id, scene_count: @head.next_pointer_target_id, visible: true)

          if @firstnode.nil?
            @secondnode = nil
          elsif !@firstnode.scene_count == 4
            @error = "You didn't add the node to the front of the list.  Make sure that you put the node right after 
            the list head and before any other nodes."
            @correct = false
          else
            @secondnode = Node.find_by(scene_id: @scene.id, scene_count: @firstnode.next_pointer_target_id, visible: true)
          end
          if @secondnode.nil?
            @thirdnode = nil
          else
            @thirdnode = Node.find_by(scene_id: @scene.id, scene_count: @secondnode.next_pointer_target_id, visible: true)
          end
          if @firstnode.nil? || @secondnode.nil? || @thirdnode.nil?
            @error = "You need to have the nodes in your list connected and pointing to the next node"
            @correct = false
          end
        end
        if @correct
          @error = "You nailed it! Way to go!"
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkAddToFront2(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
      #Check if there is a list head
      @head = Node.find_by(scene_id: @scene.id, head: true)
      @nodes = Node.where(scene_id: @scene.id, head: false, visible: true)
      if @head.nil?
        @error = "You need a list head"
        @correct = false
      #Check that the list head points to something
      elsif @head.next_pointer_target_id.nil?
        @error = "Make sure that you list head is pointing to the beginning of your list. 
        If you try to point to the node you want to add make sure you don't drop the rest of the list."
        @correct = false
      else
        if @nodes.nil? || @nodes.length < 5
          @error = "You need to have 5 nodes in your list.  Make sure you don't drop the rest of your list."
          @correct = false
        else
          #Check that nodes are in order
          @firstnode = Node.find_by(scene_id: @scene.id, scene_count: @head.next_pointer_target_id, visible: true)

          if @firstnode.nil?
            @secondnode = nil
          elsif !@firstnode.scene_count == 6
            @error = "You didn't add the node to the front of the list.  Make sure that you put the node right after 
            the list head and before any other nodes."
            @correct = false
          else
            @secondnode = Node.find_by(scene_id: @scene.id, scene_count: @firstnode.next_pointer_target_id, visible: true)
          end
          if @secondnode.nil?
            @thirdnode = nil
          else
            @thirdnode = Node.find_by(scene_id: @scene.id, scene_count: @secondnode.next_pointer_target_id, visible: true)
          end
          if @thirdnode.nil?
            @fourthnode = nil
          else
            @fourthnode = Node.find_by(scene_id: @scene.id, scene_count: @thirdnode.next_pointer_target_id, visible: true)
          end
          if @fourthnode.nil?
            @fifthnode = nil
          else
            @fifthnode = Node.find_by(scene_id: @scene.id, scene_count: @fourthnode.next_pointer_target_id, visible: true)
          end
          if @firstnode.nil? || @secondnode.nil? || @thirdnode.nil?|| @fourthnode.nil? || @fifthnode.nil?
            @error = "You need to have the nodes in your list connected and pointing to the next node"
            @correct = false
          end
        end
        if @correct
          @error = "You nailed it! Way to go!"
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkAddToFront3(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
      #Check if there is a list head
      @head = Node.find_by(scene_id: @scene.id, head: true)
      @nodes = Node.where(scene_id: @scene.id, head: false, visible: true)
      if @head.nil?
        @error = "You need a list head"
        @correct = false
      #Check that the list head points to something
      elsif @head.next_pointer_target_id.nil?
        @error = "Make sure that you list head is pointing to the beginning of your list. 
        If you try to point to the node you want to add make sure you don't drop the rest of the list."
        @correct = false
      else
        if @nodes.nil? || @nodes.length < 3
          @error = "You need to have 3 nodes in your list.  Make sure you don't drop the rest of your list."
          @correct = false
        else
          #Check that nodes are in order
          @firstnode = Node.find_by(scene_id: @scene.id, scene_count: @head.next_pointer_target_id, visible: true)

          if @firstnode.nil?
            @secondnode = nil
          elsif !@firstnode.scene_count == 6
            @error = "You didn't add the node to the front of the list.  Make sure that you put the node right after 
            the list head and before any other nodes."
            @correct = false
          else
            @secondnode = Node.find_by(scene_id: @scene.id, scene_count: @firstnode.next_pointer_target_id, visible: true)
          end
          if @secondnode.nil?
            @thirdnode = nil
          else
            @thirdnode = Node.find_by(scene_id: @scene.id, scene_count: @secondnode.next_pointer_target_id, visible: true)
          end
          if @firstnode.nil? || @secondnode.nil? || @thirdnode.nil?
            @error = "You need to have the nodes in your list connected and pointing to the next node"
            @correct = false
          elsif @firstnode.data1.to_i > @secondnode.data1.to_i || @secondnode.data1.to_i > @thirdnode.data1.to_i
            @error = "You need to have the nodes in your list in numerically ascending order"
            @correct = false
          end
        end
        if @correct
          @error = "You nailed it! Way to go!"
        end
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
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
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
          if @correct && !(@firstnode.data1.to_i < @secondnode.data1.to_i && @secondnode.data1.to_i < @thirdnode.data1.to_i)
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

  def checkAddToMiddle2(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
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
        if @nodes.nil? || @nodes.length < 5
          @error = "You need to have 5 nodes in your list.  Make sure you don't drop the rest of your list."
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
          if @thirdnode.nil?
            @fourthnode = nil
          else
            @fourthnode = Node.find_by(scene_id: @scene.id, scene_count: @thirdnode.next_pointer_target_id, visible: true)
          end
          if @fourthnode.nil?
            @fifthnode = nil
          else
            @fifthnode = Node.find_by(scene_id: @scene.id, scene_count: @fourthnode.next_pointer_target_id, visible: true)
          end
          if @firstnode.nil? || @secondnode.nil? || @thirdnode.nil?|| @fourthnode.nil? || @fifthnode.nil?
            @error = "You need to have the nodes in your list connected and pointing to the next node"
            @correct = false
          end
          if !(@firstnode.data1.to_i < @secondnode.data1.to_i && @secondnode.data1.to_i < @thirdnode.data1.to_i && @thirdnode.data1.to_i < @fourthnode.data1.to_i && @fourthnode.data1.to_i < @fifthnode.data1.to_i)
            @error = "Make sure that the nodes are in the correct numerical order"
            @correct = false
          end
          if @correct
            @error = "You nailed it! Way to go!"
          else
            @error = "SOMETHING WENT WRONG"
          end
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkAddToMiddle3(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
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
          #<=> returns -1 is left is first alphabetically as the data is strings
          if (@firstnode.data1 <=> @secondnode.data1) != -1 && (@secondnode.data1 <=> @thirdnode.data1) != -1
            @error = "Make sure that the nodes are in the correct alphabetical order"
            @correct = false
          end
          if @correct
            @error = "You nailed it! Way to go!"
          end
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkAddToBack(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
      #Check if there is a list head
      @head = Node.find_by(scene_id: @scene.id, head: true)
      @nodes = Node.where(scene_id: @scene.id, head: false, visible: true)
      if @head.nil?
        @error = "You need a list head"
        @correct = false
      #Check that the list head points to something
      elsif @head.next_pointer_target_id.nil?
        @error = "Make sure that you list head is pointing to the beginning of your list. 
        If you try to point to the node you want to add make sure you don't drop the rest of the list."
        @correct = false
      else
        if @nodes.nil? || @nodes.length < 3
          @error = "You need to have 3 nodes in your list.  Make sure you don't drop the rest of your list."
          @correct = false
        else
          #Check that nodes are in order
          @firstnode = Node.find_by(scene_id: @scene.id, scene_count: @head.next_pointer_target_id, visible: true)

          if @firstnode.nil?
            @secondnode = nil
            @correct = false
          else
            @secondnode = Node.find_by(scene_id: @scene.id, scene_count: @firstnode.next_pointer_target_id, visible: true)
          end
          if @secondnode.nil?
            @thirdnode = nil
          else
            @thirdnode = Node.find_by(scene_id: @scene.id, scene_count: @secondnode.next_pointer_target_id, visible: true)
          end
          if @firstnode.nil? || @secondnode.nil? || @thirdnode.nil?
            @error = "You need to have the nodes in your list connected and pointing to the next node"
            @correct = false
          end
          if !@thirdnode.nil? && @thirdnode.scene_count != 4
            @error = "You need to add the node to the end of the list"
            @correct = false
          end
        end
        if @correct
          @error = "You nailed it! Way to go!"
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkAddToBack2(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
      #Check if there is a list head
      @head = Node.find_by(scene_id: @scene.id, head: true)
      @nodes = Node.where(scene_id: @scene.id, head: false, visible: true)
      if @head.nil?
        @error = "You need a list head"
        @correct = false
      #Check that the list head points to something
      elsif @head.next_pointer_target_id.nil?
        @error = "Make sure that you list head is pointing to the beginning of your list. 
        If you try to point to the node you want to add make sure you don't drop the rest of the list."
        @correct = false
      else
        if @nodes.nil? || @nodes.length < 5
          @error = "You need to have 5 nodes in your list.  Make sure you don't drop the rest of your list."
          @correct = false
        else
          #Check that nodes are in order
          @firstnode = Node.find_by(scene_id: @scene.id, scene_count: @head.next_pointer_target_id, visible: true)

          if @firstnode.nil?
            @secondnode = nil
            @correct = false
          else
            @secondnode = Node.find_by(scene_id: @scene.id, scene_count: @firstnode.next_pointer_target_id, visible: true)
          end
          if @secondnode.nil?
            @thirdnode = nil
          else
            @thirdnode = Node.find_by(scene_id: @scene.id, scene_count: @secondnode.next_pointer_target_id, visible: true)
          end
          if @thirdnode.nil?
            @fourthnode = nil
          else
            @fourthnode = Node.find_by(scene_id: @scene.id, scene_count: @thirdnode.next_pointer_target_id, visible: true)
          end
          if @fourthnode.nil?
            @fifthnode = nil
          else
            @fifthnode = Node.find_by(scene_id: @scene.id, scene_count: @fourthnode.next_pointer_target_id, visible: true)
          end
          if @firstnode.nil? || @secondnode.nil? || @thirdnode.nil? || @fourthnode.nil? || @fifthnode.nil?
            @error = "You need to have the nodes in your list connected and pointing to the next node"
            @correct = false
          end
          if !@fifthnode.nil? && @fifthnode.scene_count != 6
            @error = "You need to add the node to the end of the list"
            @correct = false
          end
        end
        if @correct
          @error = "You nailed it! Way to go!"
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkAddToBack3(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
      #Check if there is a list head
      @head = Node.find_by(scene_id: @scene.id, head: true)
      @nodes = Node.where(scene_id: @scene.id, head: false, visible: true)
      if @head.nil?
        @error = "You need a list head"
        @correct = false
      #Check that the list head points to something
      elsif @head.next_pointer_target_id.nil?
        @error = "Make sure that you list head is pointing to the beginning of your list. 
        If you try to point to the node you want to add make sure you don't drop the rest of the list."
        @correct = false
      else
        if @nodes.nil? || @nodes.length < 3
          @error = "You need to have 3 nodes in your list.  Make sure you don't drop the rest of your list."
          @correct = false
        else
          #Check that nodes are in order
          @firstnode = Node.find_by(scene_id: @scene.id, scene_count: @head.next_pointer_target_id, visible: true)

          if @firstnode.nil?
            @secondnode = nil
            @correct = false
          else
            @secondnode = Node.find_by(scene_id: @scene.id, scene_count: @firstnode.next_pointer_target_id, visible: true)
          end
          if @secondnode.nil?
            @thirdnode = nil
          else
            @thirdnode = Node.find_by(scene_id: @scene.id, scene_count: @secondnode.next_pointer_target_id, visible: true)
          end
          if @firstnode.nil? || @secondnode.nil? || @thirdnode.nil?
            @error = "You need to have the nodes in your list connected and pointing to the next node"
            @correct = false
          end
          if !@thirdnode.nil? && @thirdnode.scene_count != 4
            @error = "You need to add the node to the end of the list"
            @correct = false
          end
          if @firstnode.data1.to_i > @secondnode.data1.to_i || @secondnode.data1.to_i > @thirdnode.data1.to_i
            @error = "Make sure the list is still in numerically ascending order"
            @correct = false
          end
        end
        if @correct
          @error = "You nailed it! Way to go!"
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
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
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
        else
          @secondnode = Node.find_by(scene_id: @scene.id, scene_count: @firstnode.next_pointer_target_id)
        end
        if @firstnode.nil? || @secondnode.nil?
          @error = "You need to have the nodes in your list connected and pointing to the next node"
          @correct = false
        end
        @error = "You nailed it! Way to go!"
        @correct = true
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkRemoveFromBack2(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
      #Check if there is a list head
      @head = Node.find_by(scene_id: @scene.id, head: true)
      @nodes = Node.where(scene_id: @scene.id, head: false, visible: true)
      if @head.nil?
        @error = "You need a list head"
        @correct = false
      #Check that the list head points to something
      elsif @head.next_pointer_target_id.nil?
        @error = "Make sure that you list head is pointing to the beginning of your list. 
        If you try to point to the node you want to add make sure you don't drop the rest of the list."
        @correct = false
        #Check that there are 3 nodes in the list
      else
        if @nodes.nil? || !@nodes.length == 3
          @error = "You need to have 3 nodes in your list.  Make sure you don't drop the rest of your list."
          @correct = false
        end
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
        if @correct
          @error = "You nailed it! Way to go!"
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkRemoveFromBack3(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
      #Check if there is a list head
      @head = Node.find_by(scene_id: @scene.id, head: true)
      @nodes = Node.where(scene_id: @scene.id, head: false, visible: true)
      if @head.nil?
        @error = "You need a list head"
        @correct = false
      #Check that the list head points to something
      elsif @head.next_pointer_target_id.nil?
        @error = "Make sure that you list head is pointing to the beginning of your list. 
        If you try to point to the node you want to add make sure you don't drop the rest of the list."
        @correct = false
        #Check that there are 3 nodes in the list
      else
        if @nodes.nil? || !@nodes.length == 0
          @error = "You need to have 0 nodes in your list.  Make sure you don't drop the rest of your list."
          @correct = false
        end
        if @correct
          @error = "You nailed it! Way to go!"
        end
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
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
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

  def checkRemoveFromList2(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
      #Check if there is a list head
      @head = Node.find_by(scene_id: @scene.id, head: true)
      @nodes = Node.where(scene_id: @scene.id, head: false)
      if @head.nil?
        @error = "You need a list head"
        @correct = false
      #Check that the list head points to something
      elsif @head.next_pointer_target_id.nil?
        @error = "Make sure that you list head is pointing to the beginning of your list. 
        Don't drop the whole list unless you need to."
        @correct = false
      else
        @nodes.each do |n| 
          if n.visible
            if n.scene_count < 6
              if Integer(n.data1.to_i).even?
                @error = "Make sure to remove all even nodes"
                @correct = false
              end
            end
          else
            if !Integer(n.data1.to_i).even?
              @error = "Make sure to keep all odd nodes in the list"
              @correct = false
            end
          end
        end
        if @correct
          @error = "Correct, way to go"
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkRemoveFromList3(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
      #Check if there is a list head
      @head = Node.find_by(scene_id: @scene.id, head: true)
      @nodes = Node.where(scene_id: @scene.id, head: false)
      if @head.nil?
        @error = "You need a list head"
        @correct = false
      #Check that the list head points to something
      elsif @head.next_pointer_target_id.nil?
        @error = "Make sure that you list head is pointing to the beginning of your list. 
        Don't drop the whole list unless you need to."
        @correct = false
      else
        @nodes.each do |n| 
          if n.visible
            if n.scene_count < 6
              if n.data1.nil? || n.head
                @error = "Make sure to remove all nodes with no instance data"
                @correct = false
              end
            end
          else
            if !n.data1.nil?
              @error = "Make sure to keep all odd nodes in the list"
              @correct = false
            end
          end
        end
        if @correct
          @error = "Correct, way to go"
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkRemoveFromFront(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
      #Check if there is a list head
      @head = Node.find_by(scene_id: @scene.id, head: true)
      @nodes = Node.where(scene_id: @scene.id, head: false)
      if @head.nil?
        @error = "You need a list head"
        @correct = false
      #Check that the list head points to something
      elsif @head.next_pointer_target_id.nil?
        @error = "Make sure that you list head is pointing to the beginning of your list. 
        Don't drop the whole list unless you need to."
        @correct = false
      else
        @nodes.each do |n| 
          p n
          if n.visible
            if n.scene_count < 6
              if n.scene_count == 2
                @error = "Make sure to remove the first node in the list"
                @correct = false
              end
            end
          else
            if n.scene_count != 2
              @error = "Make sure to keep all nodes in the list that aren't the first node"
              @correct = false
            end
          end
        end
        if @correct
          @error = "Correct, way to go"
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkRemoveFromFront2(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
      #Check if there is a list head
      @head = Node.find_by(scene_id: @scene.id, head: true)
      @nodes = Node.where(scene_id: @scene.id, head: false)
      if @head.nil?
        @error = "You need a list head"
        @correct = false
      #Check that the list head points to something
      elsif @head.next_pointer_target_id.nil?
        @error = "Make sure that you list head is pointing to the beginning of your list. 
        Don't drop the whole list unless you need to."
        @correct = false
      else
        @nodes.each do |n| 
          if n.visible
            if n.scene_count < 6
              if n.scene_count == 2
                @error = "Make sure to remove the node with the smallest instance data in the list"
                @correct = false
              end
            end
          else
            if n.scene_count != 2
              @error = "Make sure to keep all nodes in the list that don't have the smallest instance data"
              @correct = false
            end
          end
        end
        if @correct
          @error = "Correct, way to go"
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkRemoveFromFront3(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
      #Check if there is a list head
      @head = Node.find_by(scene_id: @scene.id, head: true)
      @nodes = Node.where(scene_id: @scene.id, head: false)
      if @head.nil?
        @error = "You need a list head"
        @correct = false
      #Check that the list head points to something
      elsif @head.next_pointer_target_id.nil?
        @error = "Make sure that you list head is pointing to the beginning of your list. 
        Don't drop the whole list unless you need to."
        @correct = false
      else
        @nodes.each do |n| 
          if n.visible
            if n.scene_count < 3
              @error = "Remove the first node in the list"
              @correct = false
            end
          end
        end
        if @correct
          @error = "Correct, way to go"
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkSort(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
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
          if !(@firstnode.data1.to_i < @secondnode.data1.to_i && @secondnode.data1.to_i < @thirdnode.data1.to_i)
            @error = "Make sure that the nodes are in the correct numerical order"
            @correct = false
          end
          if @correct
            @error = "You nailed it! Way to go!"
          else
            @error = "SOMETHING WENT WRONG"
          end
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkSort2(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
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
          elsif !(@firstnode.data1.to_i < @secondnode.data1.to_i && @secondnode.data1.to_i < @thirdnode.data1.to_i)
            @error = "Make sure that the nodes are in the correct numerical order"
            @correct = false
          end
          if @correct
            @error = "You nailed it! Way to go!"
          end
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkSort3(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
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
        if @nodes.nil? || @nodes.length < 4
          @error = "You need to have 4 nodes in your list.  Make sure you don't drop the rest of your list."
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
          if @thirdnode.nil?
            @fourthnode = nil
          else
            @fourthnode = Node.find_by(scene_id: @scene.id, scene_count: @thirdnode.next_pointer_target_id)
          end
          if @firstnode.nil? || @secondnode.nil? || @thirdnode.nil? || @fourthnode.nil?
            @error = "You need to have the nodes in your list connected and pointing to the next node"
            @correct = false
          elsif (@firstnode.data1 <=> @secondnode.data1) != -1 && (@secondnode.data1 <=> @thirdnode.data1) != -1 && (@thirdnode.data1 <=> @fourthnode.data1) != -1
            @error = "Make sure that the nodes are in the correct alphabetical order"
            @correct = false
          end
          if @correct
            @error = "You nailed it! Way to go!"
          end
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkReverse(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
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
          if !(@firstnode.data1.to_i < @secondnode.data1.to_i && @secondnode.data1.to_i < @thirdnode.data1.to_i)
            @error = "Make sure that the nodes are in the correct numerical order"
            @correct = false
          end
          if @correct
            @error = "You nailed it! Way to go!"
          else
            @error = "SOMETHING WENT WRONG"
          end
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkReverse2(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
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
          if @thirdnode.nil?
            @fourthnode = nil
          else
            @fourthnode = Node.find_by(scene_id: @scene.id, scene_count: @thirdnode.next_pointer_target_id)
          end
          if @firstnode.nil? || @secondnode.nil? || @thirdnode.nil? || @fourthnode.nil?
            @error = "You need to have the nodes in your list connected and pointing to the next node"
            @correct = false
          end
          if !(@firstnode.data1.to_i > @secondnode.data1.to_i && @secondnode.data1.to_i > @thirdnode.data1.to_i && @thirdnode.data1.to_i > @fourthnode.data1.to_i)
            @error = "Make sure that the nodes are in the correct numerical order"
            @correct = false
          end
          if @correct
            @error = "You nailed it! Way to go!"
          else
            @error = "SOMETHING WENT WRONG"
          end
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def checkReverse3(scene)
    @scene = scene
    @correct = true
    @error = ""
    if user_signed_in? && (@scene.creator_id == current_user.id || @scene.collab_id == current_user.id)
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
        if @nodes.nil? || @nodes.length < 4
          @error = "You need to have 4 nodes in your list.  Make sure you don't drop the rest of your list."
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
          if @thirdnode.nil?
            @fourthnode = nil
          else
            @fourthnode = Node.find_by(scene_id: @scene.id, scene_count: @thirdnode.next_pointer_target_id)
          end
          if @firstnode.nil? || @secondnode.nil? || @thirdnode.nil? || @fourthnode.nil?
            @error = "You need to have the nodes in your list connected and pointing to the next node"
            @correct = false
          elsif (@firstnode.data1 <=> @secondnode.data1) != -1 && (@secondnode.data1 <=> @thirdnode.data1) != -1 && (@thirdnode.data1 <=> @fourthnode.data1) != -1
            @error = "Make sure that the nodes are in the correct alphabetical order"
            @correct = false
          end
          if @correct
            @error = "You nailed it! Way to go!"
          end
        end
      end
    else
      @error = "You are not signed in or didn't work on this question"  
    end
    return @error, @correct
  end

  def scene_params
      params.require(:scene).permit(:step)
  end
end
