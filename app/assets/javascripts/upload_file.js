$(document).on('change', '.browse', function() {
    var input = $(this),
        numFiles = input.get(0).files ? input.get(0).files.length : 1,
        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    // input.trigger('fileselect', [numFiles, label]);
    if (label != "") {
      $('.browse-label').text("Your picture has been saved");
    } else {
      $('.browse-label').text("Choose a photo");
    }
});
