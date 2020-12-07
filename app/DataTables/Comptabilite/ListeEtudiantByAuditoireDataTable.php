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
           return
                     '<a href="'.route('comptabilite.add_payement',$query->idetudiants).'" class="btn btn-success"><span class= "fas fa-plus"></span></a>'

                     .'     <a href="'.route('comptabilite.payement',$query->idetudiants).'" class="edit-modal btn btn-info" ><span class= "fas fa-eye"></span></a>';
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
