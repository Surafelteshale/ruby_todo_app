RSpec.describe TodosController, type: :controller do
    let(:valid_attributes) { { task: 'Sample task', is_completed: false } }
    let(:invalid_attributes) { { task: '', is_completed: false } }
    let(:valid_session) { {} }
  
    describe 'GET #index' do
      it 'returns a success response' do
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end
  
    describe 'GET #show' do
      it 'returns a success response' do
        todo = Todo.create! valid_attributes
        get :show, params: { id: todo.to_param }, session: valid_session
        expect(response).to be_successful
      end
    end
  
    describe 'GET #new' do
      it 'returns a success response' do
        get :new, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end
  
    describe 'GET #edit' do
      it 'returns a success response' do
        todo = Todo.create! valid_attributes
        get :edit, params: { id: todo.to_param }, session: valid_session
        expect(response).to be_successful
      end
    end
  
    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new Todo' do
          expect {
            post :create, params: { todo: valid_attributes }, session: valid_session
          }.to change(Todo, :count).by(1)
        end
  
        it 'redirects to the created todo' do
          post :create, params: { todo: valid_attributes }, session: valid_session
          expect(response).to redirect_to(Todo.last)
        end
      end
  
      context 'with invalid params' do
        it 'returns a success response (i.e. to display the "new" template)' do
          post :create, params: { todo: invalid_attributes }, session: valid_session
          expect(response).to be_successful
        end
      end
    end
  
    describe 'PATCH #update' do
      context 'with valid params' do
        let(:new_attributes) { { task: 'Updated task' } }
  
        it 'updates the requested todo' do
          todo = Todo.create! valid_attributes
          patch :update, params: { id: todo.to_param, todo: new_attributes }, session: valid_session
          todo.reload
          expect(todo.task).to eq('Updated task')
        end
  
        it 'redirects to the todo' do
          todo = Todo.create! valid_attributes
          patch :update, params: { id: todo.to_param, todo: valid_attributes }, session: valid_session
          expect(response).to redirect_to(todo)
        end
      end
  
      context 'with invalid params' do
        it 'returns a success response (i.e. to display the "edit" template)' do
          todo = Todo.create! valid_attributes
          patch :update, params: { id: todo.to_param, todo: invalid_attributes }, session: valid_session
          expect(response).to be_successful
        end
      end
    end
  
    describe 'DELETE #destroy' do
      it 'destroys the requested todo' do
        todo = Todo.create! valid_attributes
        expect {
          delete :destroy, params: { id: todo.to_param }, session: valid_session
        }.to change(Todo, :count).by(-1)
      end
  
      it 'redirects to the todos list' do
        todo = Todo.create! valid_attributes
        delete :destroy, params: { id: todo.to_param }, session: valid_session
        expect(response).to redirect_to(todos_url)
      end
    end
  end
  
  