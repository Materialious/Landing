import App from './App.svelte';

import './style.css';

import "beercss";
import "material-dynamic-colors";
import { mount } from "svelte";

const app = mount(App, {
  target: document.getElementById('app')!,
});

export default app;
