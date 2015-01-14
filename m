From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jan 2015 21:03:52 +0000
Subject: [patch 5/6] usb: gadget: uvc: make a bunch of stuff static
Message-Id: <20150114210352.GE23203@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Sparse rightly complains that these things should be static since they
are only used in the one .c file.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 1af2686..a0443a2 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -43,7 +43,8 @@ struct uvcg_control_header {
 	unsigned			linked;
 };
 
-struct uvcg_control_header *to_uvcg_control_header(struct config_item *item)
+static struct uvcg_control_header *to_uvcg_control_header(struct config_item
+							  *item)
 {
 	return container_of(item, struct uvcg_control_header, item);
 }
@@ -135,7 +136,7 @@ static struct configfs_attribute *uvcg_control_header_attrs[] = {
 	NULL,
 };
 
-struct config_item_type uvcg_control_header_type = {
+static struct config_item_type uvcg_control_header_type = {
 	.ct_item_ops	= &uvcg_control_header_item_ops,
 	.ct_attrs	= uvcg_control_header_attrs,
 	.ct_owner	= THIS_MODULE,
@@ -161,7 +162,7 @@ static struct config_item *uvcg_control_header_make(struct config_group *group,
 	return &h->item;
 }
 
-void uvcg_control_header_drop(struct config_group *group,
+static void uvcg_control_header_drop(struct config_group *group,
 			      struct config_item *item)
 {
 	struct uvcg_control_header *h = to_uvcg_control_header(item);
@@ -718,7 +719,7 @@ struct uvcg_format {
 	__u8			bmaControls[UVCG_STREAMING_CONTROL_SIZE];
 };
 
-struct uvcg_format *to_uvcg_format(struct config_item *item)
+static struct uvcg_format *to_uvcg_format(struct config_item *item)
 {
 	return container_of(to_config_group(item), struct uvcg_format, group);
 }
@@ -795,7 +796,8 @@ struct uvcg_streaming_header {
 	unsigned					num_fmt;
 };
 
-struct uvcg_streaming_header *to_uvcg_streaming_header(struct config_item *item)
+static struct uvcg_streaming_header *to_uvcg_streaming_header(struct config_item
+							      *item)
 {
 	return container_of(item, struct uvcg_streaming_header, item);
 }
@@ -947,7 +949,7 @@ static struct configfs_attribute *uvcg_streaming_header_attrs[] = {
 	NULL,
 };
 
-struct config_item_type uvcg_streaming_header_type = {
+static struct config_item_type uvcg_streaming_header_type = {
 	.ct_item_ops	= &uvcg_streaming_header_item_ops,
 	.ct_attrs	= uvcg_streaming_header_attrs,
 	.ct_owner	= THIS_MODULE,
@@ -973,7 +975,7 @@ static struct config_item
 	return &h->item;
 }
 
-void uvcg_streaming_header_drop(struct config_group *group,
+static void uvcg_streaming_header_drop(struct config_group *group,
 			      struct config_item *item)
 {
 	struct uvcg_streaming_header *h = to_uvcg_streaming_header(item);
@@ -1017,7 +1019,7 @@ struct uvcg_frame {
 	struct config_item	item;
 };
 
-struct uvcg_frame *to_uvcg_frame(struct config_item *item)
+static struct uvcg_frame *to_uvcg_frame(struct config_item *item)
 {
 	return container_of(item, struct uvcg_frame, item);
 }
@@ -1260,7 +1262,7 @@ static struct configfs_attribute *uvcg_frame_attrs[] = {
 	NULL,
 };
 
-struct config_item_type uvcg_frame_type = {
+static struct config_item_type uvcg_frame_type = {
 	.ct_item_ops	= &uvcg_frame_item_ops,
 	.ct_attrs	= uvcg_frame_attrs,
 	.ct_owner	= THIS_MODULE,
@@ -1311,7 +1313,8 @@ static struct config_item *uvcg_frame_make(struct config_group *group,
 	return &h->item;
 }
 
-void uvcg_frame_drop(struct config_group *group, struct config_item *item)
+static void uvcg_frame_drop(struct config_group *group,
+			    struct config_item *item)
 {
 	struct uvcg_frame *h = to_uvcg_frame(item);
 	struct uvcg_format *fmt;
@@ -1334,7 +1337,7 @@ struct uvcg_uncompressed {
 	struct uvc_format_uncompressed	desc;
 };
 
-struct uvcg_uncompressed *to_uvcg_uncompressed(struct config_item *item)
+static struct uvcg_uncompressed *to_uvcg_uncompressed(struct config_item *item)
 {
 	return container_of(
 		container_of(to_config_group(item), struct uvcg_format, group),
@@ -1544,7 +1547,7 @@ static struct configfs_attribute *uvcg_uncompressed_attrs[] = {
 	NULL,
 };
 
-struct config_item_type uvcg_uncompressed_type = {
+static struct config_item_type uvcg_uncompressed_type = {
 	.ct_item_ops	= &uvcg_uncompressed_item_ops,
 	.ct_group_ops	= &uvcg_uncompressed_group_ops,
 	.ct_attrs	= uvcg_uncompressed_attrs,
@@ -1582,7 +1585,7 @@ static struct config_group *uvcg_uncompressed_make(struct config_group *group,
 	return &h->fmt.group;
 }
 
-void uvcg_uncompressed_drop(struct config_group *group,
+static void uvcg_uncompressed_drop(struct config_group *group,
 			    struct config_item *item)
 {
 	struct uvcg_uncompressed *h = to_uvcg_uncompressed(item);
@@ -1606,7 +1609,7 @@ struct uvcg_mjpeg {
 	struct uvc_format_mjpeg		desc;
 };
 
-struct uvcg_mjpeg *to_uvcg_mjpeg(struct config_item *item)
+static struct uvcg_mjpeg *to_uvcg_mjpeg(struct config_item *item)
 {
 	return container_of(
 		container_of(to_config_group(item), struct uvcg_format, group),
@@ -1757,7 +1760,7 @@ static struct configfs_attribute *uvcg_mjpeg_attrs[] = {
 	NULL,
 };
 
-struct config_item_type uvcg_mjpeg_type = {
+static struct config_item_type uvcg_mjpeg_type = {
 	.ct_item_ops	= &uvcg_mjpeg_item_ops,
 	.ct_group_ops	= &uvcg_mjpeg_group_ops,
 	.ct_attrs	= uvcg_mjpeg_attrs,
@@ -1789,7 +1792,7 @@ static struct config_group *uvcg_mjpeg_make(struct config_group *group,
 	return &h->fmt.group;
 }
 
-void uvcg_mjpeg_drop(struct config_group *group,
+static void uvcg_mjpeg_drop(struct config_group *group,
 			    struct config_item *item)
 {
 	struct uvcg_mjpeg *h = to_uvcg_mjpeg(item);
