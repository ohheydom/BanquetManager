require 'spec_helper'

describe "Clients Pages" do
  describe "Index Page" do
    it "has a link to a todo list" do
      visit clients_path
      expect(page).to have_link("Six Week Schedule", todolist_path)
    end
    it "has a link to commissions" do
      visit clients_path
      expect(page).to have_link("Commissions", commissions_path)
    end
    it "has a sort by All/Past/Future events" do
      visit clients_path
      expect(page).to have_content('Future')
    end
  end
end 
