import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    defaultDate: new Date(),
    minDate: "today",
    altInput: true,
    altFormat: "j M y",
    dateFormat: "d-m-Y"
  });
};

export { initFlatpickr };
