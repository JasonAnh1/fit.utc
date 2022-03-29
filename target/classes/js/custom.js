/**
 * 
 */

function deleteOldStudent(id){
    jQuery.ajax({
        url: "/admin/ajax/delete/OldStudent/"+id,
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        success: function (jsonValue){
            alert("Xóa thành công !!");
        },
        error: function(jqXhr, textStatus, errorMessage) {
           
                alert("cựu sinh viên này đã không hoạt động !!");
            
        }
    });
}
function deleteSponsor(id){
    jQuery.ajax({
        url: "/admin/ajax/delete/Sponsor/"+id,
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        success: function (jsonValue){
            alert("Thao tác thành công !!");
        },
        error: function(jqXhr, textStatus, errorMessage) {
           
                alert("nhà tài trợ này đã không hoạt động !!");
            
        }
    });
}
function activeOldStudent(id){
    jQuery.ajax({
        url: "/admin/ajax/active/OldStudent/"+id,
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        success: function (jsonValue){
            alert("Kích hoạt thành công !!");
        },
        error: function(jqXhr, textStatus, errorMessage) {
           
                alert("l !!");
            
        }
    });}

function activeSponsor(id){
    jQuery.ajax({
        url: "/admin/ajax/active/Sponsor/"+id,
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        success: function (jsonValue){
            alert("Kích hoạt thành công !!");
        },
        error: function(jqXhr, textStatus, errorMessage) {
           
                alert("lỗi!!");
            
        }
    });}
