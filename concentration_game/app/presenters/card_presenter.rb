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
        when 2
          display_small_suits("21", "25") +
          display_corner_suit(true)
        when 3
          display_small_suits("21", "25", "23") +
          display_corner_suit(true)
        when 4
          display_small_suits("11", "15", "31", "35") +
          display_corner_suit(true)
        when 5
          display_small_suits("11", "15", "31", "35", "23") +
          display_corner_suit(true)
        when 6
          display_small_suits("11", "13", "15", "31", "35", "33") +
          display_corner_suit(true)
        when 7
          display_small_suits("11", "13", "15", "31", "35", "33", "22") +
          display_corner_suit(true)
        when 8
          display_small_suits("11", "13", "15", "22", "24", "31", "33", "35") +
          display_corner_suit(true)
        when 9
          display_small_suits("11", "12", "14", "15", "23", "31", "32", "34", "35") +
          display_corner_suit(true)
        else
          display_small_suits("11", "12", "14", "15", "22", "24", "31", "32", "34", "35") +
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