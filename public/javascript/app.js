function copyItineraryCode() {
  /* Get the text field */
  const itinCodeSpan = document.querySelector("#itineraryCode");
  const itinCode = itinCodeSpan.textContent;

  navigator.clipboard
    .writeText(itinCode)
    .then(() => {
      alert("Copied itinerary code " + itinCode);
    });
}