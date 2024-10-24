function formatToDateString(date) {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0'); // เดือน (เริ่มจาก 0)
    const day = String(date.getDate()).padStart(2, '0'); // วัน
    return `${day}-${month}-${year}`;
}

module.exports = formatToDateString