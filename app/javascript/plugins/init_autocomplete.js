import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelectorAll('.auto-address-fill');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
