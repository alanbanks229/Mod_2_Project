class SessionsController < ApplicationController
    def create
        # ...
        #session[:current_user_id] = @user.id
        # ...

        user = User.authenticate(params[:email], params[:password])
        if user
            session[:user_id] user.id
            #below used redirect_to root_url... but in our case i think we use other way.
            redirect_to user_path(user), :notice => "Logged in!"
        else
            flash.now.alert = "Invalid email or password"
            render "new"
        end
    end

    def new

    end

    def destroy
        session[:user_id] = nil
        redirect_to root_url, :notice => "Logged out!"
    end
    application_controller.rb
    helper_method :current_user

    private 

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    # routes .rb
    get "log_out" => "sessions#destroy", :as => "log_out"
    get "log_in" => "sessions#new", :as => "log_in"
    get "sign_up" => "users#new", :as => "sign_up"
    root :to => "users#new"
    resources :users
    resources :sessions

    # users/new.html.erb
    <h1> Sign Up </h1>
    <%= form_for @user do |f| %>
        <% if @user.derrors.any? %>
            <div class="error_messages">
                <h2>Form is invalid</h2>
                <ul>
                    <% for message in @user.errors.full_messages %>
                        <li<%= message %></li>
                    <% end %>
                </ul>
            </div>
        <% end %>
    <p>
       <%= f.label :email %><br />
       <%= f.text_field :email %>
    </p>
    <p>
        <%= f.label :password %><br />
        <%= f.password_field :password %>
    </p>
    <p>
        <%= f.label :password_confirmation %><br />
        <%= f.password_field :password_confirmation %>
    </p>
    <p class="button"><%= f.submit %></p>
    <% end %>
        

end