<?php

namespace App\Exports;

use App\Indicator;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\WithHeadings;

class IndicatorExport implements FromCollection, WithHeadings
{
	use Exportable;

	protected $indicator;

	public function __construct($indicator)
    {
        $this->indicator = $indicator;
    }

	/**
	 * @return \Illuminate\Support\Collection
	 */
	public function collection()
	{
		$data = $this->indicator->data;

		$data = $data->map(function ($data) {
		    return $data->only(['date', 'value']);
		});

		return $data;
	}

	public function headings(): array
    {
        return [
            'data',
            'valor',
        ];
    }
}
