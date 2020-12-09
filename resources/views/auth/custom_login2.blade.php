
<!doctype html>
<html lang="fr">

<!-- Mirrored from getbootstrap.com/docs/4.1/examples/sign-in/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 07 Nov 2018 23:41:52 GMT -->
<meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="PENIEL WIFI">
    <title>CONNECT ISS-FBNBANK</title>

    <meta property="og:title" content="CONNECT ISS-FBNBANK">
    <meta property="og:type" content="website">
    <meta property="og:url" content="http://ramazani-iss-fbnbank.herokuapp.com/login">
    <meta property="og:image" content="http://ramazani-iss-fbnbank.herokuapp.com/img/og.png" />

    <!-- Bootstrap core CSS -->
    <!-- Custom CSS -->
    <link href="{{ asset('bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('bootstrap/icons/font-awesome/css/fontawesome-all.css') }}" rel="stylesheet">
<style type="text/css">
  html,
  body {
    height: 100%;
  }

  body {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    padding-top: 40px;
    padding-bottom: 40px;
    background-color: #f5f5f5;
  }

  .form-signin {
    width: 100%;
    max-width: 330px;
    padding: 15px;
    margin: auto;
  }
  .form-signin .checkbox {
    font-weight: 400;
  }
  .form-signin .form-control {
    position: relative;
    box-sizing: border-box;
    height: auto;
    padding: 10px;
    font-size: 16px;
  }
  .form-signin .form-control:focus {
    z-index: 2;
  }
  .form-signin input[type="email"] {
    margin-bottom: -1px;
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
  }
  .form-signin input[type="password"] {
    margin-bottom: 10px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
  }
</style>

    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
  </head>

  <body class="text-center">
    <form class="form-signin" method="POST" action="{{ route('login') }}">
      @csrf
      <img class="mb-4" src="{{ asset('img/Logo-fbnbank-bizcongo-banque.jpg') }}" alt="" width="72" height="72">
      <h5 class="h5 mb-5 font-weight-normal">FBN BANK</h5>
      @include('partials._msgFlash')
      <label for="username" class="sr-only">Pseudo</label>
      <input type="input" id="username" name="username" class="form-control" placeholder="Pseudo" required autofocus>
      <label for="inputPassword"  class="sr-only">Mot de passe </label>
      <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Mot de passe" required>
      <div class="checkbox mb-3">
        <label>
            <a href="/login">Se connecter à iss kin</a>
        </label>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Se connecter</button>
      <p class="mt-5 mb-3 text-muted">&copy; {{ date('Y') }} | ISS-KIN </p>
    </form>
  </body>

<!-- Mirrored from getbootstrap.com/docs/4.1/examples/sign-in/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 07 Nov 2018 23:41:53 GMT -->
</html>
