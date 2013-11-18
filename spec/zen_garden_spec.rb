require 'spec_helper'
require 'zen_garden'

describe ZenGarden do
  let(:app_name) { 'example' }
  before { ENV['HEROKU_APP_NAME'] = app_name }

  it "defines the module for this plugin" do
    expect(ZenGarden).to be_a Module
  end

  it "includes other modules for the rake tasks" do
    expect(ZenGarden::SSH).to be_a Module
    expect(ZenGarden::Database).to be_a Module
  end

  it "knows the name of the Heroku app" do
    expect(ZenGarden.app_name).to eq(app_name)
  end
end
