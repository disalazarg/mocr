require "../spec_helper"

describe Mocr::Server do
  it "responds on the root route" do
    get "/"

    resp = JSON.parse response.body.not_nil!

    response.status_code.should eq 200
    resp["service"].should eq "mocr"
    resp["status"].should eq "ok"
  end

  it "responds on a subroute" do
    get "/posts"

    resp = JSON.parse response.body.not_nil!

    response.status_code.should eq 200
    resp["title"].should eq "Title"
    resp["content"].should eq "content"
  end

  it "responds on a POST subroute" do
    post "/posts"

    resp = JSON.parse response.body.not_nil!

    response.status_code.should eq 201
  end
end
