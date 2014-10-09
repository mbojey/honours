(function() {
  CKEDITOR.editorConfig = function(config) {
    config.language = 'en';
    config.height = '125px';
    config.toolbar_Pure = [
      {
        name: 'basicstyles',
        items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat']
      }, {
        name: 'styles',
        items: ['Font', 'FontSize']
      }
    ];
    config.toolbar = 'Pure';
    return true;
  };

}).call(this);
