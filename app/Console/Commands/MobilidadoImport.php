<?php

namespace App\Console\Commands;

use App\Imports\MobilidadosImport;
use Illuminate\Console\Command;

class MobilidadoImport extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'import:mobilidados';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Import indicators from CSV file';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
		$this->output->title('Starting import');
        (new MobilidadosImport)->withOutput($this->output)->import('mobilidados-dados.csv');
        $this->output->success('Import successful');
    }
}
