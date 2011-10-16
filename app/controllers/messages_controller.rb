class MessagesController < ApplicationController

   before_filter :authenticate_user!

    def index
      #this action should be removed perhaps or only allowed for super users or something
      @messages = Message.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @messages }
      end
    end
    
    def new
      
      @message = Message.new
      
      #There should always be a listing with a Message, so go get it. 
      #TODO: is this safe.... 
      @listing = Listing.find(params[:id])
      
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @listing }
      end
    end
    
    def index_by_current_user
      #This will be used to create an "inbox" where a job poster can view his jobs
      @listings = Listing.find(:all, :conditions => ["user_id = ?", current_user.id])
      @messages = Array.new
      @listings.each do | listings |
        listings.messages.each do |message|
          @messages << message
        end
      end  
      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @messages }
      end
      
    end

    def show
      @message = Message.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @message }
      end
    end
    
    
    def create
      Rails.logger.debug ":::" + params.inspect
      Rails.logger.debug ":::" + params[:message].inspect
      Rails.logger.debug ":::" + params[:message][:listing].class.to_s
      #TODO: fix this.. hack. should just pass a different param.
      params[:message][:listing] = Listing.find(params[:message][:listing])
      @message = Message.new(params[:message])
      #Adding the user via the devise current_user user object. Validation should catch it if somehow this is nil
      @message.user = current_user

      respond_to do |format|
        if @message.save
          format.html { redirect_to listings_path, :notice => 'Message was successfully created.' }
          format.json { render :json => @message, :status => :created, :location => @message }
        else
          format.html { render :action => "new" }
          format.json { render :json => @message.errors, :status => :unprocessable_entity }
        end
      end
    end

end
