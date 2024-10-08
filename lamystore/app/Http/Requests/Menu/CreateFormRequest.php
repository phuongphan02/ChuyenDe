<?php

namespace App\Http\Requests\Menu;

use Illuminate\Foundation\Http\FormRequest;

class CreateFormRequest extends FormRequest
{
  /**
   * Determine if the user is authorized to make this request.
   */
  public function authorize(): bool
  {
    return true;
  }

  /**
   * Get the validation rules that apply to the request.
   *
   * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
   */
  public function rules(): array
  {
    return [
      'name'=>'required',
      // 'url'=>'required'
    ];
  }
  public function messages(){
    return [
      'name.required' => 'Vui lòng nhập tên vào danh mục',
      // 'url.required' => 'Vui lòng nhập nội dung danh mục',
    ];
  }
}
