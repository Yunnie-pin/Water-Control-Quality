<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Client>
 */
class ClientFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'nama' => fake()->name(),
            'sensor_ph' => fake()->randomFloat(2, 100, 200),
            'sensor_suhu' => fake()->randomFloat(2, 100, 200),
            'hasil' => 'mantap'
        ];
    }
}
