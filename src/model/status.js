class Status{
    constructor(statusID, status, dateAdd, statusNote, statusType, statusColor) {
        this.status_id = statusID;
        this.status = status;
        this.date_add = dateAdd;
        this.status_note = statusNote;
        this.status_type = statusType;
        this.status_color = statusColor
    }
}

module.exports = Status;