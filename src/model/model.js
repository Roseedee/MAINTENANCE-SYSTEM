const formatToDateString = require('../util/dateFormat');
const formatToTimeString = require('../util/timeFormat');

class Model {
  
  constructor(modelId, modelName, addDate) {
    this.model_id = modelId;
    this.model = modelName;
    this.add_date = new Date(addDate)
    this.date = formatToDateString(this.add_date)
    this.time = formatToTimeString(this.add_date)
  }
}

module.exports = Model