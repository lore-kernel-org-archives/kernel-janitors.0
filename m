From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jan 2015 21:01:07 +0000
Subject: [patch 2/6] usb: gadget: uvc: cleanup __uvcg_fill_strm()
Message-Id: <20150114210107.GB23203@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Static checkers complain about this API:

	drivers/usb/gadget/function/uvc_configfs.c:2139
		uvcg_streaming_class_allow_link()
	warn: did you really mean to pass the address of 'data'?

Indeed, the code is cleaner when we just pass the pointer instead of the
pointer to the pointer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Looks obvious enough to me, but I've only compiled this code and haven't
tested it.

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index d112c99..2bd0688 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -2009,28 +2009,27 @@ static int __uvcg_cnt_strm(void *priv1, void *priv2, void *priv3, int n,
 	return 0;
 }
 
-static int __uvcg_fill_strm(void *priv1, void *priv2, void *priv3, int n,
+static int __uvcg_fill_strm(void *priv1, void *dest, void *priv3, int n,
 			    enum uvcg_strm_type type)
 {
-	void **dest = priv2;
 	struct uvc_descriptor_header ***array = priv3;
 	size_t sz;
 
-	**array = *dest;
+	**array = dest;
 	++*array;
 
 	switch (type) {
 	case UVCG_HEADER: {
-		struct uvc_input_header_descriptor *ihdr = *dest;
+		struct uvc_input_header_descriptor *ihdr = dest;
 		struct uvcg_streaming_header *h = priv1;
 		struct uvcg_format_ptr *f;
 
-		memcpy(*dest, &h->desc, sizeof(h->desc));
-		*dest += sizeof(h->desc);
+		memcpy(dest, &h->desc, sizeof(h->desc));
+		dest += sizeof(h->desc);
 		sz = UVCG_STREAMING_CONTROL_SIZE;
 		list_for_each_entry(f, &h->formats, entry) {
-			memcpy(*dest, f->fmt->bmaControls, sz);
-			*dest += sz;
+			memcpy(dest, f->fmt->bmaControls, sz);
+			dest += sz;
 		}
 		ihdr->bLength = sizeof(h->desc) + h->num_fmt * sz;
 		ihdr->bNumFormats = h->num_fmt;
@@ -2040,22 +2039,22 @@ static int __uvcg_fill_strm(void *priv1, void *priv2, void *priv3, int n,
 		struct uvcg_format *fmt = priv1;
 
 		if (fmt->type = UVCG_UNCOMPRESSED) {
-			struct uvc_format_uncompressed *unc = *dest;
+			struct uvc_format_uncompressed *unc = dest;
 			struct uvcg_uncompressed *u  				container_of(fmt, struct uvcg_uncompressed,
 					     fmt);
 
-			memcpy(*dest, &u->desc, sizeof(u->desc));
-			*dest += sizeof(u->desc);
+			memcpy(dest, &u->desc, sizeof(u->desc));
+			dest += sizeof(u->desc);
 			unc->bNumFrameDescriptors = fmt->num_frames;
 			unc->bFormatIndex = n + 1;
 		} else if (fmt->type = UVCG_MJPEG) {
-			struct uvc_format_mjpeg *mjp = *dest;
+			struct uvc_format_mjpeg *mjp = dest;
 			struct uvcg_mjpeg *m  				container_of(fmt, struct uvcg_mjpeg, fmt);
 
-			memcpy(*dest, &m->desc, sizeof(m->desc));
-			*dest += sizeof(m->desc);
+			memcpy(dest, &m->desc, sizeof(m->desc));
+			dest += sizeof(m->desc);
 			mjp->bNumFrameDescriptors = fmt->num_frames;
 			mjp->bFormatIndex = n + 1;
 		} else {
@@ -2065,15 +2064,15 @@ static int __uvcg_fill_strm(void *priv1, void *priv2, void *priv3, int n,
 	break;
 	case UVCG_FRAME: {
 		struct uvcg_frame *frm = priv1;
-		struct uvc_descriptor_header *h = *dest;
+		struct uvc_descriptor_header *h = dest;
 
 		sz = sizeof(frm->frame);
-		memcpy(*dest, &frm->frame, sz);
-		*dest += sz;
+		memcpy(dest, &frm->frame, sz);
+		dest += sz;
 		sz = frm->frame.b_frame_interval_type *
 			sizeof(*frm->dw_frame_interval);
-		memcpy(*dest, frm->dw_frame_interval, sz);
-		*dest += sz;
+		memcpy(dest, frm->dw_frame_interval, sz);
+		dest += sz;
 		if (frm->fmt_type = UVCG_UNCOMPRESSED)
 			h->bLength = UVC_DT_FRAME_UNCOMPRESSED_SIZE(
 				frm->frame.b_frame_interval_type);
@@ -2136,7 +2135,7 @@ static int uvcg_streaming_class_allow_link(struct config_item *src,
 		goto unlock;
 	}
 	cl_arr = *class_array;
-	ret = __uvcg_iter_strm_cls(target_hdr, &data, &cl_arr,
+	ret = __uvcg_iter_strm_cls(target_hdr, data, &cl_arr,
 				   __uvcg_fill_strm);
 	if (ret) {
 		kfree(*class_array);
