From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 12 Feb 2011 03:38:23 +0000
Subject: [PATCH 2/4] Staging: bcm: Bcmchar: Fix style issues on bcm_char_release()
Message-Id: <1297481905-22331-3-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/bcm/Bcmchar.c |   68 ++++++++++++++++++----------------------
 1 files changed, 31 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/bcm/Bcmchar.c b/drivers/staging/bcm/Bcmchar.c
index edcd0c0..2a3f64c 100644
--- a/drivers/staging/bcm/Bcmchar.c
+++ b/drivers/staging/bcm/Bcmchar.c
@@ -45,61 +45,55 @@ static int bcm_char_open(struct inode *inode, struct file * filp)
 
 static int bcm_char_release(struct inode *inode, struct file *filp)
 {
-    PPER_TARANG_DATA pTarang, tmp, ptmp;
-	PMINI_ADAPTER Adapter=NULL;
-    struct sk_buff * pkt, * npkt;
+	PPER_TARANG_DATA pTarang, tmp, ptmp;
+	PMINI_ADAPTER Adapter = NULL;
+	struct sk_buff *pkt, *npkt;
 
-    pTarang = (PPER_TARANG_DATA)filp->private_data;
+	pTarang = (PPER_TARANG_DATA)filp->private_data;
 
-    if(pTarang = NULL)
-	{
-	BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "ptarang is null\n");
-	return 0;
+	if (pTarang = NULL) {
+		BCM_DEBUG_PRINT(Adapter, DBG_TYPE_PRINTK, 0, 0,
+				"ptarang is null\n");
+		return 0;
 	}
 
 	Adapter = pTarang->Adapter;
 
-    down( &Adapter->RxAppControlQueuelock);
+	down(&Adapter->RxAppControlQueuelock);
 
-    tmp = Adapter->pTarangs;
-    for ( ptmp = NULL; tmp; ptmp = tmp, tmp = tmp->next )
-	{
-        if ( tmp = pTarang )
+	tmp = Adapter->pTarangs;
+	for (ptmp = NULL; tmp; ptmp = tmp, tmp = tmp->next) {
+		if (tmp = pTarang)
 			break;
 	}
 
-    if ( tmp )
-	{
-        if ( !ptmp )
-            Adapter->pTarangs = tmp->next;
-        else
-            ptmp->next = tmp->next;
+	if (tmp) {
+		if (!ptmp)
+			Adapter->pTarangs = tmp->next;
+		else
+			ptmp->next = tmp->next;
+	} else {
+		up(&Adapter->RxAppControlQueuelock);
+		return 0;
 	}
 
-    else
-	{
-    	up( &Adapter->RxAppControlQueuelock);
-	return 0;
-	}
-
-    pkt = pTarang->RxAppControlHead;
-    while ( pkt )
-	{
-        npkt = pkt->next;
-        kfree_skb(pkt);
-        pkt = npkt;
+	pkt = pTarang->RxAppControlHead;
+	while (pkt) {
+		npkt = pkt->next;
+		kfree_skb(pkt);
+		pkt = npkt;
 	}
 
-    up( &Adapter->RxAppControlQueuelock);
+	up(&Adapter->RxAppControlQueuelock);
 
-    /*Stop Queuing the control response Packets*/
-    atomic_dec(&Adapter->ApplicationRunning);
+	/*Stop Queuing the control response Packets*/
+	atomic_dec(&Adapter->ApplicationRunning);
 
-    kfree(pTarang);
+	kfree(pTarang);
 
 	/* remove this filp from the asynchronously notified filp's */
-    filp->private_data = NULL;
-    return 0;
+	filp->private_data = NULL;
+	return 0;
 }
 
 static ssize_t bcm_char_read(struct file *filp, char __user *buf, size_t size, loff_t *f_pos)
-- 
1.7.0.4

