From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 12 Feb 2011 03:38:22 +0000
Subject: [PATCH 1/4] Staging: bcm: Bcmchar: Fix style issues on bcm_char_open()
Message-Id: <1297481905-22331-2-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/bcm/Bcmchar.c |   22 ++++++++++++----------
 1 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/bcm/Bcmchar.c b/drivers/staging/bcm/Bcmchar.c
index 7dff283..edcd0c0 100644
--- a/drivers/staging/bcm/Bcmchar.c
+++ b/drivers/staging/bcm/Bcmchar.c
@@ -15,21 +15,22 @@
 
 static int bcm_char_open(struct inode *inode, struct file * filp)
 {
-	PMINI_ADAPTER 		Adapter = NULL;
-    PPER_TARANG_DATA 	pTarang = NULL;
+	PMINI_ADAPTER       Adapter = NULL;
+	PPER_TARANG_DATA    pTarang = NULL;
 
 	Adapter = GET_BCM_ADAPTER(gblpnetdev);
-    pTarang = (PPER_TARANG_DATA)kmalloc(sizeof(PER_TARANG_DATA), GFP_KERNEL);
-    if (!pTarang)
-        return -ENOMEM;
+	pTarang = (PPER_TARANG_DATA)kmalloc(sizeof(PER_TARANG_DATA),
+					    GFP_KERNEL);
+	if (!pTarang)
+		return -ENOMEM;
 
-	memset (pTarang, 0, sizeof(PER_TARANG_DATA));
-    pTarang->Adapter = Adapter;
-	pTarang->RxCntrlMsgBitMask = 0xFFFFFFFF & ~(1 << 0xB) ;
+	memset(pTarang, 0, sizeof(PER_TARANG_DATA));
+	pTarang->Adapter = Adapter;
+	pTarang->RxCntrlMsgBitMask = 0xFFFFFFFF & ~(1 << 0xB);
 
 	down(&Adapter->RxAppControlQueuelock);
-    pTarang->next = Adapter->pTarangs;
-    Adapter->pTarangs = pTarang;
+	pTarang->next = Adapter->pTarangs;
+	Adapter->pTarangs = pTarang;
 	up(&Adapter->RxAppControlQueuelock);
 
 	/* Store the Adapter structure */
@@ -41,6 +42,7 @@ static int bcm_char_open(struct inode *inode, struct file * filp)
 	nonseekable_open(inode, filp);
 	return 0;
 }
+
 static int bcm_char_release(struct inode *inode, struct file *filp)
 {
     PPER_TARANG_DATA pTarang, tmp, ptmp;
-- 
1.7.0.4

