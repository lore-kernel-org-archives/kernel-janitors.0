From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 28 May 2016 04:48:10 +0000
Subject: [patch v2] usb: f_fs: off by one bug in _ffs_func_bind()
Message-Id: <20160528044810.GA4107@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20160528044618.GQ11011@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Nazarewicz <mina86@mina86.com>, Lars-Peter Clausen <lars@metafoo.de>, Robert Baldyga <r.baldyga@samsung.com>, Al Viro <viro@ZenIV.linux.org.uk>, Daniel Walter <dwalter@sigma-star.at>, "Du, Changbin" <changbin.du@intel.com>, Rui Miguel Silva <rui.silva@linaro.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This loop is supposed to set all the .num[] values to -1 but it's off by
one so it skips the first element and sets one element past the end of
the array.

I've cleaned up the loop a little as well.

Fixes: ddf8abd25994 ('USB: f_fs: the FunctionFS driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: move the eps_ptr assignment outside the loop.

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 73515d5..d26eb64 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -2729,6 +2729,7 @@ static int _ffs_func_bind(struct usb_configuration *c,
 		func->ffs->ss_descs_count;
 
 	int fs_len, hs_len, ss_len, ret, i;
+	struct ffs_ep *eps_ptr;
 
 	/* Make it a single chunk, less management later on */
 	vla_group(d);
@@ -2777,12 +2778,9 @@ static int _ffs_func_bind(struct usb_configuration *c,
 	       ffs->raw_descs_length);
 
 	memset(vla_ptr(vlabuf, d, inums), 0xff, d_inums__sz);
-	for (ret = ffs->eps_count; ret; --ret) {
-		struct ffs_ep *ptr;
-
-		ptr = vla_ptr(vlabuf, d, eps);
-		ptr[ret].num = -1;
-	}
+	eps_ptr = vla_ptr(vlabuf, d, eps);
+	for (i = 0; i < ffs->eps_count; i++)
+		eps_ptr[i].num = -1;
 
 	/* Save pointers
 	 * d_eps = vlabuf, func->eps used to kfree vlabuf later
