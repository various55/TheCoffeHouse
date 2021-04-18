// khai báo cho các biến dùng chung
// các url
var url = '';
// các biến để getData
var orderBy = 1;  // 1 order by desc Created Date,2 order by Created ,3 orderBy Order , 4 orderBy desc Order
var idForeignKey = 0; // 0 tìm tất cả
var sortBy = '';
var isAsc = true;
var search = '';
var pageNumber = 1;
var pageSize = 9;

// định nghĩa các function hiển thị dữ liệu
function Search() {
    //action 'input' text changed, keyup: enter thì ok
    $('.search').on('input', function (e) {
        let val = $(this).val();
        search = val;
        loadData(url);
    })
}
function loadData(url) {
    var data = {
        idCategory: idForeignKey,
        sortBy: sortBy,
        isAsc: isAsc,
        search: search,
        pageSize: pageSize,
        pageNumber: pageNumber
    }
    $.ajax({
        url: url,
        type: 'post',
        dataType: 'html',
        data: {
            requestData: data
        },
        success: (response) => {
            console.log(response);
            $('#products').html('');
            $('#products').html(response);
        },
        error: (response) => {
            console.log(response);
        }
    })
}
function ChangeSortBy() {
    $('select.sortBy').on('change', function () {
        let val = $(this).val();
        sortBy = val;
        loadData(url)
    })
}
function ChangePageSize() {
    
    $('select.pageSize').on('change', function () {
        let val = $(this).val();
        pageSize = val;
        pageNumber = 1;
        loadData(url)
    })
}

function ChangePageNumber() {
    $('#pagination li a').click((e) => {
        e.preventDefault();
        pageNumber = e.target.name;
        loadData(url);
    });
}
function FindByFK() {
    $('a.findByFK').click((e) => {
        e.preventDefault()
        idForeignKey = e.target.name;
        loadData(url);
    });
}


// get data from server 
function GetDataToTable(url, search, pageNumber, pageSize) {
    let submitData = new Object();
    submitData = {
        search: search,
        pageSize: pageSize,
        pageNumber: pageNumber
    }
    $.ajax({
        url: url,
        type: 'post',
        dataType: 'html',
        data: {
            requestData: submitData
        },
        success: function (res) {
            console.log(res)
            $('.view-table').html('');
            $('.view-table').append(res);
        },
        error: function (error) {
            console.log("error");
            console.log(error);
        },
        complete: function () {
            ChangePageNumber();
        }
    })
}

// post record
function AddOrUpdate(url) {
    if (Validation()) {  // kiểm tra dữ liệu đầu vào
        // read data in form
        let formArray = $('form.form-input').serializeArray();
        var object = {};
        jQuery.map(formArray, function (n, i) {
            object[n.name] = n.value;
        });
        $('.form-input textarea').each(function (index, item) {
            if ($(this).hasClass('ckeditor') || $(this).hasClass('ckeditor')) {
                let id = $(this).attr('id');
                object[$(this).attr('name')] = CKEDITOR.instances[id].getData();
            }
        })
        swal({
            title: $('#Id').val() == 0 ? "Bạn có chắc chắn muốn thêm" : "Bạn có chắc muốn sửa dữ liệu này?",
            text: $('#Id').val() == 0 ? "" : "Sau khi sửa thì không thể quay lại!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                // submit data
                $.ajax({
                    url: url,
                    type: 'post',
                    dataType: 'json',
                    data: {
                        obj: object
                    },
                    success: function (res) {
                        let msg = ''
                        if ($('#Id').val() == 0) {
                            msg = 'Thêm dữ liệu thành công'
                        }
                        else {
                            msg = 'Sủa dữ liệu thành công'
                        }
                        if (res) {
                            let t = toastr.success(msg);
                            t.show();
                            GetDataToTable(urlGetData, search, pageNumber, pageSize)
                        }
                        else {
                            let t = toastr.warning('Bạn cần nhập mật khẩu để thay đổi thông tin');
                            t.show();
                        }
                    },
                    error: function (error) {

                    },
                    complete: function () {
                        RefreshForm();
                    }
                })
            }
        })
    }
}

