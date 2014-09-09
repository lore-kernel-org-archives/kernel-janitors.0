From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Sep 2014 12:06:09 +0000
Subject: [patch] usb: gadget: f_fs: signedness bug in __ffs_func_bind_do_descs()
Message-Id: <20140909120609.GB19760@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We need "idx" to be signed for the error handling to work.

Fixes: 6d5c1c77bbf9 ('usb: gadget: f_fs: fix the redundant ep files problem')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Btw, there is a sparse warning:

drivers/usb/gadget/function/f_fs.c:401:44: warning: Variable length array is used.

The risk here is that the array would be too large.  I don't know the
code well enough to say if it can be triggered, but from an outsider
perspective it looks scary (security implications).  There should be a
comment explaining why it can't be used to overflow the 8k stack.

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 0dc3552..7ad7137 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -2393,7 +2393,8 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
 	struct usb_endpoint_descriptor *ds = (void *)desc;
 	struct ffs_function *func = priv;
 	struct ffs_ep *ffs_ep;
-	unsigned ep_desc_id, idx;
+	unsigned ep_desc_id;
+	int idx;
 	static const char *speed_names[] = { "full", "high", "super" };
 
 	if (type != FFS_DESCRIPTOR)
