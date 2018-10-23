ActiveAdmin.register Coupon do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :type, :amount, :starts_at, :ends_at, :code

  index do
    selectable_column
    column :id
    column(:type) { |coupon| coupon.type.split('::')[1] }
    column :code
    column :amount
    column :active
    actions
  end

  form do |f|
    f.inputs 'New Coupon' do
      f.input :type, as: :select, collection: {
        "Dollar": 'Coupons::Dollar',
        "Percent Off": 'Coupons::Percent'
      }
      f.input :amount
      f.input :starts_at
      f.input :ends_at
      f.input :code
    end
    f.actions
  end

  show do
    attributes_table do
      row(:type) {|coupon| coupon.type.split('::')[1]}
      row :value
      row :starts_at
      row :ends_at
      row :code
      row :active
    end
  end

end
