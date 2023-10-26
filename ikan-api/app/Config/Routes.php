<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');

$routes->group('ikan', function ($routes){
    $routes->post('/', 'IkanController::create');
    $routes->get('/', 'IkanController::list');
    $routes->get('(:segment)', 'IkanController::detail/$1');
    $routes->put('(:segment)', 'IkanController::ubah/$1');
    $routes->delete('(:segment)', 'IkanController::hapus/$1');
});
