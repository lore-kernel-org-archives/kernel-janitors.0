From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 May 2012 08:47:47 +0000
Subject: [patch] hvc_xen: NULL dereference on allocation failure
Message-Id: <20120515084746.GC30265@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Alan Cox <alan@linux.intel.com>

If kzalloc() returns a NULL here, we pass a NULL to
xencons_disconnect_backend() which will cause an Oops.

Also I removed the __GFP_ZERO while I was at it since kzalloc() implies
__GFP_ZERO.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index 83d5c88..d3d91da 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -430,9 +430,9 @@ static int __devinit xencons_probe(struct xenbus_device *dev,
 	if (devid = 0)
 		return -ENODEV;
 
-	info = kzalloc(sizeof(struct xencons_info), GFP_KERNEL | __GFP_ZERO);
+	info = kzalloc(sizeof(struct xencons_info), GFP_KERNEL);
 	if (!info)
-		goto error_nomem;
+		return -ENOMEM;
 	dev_set_drvdata(&dev->dev, info);
 	info->xbdev = dev;
 	info->vtermno = xenbus_devid_to_vtermno(devid);
