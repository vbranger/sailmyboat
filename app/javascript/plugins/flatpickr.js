import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


const initCalendar = () => {
flatpickr("#range_start", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#range_end"})],
  inline: true
})
};

const initCalendarNew = () => {
flatpickr('.datepicker', {
  altInput: true,
})
};

export { initCalendar, initCalendarNew };

