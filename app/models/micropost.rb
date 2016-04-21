class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size

  #リプライのmicropostの場合true，そうでない場合falseを返す
  def reply_present?
   !to_micropost_id.nil?
  end

  #リプライされている場合true, そうでない場合falseを返す
  def is_replied?
    !!Micropost.find_by(to_micropost_id: id)
  end

  #自分をreplyしているmicropostを探す
  def find_reply
    Micropost.where(to_micropost_id: id)
  end

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
