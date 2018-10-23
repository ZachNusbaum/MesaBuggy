ActiveAdmin.register Category do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :description

  index do
    selectable_column
    column :id
    column :name
    column('Product count') { |cat| cat.products.count }
    column :created_at
    column :updated_at
    actions
  end

end
