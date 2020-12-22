import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    minDate: "today",
    altInput: true,
    altFormat: "j M y",
    dateFormat: "d-m-Y"
  });
};

export { initFlatpickr };
