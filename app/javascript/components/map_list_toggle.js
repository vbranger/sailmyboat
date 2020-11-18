import { initMapbox } from '../plugins/init_mapbox';

const initToggle = () => {
  const button_map = document.querySelector("#btn-map");
  const button_list = document.querySelector("#btn-list");
  const cards_result = document.querySelector("#cards-result");
  const map = document.querySelector('#map');

  button_map.addEventListener('click', (event) => {
    button_map.classList.toggle("hidden");
    button_list.classList.toggle("hidden");
    cards_result.classList.toggle("hidden");
    map.classList.toggle("hidden");
    initMapbox();
  });

  button_list.addEventListener('click', (event) => {
    button_list.classList.toggle("hidden");
    button_map.classList.toggle("hidden");
    cards_result.classList.toggle("hidden");
    map.classList.toggle("hidden");
    initMapbox();
  });
};

export { initToggle };