ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :first_name, :last_name, :email, :password, :password_confirmation, :admin

  index do
    selectable_column
    column :email
    column :admin
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs 'User Details' do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin
      f.actions
    end
  end

end
