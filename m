From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 12 Feb 2011 03:38:24 +0000
Subject: [PATCH 3/4] Staging: bcm: Bcmchar: Fix style issues on bcm_char_read()
Message-Id: <1297481905-22331-4-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/bcm/Bcmchar.c |   52 ++++++++++++++++++++++-------------------
 1 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/bcm/Bcmchar.c b/drivers/staging/bcm/Bcmchar.c
index 2a3f64c..2064c2e 100644
--- a/drivers/staging/bcm/Bcmchar.c
+++ b/drivers/staging/bcm/Bcmchar.c
@@ -96,59 +96,63 @@ static int bcm_char_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
-static ssize_t bcm_char_read(struct file *filp, char __user *buf, size_t size, loff_t *f_pos)
+static ssize_t bcm_char_read(struct file *filp, char __user *buf, size_t size,
+			     loff_t *f_pos)
 {
 	PPER_TARANG_DATA pTarang = filp->private_data;
 	PMINI_ADAPTER	Adapter = pTarang->Adapter;
-	struct sk_buff* Packet = NULL;
+	struct sk_buff *Packet = NULL;
 	ssize_t         PktLen = 0;
-	int 		wait_ret_val=0;
+	int             wait_ret_val = 0;
+	unsigned long ret = 0;
 
 	wait_ret_val = wait_event_interruptible(Adapter->process_read_wait_queue,
-		(pTarang->RxAppControlHead || Adapter->device_removed));
-	if((wait_ret_val = -ERESTARTSYS))
-	{
-   		BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL, "Exiting as i've been asked to exit!!!\n");
+						(pTarang->RxAppControlHead ||
+						 Adapter->device_removed));
+	if ((wait_ret_val = -ERESTARTSYS)) {
+		BCM_DEBUG_PRINT(Adapter, DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,
+				"Exiting as i've been asked to exit!!!\n");
 		return wait_ret_val;
 	}
 
-	if(Adapter->device_removed)
-	{
-		BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL, "Device Removed... Killing the Apps...\n");
+	if (Adapter->device_removed) {
+		BCM_DEBUG_PRINT(Adapter, DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,
+				"Device Removed... Killing the Apps...\n");
 		return -ENODEV;
 	}
 
-	if(FALSE = Adapter->fw_download_done)
+	if (FALSE = Adapter->fw_download_done)
 		return -EACCES;
 
-    down( &Adapter->RxAppControlQueuelock);
+	down(&Adapter->RxAppControlQueuelock);
 
-	if(pTarang->RxAppControlHead)
-	{
+	if (pTarang->RxAppControlHead) {
 		Packet = pTarang->RxAppControlHead;
-		DEQUEUEPACKET(pTarang->RxAppControlHead,pTarang->RxAppControlTail);
+		DEQUEUEPACKET(pTarang->RxAppControlHead,
+			      pTarang->RxAppControlTail);
 		pTarang->AppCtrlQueueLen--;
 	}
 
-    up(&Adapter->RxAppControlQueuelock);
+	up(&Adapter->RxAppControlQueuelock);
 
-	if(Packet)
-	{
+	if (Packet) {
 		PktLen = Packet->len;
-		if(copy_to_user(buf, Packet->data, min_t(size_t, PktLen, size)))
-		{
+		ret = copy_to_user(buf, Packet->data,
+				   min_t(size_t, PktLen, size));
+		if (ret) {
 			dev_kfree_skb(Packet);
-			BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "\nReturning from copy to user failure \n");
+			BCM_DEBUG_PRINT(Adapter, DBG_TYPE_PRINTK, 0, 0,
+					"Returning from copy to user failure\n");
 			return -EFAULT;
 		}
-		BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,
+		BCM_DEBUG_PRINT(Adapter, DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,
 				"Read %zd Bytes From Adapter packet = %p by process %d!\n",
 				PktLen, Packet, current->pid);
 		dev_kfree_skb(Packet);
 	}
 
-    BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL, "<==\n");
-    return PktLen;
+	BCM_DEBUG_PRINT(Adapter, DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL, "<\n");
+	return PktLen;
 }
 
 static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
-- 
1.7.0.4

