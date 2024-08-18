const header_h = 60; //px

onLoad();

function onLoad() {
          const header = document.getElementsByTagName('header')[0];
          const class_main = document.getElementsByClassName('main')[0];
          const class_content = document.getElementsByClassName('body')[0];
          const min_content_h = (window.innerHeight - header_h) + 'px';

          header.style.height = header_h + 'px';
          class_main.style.top = header_h + 'px';
          class_main.style.minHeight = min_content_h;
          class_content.style.minHeight = min_content_h;
}
