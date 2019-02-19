<?php

namespace App\Imports;

use Carbon\Carbon;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToCollection;

class MobilidadosImport implements ToCollection
{

	use Importable;

    /**
    * @param array $row
    *
    * @return \App\Indicator
    */
	public function collection(Collection $rows)
    {
        foreach ($rows as $row)
        {
			$mobilidados = DB::table('mobilidados')->where('name', $row[4])->first();

			if(is_null($mobilidados)) {
				dd($row);
			}

			if(is_null($row[7])) continue;

			DB::table('mobilidados_data')->insert([
				'mobilidados_id' => $mobilidados->id,
				'date' => Carbon::create($row[6], 1, 1),
				'value' => $row[7],
			]);
        }
    }
}
