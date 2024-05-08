import App from './App.svelte';

import './style.css';

import "beercss";
import "material-dynamic-colors";

const app = new App({
  target: document.getElementById('app')!,
});

export default app;
