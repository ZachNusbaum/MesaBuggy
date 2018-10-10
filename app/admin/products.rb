ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :description, :category_id, :price_cents, :quantity, :weight, :published, images: []

  form do |f|
    f.inputs 'Product Details' do
      f.input :category
      f.input :name
      f.input :description
      f.input :price
      f.input :quantity
      f.input :weight
      f.input :published
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end

  show do
    attributes_table do
      row :category
      row :name
      row :description
      row :price
      row :quantity
      row :weight
      row :published
    end

    product.images.each do |image|
      para raw("<img src=\"#{url_for image}\">")
      para(link_to('Delete', attachment_path(image.id), method: :delete))
    end
  end

end
