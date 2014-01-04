require 'spec_helper'

describe "Clients Pages" do
  describe "Index Page" do
    it "has a link to a todo list" do
      visit clients_path
      expect(page).to have_link("Six Week Schedule", todolist_path)
    end
    it "has a sort by All/Previous/Future events" do
      visit clients_path
      expect(page).to have_content('Sort')
    end
  end
end 
