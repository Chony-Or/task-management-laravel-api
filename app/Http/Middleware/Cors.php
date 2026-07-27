<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class Cors
{
    /**
     * Handle an incoming request.
     *
     * @param  Closure(Request): (Response)  $next
     */
    // Source - https://stackoverflow.com/a/57658719
// Posted by Sodruldeen Mustapha, modified by community. See post 'Timeline' for change history
// Retrieved 2026-07-27, License - CC BY-SA 4.0

    public function handle($request, Closure $next) {
        return $next($request)
        ->header('Access-Control-Allow-Origin', '*')
        ->header('Access-Control-Allow-Methods', '*')
        ->header('Access-Control-Allow-Headers',' Origin, Content-Type, Accept, Authorization, X-Request-With')
        ->header('Access-Control-Allow-Credentials',' true');
    }

}
