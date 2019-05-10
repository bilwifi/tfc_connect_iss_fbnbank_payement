<?php

namespace App\DataTables\Section;

use App\Models\Enrole;
use Yajra\DataTables\Services\DataTable;

class ListeEtudiantsEnrolesDataTable extends DataTable
{

    protected $printColumns = [
        ['data' => 'nom', 'title' => 'Nom'],
        ['data' => 'postnom', 'title' => 'Postnom'],
    ];
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
                $class = "danger";
                $txt = "Démettre";
                return '<a href="'.route('section.!enrolerEtudiant',$query->idenroles).'" class="btn btn-'.$class.'">'.$txt.'</a>';
            });
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\User $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Enrole $model)
    {
        return $model::JoinStudentbyAuditoire($this->idauditoires)
                    ->get([
                        'idenroles',
                        'etudiants.idetudiants',
                        'matricule',
                        'nom',
                        'postnom',
                        'prenom',
                        'frais',
                        'commentaire',
                        'enroles.created_at'
                    ]);
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
                    ->addAction(['printable'  => false,'title'=>'Action','exportable' => false,'width' => '80px'
                        ])
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
            'created_at'=>[
                        'name'=>'created_at',
                        'data' => 'created_at',
                        'title' => 'Date d\'enrôlemment',
                        'searchable' => false,
                        'orderable' => true,
                        // 'render' => 'pap',
                        'exportable' => true,
                        'printable' => true,
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
            'dom' => 'flrtipB',
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
                                'filename' => 'Enrôlés_'.$this->auditoire,
                                'title' => 'Enrôlés',
                                'message' => $this->auditoire,
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
        return 'Enrôlés_'.$this->auditoire.'_'. date('YmdHis');
    }


}
