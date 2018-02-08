$(document).ready(() => {
  // Instantiate some variables and objects
  const $dataTable = $('#dataTable');

  // Create helper functions
  function createRecord(data) {
    return "<tr><td>" + data.id +
      "</td><td>" + data.title +
      "</td><td>" + data.author +
      "</td><td>" + data.status +
      "</td></tr>";
  }

  // AJAX call for the index
  $.ajax({
    url: "http://localhost:3000/api/books/"
  }).then((data) => {
    $.each(data, (index, value) => {
      $dataTable.append(createRecord(value));
    });
  });

  // Create form
  $('#create-book').submit((event) => {
    // Get form data
    var formdata = {
      'title': $('input[name=title]').val(),
      'author': $('input[name=author]').val(),
      'section': $('input[name=section]').val(),
      'batch': $('input[name=batch]').val(),
      'size': $('input[name=size]').val()
    };

    // Send the form
    $.ajax({
      type: 'POST',
      url: 'http://localhost:3000/api/books/',
      data: formdata,
      dataType: 'json'
    }).done((data) => {
      // Remove modal and append new record to the table
      $('#createModal').modal('hide');
      $dataTable.append(createRecord(data));
    }).fail((data, textStatus, xhr) => {
      // Backend validation
      alert(data.responseJSON.message);
    });

    // Prevent the default form submission
    event.preventDefault();
  });
});
