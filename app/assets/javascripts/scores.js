$(document).ready(function() {
  setInterval(function() {
    $.ajax({
      url: "/scores.json"
    }).done(function(scores) {
      for(let score of scores) {
        let $scoreRow = $('[data-score-id="' + score.id + '"]');
        $scoreRow.find('[data-score-attribute="home_team"]').text(score.home_team.full_name);
        $scoreRow.find('[data-score-attribute="visitor_team"]').text(score.visitor_team.full_name);
        $scoreRow.find('[data-score-attribute="home_goals"]').text(score.home_goals);
        $scoreRow.find('[data-score-attribute="visitor_goals"]').text(score.visitor_goals);
        $scoreRow.find('[data-score-attribute="overtime"]').text(score.overtime);

        if (score.winner_team !== null) {
          $scoreRow.find('[data-score-attribute="winner_team"]').text(`${score.winner_team.code} : ${score.winner_team.title}`);
        }

        $scoreRow.find('[data-score-attribute="points_for_winner_team"]').text(score.points_for_winner_team);

        $scoreRow.addClass('highlight');

        setTimeout(function() {
          $scoreRow.removeClass('highlight');
        }, 500);
      }
    });
  }, 5000);
});
