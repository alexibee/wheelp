import { Controller } from "@hotwired/stimulus"
import mapboxgl from "!mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/alexibee/cl0l9gxet001b14pon1bzmxb1"
    })
    this.#addMarkerToMap()
    this.#fitMapToMarker()
  }

  #addMarkerToMap() {
      const popup = new mapboxgl.Popup().setHTML(this.markerValue.info_window)
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${'https://res.cloudinary.com/dhoecmw9w/image/upload/v1646932396/wrench_mxycup.png'}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "25px"
      customMarker.style.height = "25px"

    // Pass the element as an argument to the new marker
      new mapboxgl.Marker(customMarker)
        .setLngLat([ this.markerValue.lng, this.markerValue.lat ])
        .setPopup(popup)
        .addTo(this.map)
    };
  #fitMapToMarker() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ this.markerValue.lng, this.markerValue.lat ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 10, duration: 0 })
  }
}
