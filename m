From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 18:58:17 +0000
Subject: [KJ] [UPDATE PATCH 2/34]: atm/iphase: remove sleep_on*() usage
Message-Id: <20050126185817.GA3593@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83319827964194726=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============83319827964194726==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 25, 2005 at 02:06:31PM -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> Please consider applying.
> 
> Description: Use wait_event_timeout() instead of the deprecated sleep_on().
> In the new code, the lock is released before sleeping and then grabbed after
> waking up; whereas before it was released/grabbed every iteration of the loop.
> Only one variable is necessary now, so ctimeout is removed. Patch is
> compile-tested.

This patch should be replaced with the following, which removes all sleep_on*()
usage from iphase.c. Thanks!

-Nish

Description: Use wait_event_timeout() instead of the deprecated sleep_on().
In the new code, the lock is released before sleeping and then grabbed after
waking up; whereas before it was released/grabbed every iteration of the loop.
Only one variable is necessary now, so ctimeout is removed. Also replace
sleep_on_timeout() with direct wait-queue usage. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/atm/iphase.c	2005-01-24 09:34:04.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/atm/iphase.c	2005-01-26 10:57:08.000000000 -0800
@@ -53,6 +53,7 @@
 #include <linux/delay.h>  
 #include <linux/uio.h>  
 #include <linux/init.h>  
+#include <linux/wait.h>
 #include <asm/system.h>  
 #include <asm/io.h>  
 #include <asm/atomic.h>  
@@ -2586,14 +2587,14 @@ err_out:
 }  
   
 static void ia_close(struct atm_vcc *vcc)  
-{  
+{
+	DEFINE_WAIT(wait);
         u16 *vc_table;
         IADEV *iadev;
         struct ia_vcc *ia_vcc;
         struct sk_buff *skb = NULL;
         struct sk_buff_head tmp_tx_backlog, tmp_vcc_backlog;
         unsigned long closetime, flags;
-        int ctimeout;
 
         iadev = INPH_IA_DEV(vcc->dev);
         ia_vcc = INPH_IA_VCC(vcc);
@@ -2606,7 +2607,9 @@ static void ia_close(struct atm_vcc *vcc
         skb_queue_head_init (&tmp_vcc_backlog); 
         if (vcc->qos.txtp.traffic_class != ATM_NONE) {
            iadev->close_pending++;
-           sleep_on_timeout(&iadev->timeout_wait, 50);
+	   prepare_to_wait(&iadev->timeout_wait, &wait, TASK_UNINTERRUPTIBLE);
+	   schedule_timeout(50);
+	   finish_wait(&iadev->timeout_wait, &wait);
            spin_lock_irqsave(&iadev->tx_lock, flags); 
            while((skb = skb_dequeue(&iadev->tx_backlog))) {
               if (ATM_SKB(skb)->vcc == vcc){ 
@@ -2619,17 +2622,12 @@ static void ia_close(struct atm_vcc *vcc
            while((skb = skb_dequeue(&tmp_tx_backlog))) 
              skb_queue_tail(&iadev->tx_backlog, skb);
            IF_EVENT(printk("IA TX Done decs_cnt = %d\n", ia_vcc->vc_desc_cnt);) 
-           closetime = jiffies;
-           ctimeout = 300000 / ia_vcc->pcr;
-           if (ctimeout == 0)
-              ctimeout = 1;
-           while (ia_vcc->vc_desc_cnt > 0){
-              if ((jiffies - closetime) >= ctimeout) 
-                 break;
-              spin_unlock_irqrestore(&iadev->tx_lock, flags);
-              sleep_on(&iadev->close_wait);
-              spin_lock_irqsave(&iadev->tx_lock, flags);
-           }    
+           closetime = 300000 / ia_vcc->pcr;
+           if (closetime == 0)
+              closetime = 1;
+           spin_unlock_irqrestore(&iadev->tx_lock, flags);
+           wait_event_timeout(iadev->close_wait, (ia_vcc->vc_desc_cnt <= 0), closetime);
+           spin_lock_irqsave(&iadev->tx_lock, flags);
            iadev->close_pending--;
            iadev->testTable[vcc->vci]->lastTime = 0;
            iadev->testTable[vcc->vci]->fract = 0; 

--===============83319827964194726==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83319827964194726==--
