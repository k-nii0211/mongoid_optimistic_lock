require 'spec_helper'

describe MongoidOptimisticLock do
  it 'has a version number' do
    expect(MongoidOptimisticLock::VERSION).not_to be nil
  end

  context 'when there is no default scope' do
    context 'when the document is new' do
      it 'returns 1' do
        expect(Blog.new.version).to eq(1)
      end
    end
  end

  context 'when the document is persisted once' do
    let(:blog) { Blog.create(title: '1') }
    it 'returns 1' do
      expect(blog.version).to eq(1)
    end
  end

  context 'when the document is persisted more than once' do
    let(:blog) { Blog.create(title: '1') }

    before do
      3.times { |n| blog.update_attribute(:title, "#{n}") }
    end

    it 'returns the number of versions' do
      expect(blog.version).to eq(4)
    end
  end
end
