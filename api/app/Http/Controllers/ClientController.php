<?php

namespace App\Http\Controllers;

use App\Http\Resources\ClientResource;
use App\Models\Client;
use Illuminate\Http\Request;

class ClientController extends Controller
{
    public function all()
    {
        return new ClientResource(Client::all());
    }

    public function add(Request $request)
    {
        $request->validate([
            'nama' => 'required',
            'sensor_ph' => 'required',
            'sensor_suhu' => 'required',
        ]);
        $data = Client::create([
            'nama' => $request->nama,
            'sensor_ph' => $request->sensor_ph,
            'sensor_suhu' => $request->sensor_suhu,
            'hasil' => $request->hasil ?: ''
        ]);
        return new ClientResource($data);
    }

    public function get($id)
    {
        $data = Client::findOrFail($id);
        return new ClientResource($data);
    }

    public function put(Request $request, $id)
    {
        $data = Client::findOrFail($id);
        $input = [];
        foreach ($request->only(['nama', 'sensor_ph', 'sensor_suhu', 'hasil']) as $key => $req) {
            if (!empty($req)) {
                $input[$key] = $req;
            }
        }
        $data->update($input);
        return new ClientResource($data);
    }

    public function delete($id)
    {
        $data = Client::findOrFail($id);
        $data->delete();
        return new ClientResource($data);
    }
}
