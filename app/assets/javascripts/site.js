document.addEventListener("turbolinks:load", function() {
   // raty
    $('.rating').raty({
        path: '/assets',
        scoreName: 'comment[rating]'
    });
    $('.rated').raty({
        path: '/assets',
        readOnly: true,
        score: function() {
            return $(this).attr('data-score');
        }
    });

   // elevateZoom
      $('.img-zoom').elevateZoom({
        zoomType: "lens",
        lensShape: "round",
        lensSize: 300,
          scrollZoom: true,
                lensFadeIn: 500,
                lensFadeOut: 500
      });
})




