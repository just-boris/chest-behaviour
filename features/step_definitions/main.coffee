Chest = require '../../'
module.exports = () ->
  throwError = (cb, deck, opened) ->
    cb.fail new Error 'Expected drawer ' + (deck+1) + ' should be ' + (if opened then 'opened' else 'closed');

  drawersFromInput = (input) ->
    input
      .split /,\s?/
      .map (d) -> (parseInt d, 10) - 1

  @Given 'closed chest', (cb) ->
    @chest = new Chest
    do cb

  @Given /chest, drawers? ([\d\s,]+) open/, (drawers, cb) ->
    @chest = new Chest
    drawers = drawersFromInput drawers
    @chest.open drawers...
    do cb


  @When /open drawers? ([\d\s,]+)/, (drawers, cb) ->
    drawers = drawersFromInput drawers
    @chest.open drawers...
    do cb

  @When /close drawers? ([\d\s,]+)/, (drawers, cb) ->
    drawers = drawersFromInput drawers
    @chest.close drawers...
    do cb

  @Then 'all drawers is closed', (cb) ->
    @chest.drawers.forEach (opened, deck) ->
      if opened
        throwError cb, deck, opened

  @Then /there is opened drawers? ([\d\s,]+)/, (drawers, cb) ->
    drawers = drawersFromInput drawers
    @chest.drawers
      .map (d) -> d.opened
      .forEach (opened, drawer) ->
        if (opened and (drawers.indexOf drawer) == -1) \
            or (!opened and (drawers.indexOf drawer) > -1)
          throwError cb, drawer, opened
    do cb
