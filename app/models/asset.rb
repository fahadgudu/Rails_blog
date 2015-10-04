class Asset < ActiveRecord::Base
  belongs_to :assetable, :polymorphic => true
  before_validation :assetable_type
  def assetable_type=(sType)
     super(sType.to_s.classify.constantize.base_class.to_s)
  end
end