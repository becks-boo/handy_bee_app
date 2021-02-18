import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.custom-select').select2(
    theme: 'bootstrap'
    // it is not working properly with theme bootstrap, however the default select 2 theme is ugly
    );
};

export { initSelect2 };
