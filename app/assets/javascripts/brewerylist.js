const BREWERIES = {}

BREWERIES.show = () => {
    $("#brewerytable tr:gt(0)").remove()
    const table = $("#brewerytable")
    console.log('hello')
    console.log(BREWERIES.list)

    BREWERIES.list.forEach((brewery) => {
      table.append('<tr>'
        + '<td>' + brewery['name'] + '</td>'
        + '<td>' + brewery['year'] + '</td>'
        + '<td>' + brewery['beers'].name.length + '</td>'
        + '<td>' + brewery['active'].name + '</td>'
        + '</tr>')
    })
  }

BREWERIES.sort_by_name = () => {
  BREWERIES.list.sort((a, b) => {
    return a.name.toUpperCase().localeCompare(b.name.toUpperCase());
  })
}

BREWERIES.sort_by_year = () => {
  BREWERIES.list.sort((a, b) => {
    return a.year-(b.year)
  })
}

BREWERIES.sort_by_beers = () => {
  BREWERIES.list.sort((a, b) => {
    return b.beers.name.length-(a.beers.name.length);
  })
}

document.addEventListener("turbolinks:load", () => {
    console.log('hi')
    if ($("#brewerytable").length == 0) {
        return
    }

  $("#name").click((e) => {
    e.preventDefault()
    BREWERIES.sort_by_name()
    BREWERIES.show();
  })

  $("#year").click((e) => {
    e.preventDefault()
    BREWERIES.sort_by_year()
    BREWERIES.show()
  })

  $("#beers").click((e) => {
    e.preventDefault()
    BREWERIES.sort_by_beers()
    BREWERIES.show()
  })

  $.getJSON('breweries.json', (breweries) => {
    console.log('json says hi')
    console.log(breweries)
    BREWERIES.list = breweries
    BREWERIES.show()
  })
})