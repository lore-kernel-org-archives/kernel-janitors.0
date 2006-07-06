From: Richard <h.vanberkum@chello.nl>
Date: Thu, 06 Jul 2006 12:52:03 +0000
Subject: Re: [KJ] [PATCH] drivers/atm/nicstar.c: add KERN_* to printk
Message-Id: <44AD27D2.7040003@chello.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44ABCCD6.6060101@chello.nl>
In-Reply-To: <44ABCCD6.6060101@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Add KERN_* to printk statements

Signed-off-by: Richard van Berkum <h.vanberkum at chello.nl>

---

nicstar.c |  126 +++++++++++++++++++++++++++++++-------------------------------
1 file changed, 63 insertions(+), 63 deletions(-)

Against: rsync.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git


--- mytree/drivers/atm/nicstar.c	2006-07-05 16:17:07.342546512 +0200
+++ current/linux-2.6/drivers/atm/nicstar.c	2006-07-06 16:58:04.634481000 +0200
@@ -470,7 +470,7 @@ static int __devinit ns_init_card(int i,

    if (pci_enable_device(pcidev))
    {
-      printk(KERN_ERR "nicstar%d: can't enable PCI device\n", i);
+      printk("nicstar%d: can't enable PCI device\n", i);
       error = 2;
       ns_init_card_error(card, error);
       return error;
@@ -478,7 +478,7 @@ static int __devinit ns_init_card(int i,

    if ((card = kmalloc(sizeof(ns_dev), GFP_KERNEL)) = NULL)
    {
-      printk(KERN_ERR "nicstar%d: can't allocate memory for device
structure.\n", i);
+      printk("nicstar%d: can't allocate memory for device structure.\n", i);
       error = 2;
       ns_init_card_error(card, error);
       return error;
@@ -496,7 +496,7 @@ static int __devinit ns_init_card(int i,
    card->membase = ioremap(membase, NS_IOREMAP_SIZE);
    if (card->membase = 0)
    {
-      printk(KERN_ERR "nicstar%d: can't ioremap() membase.\n",i);
+      printk("nicstar%d: can't ioremap() membase.\n",i);
       error = 3;
       ns_init_card_error(card, error);
       return error;
@@ -507,7 +507,7 @@ static int __devinit ns_init_card(int i,

    if (pci_read_config_byte(pcidev, PCI_LATENCY_TIMER, &pci_latency) != 0)
    {
-      printk(KERN_ERR "nicstar%d: can't read PCI latency timer.\n", i);
+      printk("nicstar%d: can't read PCI latency timer.\n", i);
       error = 6;
       ns_init_card_error(card, error);
       return error;
@@ -523,7 +523,7 @@ static int __devinit ns_init_card(int i,
       }
       if (j = 4)
       {
-         printk(KERN_ERR "nicstar%d: can't set PCI latency timer to %d.\n", i,
NS_PCI_LATENCY);
+         printk("nicstar%d: can't set PCI latency timer to %d.\n", i,
NS_PCI_LATENCY);
          error = 7;
          ns_init_card_error(card, error);
 	 return error;
@@ -557,7 +557,7 @@ static int __devinit ns_init_card(int i,
    data = readl(card->membase + DR0);
    switch(data) {
       case 0x00000009:
-         printk(KERN_INFO "nicstar%d: PHY seems to be 25 Mbps.\n", i);
+         printk("nicstar%d: PHY seems to be 25 Mbps.\n", i);
          card->max_pcr = ATM_25_PCR;
          while(CMD_BUSY(card));
          writel(0x00000008, card->membase + DR0);
@@ -572,7 +572,7 @@ static int __devinit ns_init_card(int i,
 	 break;
       case 0x00000030:
       case 0x00000031:
-         printk(KERN_INFO "nicstar%d: PHY seems to be 155 Mbps.\n", i);
+         printk("nicstar%d: PHY seems to be 155 Mbps.\n", i);
          card->max_pcr = ATM_OC3_PCR;
 #ifdef PHY_LOOPBACK
          while(CMD_BUSY(card));
@@ -581,7 +581,7 @@ static int __devinit ns_init_card(int i,
 #endif /* PHY_LOOPBACK */
 	 break;
       default:
-         printk(KERN_INFO "nicstar%d: unknown PHY type (0x%08X).\n", i, data);
+         printk("nicstar%d: unknown PHY type (0x%08X).\n", i, data);
          error = 8;
          ns_init_card_error(card, error);
          return error;
@@ -604,11 +604,11 @@ static int __devinit ns_init_card(int i,

 #if (NS_MAX_RCTSIZE = 4096)
    if (card->sram_size = 128)
-      printk(KERN_INFO "nicstar%d: limiting maximum VCI. See NS_MAX_RCTSIZE in
nicstar.h\n", i);
+      printk("nicstar%d: limiting maximum VCI. See NS_MAX_RCTSIZE in
nicstar.h\n", i);
 #elif (NS_MAX_RCTSIZE = 16384)
    if (card->sram_size = 32)
    {
-      printk(KERN_INFO "nicstar%d: wasting memory. See NS_MAX_RCTSIZE in
nicstar.h\n", i);
+      printk("nicstar%d: wasting memory. See NS_MAX_RCTSIZE in nicstar.h\n", i);
       card->rct_size = 4096;
    }
 #else
@@ -625,9 +625,9 @@ static int __devinit ns_init_card(int i,
    if (mac[i] = NULL)
       nicstar_init_eprom(card->membase);

-   if (request_irq(pcidev->irq, &ns_irq_handler, SA_INTERRUPT | SA_SHIRQ,
"nicstar", card) != 0)
+   if (request_irq(pcidev->irq, &ns_irq_handler, IRQF_DISABLED | IRQF_SHARED,
"nicstar", card) != 0)
    {
-      printk(KERN_ERR "nicstar%d: can't allocate IRQ %d.\n", i, pcidev->irq);
+      printk("nicstar%d: can't allocate IRQ %d.\n", i, pcidev->irq);
       error = 9;
       ns_init_card_error(card, error);
       return error;
@@ -640,7 +640,7 @@ static int __devinit ns_init_card(int i,
    card->tsq.org = kmalloc(NS_TSQSIZE + NS_TSQ_ALIGNMENT, GFP_KERNEL);
    if (card->tsq.org = NULL)
    {
-      printk(KERN_ERR "nicstar%d: can't allocate TSQ.\n", i);
+      printk("nicstar%d: can't allocate TSQ.\n", i);
       error = 10;
       ns_init_card_error(card, error);
       return error;
@@ -659,7 +659,7 @@ static int __devinit ns_init_card(int i,
    card->rsq.org = kmalloc(NS_RSQSIZE + NS_RSQ_ALIGNMENT, GFP_KERNEL);
    if (card->rsq.org = NULL)
    {
-      printk(KERN_ERR "nicstar%d: can't allocate RSQ.\n", i);
+      printk("nicstar%d: can't allocate RSQ.\n", i);
       error = 11;
       ns_init_card_error(card, error);
       return error;
@@ -679,7 +679,7 @@ static int __devinit ns_init_card(int i,
    card->scq0 = get_scq(VBR_SCQSIZE, NS_VRSCD0);
    if (card->scq0 = NULL)
    {
-      printk(KERN_ERR "nicstar%d: can't get SCQ0.\n", i);
+      printk("nicstar%d: can't get SCQ0.\n", i);
       error = 12;
       ns_init_card_error(card, error);
       return error;
@@ -758,7 +758,7 @@ static int __devinit ns_init_card(int i,
       hb = __dev_alloc_skb(NS_HBUFSIZE, GFP_KERNEL);
       if (hb = NULL)
       {
-         printk(KERN_ERR "nicstar%d: can't allocate %dth of %d huge buffers.\n",
+         printk("nicstar%d: can't allocate %dth of %d huge buffers.\n",
                 i, j, NUM_HB);
          error = 13;
          ns_init_card_error(card, error);
@@ -779,7 +779,7 @@ static int __devinit ns_init_card(int i,
       lb = __dev_alloc_skb(NS_LGSKBSIZE, GFP_KERNEL);
       if (lb = NULL)
       {
-         printk(KERN_ERR "nicstar%d: can't allocate %dth of %d large buffers.\n",
+         printk("nicstar%d: can't allocate %dth of %d large buffers.\n",
                 i, j, NUM_LB);
          error = 14;
          ns_init_card_error(card, error);
@@ -799,7 +799,7 @@ static int __devinit ns_init_card(int i,
    /* Test for strange behaviour which leads to crashes */
    if ((bcount = ns_stat_lfbqc_get(readl(card->membase + STAT))) < card->lbnr.min)
    {
-      printk(KERN_ERR "nicstar%d: Strange... Just allocated %d large buffers
and lfbqc = %d.\n",
+      printk("nicstar%d: Strange... Just allocated %d large buffers and lfbqc %d.\n",
              i, j, bcount);
       error = 14;
       ns_init_card_error(card, error);
@@ -816,7 +816,7 @@ static int __devinit ns_init_card(int i,
       sb = __dev_alloc_skb(NS_SMSKBSIZE, GFP_KERNEL);
       if (sb = NULL)
       {
-         printk(KERN_ERR "nicstar%d: can't allocate %dth of %d small buffers.\n",
+         printk("nicstar%d: can't allocate %dth of %d small buffers.\n",
                 i, j, NUM_SB);
          error = 15;
          ns_init_card_error(card, error);
@@ -830,7 +830,7 @@ static int __devinit ns_init_card(int i,
    /* Test for strange behaviour which leads to crashes */
    if ((bcount = ns_stat_sfbqc_get(readl(card->membase + STAT))) < card->sbnr.min)
    {
-      printk(KERN_ERR "nicstar%d: Strange... Just allocated %d small buffers
and sfbqc = %d.\n",
+      printk("nicstar%d: Strange... Just allocated %d small buffers and sfbqc %d.\n",
              i, j, bcount);
       error = 15;
       ns_init_card_error(card, error);
@@ -847,7 +847,7 @@ static int __devinit ns_init_card(int i,
       iovb = alloc_skb(NS_IOVBUFSIZE, GFP_KERNEL);
       if (iovb = NULL)
       {
-         printk(KERN_ERR "nicstar%d: can't allocate %dth of %d iovec buffers.\n",
+         printk("nicstar%d: can't allocate %dth of %d iovec buffers.\n",
                 i, j, NUM_IOVB);
          error = 16;
          ns_init_card_error(card, error);
@@ -872,7 +872,7 @@ static int __devinit ns_init_card(int i,
    card->atmdev = atm_dev_register("nicstar", &atm_ops, -1, NULL);
    if (card->atmdev = NULL)
    {
-      printk(KERN_ERR "nicstar%d: can't register device.\n", i);
+      printk("nicstar%d: can't register device.\n", i);
       error = 17;
       ns_init_card_error(card, error);
       return error;
@@ -887,7 +887,7 @@ static int __devinit ns_init_card(int i,
       }
    }

-   printk(KERN_INFO "nicstar%d: MAC address %02X:%02X:%02X:%02X:%02X:%02X\n", i,
+   printk("nicstar%d: MAC address %02X:%02X:%02X:%02X:%02X:%02X\n", i,
           card->atmdev->esi[0], card->atmdev->esi[1], card->atmdev->esi[2],
           card->atmdev->esi[3], card->atmdev->esi[4], card->atmdev->esi[5]);

@@ -1055,7 +1055,7 @@ static void free_scq(scq_info *scq, stru
    {
       if (vcc = NULL)
       {
-         printk(KERN_INFO "nicstar: free_scq() called with vcc = NULL for
fixed rate scq.");
+         printk("nicstar: free_scq() called with vcc = NULL for fixed rate scq.");
          for (i = 0; i < scq->num_entries; i++)
             dev_kfree_skb_any(scq->skb[i]);
       }
@@ -1095,7 +1095,7 @@ static void push_rxbufs(ns_dev *card, st

 #ifdef GENERAL_DEBUG
    if (!addr1)
-      printk(KERN_INFO "nicstar%d: push_rxbufs called with addr1 = 0.\n",
card->index);
+      printk("nicstar%d: push_rxbufs called with addr1 = 0.\n", card->index);
 #endif /* GENERAL_DEBUG */

    stat = readl(card->membase + STAT);
@@ -1256,28 +1256,28 @@ static irqreturn_t ns_irq_handler(int ir
    if (stat_r & NS_STAT_SFBQF)
    {
       writel(NS_STAT_SFBQF, card->membase + STAT);
-      printk(KERN_INFO "nicstar%d: Small free buffer queue is full.\n",
card->index);
+      printk("nicstar%d: Small free buffer queue is full.\n", card->index);
    }

    /* Large Buffer Queue is full */
    if (stat_r & NS_STAT_LFBQF)
    {
       writel(NS_STAT_LFBQF, card->membase + STAT);
-      printk(KERN_INFO "nicstar%d: Large free buffer queue is full.\n",
card->index);
+      printk("nicstar%d: Large free buffer queue is full.\n", card->index);
    }

    /* Receive Status Queue is full */
    if (stat_r & NS_STAT_RSQF)
    {
       writel(NS_STAT_RSQF, card->membase + STAT);
-      printk(KERN_INFO "nicstar%d: RSQ full.\n", card->index);
+      printk("nicstar%d: RSQ full.\n", card->index);
       process_rsq(card);
    }

    /* Complete CS-PDU received */
    if (stat_r & NS_STAT_EOPDU)
    {
-      RXPRINTK(KERN_INFO "nicstar%d: End of CS-PDU received.\n", card->index);
+      RXPRINTK("nicstar%d: End of CS-PDU received.\n", card->index);
       process_rsq(card);
       writel(NS_STAT_EOPDU, card->membase + STAT);
    }
@@ -1287,7 +1287,7 @@ static irqreturn_t ns_irq_handler(int ir
    {
       writel(NS_STAT_RAWCF, card->membase + STAT);
 #ifndef RCQ_SUPPORT
-      printk(KERN_INFO "nicstar%d: Raw cell received and no support yet...\n",
+      printk("nicstar%d: Raw cell received and no support yet...\n",
              card->index);
 #endif /* RCQ_SUPPORT */
       /* NOTE: the following procedure may keep a raw cell pending until the
@@ -1319,7 +1319,7 @@ static irqreturn_t ns_irq_handler(int ir
       struct sk_buff *sb;

       writel(NS_STAT_SFBQE, card->membase + STAT);
-      printk(KERN_INFO "nicstar%d: Small free buffer queue empty.\n",
+      printk("nicstar%d: Small free buffer queue empty.\n",
              card->index);
       for (i = 0; i < card->sbnr.min; i++)
       {
@@ -1346,7 +1346,7 @@ static irqreturn_t ns_irq_handler(int ir
       struct sk_buff *lb;

       writel(NS_STAT_LFBQE, card->membase + STAT);
-      printk(KERN_INFO "nicstar%d: Large free buffer queue empty.\n",
+      printk("nicstar%d: Large free buffer queue empty.\n",
              card->index);
       for (i = 0; i < card->lbnr.min; i++)
       {
@@ -1416,7 +1416,7 @@ static int ns_open(struct atm_vcc *vcc)
       inuse += 2;
    if (inuse)
    {
-      printk(KERN_INFO "nicstar%d: %s vci already in use.\n", card->index,
+      printk("nicstar%d: %s vci already in use.\n", card->index,
              inuse = 1 ? "tx" : inuse = 2 ? "rx" : "tx and rx");
       return -EINVAL;
    }
@@ -1471,7 +1471,7 @@ static int ns_open(struct atm_vcc *vcc)

          if (n = 0)
          {
-            printk(KERN_ERR "nicstar%d: selected bandwidth < granularity.\n",
card->index);
+            printk("nicstar%d: selected bandwidth < granularity.\n", card->index);
 	    clear_bit(ATM_VF_PARTIAL,&vcc->flags);
 	    clear_bit(ATM_VF_ADDR,&vcc->flags);
             return -EINVAL;
@@ -1479,7 +1479,7 @@ static int ns_open(struct atm_vcc *vcc)

          if (n > (card->tst_free_entries - NS_TST_RESERVED))
          {
-            PRINTK(KERN_ERR "nicstar%d: not enough free CBR bandwidth.\n",
card->index);
+            PRINTK("nicstar%d: not enough free CBR bandwidth.\n", card->index);
 	    clear_bit(ATM_VF_PARTIAL,&vcc->flags);
 	    clear_bit(ATM_VF_ADDR,&vcc->flags);
             return -EINVAL;
@@ -1714,19 +1714,19 @@ static void ns_close(struct atm_vcc *vcc
       u32 stat, cfg;
       stat = readl(card->membase + STAT);
       cfg = readl(card->membase + CFG);
-      printk(KERN_DEBUG "STAT = 0x%08X  CFG = 0x%08X  \n", stat, cfg);
-      printk(KERN_DEBUG "TSQ: base = 0x%08X  next = 0x%08X  last = 0x%08X  TSQT
= 0x%08X \n",
+      printk("STAT = 0x%08X  CFG = 0x%08X  \n", stat, cfg);
+      printk("TSQ: base = 0x%08X  next = 0x%08X  last = 0x%08X  TSQT = 0x%08X \n",
              (u32) card->tsq.base, (u32) card->tsq.next,(u32) card->tsq.last,
 	     readl(card->membase + TSQT));
-      printk(KERN_DEBUG "RSQ: base = 0x%08X  next = 0x%08X  last = 0x%08X  RSQT
= 0x%08X \n",
+      printk("RSQ: base = 0x%08X  next = 0x%08X  last = 0x%08X  RSQT = 0x%08X \n",
              (u32) card->rsq.base, (u32) card->rsq.next,(u32) card->rsq.last,
 	     readl(card->membase + RSQT));
-      printk(KERN_DEBUG "Empty free buffer queue interrupt %s \n",
+      printk("Empty free buffer queue interrupt %s \n",
              card->efbie ? "enabled" : "disabled");
-      printk(KERN_DEBUG "SBCNT = %d  count = %d   LBCNT = %d count = %d \n",
+      printk("SBCNT = %d  count = %d   LBCNT = %d count = %d \n",
              ns_stat_sfbqc_get(stat), card->sbpool.count,
 	     ns_stat_lfbqc_get(stat), card->lbpool.count);
-      printk(KERN_DEBUG "hbpool.count = %d  iovpool.count = %d \n",
+      printk("hbpool.count = %d  iovpool.count = %d \n",
              card->hbpool.count, card->iovpool.count);
    }
 #endif /* RX_DEBUG */
@@ -1755,7 +1755,7 @@ static void fill_tst(ns_dev *card, int n
          break;
    }
    if (e = NS_TST_NUM_ENTRIES) {
-      printk(KERN_INFO "nicstar%d: No free TST entries found. \n", card->index);
+      printk("nicstar%d: No free TST entries found. \n", card->index);
       return;
    }

@@ -1802,7 +1802,7 @@ static int ns_send(struct atm_vcc *vcc,
    TXPRINTK("nicstar%d: ns_send() called.\n", card->index);
    if ((vc = (vc_map *) vcc->dev_data) = NULL)
    {
-      printk(KERN_ERR "nicstar%d: vcc->dev_data = NULL on ns_send().\n",
card->index);
+      printk("nicstar%d: vcc->dev_data = NULL on ns_send().\n", card->index);
       atomic_inc(&vcc->stats->tx_err);
       dev_kfree_skb_any(skb);
       return -EINVAL;
@@ -1810,7 +1810,7 @@ static int ns_send(struct atm_vcc *vcc,

    if (!vc->tx)
    {
-      printk(KERN_ERR "nicstar%d: Trying to transmit on a non-tx VC.\n",
card->index);
+      printk("nicstar%d: Trying to transmit on a non-tx VC.\n", card->index);
       atomic_inc(&vcc->stats->tx_err);
       dev_kfree_skb_any(skb);
       return -EINVAL;
@@ -1818,7 +1818,7 @@ static int ns_send(struct atm_vcc *vcc,

    if (vcc->qos.aal != ATM_AAL5 && vcc->qos.aal != ATM_AAL0)
    {
-      printk(KERN_ERR "nicstar%d: Only AAL0 and AAL5 are supported.\n",
card->index);
+      printk("nicstar%d: Only AAL0 and AAL5 are supported.\n", card->index);
       atomic_inc(&vcc->stats->tx_err);
       dev_kfree_skb_any(skb);
       return -EINVAL;
@@ -1826,7 +1826,7 @@ static int ns_send(struct atm_vcc *vcc,

    if (skb_shinfo(skb)->nr_frags != 0)
    {
-      printk(KERN_ERR "nicstar%d: No scatter-gather yet.\n", card->index);
+      printk("nicstar%d: No scatter-gather yet.\n", card->index);
       atomic_inc(&vcc->stats->tx_err);
       dev_kfree_skb_any(skb);
       return -EINVAL;
@@ -1898,7 +1898,7 @@ static int push_scqe(ns_dev *card, vc_ma
    {
       if (in_interrupt()) {
          spin_unlock_irqrestore(&scq->lock, flags);
-         printk(KERN_INFO "nicstar%d: Error pushing TBD.\n", card->index);
+         printk("nicstar%d: Error pushing TBD.\n", card->index);
          return 1;
       }

@@ -1909,7 +1909,7 @@ static int push_scqe(ns_dev *card, vc_ma

       if (scq->full) {
          spin_unlock_irqrestore(&scq->lock, flags);
-         printk(KERN_INFO "nicstar%d: Timeout pushing TBD.\n", card->index);
+         printk("nicstar%d: Timeout pushing TBD.\n", card->index);
          return 1;
       }
    }
@@ -1946,7 +1946,7 @@ static int push_scqe(ns_dev *card, vc_ma
             data = (u32) virt_to_bus(scq->next);
             ns_write_sram(card, scq->scd, &data, 1);
             spin_unlock_irqrestore(&scq->lock, flags);
-            printk(KERN_INFO "nicstar%d: Error pushing TSR.\n", card->index);
+            printk("nicstar%d: Error pushing TSR.\n", card->index);
             return 0;
          }

@@ -2038,7 +2038,7 @@ static void process_tsq(ns_dev *card)
 	 {
 	    if (card->scd2vc[scdi] = NULL)
 	    {
-	       printk(KERN_INFO "nicstar%d: could not find VC from SCD index.\n",
+	       printk("nicstar%d: could not find VC from SCD index.\n",
 	              card->index);
                ns_tsi_init(card->tsq.next);
                return;
@@ -2087,7 +2087,7 @@ static void drain_scq(ns_dev *card, scq_
            card->index, (u32) scq, pos);
    if (pos >= scq->num_entries)
    {
-      printk(KERN_INFO "nicstar%d: Bad index on drain_scq().\n", card->index);
+      printk("nicstar%d: Bad index on drain_scq().\n", card->index);
       return;
    }

@@ -2161,7 +2161,7 @@ static void dequeue_rx(ns_dev *card, ns_
    vci = ns_rsqe_vci(rsqe);
    if (vpi >= 1UL << card->vpibits || vci >= 1UL << card->vcibits)
    {
-      printk(KERN_INFO "nicstar%d: SDU received for out-of-range vc %d.%d.\n",
+      printk("nicstar%d: SDU received for out-of-range vc %d.%d.\n",
              card->index, vpi, vci);
       recycle_rx_buf(card, skb);
       return;
@@ -2189,7 +2189,7 @@ static void dequeue_rx(ns_dev *card, ns_
       {
          if ((sb = dev_alloc_skb(NS_SMSKBSIZE)) = NULL)
          {
-            printk(KERN_INFO "nicstar%d: Can't allocate buffers for aal0.\n",
+            printk("nicstar%d: Can't allocate buffers for aal0.\n",
                    card->index);
             atomic_add(i,&vcc->stats->rx_drop);
             break;
@@ -2231,7 +2231,7 @@ static void dequeue_rx(ns_dev *card, ns_
          iovb = alloc_skb(NS_IOVBUFSIZE, GFP_ATOMIC);
 	 if (iovb = NULL)
 	 {
-	    printk(KERN_INFO "nicstar%d: Out of iovec buffers.\n", card->index);
+	    printk("nicstar%d: Out of iovec buffers.\n", card->index);
             atomic_inc(&vcc->stats->rx_drop);
             recycle_rx_buf(card, skb);
             return;
@@ -2260,7 +2260,7 @@ static void dequeue_rx(ns_dev *card, ns_
    }
    else if (NS_SKB(iovb)->iovcnt >= NS_MAX_IOVECS)
    {
-      printk(KERN_INFO "nicstar%d: received too big AAL5 SDU.\n", card->index);
+      printk("nicstar%d: received too big AAL5 SDU.\n", card->index);
       atomic_inc(&vcc->stats->rx_err);
       recycle_iovec_rx_bufs(card, (struct iovec *) iovb->data, NS_MAX_IOVECS);
       NS_SKB(iovb)->iovcnt = 0;
@@ -2277,7 +2277,7 @@ static void dequeue_rx(ns_dev *card, ns_
    {
       if (NS_SKB_CB(skb)->buf_type != BUF_SM)
       {
-         printk(KERN_INFO "nicstar%d: Expected a small buffer, and this is not
one.\n",
+         printk("nicstar%d: Expected a small buffer, and this is not one.\n",
 	        card->index);
          which_list(card, skb);
          atomic_inc(&vcc->stats->rx_err);
@@ -2291,7 +2291,7 @@ static void dequeue_rx(ns_dev *card, ns_
    {
       if (NS_SKB_CB(skb)->buf_type != BUF_LG)
       {
-         printk(KERN_INFO "nicstar%d: Expected a large buffer, and this is not
one.\n",
+         printk("nicstar%d: Expected a large buffer, and this is not one.\n",
 	        card->index);
          which_list(card, skb);
          atomic_inc(&vcc->stats->rx_err);
@@ -2313,7 +2313,7 @@ static void dequeue_rx(ns_dev *card, ns_
       if (ns_rsqe_crcerr(rsqe) ||
           len + 8 > iovb->len || len + (47 + 8) < iovb->len)
       {
-         printk(KERN_INFO "nicstar%d: AAL5 CRC error", card->index);
+         printk("nicstar%d: AAL5 CRC error", card->index);
          if (len + 8 > iovb->len || len + (47 + 8) < iovb->len)
             printk(" - PDU size mismatch.\n");
          else
@@ -2419,7 +2419,7 @@ static void dequeue_rx(ns_dev *card, ns_
             hb = dev_alloc_skb(NS_HBUFSIZE);
             if (hb = NULL)
             {
-               printk(KERN_INFO "nicstar%d: Out of huge buffers.\n", card->index);
+               printk("nicstar%d: Out of huge buffers.\n", card->index);
                atomic_inc(&vcc->stats->rx_drop);
                recycle_iovec_rx_bufs(card, (struct iovec *) iovb->data,
 	                             NS_SKB(iovb)->iovcnt);
@@ -2497,7 +2497,7 @@ static void dequeue_rx(ns_dev *card, ns_
             }
 #ifdef EXTRA_DEBUG
             if (remaining != 0 || hb->len != len)
-               printk(KERN_DEBUG  "nicstar%d: Huge buffer len mismatch.\n",
card->index);
+               printk("nicstar%d: Huge buffer len mismatch.\n", card->index);
 #endif /* EXTRA_DEBUG */
             ATM_SKB(hb)->vcc = vcc;
 #ifdef NS_USE_DESTRUCTORS
@@ -2592,7 +2592,7 @@ static void recycle_rx_buf(ns_dev *card,
 	struct ns_skb_cb *cb = NS_SKB_CB(skb);

 	if (unlikely(cb->buf_type = BUF_NONE)) {
-		printk(KERN_INFO "nicstar%d: What kind of rx buffer is this?\n", card->index);
+		printk("nicstar%d: What kind of rx buffer is this?\n", card->index);
 		dev_kfree_skb_any(skb);
 	} else
 		push_rxbufs(card, skb);
@@ -2965,7 +2965,7 @@ static int ns_ioctl(struct atm_dev *dev,
             return dev->phy->ioctl(dev, cmd, arg);
          }
          else {
-            printk(KERN_ERR "nicstar%d: %s = NULL \n", card->index,
+            printk("nicstar%d: %s = NULL \n", card->index,
                    dev->phy ? "dev->phy->ioctl" : "dev->phy");
             return -ENOIOCTLCMD;
          }
@@ -2975,7 +2975,7 @@ static int ns_ioctl(struct atm_dev *dev,

 static void which_list(ns_dev *card, struct sk_buff *skb)
 {
-	printk(KERN_INFO "skb buf_type: 0x%08x\n", NS_SKB_CB(skb)->buf_type);
+	printk("skb buf_type: 0x%08x\n", NS_SKB_CB(skb)->buf_type);
 }




_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
