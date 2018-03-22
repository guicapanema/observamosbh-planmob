<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateIndicatorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('indicators', function (Blueprint $table) {
            $table->increments('id');
			$table->integer('parent_id');
			$table->string('parent_type');
			$table->string('name');
			$table->string('alias');
			$table->text('description')->nullable();
			$table->text('formula')->nullable();
			$table->string('modals', 256)->nullable();
			$table->string('tags', 256)->nullable();
			$table->string('target_short')->nullable();
			$table->string('target_medium')->nullable();
			$table->string('target_long')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('indicators');
    }
}
