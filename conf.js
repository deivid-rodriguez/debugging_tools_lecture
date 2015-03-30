//
// Full list of configuration options available at:
// https://github.com/hakimel/reveal.js#configuration
//
Reveal.initialize({
  controls: true,
  progress: true,
  history: true,
  center: true,

  transition: 'slide', // none/fade/slide/convex/concave/zoom

  dependencies: [
    {
      src: 'plugin/highlight/highlight.js',
      async: true,
      condition: function() { return !!document.querySelector( 'pre code' ); },
      callback: function() { hljs.initHighlightingOnLoad(); }
    },
    {
      src: 'plugin/externalcode/externalcode.js',
      async: true,
      condition: function() { return !!document.querySelector( '[data-code]' ); }
    }
  ]
});
