const formatToDateString = require('../util/dateFormat');
const formatToTimeString = require('../util/timeFormat');

class Brand {
  
  constructor(brandId, brandName, addDate) {
    this.brand_id = brandId;
    this.brand = brandName;
    this.add_date = new Date(addDate)
    this.date = formatToDateString(this.add_date)
    this.time = formatToTimeString(this.add_date)
  }
}

module.exports = Brand