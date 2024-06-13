module BadgesHelper
  def badge_image(badge)
    image_path = badge.custom_fields[:image]
    if image_path.present?
      image_tag(image_path, alt: badge.name, class: 'badge-image')
    else
      'No image available'
    end
  end
end
