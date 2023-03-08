Rails.application.routes.draw do

get("/", { :controller => "body_parts", :action => "index" })

  # Routes for the Bookmark resource:
  post("/add_bookmark", {:controller => "stretches", :action => "add_user_bookmark"})
  # CREATE
  post("/insert_bookmark", { :controller => "bookmarks", :action => "create" })
          
  # READ
  get("/bookmarks", { :controller => "bookmarks", :action => "index" })
  
  get("/bookmarks/:path_id", { :controller => "bookmarks", :action => "show" })
  
  # UPDATE
  
  post("/modify_bookmark/:path_id", { :controller => "bookmarks", :action => "update" })
  
  # DELETE
  get("/delete_bookmark/:path_id", { :controller => "bookmarks", :action => "destroy" })

  #------------------------------

  # Routes for the User body part resource:

  # CREATE
  post("/insert_user_body_part", { :controller => "user_body_parts", :action => "create" })
          
  # READ
  get("/user_body_parts", { :controller => "user_body_parts", :action => "index" })
  
  get("/user_body_parts/:path_id", { :controller => "user_body_parts", :action => "show" })
  
  # UPDATE
  
  post("/modify_user_body_part/:path_id", { :controller => "user_body_parts", :action => "update" })
  
  # DELETE
  get("/delete_user_body_part/:path_id", { :controller => "user_body_parts", :action => "destroy" })

  #------------------------------

  # Routes for the Stretch resource:

  # CREATE
  post("/insert_stretch", { :controller => "stretches", :action => "create" })
          
  # READ
  get("/stretches", { :controller => "stretches", :action => "index" })
  
  get("/stretches/:path_id", { :controller => "stretches", :action => "show" })
  
  # UPDATE
  
  post("/modify_stretch/:path_id", { :controller => "stretches", :action => "update" })
  
  # DELETE
  get("/delete_stretch/:path_id", { :controller => "stretches", :action => "destroy" })

  #------------------------------

  # Routes for the Body part resource:

  # CREATE
  post("/insert_body_part", { :controller => "body_parts", :action => "create" })
          
  # READ
  get("/body_parts", { :controller => "body_parts", :action => "index" })
  
  get("/body_parts/:path_id", { :controller => "body_parts", :action => "show" })
  
  # UPDATE
  
  post("/modify_body_part/:path_id", { :controller => "body_parts", :action => "update" })
  
  # DELETE
  get("/delete_body_part/:path_id", { :controller => "body_parts", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
