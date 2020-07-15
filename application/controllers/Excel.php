<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Excel extends CI_Controller {
    function __construct(){
        parent::__construct();
        $this->load->library(array('PHPExcel','PHPExcel/IOFactory'));
    }
    public function index()
    {
        $this->load->view('excel');
    }
    public function upload(){
        $fileName = time().$_FILES['file']['name'];
         
        $config['upload_path'] = './assets/'; //buat folder dengan nama assets di root folder
        $config['file_name'] = $fileName;
        $config['allowed_types'] = 'xls|xlsx|csv';
        $config['max_size'] = 10000;
         
        $this->load->library('upload');
        $this->upload->initialize($config);
         
        if(! $this->upload->do_upload('file') )
        $this->upload->display_errors();
             
        $media = $this->upload->data('file_name');
        return $media;
         
        try {
                $media = IOFactory::identify($media);
                $objReader = IOFactory::createReader($media);
                $objPHPExcel = $objReader->load($media);
            } catch(Exception $e) {
                die('Error loading file "'.pathinfo($media,PATHINFO_BASENAME).'": '.$e->getMessage());
            }
 
            $sheet = $objPHPExcel->getSheet(0);
            $highestRow = $sheet->getHighestRow();
            $highestColumn = $sheet->getHighestColumn();
             
            for ($row = 2; $row <= $highestRow; $row++){                  //  Read a row of data into an array                 
                $rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row,
                                                NULL,
                                                TRUE,
                                                FALSE);
                                                 
                //Sesuaikan sama nama kolom tabel di database                                
                 $data = array(
                    "id_gtk"=> $rowData[0][0],
                    "Nama"=> $rowData[0][1],
                    "NUPTK"=> $rowData[0][2],
                    "JK"=> $rowData[0][3],
                    "Tempat_Lahir"=> $rowData[0][4],
                    "Tanggal_Lahir"=> $rowData[0][5],
                    "NIP"=> $rowData[0][6],
                    "Status_Kepegawaian"=> $rowData[0][7],
                    "Jenis_PTK"=> $rowData[0][8],
                    "Agama"=> $rowData[0][9]
                );
                 
                //sesuaikan nama dengan nama tabel
                $this->db->insert("gtk",$data);
                     
            }
        redirect('excel/');
    }
}