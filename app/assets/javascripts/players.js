

$(document).ready(function() {
  setInterval(function() {
    $.ajax({
      url: "/players/remote_players"
    }).done(function(players) {
      for(let player of players) {
        let $playerElement = $('[data-player-id="' + player.id + '"]');
        $playerElement.find('[data-player-attribute="name"]').text(player.name);
        $playerElement.find('[data-player-attribute="number"]').text(player.number);
        $playerElement.find('[data-player-attribute="position"]').text(player.position);
        $playerElement.find('[data-player-attribute="club"]').text(player.club);
        $playerElement.find('[data-player-attribute="team_full_name"]').text(player.team.full_name);
      }
    });
  }, 5000);
});
