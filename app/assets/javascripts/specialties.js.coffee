$ ->
  load_specialties = (specialties) ->
    $('#specialties').html(specialties).slideDown()
    $('.menu').slideDown()

  $('.service-link').click ->
    $('.service-link').removeClass('active')
    $(this).addClass('active')
    service_text = $(this).text()
    service_id = $(this).attr('data-service-value')
    form_type = $('#form-type').val()
    $('#specialty-filter-service-name').text(service_text)
    $('#services input').val(service_id)
    $('#specialties').slideUp()
    $.get('/specialties', {service_id: service_id, form_type: form_type}, load_specialties)
