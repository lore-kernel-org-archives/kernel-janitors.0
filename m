From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 30 Aug 2006 04:45:02 +0000
Subject: [KJ] [Patch][updated] use HZ relative values instead of
Message-Id: <1156913102.10833.10.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

G'day list.

This is (part of) a split-up of an earlier patch.
I decided to stay with HZ/2 instead of msecs_to_jiffies(500) as I don't
think any kind of accuracy is required for this half a second delay.

Compile tested on allyesconfig

Use HZ relative values instead of constants in iphase.c

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
--- drivers/atm/iphase.c.orig	2006-08-28 23:29:06.000000000 +1000
+++ drivers/atm/iphase.c	2006-08-30 12:59:59.000000000 +1000
@@ -189,7 +189,7 @@ static u16 get_desc (IADEV *dev, struct 
   int ltimeout;
 
   ia_hack_tcq (dev);
-  if(((jiffies - timer)>50)||((dev->ffL.tcq_rd=dev->host_tcq_wr))){      
+  if(((jiffies - timer)>HZ/2)||((dev->ffL.tcq_rd=dev->host_tcq_wr))){      
      timer = jiffies; 
      i=0;
      while (i < dev->num_tx_desc) {
@@ -1223,7 +1223,7 @@ static void rx_intr(struct atm_dev *dev)
         iadev->rx_tmp_jif = jiffies; 
         iadev->rxing = 0;
      } 
-     else if (((jiffies - iadev->rx_tmp_jif) > 50) && 
+     else if (((jiffies - iadev->rx_tmp_jif) > HZ/2) && 
                ((iadev->rx_pkt_cnt - iadev->rx_tmp_cnt) = 0)) {
         for (i = 1; i <= iadev->num_rx_desc; i++)
                free_desc(dev, i);
@@ -2610,7 +2610,7 @@ static void ia_close(struct atm_vcc *vcc
         if (vcc->qos.txtp.traffic_class != ATM_NONE) {
            iadev->close_pending++;
 	   prepare_to_wait(&iadev->timeout_wait, &wait, TASK_UNINTERRUPTIBLE);
-	   schedule_timeout(50);
+	   schedule_timeout(HZ/2);
 	   finish_wait(&iadev->timeout_wait, &wait);
            spin_lock_irqsave(&iadev->tx_lock, flags); 
            while((skb = skb_dequeue(&iadev->tx_backlog))) {


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
