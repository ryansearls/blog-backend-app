require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "should return an array of all posts" do
      user = User.create!(name: "bill", email: "bill@example.com", password: "password")

      post = Post.create!(title: "thing", body: "this is thing", image: "image.png", user_id: user.id)
      post = Post.create!(title: "hat", body: "this is hat", image: "image.png", user_id: user.id)

      get "/posts"
      posts = JSON.parse(response.body)
      expect(posts.length).to eq(2)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /posts/:id" do
    it "should return a single post" do
      user = User.create!(name: "bill", email: "bill@example.com", password: "password")

      post = Post.create!(title: "hat", body: "this is hat", image: "image.png", user_id: user.id)

      
      get "/posts/#{post.id}"
      posts = JSON.parse(response.body)
      expect(post["title"]).to eq("hat")
      expect(response).to have_http_status(200)
    end
  end

  # describe "POST /posts" do
  #   it "should create a post" do
  #     user = User.create!(name: "bill", email: "bill@example.com", password: "password")
  #     jwt = JWT.encode({user_id: user.id}, "random", "HS256")
  #       # Rails.application.credentials.fetch(:secret_key_base), "HS256")
      

  #     post "/posts", params: {
  #       title: "hat", 
  #       body: "this is hat", 
  #       image: "image.png", 
  #       user_id: user.id,
  #     },

      
  #     headers = { Authorization => "Bearer #{jwt}"}
  #     post = JSON.parse(response.body)

  #     expect(post["title"]).to eq("hat")
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
