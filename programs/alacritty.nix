{
  programs.alacritty = {
    enable = true;
    settings = {

      window = {
        padding = {
          x = 8.0;
          y = 6.0;
        };
        opacity = 1.0;
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };
      
      selection = {
        save_to_clipboard = false;
      };

      font = {
        size = 7.0;
        draw_bold_text_with_bright_colors = false;
        normal = {
          family = "monospace";
          style = "Regular";
        };
        bold = {
          family = "monospace";
          style = "Bold";
        };
        italic = {
          family = "monospace";
          style = "Italic";
        };
        bold_italic = {
          family = "monospace";
          style = "Bold Italic";
        };
        glyph_offset = {
          x = 0.0;
          y = 0.0;
        };

        colors = {
          primary = {};
          cursor = {};
          vi_mode_cursor = {};
          line_indicator = {};
          footer_bar = {};
          selection = {};
          search = {};
          hints = {};
          normal = {};
          bright = {};
          dim = {};
        };

        bell = {};

      };
    };
  };

}
