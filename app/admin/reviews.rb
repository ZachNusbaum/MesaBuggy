ActiveAdmin.register Review do
  actions :all, except: [:show, :new, :create]
  permit_params :body, :rating, :hidden
  menu parent: 'Products'

  form do |f|
    f.inputs 'Product Review' do
      f.input :body
      f.input :rating
      f.input :hidden
    end
    f.actions
  end
end
