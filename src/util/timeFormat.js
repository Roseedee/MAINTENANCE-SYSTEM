function formatToTimeString(date) {
    const hours = String(date.getHours()).padStart(2, '0'); // ชั่วโมง
    const minutes = String(date.getMinutes()).padStart(2, '0'); // นาที
    const seconds = String(date.getSeconds()).padStart(2, '0'); // วินาที
    return `${hours}:${minutes}:${seconds}`;
}

module.exports = formatToTimeString