const noticeDisappear = () => {
  $(function() {
    setTimeout(function(){
    $('.notice').slideUp(500);
  }, 2000);
});
}

export { noticeDisappear };

// TIMEOUT > applique une fonction après un temps donné
// ici 2000 en millisec
// SlideUp > notice vers le haut pour disappear (argument = vitesse ici 500)
