<?php

namespace App\Http\Controllers;

use App\Http\Resources\ModuleResource;
use App\Models\Module;
use Illuminate\Http\Request;

class ModuleController extends Controller
{
    public function find_all()
    {
        return new ModuleResource(Module::all());
    }

    public function create(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
        ]);
        $data = Module::create([
            'name' => $request->name,
            'value' => $request->value
        ]);
        return new ModuleResource($data);
    }

    public function find_by_id($id)
    {
        $data = Module::findOrFail($id);
        return new ModuleResource($data);
    }

    public function update(Request $request, $id)
    {
        $data = Module::findOrFail($id);
        $input = [];
        foreach ($request->only(['name', 'value']) as $key => $req) {
            if (!empty($req)) {
                $input[$key] = $req;
            }
        }
        $data->update($input);
        return new ModuleResource($data);
    }

    public function delete($id)
    {
        $data = Module::findOrFail($id);
        $data->delete();
        return new ModuleResource($data);
    }
}
