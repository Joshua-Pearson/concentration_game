class CardPresenter < BasePresenter

  presents :card

  def display_card
    content_tag(:div,
        content_tag(:div, raw("#{card.face}<br/>&#{card.suit};"), class: "index") +
        content_tag(:div, raw("&#{card.suit};"), class: "position-11") +
        content_tag(:div, raw("&#{card.suit};"), class: "position-12") +
        content_tag(:div, raw("&#{card.suit};"), class: "position-14") +
        content_tag(:div, raw("&#{card.suit};"), class: "position-15") +
        content_tag(:div, raw("&#{card.suit};"), class: "position-23") +
        content_tag(:div, raw("&#{card.suit};"), class: "position-31") +
        content_tag(:div, raw("&#{card.suit};"), class: "position-32") +
        content_tag(:div, raw("&#{card.suit};"), class: "position-34") +
        content_tag(:div, raw("&#{card.suit};"), class: "position-35"),
      data: {id: card.id}, class: "invisible front#{card.suit == 'clubs' || card.suit == 'spades' ? '' : ' red'}"
    )
  end

  def display_blank_card
    content_tag(:div, "", class: "front")
  end

end