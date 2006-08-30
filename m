From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 30 Aug 2006 11:29:41 +0000
Subject: [KJ] [Patch] [updated] use time_after macro in iphase.c
Message-Id: <1156937382.24061.5.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

G'day list.

This is the second part of the split up patch and it applies on top of
"[KJ][Patch][updated] use HZ relative values instead of absolute values
in iphase.c"

Use the time_after macro's in iphase.c and remove a now redundant
variable.

Compile tested with allyesconfig

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
--- drivers/atm/iphase.c.patch1	2006-08-30 14:46:22.000000000 +1000
+++ drivers/atm/iphase.c	2006-08-30 15:14:43.000000000 +1000
@@ -184,12 +184,11 @@ static u16 get_desc (IADEV *dev, struct 
   u_short 		desc_num, i;
   struct sk_buff        *skb;
   struct ia_vcc         *iavcc_r = NULL; 
-  unsigned long delta;
   static unsigned long timer = 0;
   int ltimeout;
 
   ia_hack_tcq (dev);
-  if(((jiffies - timer)>HZ/2)||((dev->ffL.tcq_rd=dev->host_tcq_wr))){      
+  if(time_after(jiffies, (timer+HZ/2))||((dev->ffL.tcq_rd=dev->host_tcq_wr))){
      timer = jiffies; 
      i=0;
      while (i < dev->num_tx_desc) {
@@ -198,9 +197,11 @@ static u16 get_desc (IADEV *dev, struct 
            continue;
         }
         ltimeout = dev->desc_tbl[i].iavcc->ltimeout; 
-        delta = jiffies - dev->desc_tbl[i].timestamp;
-        if (delta >= ltimeout) {
-           IF_ABR(printk("RECOVER run!! desc_tbl %d = %d  delta = %ld, time = %ld\n", i,dev->desc_tbl[i].timestamp, delta, jiffies);)
+        if (time_after_eq(jiffies, 
+		((unsigned long)dev->desc_tbl[i].timestamp+ltimeout))) {
+           IF_ABR(printk("RECOVER run!! desc_tbl %d = %d  delta = %ld, time = %ld\n",
+	    	i, dev->desc_tbl[i].timestamp,
+		(jiffies-dev->desc_tbl[i].timestamp), jiffies);)
            if (dev->ffL.tcq_rd = dev->ffL.tcq_st) 
               dev->ffL.tcq_rd =  dev->ffL.tcq_ed;
            else 
@@ -1223,7 +1224,7 @@ static void rx_intr(struct atm_dev *dev)
         iadev->rx_tmp_jif = jiffies; 
         iadev->rxing = 0;
      } 
-     else if (((jiffies - iadev->rx_tmp_jif) > HZ/2) && 
+     else if (time_after(jiffies, ((unsigned long)iadev->rx_tmp_jif + HZ/2)) && 
                ((iadev->rx_pkt_cnt - iadev->rx_tmp_cnt) = 0)) {
         for (i = 1; i <= iadev->num_rx_desc; i++)
                free_desc(dev, i);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
