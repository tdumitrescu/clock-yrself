{Salary} = require "./models"

SAMPLE_ID = 15

module.exports =
  exx: (req, res) -> res.json examples: Salary.samples

  createEx: (req, res) ->
    exData = req.body
    user = {id: SAMPLE_ID}
    user.occupation = exData.occupation
    user.location   = exData.location
    user.salary     = exData.salary
    user.salaryType = exData.salaryType
    res.cookie 'user_ex', user
    res.json true
