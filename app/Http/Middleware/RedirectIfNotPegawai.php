<?php
namespace App\Http\Middleware;

use Closure;

class RedirectIfNotPegawai
{
    /**
     * Handle an incoming request .
     *
     * @param  \Illuminate \Http \Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next,  $guard = "pegawai")
    {
        if (!auth()->guard($guard)->check()) {
            return redirect(route('pegawai.login'));
        }
        return $next($request);
    }
}
