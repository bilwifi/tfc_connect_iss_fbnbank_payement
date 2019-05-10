<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreationDesTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('promotions', function (Blueprint $table) {
            $table->increments('idpromotions');
            $table->string('lib',65);
            $table->string('abbr',65);

            $table->engine = 'InnoDB';
            $table->charset = 'utf8';
            $table->collation = 'utf8_unicode_ci';
        });

        Schema::create('sections', function (Blueprint $table) {
            $table->increments('idsections');
            $table->string('lib',65);
            $table->string('abbr',65);

            $table->engine = 'InnoDB';
            $table->charset = 'utf8';
            $table->collation = 'utf8_unicode_ci';
        });

        Schema::create('facultes', function (Blueprint $table) {
            $table->increments('idfacultes');
            $table->string('lib',65);
            $table->string('abbr',65);
            $table->unsignedInteger
            ('idsections'); 
            $table->foreign('idsections')
                  ->references('idsections')->on('sections')
                  ->onDelete('cascade');

            $table->engine = 'InnoDB';
            $table->charset = 'utf8';
            $table->collation = 'utf8_unicode_ci';
        });

        Schema::create('auditoires', function (Blueprint $table) {
            $table->increments('idauditoires');
            $table->string('lib',65);
            $table->string('abbr',65);
            $table->unsignedInteger('idfacultes');
            $table->unsignedInteger('idpromotions');
            $table->unsignedInteger('idsections');
            $table->foreign('idfacultes')
                  ->references('idfacultes')->on('facultes');
            $table->foreign('idpromotions')
                  ->references('idpromotions')->on('promotions');
            $table->foreign('idsections')
                  ->references('idsections')->on('sections');

            $table->engine = 'InnoDB';
            $table->charset = 'utf8';
            $table->collation = 'utf8_unicode_ci';
        });

        Schema::create('gestion_annees', function (Blueprint $table) {
            $table->increments('idgestion_annees');
            $table->year('annee_debut');
            $table->year('annee_fin');
            $table->string('annee_format',10);
            $table->boolean('statut')->default(false);
            $table->timestamps();

            $table->engine = 'InnoDB';
            $table->charset = 'utf8';
            $table->collation = 'utf8_unicode_ci';
        });
        Schema::create('profils', function (Blueprint $table) {
            $table->increments('idprofils');
            $table->string('lib');

            $table->engine = 'InnoDB';
            $table->charset = 'utf8';
            $table->collation = 'utf8_unicode_ci';
        });


         Schema::create('etudiants', function (Blueprint $table) {
            $table->increments('idetudiants');
            $table->string('matricule',10)->unique();
            $table->string('nom',65);
            $table->string('postnom',65)->nullable();
            $table->string('prenom',65)->nullable();
            $table->unsignedInteger('idauditoires');
            $table->unsignedInteger('annee_acad');
            $table->unsignedInteger('idprofils');
            $table->bigInteger('frais')->default(0)->nullable();
            $table->text('commentaire')->nullable();

            $table->boolean('statut')->default(false);
            $table->timestamps();
            $table->foreign('idauditoires')
                  ->references('idauditoires')->on('auditoires')->onDelete('cascade');
            $table->foreign('idprofils')
                  ->references('idprofils')->on('profils')->onDelete('cascade');
            $table->foreign('annee_acad')
                  ->references('idgestion_annees')->on('gestion_annees')->onDelete('cascade');

            $table->engine = 'InnoDB';
            $table->charset = 'utf8';
            $table->collation = 'utf8_unicode_ci';
        });

        Schema::create('users_roles', function (Blueprint $table) {
            $table->increments('idusers_roles');
            $table->string('lib',65);
            $table->unsignedInteger('level');

            $table->engine = 'InnoDB';
            $table->charset = 'utf8';
            $table->collation = 'utf8_unicode_ci';
        });

        Schema::create('users', function (Blueprint $table) {
            $table->increments('idusers');
            $table->string('username',45)->unique();
            $table->string('name',65);
            $table->string('first_name',65);
            $table->string('email',65)->nullable()->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->unsignedInteger('idsections')->nullable();
            $table->unsignedInteger('idusers_roles');
            $table->boolean('statut')->default(true);
            $table->rememberToken();
            $table->timestamps();
            $table->foreign('idsections')
                  ->references('idsections')->on('sections')->onDelete('cascade');
            $table->foreign('idusers_roles')
                  ->references('idusers_roles')->on('users_roles')->onDelete('cascade');
            $table->engine = 'InnoDB';
            $table->charset = 'utf8';
            $table->collation = 'utf8_unicode_ci';
        });

        Schema::create('enroles', function (Blueprint $table) {
            $table->increments('idenroles');
            $table->unsignedInteger('idetudiants');
            $table->unsignedInteger('idusers');
            $table->timestamps();
            $table->engine = 'InnoDB';
            $table->charset = 'utf8';
            $table->collation = 'utf8_unicode_ci';
        });

       
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('enroles');
        Schema::dropIfExists('users');
        Schema::dropIfExists('users_roles');
        Schema::dropIfExists('etudiants');
        Schema::dropIfExists('gestion_annees');
        Schema::dropIfExists('profils');
        Schema::dropIfExists('auditoires');
        Schema::dropIfExists('facultes');
        Schema::dropIfExists('sections');
        Schema::dropIfExists('promotions');
        

        
    }
}
