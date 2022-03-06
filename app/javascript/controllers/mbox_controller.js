import { Controller } from "@hotwired/stimulus"
import mapboxgl from "!mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }

  connect() {
    console.dir(this.markerValue)
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkerToMap()
    this.#fitMapToMarker()
  }

  #addMarkerToMap() {
      const popup = new mapboxgl.Popup().setHTML(this.markerValue.info_window)
      // const customMarker = document.createElement("div")
      // customMarker.className = "marker"
      // customMarker.style.backgroundImage = `url('${marker.image_url}')`
      // customMarker.style.backgroundSize = "contain"
      // customMarker.style.width = "25px"
      // customMarker.style.height = "25px"

    // Pass the element as an argument to the new marker
      new mapboxgl.Marker() //pass customMarker here if we have
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
