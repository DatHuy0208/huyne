<?php

namespace App\Http\Controllers\clients;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ContactController extends Controller
{
    public function index()
    {
        $title = 'Liên hệ';
        return view('clients.contact', compact('title'));
    }

    public function createContact(Request $req){
        try {
            // Validate dữ liệu
            $validated = $req->validate([
                'name' => 'required|string|max:255',
                'phone_number' => 'required|string|max:20',
                'email' => 'required|email|max:255',
                'message' => 'required|string|max:1000'
            ], [
                'name.required' => 'Vui lòng nhập họ và tên',
                'phone_number.required' => 'Vui lòng nhập số điện thoại',
                'email.required' => 'Vui lòng nhập email',
                'email.email' => 'Email không hợp lệ',
                'message.required' => 'Vui lòng nhập nội dung'
            ]);

            $dataContact = [
                'fullName'    => $validated['name'],
                'phoneNumber' => $validated['phone_number'],
                'email'       => $validated['email'],
                'message'     => $validated['message']
            ];

            $createContact = DB::table('tbl_contact')->insert($dataContact); 

            if($createContact){
                toastr()->success('Gửi thành công. Chúng tôi sẽ sớm liên hệ tới bạn!');
            }else{
                toastr()->error('Có lỗi xảy ra. Xin vui lòng thử lại');
            }
            
        } catch (\Illuminate\Validation\ValidationException $e) {
            toastr()->error('Vui lòng kiểm tra lại thông tin đã nhập');
        } catch (\Exception $e) {
            toastr()->error('Có lỗi xảy ra: ' . $e->getMessage());
        }
        
        return redirect()->back();
    }
}
