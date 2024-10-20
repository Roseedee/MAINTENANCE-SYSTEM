const rootStyle = getComputedStyle(document.querySelector(':root'))

const header_h = rootStyle.getPropertyValue('--header-h');
const sidebar_left_w = rootStyle.getPropertyValue('--sidebar-left-w')

onLoad();

function getNumberFromValue(value) {
    const number = value.match(/\d+/); // กรองเฉพาะตัวเลข
    return number ? Number(number[0]) : 0; // แปลงเป็นตัวเลข ถ้าไม่มีตัวเลขจะคืนค่า null
}

function onLoad() {

    const header = document.getElementsByTagName('header')[0];
    const class_main = document.getElementsByClassName('main')[0];
    const class_content = document.getElementsByClassName('body')[0];
    const class_sidebar_left = document.getElementsByClassName('sidebar-left')[0];

    const min_content_h = (window.innerHeight - getNumberFromValue(header_h)) + 'px';

    header.style.height = header_h;
    class_main.style.top = header_h;
    class_main.style.minHeight = min_content_h;
    class_content.style.minHeight = min_content_h;
    class_content.style.width = (window.innerWidth - getNumberFromValue(sidebar_left_w)) + 'px'
    class_sidebar_left.style.height = min_content_h
}

window.addEventListener('resize', onLoad);