//get record
function GetObjectById(url, id) {
    $.ajax({
        url: url,
        type: 'post',
        dataType: 'json',
        data: {
            id: id
        },
        success: function (res) {
            $.each(res, function (key, value) {
                key = key[0].toUpperCase() + key.slice(1, key.length);   // lấy ra key object
                let elName = ".form-input " + "#" + key   // lấy ra string el
                let el = $(elName); // get element by key
                if (el != null && el != undefined && el.length > 0) {
                    let tagName = el.prop('tagName').toLowerCase();  // get tag name element
                    if (tagName == 'input') {
                        let type = el.prop('type');  // type of input
                        if (type == 'text' || type == 'number' || type == 'hidden' || type == 'email') {
                            el.val(value);
                            if (key == "Image") {
                                el.siblings('img').attr('src', value)
                            }
                        }
                        else if (type == 'radio') {
                            let obj = ".form-input " + "input[name=" + key + "][value=" + value + "]"
                            let radio = $(obj);
                            radio.prop('checked', true);
                        }
                        else if (type == 'date') {
                            let date = value.slice(0, 10);
                            el.val(date);
                        }
                    }
                    else if (tagName == 'select') {
                        el.val(value);
                        if (el.hasClass('select2')) {
                            el.val(value).select2();
                        }
                    }
                    else if (tagName == 'textarea') {
                        if (el.hasClass('ckeditor') || el.hasClass('p-ckeditor')) {
                            CKEDITOR.instances[key].setData(value);
                        }
                        else {
                            el.val(value);
                        }
                    }
                }

            })
        },
        error: function (error) {
            console.log(error)
        },
        complete: function () {
        }
    })
}

// view detail
function GetViewDetail(url, id) {
    $.ajax({
        url: url,
        type: 'post',
        dataType: 'html',
        data: {
            id: id
        },
        success: function (res) {
            $('#viewDetail .modal-body').html('');
            $('#viewDetail .modal-body').append(res);
            $('#viewDetail').modal('show');
        },
        error: function (error) {
            console.log(error)
        }
    })
}
function SwitchStatus(url, id,status) {
    Swal.fire({
        title: 'Bạn có muốn thay đổi trạng thái ?',
        showDenyButton: true,
        confirmButtonText: `Đồng ý`,
        denyButtonText: `Hủy`,
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            $.ajax({
                url: url,
                data: {
                    id: id
                },
                success: (response) => {
                    Swal.fire('Saved!', '', 'success')
                },
                error: (response) => {
                }
            })
        } else if (result.isDenied) {
            var item = "input.btn-switch"+"#"+id ;
            var btn = $(item);
            btn.prop("checked", status != 'true');
            Swal.fire('Changes are not saved', '', 'info')
        }
    })
}

// delete record
function DeleteById(url, id) {
    Swal.fire({
        title: 'Xóa sẽ làm mất dữ liệu, bạn có muốn tiếp tục?',
        showDenyButton: true,
        showCancelButton: true,
        confirmButtonText: `Đồng ý`,
        denyButtonText: `Hủy`,
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            $.ajax({
                url: url,
                data: {
                    id: id
                },
                success: (res) => {
                    $('#tableProducts').html(res)
                    Swal.fire('Xóa dữ liệu thành công !', '', 'info')
                },
                error: (response) => {
                    Swal.fire('Đã xảy ra lỗi, xin vui lòng liên hệ với chúng tôi theo email truongvietanh221@gmail.com !', '', 'info')
                }
            })
        } else if (result.isDenied) {
            Swal.fire('Changes are not saved', '', 'info')
        }
    })
}

// xóa đi dữ liệu đang nhập trên form
function RefreshForm() {
    $('.text-danger').html('');
    $('.form-input input').each(function () {
        if ($(this).attr('type') == 'text' || $(this).attr('type') == 'date' || $(this).attr('type') == 'password' || $(this).attr('type') == 'email') {
            $(this).val("");
            if ($(this).attr('name') == "Image") {
                $(this).val('/Uploads/Image/no-image.jpg');
                $(this).siblings('img').attr('src', '/Uploads/Image/no-image.jpg');
            }
        }
        else if ($(this).attr('type') == 'number') {
            $(this).val(0);
        }
        else if ($(this).attr('type') == 'radio') {
            let name = $(this).attr('name');
            $("#" + name + "").prop('checked', true)
        }
    })

    $('.form-input select').each(function () {
        $(this).val(0);
        if ($(this).hasClass('select2')) {
            $(this).val(0).select2();
        }
    })
    $('.form-input textarea').each(function () {
        if ($(this).hasClass('ckeditor') || $(this).hasClass('p-ckeditor')) {
            let id = $(this).attr('id');
            CKEDITOR.instances[id].setData('')
        }
        else {
            $(this).val('')
        }
    })
}

