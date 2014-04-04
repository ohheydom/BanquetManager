require 'spec_helper'

describe TodolistsController do
  describe 'find_prev_tuesday method' do
    it 'returns 12/24/13 is date is sunday, 12/29/13' do
      expect(TodolistsController.new.find_prev_tuesday('12/29/13').strftime('%D')).to eq('12/24/13')
    end
    it 'returns 12/31/13 if date is monday, 12/30/13' do
      expect(TodolistsController.new.find_prev_tuesday('12/30/13').strftime('%D')).to eq('12/31/13')
    end
    it 'returns 12/31/13 if date is a Tuesday, 12/31/13' do
      expect(TodolistsController.new.find_prev_tuesday('12/31/13').strftime('%D')).to eq('12/31/13')
    end
    it 'returns 12/31 if date is Wedneday, 1/1/14' do
      expect(TodolistsController.new.find_prev_tuesday('1/1/14').strftime('%D')).to eq('12/31/13')
    end
    it 'returns 12/31 if date is Thursday, 1/2/14' do
      expect(TodolistsController.new.find_prev_tuesday('1/2/14').strftime('%D')).to eq('12/31/13')
    end
    it 'returns 12/31 if date is Friday, 1/3/14' do
      expect(TodolistsController.new.find_prev_tuesday('1/3/14').strftime('%D')).to eq('12/31/13')
    end
    it 'returns 12/31 if date is Saturday, 1/4/14' do
      expect(TodolistsController.new.find_prev_tuesday('1/4/14').strftime('%D')).to eq('12/31/13')
    end
  end
end
