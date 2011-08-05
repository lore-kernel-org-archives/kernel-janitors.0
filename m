From: Dan Carpenter <error27@gmail.com>
Date: Fri, 05 Aug 2011 14:18:21 +0000
Subject: [patch] xen-blkback: add missing return on error in
Message-Id: <20110805141821.GK7659@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Laszlo Ersek <lersek@redhat.com>, Joe Jin <joe.jin@oracle.com>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

We should return here after reporting the error.  Otherwise we'd hit
a NULL deref of blkif->xenblkd on the next line.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index 32d4c3c..b750299 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -107,6 +107,7 @@ static void xen_update_blkif_status(struct xen_blkif *blkif)
 		err = PTR_ERR(blkif->xenblkd);
 		blkif->xenblkd = NULL;
 		xenbus_dev_error(blkif->be->dev, err, "start xenblkd");
+		return;
 	}
 
 	blkif->be->kthread_pid = blkif->xenblkd->pid;
