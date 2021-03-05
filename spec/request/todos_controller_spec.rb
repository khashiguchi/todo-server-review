require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  let!(:todos) { create_list(:todo, 10) }
  let(:todo_id) { todos.first.id }

  describe '[index] Get /todos' do
    before {get '/todos'}

    it 'returns todos and status code (200)'do
      expect(json).not_to be_empty
      expect(response).to have_http_status(200)
    end

    it 'is present 10 todos' do
      expect(json.size).to eq(10)
    end
  end

  describe '[create] POST /todos' do
    let(:todo_title) { 'sample_title' }
    context 'when the request is satisfactory' do
      before { post '/todos', params:{title: todo_title}}
      it 'create the title of todo' do
        expect(json['title']).to eq('sample_title')
      end

      it 'returns status code (201)' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the todo with blank title requested' do
      before { post '/todos', params:{title: ''}}
      it 'returns error message' do
        expect(response.body).to match(/Validation failed: Title can't be blank/)
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe '[update] PUT /todos/:id' do
    let(:update_title){ "update_sample_title" }
    before { put "/todos/#{todo_id}", params:{title: update_title}}
    context 'exist the record of the id' do
      it 'is blank' do
        expect(response.body).to be_empty
      end
    end

    it 'is returns status code (204)' do
      expect(response).to have_http_status(204)
    end
  end

  describe '[delete] DELETE /todos/:id' do
    before { put "/todos/#{todo_id}" }

    it 'returns status code (204)' do
      expect(response).to have_http_status(204)
    end
  end
end