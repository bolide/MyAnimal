module CollectionCellStylesheet
  def cell_size
    {w: 96, h: 116}
  end

  def collection_cell(st)
    st.frame = cell_size
    st.background_color = color.random

    # Style overall view here
  end

  def title(st)
    st.frame = {l:0,t:96,w:96,h:20}
    st.color = color.white
    st.text_alignment = :center
  end

  def animal_image(st)
    st.frame = {l:6,t:6,w:90,h:90}
    st.centered = :horizontal
  end
end
