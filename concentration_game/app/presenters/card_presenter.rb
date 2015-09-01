class CardPresenter < BasePresenter

  presents :card

  def display_card
    display_card_front do
      display_corner_suit +
      case card.value
        when 11, 12, 13
          display_face_card_image +
          display_small_suits("11", "35") +
          display_corner_suit(true)
        when 1
          content_tag(:div, raw("&#{card.suit};"), class: "ace") +
          display_corner_suit(true)
        else
          display_small_suits(*Card::CSS_VALUE_MATCHING[card.value]) +
          display_corner_suit(true)
      end
    end
  end

  def display_blank_card
    content_tag(:div, "", class: "front")
  end

  def display_small_suits(*position_numbers)
    html_string = ""
    position_numbers.try(:each) do |n|
      html_string += content_tag(:div, raw("&#{card.suit};"), class: "position-#{n}")
    end
    raw(html_string)
  end

  def display_corner_suit(upside_down=false)
    css_class = upside_down ? "upside-down-index" : "index"
    content_tag(:div, raw("#{card.face}<br/>&#{card.suit};"), class: css_class)
  end

  def display_face_card_image
    image_tag("#{card.face.downcase}.gif", class: "face", width: "80", height: "130")
  end

  def display_card_front
    content_tag(:div, yield, data: {id: card.id}, class: "invisible front#{card.suit == 'clubs' || card.suit == 'spades' ? '' : ' red'}")
  end

end