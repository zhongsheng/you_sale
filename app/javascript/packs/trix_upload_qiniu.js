import $ from "jquery"
import * as qiniu from 'qiniu-js'

$(function () {

    var HOST = "http://tmp.dzunion.cn/";

    //removeEventListener
    addEventListener("trix-attachment-add", function(event) {
        if (event.attachment.file) {
            uploadFileAttachment(event.attachment);
        }
    });

    function uploadFileAttachment(attachment) {
        var key = $.now() + attachment.file.name;
        $.getJSON('/utility/upload_token.json?key='+key, function(token){
            var putExtra = {
                fname: key,
                params: {},
                mimeType: ["image/png", "image/jpeg", "image/gif"]
            };
            var config = {
                useCdnDomain: true,
                region: qiniu.region.z0
            };
            var observable = qiniu.upload(attachment.file, key, token.value, putExtra, config);

            var observer = {
                next(res){
                    attachment.setUploadProgress(res.total.percent);
                },
                error(err){
                    alert(err.message);
                },
                complete(res){
                    var attributes = {
                        url: HOST + key,
                        href: HOST + key // + "?content-disposition=attachment"
                    };
                    attachment.setAttributes(attributes);
                }
            };
            var subscription = observable.subscribe(observer);
        });
    }
});
