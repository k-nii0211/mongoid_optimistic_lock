require 'spec_helper'

describe Mongoid::OptimisticLock do
  context 'when there is no default scope' do
    context 'when the document is new' do
      it 'returns 1' do
        expect(Blog.new.lock_version).to eq(1)
      end
    end
  end

  context 'when the document is persisted once' do
    let(:blog) { Blog.create(title: '1') }
    it 'returns 1' do
      expect(blog.lock_version).to eq(1)
    end
  end

  context 'when the document is persisted more than once' do
    let(:blog) { Blog.create(title: '1') }

    before do
      3.times { |n| blog.update_attribute(:title, "#{n}") }
    end

    it 'returns the number of versions' do
      expect(blog.lock_version).to eq(4)
    end
  end

  context 'when the document is persisted more than once' do
    let(:blog) { Blog.create(title: '1') }

    it 'returns the number of versions' do
      expect(blog.update({title: '2', lock_version: 1})).to be_truthy
      expect(blog.update({title: '3', lock_version: 1})).to be_falsey
      expect(blog.update({title: '3', lock_version: 2})).to be_truthy
    end
  end
end
