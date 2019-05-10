<?php

namespace App\DataTables\Comptabilite;

use App\Models\Etudiant;
use Yajra\DataTables\Services\DataTable;

class ListeEtudiantByAuditoireDataTable extends DataTable
{
    /**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return \Yajra\DataTables\DataTableAbstract
     */
    public function dataTable($query)
    {
        return datatables($query)
            ->addColumn('action', function($query){
                if( $query->statut == 0 ){
                     $class = "success";
                     $incon = "<i class='fas fa-check-circle'></i>";
                     $toltip = "Autoriser l'étudiant à s'enrôler ";
                }else{
                     $class = "danger";
                     $incon = "<i class='fas fa-times-circle' ></i>";
                     $toltip = "Démettre l'étudiant à l'enrôlement ";
                }
                $btnCommentaire = !empty(trim($query->commentaire)) ? "" : "disabled";
                $commentaire = '<button type="button" class="btn  btn-info" data-toggle="popover" title="Etudiant : '.$query->lib.'" data-content="'.$query->commentaire.'" '.$btnCommentaire.'><span class= "fas fa-eye"></span></button>';

                $class = $query->statut == 0 ? "success" : "danger";
                $txt = $query->statut == 0 ? "<i class='fas fa-check-circle'></i>" : "<i class='fas fa-times-circle' ></i>";
                return 
                     '<a href="'.route('comptabilite.autoriseStudent',$query->idetudiants).'" class="btn btn-'.$class.'" data-toggle="tooltip" data-placement="right" title="'.$toltip.'">'.$incon.'</a>'

                     .'  '.
                     $commentaire
                     .'  '.
                     '<button type="button" class="edit-modal btn btn-info" data-toggle="modal" data-target="#editModal"  data-info="'.$query->idetudiants.','.$query->matricule.','.$query->nom.','.$query->postnom.','.$query->prenom.','.$query->frais.','.$query->idprofils.','.$query->commentaire.'"><span class= "fas fa-edit"></span></button>'

                     ;
            });
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\User $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Etudiant $model)
    {
        return $model::EtudiantParAuditoire($this->idauditoires)->ProfilEtudiant()->get();
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    public function html()
    {
        return $this->builder()
                    ->columns($this->getColumns())
                    ->minifiedAjax()
                    ->addAction(['width' => '150px'])
                    ->parameters($this->getBuilderParameters());
    }

    /**
     * Get columns.
     *
     * @return array
     */
    protected function getColumns()
    {
        return [
            'matricule',
            'nom',
            'postnom',
            'prenom',
            'frais',
            'lib'=>[
                        'name'=>'lib',
                        'data' => 'lib',
                        'title' => 'Profil',
                        'searchable' => false,
                        'orderable' => false,
                        // 'render' => 'pap',
                        'exportable' => true,
                        'printable' => true,
                    ],
            // 'commentaire'=>[
            //             'className' => 'commentaireDatatable',
            //             'name'=>'commentaire',
            //             'data' => 'commentaire',
            //             'title' => 'Observation',
            //             'searchable' => false,
            //             'orderable' => false,
            //             // 'render' => 'pap',
            //             'exportable' => true,
            //             'printable' => true,
            //         ],
            // 'statut'=>[
            //             'name'=>'statut',
            //             'data' => 'statut',
            //             'title' => 'statut',
            //             'searchable' => true,
            //             'orderable' => true,
            //             // 'render' => 'pap',
            //             'exportable' => true,
            //             'printable' => true,
            //         ],
           
        ];
    }

    protected function getBuilderParameters(){
        return [
            'order' => [[1,'Asc']]
        ];
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'Comptabilite/ListeEtudiantByAuditoire_' . date('YmdHis');
    }
}
