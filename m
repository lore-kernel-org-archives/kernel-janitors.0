From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 17 Oct 2015 05:18:47 +0000
Subject: [patch] iommu/vt-d: fix a loop in prq_event_thread()
Message-Id: <20151017051847.GA13372@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, David Woodhouse <David.Woodhouse-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

There is an extra semi-colon on this if statement so we always break on
the first iteration.

Fixes: 0204a4960982 ('iommu/vt-d: Add callback to device driver on page faults')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c
index 99a7803..dd070e6 100644
--- a/drivers/iommu/intel-svm.c
+++ b/drivers/iommu/intel-svm.c
@@ -536,7 +536,7 @@ static irqreturn_t prq_event_thread(int irq, void *d)
 		/* Accounting for major/minor faults? */
 		rcu_read_lock();
 		list_for_each_entry_rcu(sdev, &svm->devs, list) {
-			if (sdev->sid = PCI_DEVID(req->bus, req->devfn));
+			if (sdev->sid = PCI_DEVID(req->bus, req->devfn))
 				break;
 		}
 		/* Other devices can go away, but the drivers are not permitted
