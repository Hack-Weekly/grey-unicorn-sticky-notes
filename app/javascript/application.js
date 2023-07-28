// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import * as bootstrap from "bootstrap";
import "@rails/actiontext";
import "trix";

import mrujs from "mrujs";
import * as Turbo from "@hotwired/turbo";

window.Turbo = Turbo;

mrujs.start();
