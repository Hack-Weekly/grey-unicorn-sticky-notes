import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";

// Connects to data-controller="drag"

export default class extends Controller {
	static targets = ["list"];
	static values = {
		url: String,
		attribute: String,
	};

	connect() {
		this.listTargets.forEach(this.initializeSortable.bind(this));
	}

	initializeSortable(target) {
		new Sortable(target, {
			group: "shared",
			animation: 100,
			sort: true,
			onEnd: this.end.bind(this),
		});
	}

	end(event) {
		const id = event.item.dataset.id;
		const url = this.urlValue.replace(":id", id);
		console.log("ID:", id);
		console.log("URL:", url);

		const formData = new FormData();
		formData.append(this.attributeValue, event.to.dataset.newValue);
		window.mrujs
			.fetch(url, {
				method: "PATCH",
				body: formData,
			})
			.then(() => {})
			.catch((error) => console.error(error));
	}
}
