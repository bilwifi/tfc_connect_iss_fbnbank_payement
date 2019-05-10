<?php

namespace App\DataTables\Section;

use App\Models\Auditoire;
use Yajra\DataTables\Services\DataTable;

class BilanDataTable extends DataTable
{
/**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return \Yajra\DataTables\DataTableAbstract
     */
    public function dataTable($query)
    {
        return datatables($query);
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\User $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Auditoire $model)
    {
        return $model::getBilan();
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
            "auditoire"=>[
                        'name'=>'auditoire',
                        'data' => 'auditoire',
                        'title' => 'Auditoires',
                        'searchable' => true,
                        'orderable' => true,
                        // 'render' => 'pap',
                        'exportable' => true,
                        ],
            "nbrEtudiant"=>[
                        'name'=>'nbrEtudiant',
                        'data' => 'nbrEtudiant',
                        'title' => 'Etudiants',
                        'searchable' => false,
                        'orderable' => false,
                        // 'render' => 'pap',
                        'exportable' => true,
                        ],
            "nbrEtudiantActif"=>[
                        'name'=>'nbrEtudiantActif',
                        'data' => 'nbrEtudiantActif',
                        'title' => 'Eligibles',
                        'searchable' => false,
                        'orderable' => false,
                        // 'render' => 'pap',
                        'exportable' => true,
                        ],
            "nbrEtudiantEnroles"=>[
                        'name'=>'nbrEtudiantEnroles',
                        'data' => 'nbrEtudiantEnroles',
                        'title' => 'Enrôlés',
                        'searchable' => false,
                        'orderable' => false,
                        // 'render' => 'pap',
                        'exportable' => true,
                        ],
            "nbrEtudiantOrdinaire"=>[
                        'name'=>'nbrEtudiantOrdinaire',
                        'data' => 'nbrEtudiantOrdinaire',
                        'title' => 'Ordinaires',
                        'searchable' => false,
                        'orderable' => false,
                        // 'render' => 'pap',
                        'exportable' => true,
                        ],
            "nbrEtudiantAyantDroit"=>[
                        'name'=>'nbrEtudiantAyantDroit',
                        'data' => 'nbrEtudiantAyantDroit',
                        'title' => 'Ayant Droits',
                        'searchable' => false,
                        'orderable' => false,
                        // 'render' => 'pap',
                        'exportable' => true,
                        ],      
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
            'dom' => 'tpB',
            'buttons' => [
                            $this->paramBtn('print','Imprimer'),
                            $this->paramBtn('pdf','PDF'),
                            $this->paramBtn('excel','Excel')

                ],
            'order' => [[1,'Asc']]
        ];
    }
    /**
     * parametres des attribut de btn.
     *
     * @return array
     */

    private function paramBtn($type,$name='Imprimer'){
        return [
                                'extend' => $type,
                                'filename' => 'Bilan_Enrôlement',
                                'title' => 'Bilan enrôlement',
                                // 'message' => 
                                'text' => $name,
                                'exportOptions' => [
                                                    'columns' => ':visible'
                                                    ],

                            ];
    }


    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'Section/Bilan_' . date('YmdHis');
    }
}
