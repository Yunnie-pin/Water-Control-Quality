<?php

namespace App\Http\Controllers;

use App\Http\Resources\ClientResource;
use App\Models\Client;
use Illuminate\Http\Request;

class ClientController extends Controller
{
    public function find_all()
    {
        $data = Client::all();
        foreach($data as $k => $d){
            $r = Client::findOrFail($d->id);
            $data[$k]->module = $r->module()->first();
        }
        return new ClientResource($data);
    }

    public function create(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'result' => 'string'
        ]);
        $data = Client::create([
            'name' => $request->name,
            'module_id' => $request->module_id,
            'result' => $request->result
        ]);
        if(isset($request->module_id)){
            $r = Client::findOrFail($data->id);
            $data->module = $r->module()->first();
        }
        return new ClientResource($data);
    }

    public function find_by_id($id)
    {
        $data = Client::findOrFail($id);
        $data->module = $data->module()->first();
        return new ClientResource($data);
    }

    public function update(Request $request, $id)
    {
        $data = Client::findOrFail($id);
        $input = [];
        foreach ($request->only(['name', 'module_id', 'result']) as $key => $req) {
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
        return response()->json(['data' => true]);
    }
}
