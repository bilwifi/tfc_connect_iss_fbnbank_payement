<?php
use App\Models\Etudiant;
use App\Models\Payement;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect()->route('login');
});

Route::get('/test', function () {
	$data =  App\Models\Auditoire::getBilan();
    return view('test');
});

Route::get('/fbnbank', function () {
    return view('auth.custom_login2');
});



Route::prefix('comptabilite')->group(function(){
	Route::name('comptabilite.')->group(function () {
		Route::get('/','Comptabilite\DashboardController@index')->name('index');
		Route::get('/auditoire/{auditoire}','Comptabilite\DashboardController@getListStudent')->name('getListStudent');

		Route::get('/autorise/{etudiant}','Comptabilite\DashboardController@autoriseStudent')->name('autoriseStudent');
		Route::post('/createEtudiant','Comptabilite\DashboardController@createEtudiant')->name('createEtudiant');
		Route::get('/createEtudiant',function(){return redirect()->back();});
		Route::post('/updateEtudiant','Comptabilite\DashboardController@updateEtudiant')->name('updateEtudiant');
        Route::get('/updateEtudiant',function(){return redirect()->back();});

        Route::get('/payement/{etudiant}',function(Etudiant $etudiant){return view('comptabilite.add_payement',compact('etudiant'));})->name('add_payement');
        Route::post('/payement/{etudiant}',function(Etudiant $etudiant){
            Payement::create([
                "id_etudiant" => $etudiant->idetudiants,
                "montant" => request()->montant,
                "devise" => request()->devise,
                "motif" => request()->motif,
                "commentaire" => request()->commentaire,
                 ]);

            return redirect()->route('comptabilite.payement',$etudiant->idetudiants);
        });

        Route::get('/etudiants/{etudiant}/frais', function (Etudiant $etudiant) {
            $payements = Payement::join('etudiants', 'etudiants.idetudiants', '=', 'payements.id_etudiant')->where("payements.id_etudiant",$etudiant->idetudiants)->orderBy("id","DESC")->get();
            return view('list_frais',compact('payements','etudiant'));
        })->name('payement');

	});
});
Route::prefix('section')->group(function(){
	Route::name('section.')->group(function () {
		Route::get('/','Section\DashboardController@index')->name('index');
		Route::get('/liste-auditoires','Section\DashboardController@getlistAuditoires')->name('getListAuditoires');
		Route::get('/auditoire/{auditoire}','Section\DashboardController@getListStudent')->name('getListStudent');

		Route::get('/enrolerEtudiant/{etudiant}','Section\DashboardController@enrolerEtudiant')->name('enrolerEtudiant');
		Route::get('/destroyEnrolement/{enrole}','Section\DashboardController@destroyEnrolement')->name('!enrolerEtudiant');
		Route::get('enroles/auditoire/{auditoire}','Section\DashboardController@getListStudentEnroler')->name('getListStudentEnroles');
        Route::get('bilan','Section\DashboardController@getBilan')->name('getBilan');
        Route::get('/etudiants/{etudiant}/frais', function (Etudiant $etudiant) {
            $payements = Payement::join('etudiants', 'etudiants.idetudiants', '=', 'payements.id_etudiant')->where("payements.id_etudiant",$etudiant->idetudiants)->get();
            return view('list_frais',compact('payements','etudiant'));
        })->name('payement');
		// Route::post('/createEtudiant','Section\DashboardController@createEtudiant')->name('createEtudiant');
		// Route::get('/createEtudiant',function(){return redirect()->back();});
		// Route::post('/updateEtudiant','Section\DashboardController@updateEtudiant')->name('updateEtudiant');
		// Route::get('/updateEtudiant',function(){return redirect()->back();});

	});
});
Auth::routes();

Route::get('/home',function(){
	return App\Http\Controllers\Helper::redirectToDashboard();
})->name('home');
