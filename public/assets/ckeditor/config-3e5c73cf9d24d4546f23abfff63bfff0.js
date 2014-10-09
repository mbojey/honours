(function() {
  CKEDITOR.editorConfig = function(config) {
    config.language = 'en';
    config.toolbar_Pure = [
      {
        name: 'basicstyles',
        items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat']
      }, {
        name: 'styles',
        items: ['Styles', 'Format', 'Font', 'FontSize']
      }
    ];
    config.toolbar = 'Pure';
    return true;
  };

}).call(this);
