import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('sloth_address');
  if (addressInput) {
    places({ container: addressInput });
  }

  // const addressInput = document.getElementById('query');
  // if (addressInput) {
  //   places({ container: addressInput });
  // }
};

export { initAutocomplete };
