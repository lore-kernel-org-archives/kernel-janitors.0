From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Aug 2013 08:16:15 +0000
Subject: [patch] gadgetfs: potential use after free in unbind()
Message-Id: <20130823081615.GC31293@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

ffs_data_put() can sometimes free "ffs" so I have moved the call down
a line below the dereference.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  I can't actually compile this file.

diff --git a/drivers/usb/gadget/f_fs.c b/drivers/usb/gadget/f_fs.c
index f394f29..1a66c5b 100644
--- a/drivers/usb/gadget/f_fs.c
+++ b/drivers/usb/gadget/f_fs.c
@@ -1417,8 +1417,8 @@ static void functionfs_unbind(struct ffs_data *ffs)
 		usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
 		ffs->ep0req = NULL;
 		ffs->gadget = NULL;
-		ffs_data_put(ffs);
 		clear_bit(FFS_FL_BOUND, &ffs->flags);
+		ffs_data_put(ffs);
 	}
 }
 
