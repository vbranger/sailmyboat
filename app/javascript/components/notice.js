const noticeDisappear = () => {
  $(function() {
    setTimeout(function(){
    $('.notice').slideUp(500);
  }, 2000);
});
}

export { noticeDisappear };

// TIMEOUT > applique une fonction après temps donné
// ici 2000 en millisec
// SlideUp > notice vers le haut pour diseappear (argument = vitesse)
