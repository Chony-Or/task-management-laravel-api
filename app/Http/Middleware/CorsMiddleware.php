<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class CorsMiddleware
{
    /**
     * Handle an incoming request.
     */
    public function handle(Request $request, Closure $next)
    {
        $origin = $request->headers->get('Origin');
        $allowedOrigins = [
            'https://task-management-react-nine.vercel.app',
            'http://localhost:3000',
            'http://localhost:5173',
        ];

        $isAllowedOrigin = in_array($origin, $allowedOrigins, true)
            || preg_match('/^https:\/\/.*\.vercel\.app$/', (string) $origin) === 1;

        if (!$isAllowedOrigin) {
            return $next($request);
        }

        if ($request->getMethod() === 'OPTIONS') {
            $response = response('', 204);
        } else {
            $response = $next($request);
        }

        $response->headers->set('Access-Control-Allow-Origin', $origin);
        $response->headers->set('Access-Control-Allow-Credentials', 'true');
        $response->headers->set('Access-Control-Allow-Methods', 'GET, POST, PUT, PATCH, DELETE, OPTIONS');
        $response->headers->set('Access-Control-Allow-Headers', 'Content-Type, Authorization, X-Requested-With, X-CSRF-TOKEN');
        $response->headers->set('Vary', 'Origin');

        return $response;
    }
}
