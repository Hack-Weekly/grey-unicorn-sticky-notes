import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
	static values = {
		closeAfter: {
			type: Number,
			default: 2500,
		},
		removeAfter: {
			type: Number,
			default: 1100,
		},
	};

	initialize() {
		this.hide();
	}

	connect() {
		setTimeout(() => {
			this.show();
		}, 500);
		setTimeout(() => {
			this.close();
		}, this.closeAfterValue);
	}

	close() {
		this.hide();
		setTimeout(() => {
			this.element.remove();
		}, this.removeAfterValue);
	}

	show() {
		this.element.setAttribute(
			'style',
			'transition: 0.8s; transform:translate(0, 100px);'
		);
	}

	hide() {
		this.element.setAttribute(
			'style',
			'transition: 1.5s; transform:translate(0, -200px);'
		);
	}
}
