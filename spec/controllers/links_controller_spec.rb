require 'rails_helper'

RSpec.describe LinksController, type: :controller do

  describe "#show" do
    context 'with a slug' do
      let(:slug) { '7pt' }
      let(:url) { 'https://google.com' }
      let(:link) { double(id: 7, url: url) }

      context 'that exists' do
        before do
          allow(Link).to receive(:find_by).with(slug: slug).and_return(link)
        end

        it 'redirects' do
          allow(LinkWorker).to receive(:perform_async).with(link.id)
          get :show, params: { slug: slug }
          expect(response).to redirect_to(url)
        end

        it 'enqueues the job' do
          expect(LinkWorker).to receive(:perform_async).with(link.id)
          get :show, params: { slug: slug }
        end
      end

      context 'that does not exist' do
        before do
          allow(Link).to receive(:find_by).with(slug: slug).and_return(nil)
        end

        it 'returns not_found' do
          allow(LinkWorker).to receive(:perform_async).with(link.id)
          get :show, params: { slug: slug }
          expect(response).to have_http_status(:not_found)
        end
      end
    end
  end
end
