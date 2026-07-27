<?php

namespace Tests\Feature;

use Tests\TestCase;

class CorsTest extends TestCase
{
    public function test_preflight_requests_return_cors_headers(): void
    {
        $response = $this->optionsJson('/api/login', [], [
            'Origin' => 'https://task-management-react-nine.vercel.app',
            'Access-Control-Request-Method' => 'POST',
            'Access-Control-Request-Headers' => 'content-type',
        ]);

        $response->assertStatus(204);
        $response->assertHeader('Access-Control-Allow-Origin', 'https://task-management-react-nine.vercel.app');
    }
}
