<?php
  // Initialize your autoloader (this example is using composer)
  require '../vendor/autoload.php';

  // Instantiate the Highlighter.
  $hl = new Highlight\Highlighter();

  // Set the languages you want to detect automatically.
  $hl->setAutodetectLanguages(array('php', 'html'));

  // Highlight some code.
  $code = $hl->highlightAuto(file_get_contents('hello.html'));

  // Output the code using the default stylesheet:
?>

<html>
  <head>
    <!-- Link to the stylesheets: -->
    <link rel="stylesheet" type="text/css" href="default.css">
  </head>
  <body>
    <!-- Print the highlighted code: -->
    <pre class="hljs <?= $code->language ?>">
      <?= $code->value ?>
    </pre>
  </body>
</html>
