<?php

namespace App\Imports;

use App\Axis;
use App\Data;
use App\Program;
use App\Indicator;
use App\Reference;
use Carbon\Carbon;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Log;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class IndicatorsImport implements WithHeadingRow, ToCollection
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
			if ( !isset($row['numeracao']) ) {
				continue;
			}

			if (substr($row['numeracao'], 1, 8) === 'métrica') {
				$this->importReference($row);
			} else if (substr($row['numeracao'], 1, 5) === 'apoio') {
				$this->importReference($row);
			} else {
				$this->importIndicator($row);
			}

        }
    }

	private function importIndicator($row)
	{
		$parent_type = $row['local'];

		$parent_id = 0;
		if ($parent_type === 'Global') {
			$parent_type = 'global';
		} else if ($parent_type === 'Eixo') {
			$parent_type = 'App\\Axis';
			$parent = Axis::where('name', 'LIKE', '%' . $row['eixo'] . '%')->first();
			if ( is_null($parent) ) {
				Log::error(
					'Could not import indicator. Parent AXIS invalid.',
					[
						'indicator' => $row['indicador'],
						'parent' => $row['eixo'],
					]
				);
				return null;
			}
			$parent_id = $parent->id;
		} else if ($parent_type === 'Programa') {
			$parent_type = 'App\\Program';
			$parent = Program::where('name', 'LIKE', '%' . $row['programa'] . '%')->first();
			if ( is_null($parent) ) {
				Log::error(
					'Could not import indicator. Parent PROGRAM invalid.',
					[
						'indicator' => $row['indicador'],
						'parent' => $row['programa'],
					]
				);
				return null;
			}
			$parent_id = $parent->id;
		}

		$name = $row['indicador'];
		$unit = $row['unidade'];
		$target_short = $row['meta_2020'];
		$target_medium = $row['meta_2025'];
		$target_long = $row['meta_2030'];

		$indicator = Indicator::create([
			'parent_id' => $parent_id,
			'parent_type' => $parent_type,
			'name' => $name,
			'alias' => str_slug($name),
			'description' => '',
			'unit' => $unit,
			'target_short' => $target_short,
			'target_medium' => $target_medium,
			'target_long' => $target_long,
		]);

		$data = $row->slice(15);

		foreach ($data as $date => $value) {
			if ( is_numeric($value) ) {
				Data::create([
					'datable_id' => $indicator->id,
					'datable_type' => 'App\\Indicator',
					'date' => Carbon::create($date, 1, 1),
					'value' => $value,
				]);
			}
		}
	}

	private function importReference($row)
	{
		$name = $row['indicador_ou_metrica'];
		$unit = $row['unidade'];

		$reference = Reference::create([
			'indicator_id' => null,
			'name' => $name,
			'alias' => str_slug($name),
			'description' => '',
			'unit' => $unit,
		]);

		$data = $row->slice(15);

		foreach ($data as $date => $value) {
			if ( is_numeric($value) ) {
				Data::create([
					'datable_id' => $reference->id,
					'datable_type' => 'App\\Reference',
					'date' => Carbon::create($date, 1, 1),
					'value' => $value,
				]);
			}
		}
	}
}