// kiểm tra dữ liệu đầu vào
function Validation() {
    let check = true;
    $('div.text-danger').html('');

    $('.form-input input').each(function () {
        if ($(this).hasClass('validation')) {
            let val = $(this).val();
            if (val == '') {
                let label = $(this).siblings('label').text();
                $(this).siblings('.text-danger').append(label + ' không được để trống');
                check = false;
            }
            else if ($(this).prop('type') == 'email') {
                if (!validateEmail(val)) {
                    let label = $(this).siblings('label').text();
                    $(this).siblings('.text-danger').append(label + ' không đúng định dạng');
                    check = false;
                }
            }
            else if ($(this).attr('name').includes('Phone')) {
                if (val.length < 10 || val.length > 11) {
                    let label = $(this).siblings('label').text();
                    $(this).siblings('.text-danger').append(label + ' không đúng định dạng');
                    check = false;
                }
            }
        }
    })
    $('.form-input select').each(function () {
        if ($(this).hasClass('validation')) {
            let val = $(this).val();
            if (val == 0) {
                let label = $(this).siblings('label').text();
                $(this).siblings('.text-danger').append(label + ' không được để trống');
                check = false;
            }
        }
    })

    $('.form-input textarea').each(function () {
        if ($(this).hasClass('validation')) {
            let val = $(this).val();
            if ($(this).hasClass('ckeditor') || $(this).hasClass('p-ckeditor')) {
                val = CKEDITOR.instances[$(this).attr('id')].setData('');
            }
            if (val == '') {
                let label = $(this).siblings('label').text();
                $(this).siblings('.text-danger').append(label + ' không được để trống');
                check = false;
            }
        }
    })
    return check;
}

function OpenFolderImage() {
    $.ajax({
        url: "/Admin/Home/ReadFileBrower",
        data: {},
        type: "get",
        dataType: 'html',
        success: function (res) {
            $('#myModal .modal-body').html('');
            $('#myModal .modal-body').append(res);
            if (!$('#myModal').hasClass('show')) {
                $('#myModal').modal('show');
                ChooseImage();
            }

        }
    })
}

function ChooseImage() {
    $('#fileExploer').on('click', 'img', function () {
        var fileUrl = '/Uploads/Image/' + $(this).attr('title');
        $('#Image').val(fileUrl);
        $('#Image').siblings('img').attr('src', fileUrl);
        // ẩn modal đi
        $('#myModal').modal('hide');
    }).hover(function () {
        $(this).css('cursor', 'pointer')
    })
}

function ConvertToSlug() {
    $('input#Name').on('keyup', function () {
        let val = $(this).val();
        $('input#Slug').val(convertToSlug(val))

        function convertToSlug(str) {
            //Đổi chữ hoa thành chữ thường
            str = str.toLowerCase();
            str = str.trim();
            str = str.replace(/\s+/gi, '-')
            //Đổi ký tự có dấu thành không dấu
            str = str.replace(/á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/gi, 'a');
            str = str.replace(/é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/gi, 'e');
            str = str.replace(/i|í|ì|ỉ|ĩ|ị/gi, 'i');
            str = str.replace(/ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ/gi, 'o');
            str = str.replace(/ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự/gi, 'u');
            str = str.replace(/ý|ỳ|ỷ|ỹ|ỵ/gi, 'y');
            str = str.replace(/đ/gi, 'd');
            str = str.replace(/\`|\~|\!|\@|\#|\||\$|\%|\^|\&|\*|\(|\)|\+|\=|\,|\.|\/|\?|\>|\<|\'|\"|\:|\;|_/gi, '-');
            str = '@' + str + '@';
            str = str.replace(/\@\-|\-\@|\@/gi, '-');
            return str;
        }
    })
}

function validateEmail(email) {
    var re = /\S+@\S+\.\S+/;
    return re.test(email);
}