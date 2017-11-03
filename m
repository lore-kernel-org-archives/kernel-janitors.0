From: Colin King <colin.king@canonical.com>
Date: Fri, 03 Nov 2017 09:20:47 +0000
Subject: [PATCH] xen/pvcalls: remove redundant check for irq >= 0
Message-Id: <20171103092047.28421-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

This is a moot point, but irq is always less than zero at the label
out_error, so the check for irq >= 0 is redundant and can be removed.

Detected by CoverityScan, CID#1460371 ("Logically dead code")

Fixes: cb1c7d9bbc87 ("xen/pvcalls: implement connect command")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/xen/pvcalls-front.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
index de8a470351a5..b08569998046 100644
--- a/drivers/xen/pvcalls-front.c
+++ b/drivers/xen/pvcalls-front.c
@@ -351,9 +351,7 @@ static int create_active(struct sock_mapping *map, int *evtchn)
 	return 0;
 
 out_error:
-	if (irq >= 0)
-		unbind_from_irqhandler(irq, map);
-	else if (*evtchn >= 0)
+	if (*evtchn >= 0)
 		xenbus_free_evtchn(pvcalls_front_dev, *evtchn);
 	kfree(map->active.data.in);
 	kfree(map->active.ring);
-- 
2.14.1

