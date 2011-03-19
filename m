From: Dan Carpenter <error27@gmail.com>
Date: Sat, 19 Mar 2011 05:45:43 +0000
Subject: [patch 2/2] xen-gntdev: unlock on error path in gntdev_mmap()
Message-Id: <20110319054543.GE2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
Cc: kernel-janitors@vger.kernel.org, xen-devel@lists.xensource.com, virtualization@lists.linux-foundation.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

We should unlock here and also decrement the number of &map->users.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
I'm not very familiar with this code.  Please review carefully.

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 017ce60..b0f9e8f 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -662,7 +662,7 @@ static int gntdev_mmap(struct file *flip, struct vm_area_struct *vma)
 	if (map->flags) {
 		if ((vma->vm_flags & VM_WRITE) &&
 				(map->flags & GNTMAP_readonly))
-			return -EINVAL;
+			goto out_unlock_put;
 	} else {
 		map->flags = GNTMAP_host_map;
 		if (!(vma->vm_flags & VM_WRITE))
@@ -700,6 +700,8 @@ unlock_out:
 	spin_unlock(&priv->lock);
 	return err;
 
+out_unlock_put:
+	spin_unlock(&priv->lock);
 out_put_map:
 	if (use_ptemod)
 		map->vma = NULL;
