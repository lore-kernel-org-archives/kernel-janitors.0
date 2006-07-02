From: Richard <h.vanberkum@chello.nl>
Date: Sun, 02 Jul 2006 22:17:29 +0000
Subject: [KJ] [PATCH] drivers/atm/iphase.c: Fix KERN_* in printk statements
Message-Id: <44A86469.9090603@chello.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix KERN_* in printk statements

Signed-of-by: Richard van Berkum



--- janitor-2.6/drivers/atm/iphase.c	2006-07-01 02:44:10.995145240 +0200
+++ mytree/drivers/atm/iphase.c	2006-07-03 02:19:18.437770720 +0200
@@ -154,22 +154,22 @@ static void ia_hack_tcq(IADEV *dev) {
      desc1 = *(u_short *)(dev->seg_ram + dev->host_tcq_wr);
      if (!desc1) ;
      else if (!dev->desc_tbl[desc1 -1].timestamp) {
-        IF_ABR(printk(" Desc %d is reset at %ld\n", desc1 -1, jiffies);)
+        IF_ABR(printk(KERN_INFO " Desc %d is reset at %ld\n", desc1 -1, jiffies);)
         *(u_short *) (dev->seg_ram + dev->host_tcq_wr) = 0;
      }                                 
      else if (dev->desc_tbl[desc1 -1].timestamp) {
         if (!(iavcc_r = dev->desc_tbl[desc1 -1].iavcc)) { 
-           printk("IA: Fatal err in get_desc\n");
+           printk(KERN_ERR "IA: Fatal err in get_desc\n");
            continue;
         }
         iavcc_r->vc_desc_cnt--;
         dev->desc_tbl[desc1 -1].timestamp = 0;
-        IF_EVENT(printk("ia_hack: return_q skb = 0x%x desc = %d\n", 
+        IF_EVENT(printk(KERN_INFO "ia_hack: return_q skb = 0x%x desc = %d\n", 
                                    (u32)dev->desc_tbl[desc1 -1].txskb, desc1);)
         if (iavcc_r->pcr < dev->rate_limit) {
            IA_SKB_STATE (dev->desc_tbl[desc1-1].txskb) |= IA_TX_DONE;
            if (ia_enque_rtn_q(&dev->tx_return_q, dev->desc_tbl[desc1 -1]) < 0)
-              printk("ia_hack_tcq: No memory available\n");
+              printk(KERN_ERR "ia_hack_tcq: No memory available\n");
         } 
         dev->desc_tbl[desc1 -1].iavcc = NULL;
         dev->desc_tbl[desc1 -1].txskb = NULL;
@@ -200,7 +200,7 @@ static u16 get_desc (IADEV *dev, struct 
         ltimeout = dev->desc_tbl[i].iavcc->ltimeout; 
         delta = jiffies - dev->desc_tbl[i].timestamp;
         if (delta >= ltimeout) {
-           IF_ABR(printk("RECOVER run!! desc_tbl %d = %d  delta = %ld, time = %ld\n", i,dev->desc_tbl[i].timestamp, delta, jiffies);)
+           IF_ABR(printk(KERN_INFO "RECOVER run!! desc_tbl %d = %d  delta = %ld, time = %ld\n", i,dev->desc_tbl[i].timestamp, delta, jiffies);)
            if (dev->ffL.tcq_rd = dev->ffL.tcq_st) 
               dev->ffL.tcq_rd =  dev->ffL.tcq_ed;
            else 
@@ -208,7 +208,7 @@ static u16 get_desc (IADEV *dev, struct 
            *(u_short *)(dev->seg_ram + dev->ffL.tcq_rd) = i+1;
            if (!(skb = dev->desc_tbl[i].txskb) || 
                           !(iavcc_r = dev->desc_tbl[i].iavcc))
-              printk("Fatal err, desc table vcc or skb is NULL\n");
+              printk(KERN_ERR "Fatal err, desc table vcc or skb is NULL\n");
            else 
               iavcc_r->vc_desc_cnt--;
            dev->desc_tbl[i].timestamp = 0;
@@ -275,7 +275,7 @@ static void clear_lockup (struct atm_vcc
      } /* vcstatus->cnt */
 	
      if (foundLockUp) {
-        IF_ABR(printk("LOCK UP found\n");) 
+        IF_ABR(printk(KERN_INFO "LOCK UP found\n");) 
 	writew(0xFFFD, dev->seg_reg+MODE_REG_0);
         /* Wait for 10 Micro sec */
         udelay(10); 
@@ -286,7 +286,7 @@ static void clear_lockup (struct atm_vcc
 	if (i < dev->num_vc)
            shd_tbl[i] = vcc->vci;
         else
-           IF_ERR(printk("ABR Seg. may not continue on VC %x\n",vcc->vci);)
+           IF_ERR(printk(KERN_ERR "ABR Seg. may not continue on VC %x\n",vcc->vci);)
         writew(T_ONLINE, dev->seg_reg+MODE_REG_0);
         writew(~(TRANSMIT_DONE|TCQ_NOT_EMPTY), dev->seg_reg+SEG_MASK_REG);
         writew(TRANSMIT_DONE, dev->seg_reg+SEG_INTR_STATUS_REG);       
@@ -478,22 +478,22 @@ static int ia_cbr_setup (IADEV *dev, str
 
    /* IpAdjustTrafficParams */
    if (vcc->qos.txtp.max_pcr <= 0) {
-      IF_ERR(printk("PCR for CBR not defined\n");)
+      IF_ERR(printk(KERN_ERR "PCR for CBR not defined\n");)
       return -1;
    }
    rate = vcc->qos.txtp.max_pcr;
    entries = rate / dev->Granularity;
-   IF_CBR(printk("CBR: CBR entries=0x%x for rate=0x%x & Gran=0x%x\n",
+   IF_CBR(printk(KERN_INFO "CBR: CBR entries=0x%x for rate=0x%x & Gran=0x%x\n",
                                 entries, rate, dev->Granularity);)
    if (entries < 1)
-      IF_CBR(printk("CBR: Bandwidth smaller than granularity of CBR table\n");) 
+      IF_CBR(printk(KERN_INFO "CBR: Bandwidth smaller than granularity of CBR table\n");) 
    rateLow  =  entries * dev->Granularity;
    rateHigh = (entries + 1) * dev->Granularity;
    if (3*(rate - rateLow) > (rateHigh - rate))
       entries++;
    if (entries > dev->CbrRemEntries) {
-      IF_CBR(printk("CBR: Not enough bandwidth to support this PCR.\n");)
-      IF_CBR(printk("Entries = 0x%x, CbrRemEntries = 0x%x.\n",
+      IF_CBR(printk(KERN_ERR "CBR: Not enough bandwidth to support this PCR.\n");)
+      IF_CBR(printk(KERN_ERR "Entries = 0x%x, CbrRemEntries = 0x%x.\n",
                                        entries, dev->CbrRemEntries);)
       return -EBUSY;
    }   
@@ -510,7 +510,7 @@ static int ia_cbr_setup (IADEV *dev, str
    toBeAssigned = entries;
    fracSlot = 0;
    vcIndex  = vcc->vci;
-   IF_CBR(printk("Vci=0x%x,Spacing=0x%x,Sp_mod=0x%x\n",vcIndex,spacing,sp_mod);)
+   IF_CBR(printk(KERN_INFO "Vci=0x%x,Spacing=0x%x,Sp_mod=0x%x\n",vcIndex,spacing,sp_mod);)
    while (toBeAssigned)
    {
       // If this is the first time, start the table loading for this connection
@@ -535,7 +535,7 @@ static int ia_cbr_setup (IADEV *dev, str
       inc = 0;
       testSlot = idealSlot;
       TstSchedTbl = (u16*)(SchedTbl+testSlot);  //set index and read in value
-      IF_CBR(printk("CBR Testslot 0x%x AT Location 0x%x, NumToAssign=%d\n",
+      IF_CBR(printk(KERN_INFO "CBR Testslot 0x%x AT Location 0x%x, NumToAssign=%d\n",
                                 testSlot, (u32)TstSchedTbl,toBeAssigned);) 
       memcpy((caddr_t)&cbrVC,(caddr_t)TstSchedTbl,sizeof(cbrVC));
       while (cbrVC)  // If another VC at this location, we have to keep looking
@@ -544,7 +544,7 @@ static int ia_cbr_setup (IADEV *dev, str
           testSlot = idealSlot - inc;
           if (testSlot < 0) { // Wrap if necessary
              testSlot += dev->CbrTotEntries;
-             IF_CBR(printk("Testslot Wrap. STable Start=0x%x,Testslot=%d\n",
+             IF_CBR(printk(KERN_INFO "Testslot Wrap. STable Start=0x%x,Testslot=%d\n",
                                                        (u32)SchedTbl,testSlot);)
           }
           TstSchedTbl = (u16 *)(SchedTbl + testSlot);  // set table index
@@ -554,13 +554,13 @@ static int ia_cbr_setup (IADEV *dev, str
           testSlot = idealSlot + inc;
           if (testSlot >= (int)dev->CbrTotEntries) { // Wrap if necessary
              testSlot -= dev->CbrTotEntries;
-             IF_CBR(printk("TotCbrEntries=%d",dev->CbrTotEntries);)
+             IF_CBR(printk(KERN_INFO "TotCbrEntries=%d",dev->CbrTotEntries);)
              IF_CBR(printk(" Testslot=0x%x ToBeAssgned=%d\n", 
                                             testSlot, toBeAssigned);)
           } 
           // set table index and read in value
           TstSchedTbl = (u16*)(SchedTbl + testSlot);
-          IF_CBR(printk("Reading CBR Tbl from 0x%x, CbrVal=0x%x Iteration %d\n",
+          IF_CBR(printk(KERN_INFO "Reading CBR Tbl from 0x%x, CbrVal=0x%x Iteration %d\n",
                           (u32)TstSchedTbl,cbrVC,inc);) 
           memcpy((caddr_t)&cbrVC,(caddr_t)TstSchedTbl,sizeof(cbrVC));
        } /* while */
@@ -574,7 +574,7 @@ static int ia_cbr_setup (IADEV *dev, str
    dev->NumEnabledCBR++;
    if (dev->NumEnabledCBR = 1) {
        writew((CBR_EN | UBR_EN | ABR_EN | (0x23 << 2)), dev->seg_reg+STPARMS);
-       IF_CBR(printk("CBR is enabled\n");)
+       IF_CBR(printk(KERN_INFO "CBR is enabled\n");)
    }
    return 0;
 }
@@ -588,7 +588,7 @@ static void ia_cbrVc_close (struct atm_v
    SchedTbl = (u16*)(iadev->seg_ram+CBR_SCHED_TABLE*iadev->memSize);
    if (iadev->NumEnabledCBR = 0) {
       writew((UBR_EN | ABR_EN | (0x23 << 2)), iadev->seg_reg+STPARMS);
-      IF_CBR (printk("CBR support disabled\n");)
+      IF_CBR (printk(KERN_INFO "CBR support disabled\n");)
    }
    NumFound = 0;
    for (i=0; i < iadev->CbrTotEntries; i++)
@@ -600,7 +600,7 @@ static void ia_cbrVc_close (struct atm_v
       }
       SchedTbl++;   
    } 
-   IF_CBR(printk("Exit ia_cbrVc_close, NumRemoved=%d\n",NumFound);)
+   IF_CBR(printk(KERN_INFO "Exit ia_cbrVc_close, NumRemoved=%d\n",NumFound);)
 }
 
 static int ia_avail_descs(IADEV *iadev) {
@@ -626,12 +626,12 @@ static int ia_que_tx (IADEV *iadev) { 
    while (num_desc && (skb = skb_dequeue(&iadev->tx_backlog))) {
       if (!(vcc = ATM_SKB(skb)->vcc)) {
          dev_kfree_skb_any(skb);
-         printk("ia_que_tx: Null vcc\n");
+         printk(KERN_INFO "ia_que_tx: Null vcc\n");
          break;
       }
       if (!test_bit(ATM_VF_READY,&vcc->flags)) {
          dev_kfree_skb_any(skb);
-         printk("Free the SKB on closed vci %d \n", vcc->vci);
+         printk(KERN_INFO "Free the SKB on closed vci %d \n", vcc->vci);
          break;
       }
       iavcc = INPH_IA_VCC(vcc);
@@ -653,19 +653,19 @@ static void ia_tx_poll (IADEV *iadev) {
    while ( (rtne = ia_deque_rtn_q(&iadev->tx_return_q))) {
        skb = rtne->data.txskb;
        if (!skb) {
-           printk("ia_tx_poll: skb is null\n");
+           printk(KERN_ERR "ia_tx_poll: skb is null\n");
            goto out;
        }
        vcc = ATM_SKB(skb)->vcc;
        if (!vcc) {
-           printk("ia_tx_poll: vcc is null\n");
+           printk(KERN_ERR "ia_tx_poll: vcc is null\n");
            dev_kfree_skb_any(skb);
 	   goto out;
        }
 
        iavcc = INPH_IA_VCC(vcc);
        if (!iavcc) {
-           printk("ia_tx_poll: iavcc is null\n");
+           printk(KERN_ERR "ia_tx_poll: iavcc is null\n");
            dev_kfree_skb_any(skb);
 	   goto out;
        }
@@ -673,13 +673,13 @@ static void ia_tx_poll (IADEV *iadev) {
        skb1 = skb_dequeue(&iavcc->txing_skb);
        while (skb1 && (skb1 != skb)) {
           if (!(IA_SKB_STATE(skb1) & IA_TX_DONE)) {
-             printk("IA_tx_intr: Vci %d lost pkt!!!\n", vcc->vci);
+             printk(KERN_INFO "IA_tx_intr: Vci %d lost pkt!!!\n", vcc->vci);
           }
-          IF_ERR(printk("Release the SKB not match\n");)
+          IF_ERR(printk(KERN_ERR "Release the SKB not match\n");)
           if ((vcc->pop) && (skb1->len != 0))
           {
              vcc->pop(vcc, skb1);
-             IF_EVENT(printk("Tansmit Done - skb 0x%lx return\n",
+             IF_EVENT(printk(KERN_INFO "Tansmit Done - skb 0x%lx return\n",
                                                           (long)skb1);)
           }
           else 
@@ -687,14 +687,14 @@ static void ia_tx_poll (IADEV *iadev) {
           skb1 = skb_dequeue(&iavcc->txing_skb);
        }                                                        
        if (!skb1) {
-          IF_EVENT(printk("IA: Vci %d - skb not found requed\n",vcc->vci);)
+          IF_EVENT(printk(KERN_INFO "IA: Vci %d - skb not found requed\n",vcc->vci);)
           ia_enque_head_rtn_q (&iadev->tx_return_q, rtne);
           break;
        }
        if ((vcc->pop) && (skb->len != 0))
        {
           vcc->pop(vcc, skb);
-          IF_EVENT(printk("Tx Done - skb 0x%lx return\n",(long)skb);)
+          IF_EVENT(printk(KERN_INFO "Tx Done - skb 0x%lx return\n",(long)skb);)
        }
        else 
           dev_kfree_skb_any(skb);
@@ -798,7 +798,7 @@ static void ia_hw_type(IADEV *iadev) {
       iadev->rx_buf_sz = IA_RX_BUF_SZ; 
    } 
    iadev->rx_pkt_ram = TX_PACKET_RAM + (iadev->num_tx_desc * iadev->tx_buf_sz); 
-   IF_INIT(printk("BUF: tx=%d,sz=%d rx=%d sz= %d rx_pkt_ram=%d\n",
+   IF_INIT(printk(KERN_INFO "BUF: tx=%d,sz=%d rx=%d sz= %d rx_pkt_ram=%d\n",
          iadev->num_tx_desc, iadev->tx_buf_sz, iadev->num_rx_desc,
          iadev->rx_buf_sz, iadev->rx_pkt_ram);)
 
@@ -812,7 +812,7 @@ static void ia_hw_type(IADEV *iadev) {
 #endif
    
    iadev->phy_type = memType & FE_MASK;
-   IF_INIT(printk("memType = 0x%x iadev->phy_type = 0x%x\n", 
+   IF_INIT(printk(KERN_INFO "memType = 0x%x iadev->phy_type = 0x%x\n", 
                                          memType,iadev->phy_type);)
    if (iadev->phy_type = FE_25MBIT_PHY) 
       iadev->LineRate = (u32)(((25600000/8)*26)/(27*53));
@@ -822,7 +822,7 @@ static void ia_hw_type(IADEV *iadev) {
       iadev->LineRate = (u32)(((34368000/8)*26)/(27*53));
    else
        iadev->LineRate = (u32)(ATM_OC3_PCR);
-   IF_INIT(printk("iadev->LineRate = %d \n", iadev->LineRate);)
+   IF_INIT(printk(KERN_INFO "iadev->LineRate = %d \n", iadev->LineRate);)
 
 }
 
@@ -854,9 +854,9 @@ static void IaFrontEndIntr(IADEV *iadev)
      iadev->carrier_detect = Boolean(!(suni->suni_rsop_status & SUNI_LOSV));
   }
   if (iadev->carrier_detect)
-    printk("IA: SUNI carrier detected\n");
+    printk(KERN_INFO "IA: SUNI carrier detected\n");
   else
-    printk("IA: SUNI carrier lost signal\n"); 
+    printk(KERN_INFO "IA: SUNI carrier lost signal\n"); 
   return;
 }
 
@@ -1013,22 +1013,22 @@ static void desc_dbg(IADEV *iadev) {
   void __iomem *tmp;
   // regval = readl((u32)ia_cmds->maddr);
   tcq_wr_ptr =  readw(iadev->seg_reg+TCQ_WR_PTR);
-  printk("B_tcq_wr = 0x%x desc = %d last desc = %d\n",
+  printk(KERN_INFO "B_tcq_wr = 0x%x desc = %d last desc = %d\n",
                      tcq_wr_ptr, readw(iadev->seg_ram+tcq_wr_ptr),
                      readw(iadev->seg_ram+tcq_wr_ptr-2));
-  printk(" host_tcq_wr = 0x%x  host_tcq_rd = 0x%x \n",  iadev->host_tcq_wr, 
+  printk(KERN_INFO " host_tcq_wr = 0x%x  host_tcq_rd = 0x%x \n",  iadev->host_tcq_wr, 
                    iadev->ffL.tcq_rd);
   tcq_st_ptr =  readw(iadev->seg_reg+TCQ_ST_ADR);
   tcq_ed_ptr =  readw(iadev->seg_reg+TCQ_ED_ADR);
-  printk("tcq_st_ptr = 0x%x    tcq_ed_ptr = 0x%x \n", tcq_st_ptr, tcq_ed_ptr);
+  printk(KERN_INFO "tcq_st_ptr = 0x%x    tcq_ed_ptr = 0x%x \n", tcq_st_ptr, tcq_ed_ptr);
   i = 0;
   while (tcq_st_ptr != tcq_ed_ptr) {
       tmp = iadev->seg_ram+tcq_st_ptr;
-      printk("TCQ slot %d desc = %d  Addr = %p\n", i++, readw(tmp), tmp);
+      printk(KERN_INFO "TCQ slot %d desc = %d  Addr = %p\n", i++, readw(tmp), tmp);
       tcq_st_ptr += 2;
   }
   for(i=0; i <iadev->num_tx_desc; i++)
-      printk("Desc_tbl[%d] = %d \n", i, iadev->desc_tbl[i].timestamp);
+      printk(KERN_INFO "Desc_tbl[%d] = %d \n", i, iadev->desc_tbl[i].timestamp);
 } 
   
   
@@ -1095,9 +1095,9 @@ static int rx_pkt(struct atm_dev *dev)  
 	}  
 	/* mask 1st 3 bits to get the actual descno. */  
 	desc = readw(iadev->reass_ram+iadev->rfL.pcq_rd) & 0x1fff;  
-        IF_RX(printk("reass_ram = %p iadev->rfL.pcq_rd = 0x%x desc = %d\n", 
+        IF_RX(printk(KERN_INFO "reass_ram = %p iadev->rfL.pcq_rd = 0x%x desc = %d\n", 
                                     iadev->reass_ram, iadev->rfL.pcq_rd, desc);
-              printk(" pcq_wr_ptr = 0x%x\n",
+              printk(KERN_INFO " pcq_wr_ptr = 0x%x\n",
                                readw(iadev->reass_reg+PCQ_WR_PTR)&0xffff);)
 	/* update the read pointer  - maybe we shud do this in the end*/  
 	if ( iadev->rfL.pcq_rd= iadev->rfL.pcq_ed) 
@@ -1115,14 +1115,14 @@ static int rx_pkt(struct atm_dev *dev)  
         if (!desc || (desc > iadev->num_rx_desc) || 
                       ((buf_desc_ptr->vc_index & 0xffff) > iadev->num_vc)) { 
             free_desc(dev, desc);
-            IF_ERR(printk("IA: bad descriptor desc = %d \n", desc);)
+            IF_ERR(printk(KERN_ERR "IA: bad descriptor desc = %d \n", desc);)
             return -1;
         }
 	vcc = iadev->rx_open[buf_desc_ptr->vc_index & 0xffff];  
 	if (!vcc)  
 	{      
                 free_desc(dev, desc); 
-		printk("IA: null vcc, drop PDU\n");  
+		printk(KERN_ERR "IA: null vcc, drop PDU\n");  
 		return -1;  
 	}  
 	  
@@ -1132,15 +1132,15 @@ static int rx_pkt(struct atm_dev *dev)  
 	if (status & (RX_CER | RX_PTE | RX_OFL))  
 	{  
                 atomic_inc(&vcc->stats->rx_err);
-		IF_ERR(printk("IA: bad packet, dropping it");)  
+		IF_ERR(printk(KERN_ERR "IA: bad packet, dropping it");)  
                 if (status & RX_CER) { 
-                    IF_ERR(printk(" cause: packet CRC error\n");)
+                    IF_ERR(printk(KERN_ERR " cause: packet CRC error\n");)
                 }
                 else if (status & RX_PTE) {
-                    IF_ERR(printk(" cause: packet time out\n");)
+                    IF_ERR(printk(KERN_ERR " cause: packet time out\n");)
                 }
                 else {
-                    IF_ERR(printk(" cause: buffer over flow\n");)
+                    IF_ERR(printk(KERN_ERR " cause: buffer over flow\n");)
                 }
 		goto out_free_desc;
 	}  
@@ -1153,14 +1153,14 @@ static int rx_pkt(struct atm_dev *dev)  
 	dma_addr = (buf_desc_ptr->dma_start_hi << 16) | buf_desc_ptr->dma_start_lo;  
 	len = dma_addr - buf_addr;  
         if (len > iadev->rx_buf_sz) {
-           printk("Over %d bytes sdu received, dropped!!!\n", iadev->rx_buf_sz);
+           printk(KERN_ERR "Over %d bytes sdu received, dropped!!!\n", iadev->rx_buf_sz);
            atomic_inc(&vcc->stats->rx_err);
 	   goto out_free_desc;
         }
 		  
         if (!(skb = atm_alloc_charge(vcc, len, GFP_ATOMIC))) {
            if (vcc->vci < 32)
-              printk("Drop control packets\n");
+              printk(KERN_ERR "Drop control packets\n");
 	      goto out_free_desc;
         }
 	skb_put(skb,len);  
@@ -1198,7 +1198,7 @@ static void rx_intr(struct atm_dev *dev)
   
   iadev = INPH_IA_DEV(dev);  
   status = readl(iadev->reass_reg+REASS_INTR_STATUS_REG) & 0xffff;  
-  IF_EVENT(printk("rx_intr: status = 0x%x\n", status);)
+  IF_EVENT(printk(KERN_INFO "rx_intr: status = 0x%x\n", status);)
   if (status & RX_PKT_RCVD)  
   {  
 	/* do something */  
@@ -1208,7 +1208,7 @@ static void rx_intr(struct atm_dev *dev)
 	packets till the packet complete queue is empty..  
 	*/  
 	state = readl(iadev->reass_reg + STATE_REG) & 0xffff;  
-        IF_EVENT(printk("Rx intr status: RX_PKT_RCVD %08x\n", status);) 
+        IF_EVENT(printk(KERN_INFO "Rx intr status: RX_PKT_RCVD %08x\n", status);) 
 	while(!(state & PCQ_EMPTY))  
 	{  
              rx_pkt(dev);  
@@ -1227,17 +1227,17 @@ static void rx_intr(struct atm_dev *dev)
                ((iadev->rx_pkt_cnt - iadev->rx_tmp_cnt) = 0)) {
         for (i = 1; i <= iadev->num_rx_desc; i++)
                free_desc(dev, i);
-printk("Test logic RUN!!!!\n");
+printk(KERN_INFO "Test logic RUN!!!!\n");
         writew( ~(RX_FREEQ_EMPT|RX_EXCP_RCVD),iadev->reass_reg+REASS_MASK_REG);
         iadev->rxing = 1;
      }
-     IF_EVENT(printk("Rx intr status: RX_FREEQ_EMPT %08x\n", status);)  
+     IF_EVENT(printk(KERN_INFO "Rx intr status: RX_FREEQ_EMPT %08x\n", status);)  
   }  
 
   if (status & RX_EXCP_RCVD)  
   {  
 	/* probably need to handle the exception queue also. */  
-	IF_EVENT(printk("Rx intr status: RX_EXCP_RCVD %08x\n", status);)  
+	IF_EVENT(printk(KERN_INFO "Rx intr status: RX_EXCP_RCVD %08x\n", status);)  
 	rx_excp_rcvd(dev);  
   }  
 
@@ -1247,7 +1247,7 @@ printk("Test logic RUN!!!!\n");
 	/* need to handle the raw incoming cells. This deepnds on   
 	whether we have programmed to receive the raw cells or not.  
 	Else ignore. */  
-	IF_EVENT(printk("Rx intr status:  RX_RAW_RCVD %08x\n", status);)  
+	IF_EVENT(printk(KERN_INFO "Rx intr status:  RX_RAW_RCVD %08x\n", status);)  
   }  
 }  
   
@@ -1283,7 +1283,7 @@ static void rx_dle_intr(struct atm_dev *
                
       if (!(len = skb->len))
       {  
-          printk("rx_dle_intr: skb len 0\n");  
+          printk(KERN_INFO "rx_dle_intr: skb len 0\n");  
 	  dev_kfree_skb_any(skb);  
       }  
       else  
@@ -1297,7 +1297,7 @@ static void rx_dle_intr(struct atm_dev *
           /* no VCC related housekeeping done as yet. lets see */  
           vcc = ATM_SKB(skb)->vcc;
 	  if (!vcc) {
-	      printk("IA: null vcc\n");  
+	      printk(KERN_ERR "IA: null vcc\n");  
               dev_kfree_skb_any(skb);
               goto INCR_DLE;
           }
@@ -1317,7 +1317,7 @@ static void rx_dle_intr(struct atm_dev *
                               (skb->len - sizeof(struct cpcs_trailer))))
           {
              atomic_inc(&vcc->stats->rx_err);
-             IF_ERR(printk("rx_dle_intr: Bad  AAL5 trailer %d (skb len %d)", 
+             IF_ERR(printk(KERN_ERR "rx_dle_intr: Bad  AAL5 trailer %d (skb len %d)", 
                                                             length, skb->len);)
              dev_kfree_skb_any(skb);
              atm_return(vcc, atm_guess_pdu2truesize(len));
@@ -1326,11 +1326,11 @@ static void rx_dle_intr(struct atm_dev *
           skb_trim(skb, length);
           
 	  /* Display the packet */  
-	  IF_RXPKT(printk("\nDmad Recvd data: len = %d \n", skb->len);  
+	  IF_RXPKT(printk(KERN_DEBUG "\nDmad Recvd data: len = %d \n", skb->len);  
           xdump(skb->data, skb->len, "RX: ");
           printk("\n");)
 
-	  IF_RX(printk("rx_dle_intr: skb push");)  
+	  IF_RX(printk(KERN_DEBUG "rx_dle_intr: skb push");)  
 	  vcc->push(vcc,skb);  
 	  atomic_inc(&vcc->stats->rx);
           iadev->rx_pkt_cnt++;
@@ -1360,13 +1360,13 @@ static int open_rx(struct atm_vcc *vcc) 
 	IADEV *iadev;  
 	u_short __iomem *vc_table;  
 	u_short __iomem *reass_ptr;  
-	IF_EVENT(printk("iadev: open_rx %d.%d\n", vcc->vpi, vcc->vci);)
+	IF_EVENT(printk(KERN_INFO "iadev: open_rx %d.%d\n", vcc->vpi, vcc->vci);)
 
 	if (vcc->qos.rxtp.traffic_class = ATM_NONE) return 0;    
 	iadev = INPH_IA_DEV(vcc->dev);  
         if (vcc->qos.rxtp.traffic_class = ATM_ABR) {  
            if (iadev->phy_type & FE_25MBIT_PHY) {
-               printk("IA:  ABR not support\n");
+               printk(KERN_INFO "IA:  ABR not support\n");
                return -EINVAL; 
            }
         }
@@ -1433,10 +1433,10 @@ static int rx_init(struct atm_dev *dev) 
 	/* write the upper 20 bits of the start address to rx list address register */  
 	writel(iadev->rx_dle_dma & 0xfffff000,
 	       iadev->dma + IPHASE5575_RX_LIST_ADDR);  
-	IF_INIT(printk("Tx Dle list addr: 0x%08x value: 0x%0x\n", 
+	IF_INIT(printk(KERN_DEBUG "Tx Dle list addr: 0x%08x value: 0x%0x\n", 
                       (u32)(iadev->dma+IPHASE5575_TX_LIST_ADDR), 
                       *(u32*)(iadev->dma+IPHASE5575_TX_LIST_ADDR));  
-	printk("Rx Dle list addr: 0x%08x value: 0x%0x\n", 
+	printk(KERN_DEBUG "Rx Dle list addr: 0x%08x value: 0x%0x\n", 
                       (u32)(iadev->dma+IPHASE5575_RX_LIST_ADDR), 
                       *(u32*)(iadev->dma+IPHASE5575_RX_LIST_ADDR));)  
   
@@ -1476,7 +1476,7 @@ static int rx_init(struct atm_dev *dev) 
 		buf_desc_ptr++;		  
 		rx_pkt_start += iadev->rx_buf_sz;  
 	}  
-	IF_INIT(printk("Rx Buffer desc ptr: 0x%0x\n", (u32)(buf_desc_ptr));)  
+	IF_INIT(printk(KERN_DEBUG "Rx Buffer desc ptr: 0x%0x\n", (u32)(buf_desc_ptr));)  
         i = FREE_BUF_DESC_Q*iadev->memSize; 
 	writew(i >> 16,  iadev->reass_reg+REASS_QUEUE_BASE); 
         writew(i, iadev->reass_reg+FREEQ_ST_ADR);
@@ -1493,7 +1493,7 @@ static int rx_init(struct atm_dev *dev) 
 		*freeq_start = (u_short)i;  
 		freeq_start++;  
 	}  
-	IF_INIT(printk("freeq_start: 0x%0x\n", (u32)freeq_start);)  
+	IF_INIT(printk(KERN_DEBUG "freeq_start: 0x%0x\n", (u32)freeq_start);)  
         /* Packet Complete Queue */
         i = (PKT_COMP_Q * iadev->memSize) & 0xffff;
         writew(i, iadev->reass_reg+PCQ_ST_ADR);
@@ -1519,7 +1519,7 @@ static int rx_init(struct atm_dev *dev) 
 	iadev->rfL.pcq_rd = readw(iadev->reass_reg+PCQ_RD_PTR) & 0xffff;
 	iadev->rfL.pcq_wr = readw(iadev->reass_reg+PCQ_WR_PTR) & 0xffff;
 	
-        IF_INIT(printk("INIT:pcq_st:0x%x pcq_ed:0x%x pcq_rd:0x%x pcq_wr:0x%x", 
+        IF_INIT(printk(KERN_DEBUG "INIT:pcq_st:0x%x pcq_ed:0x%x pcq_rd:0x%x pcq_wr:0x%x", 
               iadev->rfL.pcq_st, iadev->rfL.pcq_ed, iadev->rfL.pcq_rd, 
               iadev->rfL.pcq_wr);)		  
 	/* just for check - no VP TBL */  
@@ -1649,7 +1649,7 @@ static void tx_intr(struct atm_dev *dev)
 	status = readl(iadev->seg_reg+SEG_INTR_STATUS_REG);  
         if (status & TRANSMIT_DONE){
 
-           IF_EVENT(printk("Tansmit Done Intr logic run\n");)
+           IF_EVENT(printk(KERN_INFO "Tansmit Done Intr logic run\n");)
            spin_lock_irqsave(&iadev->tx_lock, flags);
            ia_tx_poll(iadev);
            spin_unlock_irqrestore(&iadev->tx_lock, flags);
@@ -1659,7 +1659,7 @@ static void tx_intr(struct atm_dev *dev)
         }     	  
 	if (status & TCQ_NOT_EMPTY)  
 	{  
-	    IF_EVENT(printk("TCQ_NOT_EMPTY int received\n");)  
+	    IF_EVENT(printk(KERN_INFO "TCQ_NOT_EMPTY int received\n");)  
 	}  
 }  
   
@@ -1692,7 +1692,7 @@ static void tx_dle_intr(struct atm_dev *
 	    }
             vcc = ATM_SKB(skb)->vcc;
             if (!vcc) {
-                  printk("tx_dle_intr: vcc is null\n");
+                  printk(KERN_INFO "tx_dle_intr: vcc is null\n");
 		  spin_unlock_irqrestore(&iadev->tx_lock, flags);
                   dev_kfree_skb_any(skb);
 
@@ -1700,7 +1700,7 @@ static void tx_dle_intr(struct atm_dev *
             }
             iavcc = INPH_IA_VCC(vcc);
             if (!iavcc) {
-                  printk("tx_dle_intr: iavcc is null\n");
+                  printk(KERN_INFO "tx_dle_intr: iavcc is null\n");
 		  spin_unlock_irqrestore(&iadev->tx_lock, flags);
                   dev_kfree_skb_any(skb);
                   return;
@@ -1718,7 +1718,7 @@ static void tx_dle_intr(struct atm_dev *
                IA_SKB_STATE(skb) |= IA_DLED;
                skb_queue_tail(&iavcc->txing_skb, skb);
             }
-            IF_EVENT(printk("tx_dle_intr: enque skb = 0x%x \n", (u32)skb);)
+            IF_EVENT(printk(KERN_DEBUG "tx_dle_intr: enque skb = 0x%x \n", (u32)skb);)
             if (++dle = iadev->tx_dle_q.end)
                  dle = iadev->tx_dle_q.start;
         }
@@ -1733,17 +1733,17 @@ static int open_tx(struct atm_vcc *vcc) 
 	struct main_vc *vc;  
 	struct ext_vc *evc;  
         int ret;
-	IF_EVENT(printk("iadev: open_tx entered vcc->vci = %d\n", vcc->vci);)  
+	IF_EVENT(printk(KERN_INFO "iadev: open_tx entered vcc->vci = %d\n", vcc->vci);)  
 	if (vcc->qos.txtp.traffic_class = ATM_NONE) return 0;  
 	iadev = INPH_IA_DEV(vcc->dev);  
         
         if (iadev->phy_type & FE_25MBIT_PHY) {
            if (vcc->qos.txtp.traffic_class = ATM_ABR) {
-               printk("IA:  ABR not support\n");
+               printk(KERN_ERR "IA:  ABR not support\n");
                return -EINVAL; 
            }
 	  if (vcc->qos.txtp.traffic_class = ATM_CBR) {
-               printk("IA:  CBR not support\n");
+               printk(KERN_ERR "IA:  CBR not support\n");
                return -EINVAL; 
           }
         }
@@ -1751,7 +1751,7 @@ static int open_tx(struct atm_vcc *vcc) 
         memset((caddr_t)ia_vcc, 0, sizeof(*ia_vcc));
         if (vcc->qos.txtp.max_sdu > 
                          (iadev->tx_buf_sz - sizeof(struct cpcs_trailer))){
-           printk("IA:  SDU size over (%d) the configured SDU size %d\n",
+           printk(KERN_INFO "IA:  SDU size over (%d) the configured SDU size %d\n",
 		  vcc->qos.txtp.max_sdu,iadev->tx_buf_sz);
 	   vcc->dev_data = NULL;
            kfree(ia_vcc);
@@ -1815,12 +1815,12 @@ static int open_tx(struct atm_vcc *vcc) 
 		vc->acr = cellrate_to_float(iadev->LineRate);  
                 if (vcc->qos.txtp.pcr > 0) 
                    vc->acr = cellrate_to_float(vcc->qos.txtp.pcr);  
-                IF_UBR(printk("UBR: txtp.pcr = 0x%x f_rate = 0x%x\n", 
+                IF_UBR(printk(KERN_DEBUG "UBR: txtp.pcr = 0x%x f_rate = 0x%x\n", 
                                              vcc->qos.txtp.max_pcr,vc->acr);)
 	}  
 	else if (vcc->qos.txtp.traffic_class = ATM_ABR)  
 	{       srv_cls_param_t srv_p;
-		IF_ABR(printk("Tx ABR VCC\n");)  
+		IF_ABR(printk(KERN_DEBUG "Tx ABR VCC\n");)  
                 init_abr_vc(iadev, &srv_p);
                 if (vcc->qos.txtp.pcr > 0) 
                    srv_p.pcr = vcc->qos.txtp.pcr;
@@ -1852,16 +1852,16 @@ static int open_tx(struct atm_vcc *vcc) 
                    srv_p.cdf = vcc->qos.txtp.cdf;    
                 if (srv_p.icr > srv_p.pcr)
                    srv_p.icr = srv_p.pcr;    
-                IF_ABR(printk("ABR:vcc->qos.txtp.max_pcr = %d  mcr = %d\n", 
+                IF_ABR(printk(KERN_DEBUG "ABR:vcc->qos.txtp.max_pcr = %d  mcr = %d\n", 
                                                       srv_p.pcr, srv_p.mcr);)
 		ia_open_abr_vc(iadev, &srv_p, vcc, 1);
 	} else if (vcc->qos.txtp.traffic_class = ATM_CBR) {
                 if (iadev->phy_type & FE_25MBIT_PHY) {
-                    printk("IA:  CBR not support\n");
+                    printk(KERN_ERR "IA:  CBR not support\n");
                     return -EINVAL; 
                 }
                 if (vcc->qos.txtp.max_pcr > iadev->LineRate) {
-                   IF_CBR(printk("PCR is not availble\n");)
+                   IF_CBR(printk(KERN_ERR "PCR is not availble\n");)
                    return -1;
                 }
                 vc->type = CBR;
@@ -1871,10 +1871,10 @@ static int open_tx(struct atm_vcc *vcc) 
                 }
        } 
 	else  
-           printk("iadev:  Non UBR, ABR and CBR traffic not supportedn"); 
+           printk(KERN_INFO "iadev:  Non UBR, ABR and CBR traffic not supportedn"); 
         
         iadev->testTable[vcc->vci]->vc_status |= VC_ACTIVE;
-	IF_EVENT(printk("ia open_tx returning \n");)  
+	IF_EVENT(printk(KERN_INFO "ia open_tx returning \n");)  
 	return 0;  
 }  
   
@@ -1898,7 +1898,7 @@ static int tx_init(struct atm_dev *dev) 
 	iadev = INPH_IA_DEV(dev);  
         spin_lock_init(&iadev->tx_lock);
  
-	IF_INIT(printk("Tx MASK REG: 0x%0x\n", 
+	IF_INIT(printk(KERN_DEBUG "Tx MASK REG: 0x%0x\n", 
                                 readw(iadev->seg_reg+SEG_MASK_REG));)  
 
 	/* Allocate 4k (boundary aligned) bytes */
@@ -2031,27 +2031,27 @@ static int tx_init(struct atm_dev *dev) 
 		prq_start++;  
 	}  
 	/* CBR Table */  
-        IF_INIT(printk("Start CBR Init\n");)
+        IF_INIT(printk(KERN_INFO "Start CBR Init\n");)
 #if 1  /* for 1K VC board, CBR_PTR_BASE is 0 */
         writew(0,iadev->seg_reg+CBR_PTR_BASE);
 #else /* Charlie's logic is wrong ? */
         tmp16 = (iadev->seg_ram+CBR_SCHED_TABLE*iadev->memSize)>>17;
-        IF_INIT(printk("cbr_ptr_base = 0x%x ", tmp16);)
+        IF_INIT(printk(KERN_DEBUG "cbr_ptr_base = 0x%x ", tmp16);)
         writew(tmp16,iadev->seg_reg+CBR_PTR_BASE);
 #endif
 
-        IF_INIT(printk("value in register = 0x%x\n",
+        IF_INIT(printk(KERN_DEBUG "value in register = 0x%x\n",
                                    readw(iadev->seg_reg+CBR_PTR_BASE));)
         tmp16 = (CBR_SCHED_TABLE*iadev->memSize) >> 1;
         writew(tmp16, iadev->seg_reg+CBR_TAB_BEG);
-        IF_INIT(printk("cbr_tab_beg = 0x%x in reg = 0x%x \n", tmp16,
+        IF_INIT(printk(KERN_DEBUG "cbr_tab_beg = 0x%x in reg = 0x%x \n", tmp16,
                                         readw(iadev->seg_reg+CBR_TAB_BEG));)
         writew(tmp16, iadev->seg_reg+CBR_TAB_END+1); // CBR_PTR;
         tmp16 = (CBR_SCHED_TABLE*iadev->memSize + iadev->num_vc*6 - 2) >> 1;
         writew(tmp16, iadev->seg_reg+CBR_TAB_END);
-        IF_INIT(printk("iadev->seg_reg = 0x%x CBR_PTR_BASE = 0x%x\n",
+        IF_INIT(printk(KERN_DEBUG "iadev->seg_reg = 0x%x CBR_PTR_BASE = 0x%x\n",
                (u32)iadev->seg_reg, readw(iadev->seg_reg+CBR_PTR_BASE));)
-        IF_INIT(printk("CBR_TAB_BEG = 0x%x, CBR_TAB_END = 0x%x, CBR_PTR = 0x%x\n",
+        IF_INIT(printk(KERN_DEBUG "CBR_TAB_BEG = 0x%x, CBR_TAB_END = 0x%x, CBR_PTR = 0x%x\n",
           readw(iadev->seg_reg+CBR_TAB_BEG), readw(iadev->seg_reg+CBR_TAB_END),
           readw(iadev->seg_reg+CBR_TAB_END+1));)
 
@@ -2108,7 +2108,7 @@ static int tx_init(struct atm_dev *dev) 
 	evc = (struct ext_vc *)iadev->EXT_VC_TABLE_ADDR;  
         iadev->testTable = kmalloc(sizeof(long)*iadev->num_vc, GFP_KERNEL); 
         if (!iadev->testTable) {
-           printk("Get freepage  failed\n");
+           printk(KERN_ERR "Get freepage  failed\n");
 	   goto err_free_desc_tbl;
         }
 	for(i=0; i<iadev->num_vc; i++)  
@@ -2207,11 +2207,11 @@ static irqreturn_t ia_int(int irq, void 
    while( (status = readl(iadev->reg+IPHASE5575_BUS_STATUS_REG) & 0x7f))  
    { 
 	handled = 1;
-        IF_EVENT(printk("ia_int: status = 0x%x\n", status);) 
+        IF_EVENT(printk(KERN_DEBUG "ia_int: status = 0x%x\n", status);) 
 	if (status & STAT_REASSINT)  
 	{  
 	   /* do something */  
-	   IF_EVENT(printk("REASSINT Bus status reg: %08x\n", status);) 
+	   IF_EVENT(printk(KERN_DEBUG "REASSINT Bus status reg: %08x\n", status);) 
 	   rx_intr(dev);  
 	}  
 	if (status & STAT_DLERINT)  
@@ -2223,7 +2223,7 @@ static irqreturn_t ia_int(int irq, void 
 	if (status & STAT_SEGINT)  
 	{  
 	   /* do something */ 
-           IF_EVENT(printk("IA: tx_intr \n");) 
+           IF_EVENT(printk(KERN_DEBUG "IA: tx_intr \n");) 
 	   tx_intr(dev);  
 	}  
 	if (status & STAT_DLETINT)  
@@ -2254,7 +2254,7 @@ static int get_esi(struct atm_dev *dev) 
 	mac1 = cpu_to_be32(le32_to_cpu(readl(  
 				iadev->reg+IPHASE5575_MAC1)));  
 	mac2 = cpu_to_be16(le16_to_cpu(readl(iadev->reg+IPHASE5575_MAC2)));  
-	IF_INIT(printk("ESI: 0x%08x%04x\n", mac1, mac2);)  
+	IF_INIT(printk(KERN_DEBUG "ESI: 0x%08x%04x\n", mac1, mac2);)  
 	for (i=0; i<MAC1_LEN; i++)  
 		dev->esi[i] = mac1 >>(8*(MAC1_LEN-1-i));  
 	  
@@ -2297,7 +2297,7 @@ static int __devinit ia_init(struct atm_
 	   necessary configuration info like memory base address,   
 	   interrupt number etc */  
 	  
-	IF_INIT(printk(">ia_init\n");)  
+	IF_INIT(printk(KERN_DEBUG ">ia_init\n");)  
 	dev->ci_range.vpi_bits = 0;  
 	dev->ci_range.vci_bits = NR_VCI_LD;  
 
@@ -2313,7 +2313,7 @@ static int __devinit ia_init(struct atm_
 				dev->number,error);  
 		return -EINVAL;  
 	}  
-	IF_INIT(printk(DEV_LABEL "(itf %d): rev.%d,realbase=0x%lx,irq=%d\n",  
+	IF_INIT(printk(KERN_DEBUG DEV_LABEL "(itf %d): rev.%d,realbase=0x%lx,irq=%d\n",  
 			dev->number, revision, real_base, iadev->irq);)  
 	  
 	/* find mapping size of board */  
@@ -2330,10 +2330,10 @@ static int __devinit ia_init(struct atm_
           iadev->memSize = 1;
         }
         else {
-           printk("Unknown pci_map_size = 0x%x\n", iadev->pci_map_size);
+           printk(KERN_ERR "Unknown pci_map_size = 0x%x\n", iadev->pci_map_size);
            return -EINVAL;
         }
-	IF_INIT(printk (DEV_LABEL "map size: %i\n", iadev->pci_map_size);)  
+	IF_INIT(printk (KERN_DEBUG DEV_LABEL "map size: %i\n", iadev->pci_map_size);)  
 	  
 	/* enable bus mastering */
 	pci_set_master(iadev->pci);
@@ -2348,11 +2348,11 @@ static int __devinit ia_init(struct atm_
 	  
 	if (!base)  
 	{  
-		printk(DEV_LABEL " (itf %d): can't set up page mapping\n",  
+		printk(KERN_ERR DEV_LABEL " (itf %d): can't set up page mapping\n",  
 			    dev->number);  
 		return error;  
 	}  
-	IF_INIT(printk(DEV_LABEL " (itf %d): rev.%d,base=%p,irq=%d\n",  
+	IF_INIT(printk(KERN_ERR DEV_LABEL " (itf %d): rev.%d,base=%p,irq=%d\n",  
 			dev->number, revision, base, iadev->irq);)  
 	  
 	/* filling the iphase dev structure */  
@@ -2375,7 +2375,7 @@ static int __devinit ia_init(struct atm_
 	iadev->reass_ram = base + ACTUAL_REASS_RAM_BASE;  
   
 	/* lets print out the above */  
-	IF_INIT(printk("Base addrs: %p %p %p \n %p %p %p %p\n", 
+	IF_INIT(printk(KERN_INFO "Base addrs: %p %p %p \n %p %p %p %p\n", 
           iadev->reg,iadev->seg_reg,iadev->reass_reg, 
           iadev->phy, iadev->ram, iadev->seg_ram, 
           iadev->reass_ram);) 
@@ -2386,7 +2386,7 @@ static int __devinit ia_init(struct atm_
 	  iounmap(iadev->base);
 	  return error;  
 	}
-        printk("IA: ");
+        printk(KERN_INFO "IA: ");
 	for (i=0; i < ESI_LEN; i++)  
                 printk("%s%02X",i ? "-" : "",dev->esi[i]);  
         printk("\n");  
@@ -2394,7 +2394,7 @@ static int __devinit ia_init(struct atm_
         /* reset SAR */  
         if (reset_sar(dev)) {
 	   iounmap(iadev->base);
-           printk("IA: reset SAR fail, please try again\n");
+           printk(KERN_ERR "IA: reset SAR fail, please try again\n");
            return 1;
         }
 	return 0;  
@@ -2486,7 +2486,7 @@ static int __devinit ia_start(struct atm
 	int error;  
 	unsigned char phy;  
 	u32 ctrl_reg;  
-	IF_EVENT(printk(">ia_start\n");)  
+	IF_EVENT(printk(KERN_DEBUG ">ia_start\n");)  
 	iadev = INPH_IA_DEV(dev);  
         if (request_irq(iadev->irq, &ia_int, SA_SHIRQ, DEV_LABEL, dev)) {  
                 printk(KERN_ERR DEV_LABEL "(itf %d): IRQ%d is already in use\n",  
@@ -2510,7 +2510,7 @@ static int __devinit ia_start(struct atm
 	/* Maybe we should reset the front end, initialize Bus Interface Control   
 		Registers and see. */  
   
-	IF_INIT(printk("Bus ctrl reg: %08x\n", 
+	IF_INIT(printk(KERN_DEBUG "Bus ctrl reg: %08x\n", 
                             readl(iadev->reg+IPHASE5575_BUS_CONTROL_REG));)  
 	ctrl_reg = readl(iadev->reg+IPHASE5575_BUS_CONTROL_REG);  
 	ctrl_reg = (ctrl_reg & (CTRL_LED | CTRL_FE_RST))  
@@ -2530,9 +2530,9 @@ static int __devinit ia_start(struct atm
   
        writel(ctrl_reg, iadev->reg+IPHASE5575_BUS_CONTROL_REG);   
   
-	IF_INIT(printk("Bus ctrl reg after initializing: %08x\n", 
+	IF_INIT(printk(KERN_DEBUG "Bus ctrl reg after initializing: %08x\n", 
                            readl(iadev->reg+IPHASE5575_BUS_CONTROL_REG));  
-	   printk("Bus status reg after init: %08x\n", 
+	   printk(KERN_DEBUG "Bus status reg after init: %08x\n", 
                             readl(iadev->reg+IPHASE5575_BUS_STATUS_REG));)  
     
         ia_hw_type(iadev); 
@@ -2545,14 +2545,14 @@ static int __devinit ia_start(struct atm
   
 	ctrl_reg = readl(iadev->reg+IPHASE5575_BUS_CONTROL_REG);  
        	writel(ctrl_reg | CTRL_FE_RST, iadev->reg+IPHASE5575_BUS_CONTROL_REG);   
-	IF_INIT(printk("Bus ctrl reg after initializing: %08x\n", 
+	IF_INIT(printk(KERN_DEBUG "Bus ctrl reg after initializing: %08x\n", 
                                readl(iadev->reg+IPHASE5575_BUS_CONTROL_REG));)  
         phy = 0; /* resolve compiler complaint */
         IF_INIT ( 
 	if ((phy=ia_phy_get(dev,0)) = 0x30)  
-		printk("IA: pm5346,rev.%d\n",phy&0x0f);  
+		printk(KERN_DEBUG "IA: pm5346,rev.%d\n",phy&0x0f);  
 	else  
-		printk("IA: utopia,rev.%0x\n",phy);) 
+		printk(KERN_DEBUG "IA: utopia,rev.%0x\n",phy);) 
 
 	if (iadev->phy_type &  FE_25MBIT_PHY)
            ia_mb25_init(iadev);
@@ -2602,7 +2602,7 @@ static void ia_close(struct atm_vcc *vcc
         ia_vcc = INPH_IA_VCC(vcc);
 	if (!ia_vcc) return;  
 
-        IF_EVENT(printk("ia_close: ia_vcc->vc_desc_cnt = %d  vci = %d\n", 
+        IF_EVENT(printk(KERN_DEBUG "ia_close: ia_vcc->vc_desc_cnt = %d  vci = %d\n", 
                                               ia_vcc->vc_desc_cnt,vcc->vci);)
 	clear_bit(ATM_VF_READY,&vcc->flags);
         skb_queue_head_init (&tmp_tx_backlog);
@@ -2623,7 +2623,7 @@ static void ia_close(struct atm_vcc *vcc
            } 
            while((skb = skb_dequeue(&tmp_tx_backlog))) 
              skb_queue_tail(&iadev->tx_backlog, skb);
-           IF_EVENT(printk("IA TX Done decs_cnt = %d\n", ia_vcc->vc_desc_cnt);) 
+           IF_EVENT(printk(KERN_DEBUG "IA TX Done decs_cnt = %d\n", ia_vcc->vc_desc_cnt);) 
            closetime = 300000 / ia_vcc->pcr;
            if (closetime = 0)
               closetime = 1;
@@ -2680,18 +2680,18 @@ static int ia_open(struct atm_vcc *vcc)
 	int error;  
 	if (!test_bit(ATM_VF_PARTIAL,&vcc->flags))  
 	{  
-		IF_EVENT(printk("ia: not partially allocated resources\n");)  
+		IF_EVENT(printk(KERN_INFO "ia: not partially allocated resources\n");)  
 		vcc->dev_data = NULL;
 	}  
 	iadev = INPH_IA_DEV(vcc->dev);  
 	if (vcc->vci != ATM_VPI_UNSPEC && vcc->vpi != ATM_VCI_UNSPEC)  
 	{  
-		IF_EVENT(printk("iphase open: unspec part\n");)  
+		IF_EVENT(printk(KERN_INFO "iphase open: unspec part\n");)  
 		set_bit(ATM_VF_ADDR,&vcc->flags);
 	}  
 	if (vcc->qos.aal != ATM_AAL5)  
 		return -EINVAL;  
-	IF_EVENT(printk(DEV_LABEL "(itf %d): open %d.%d\n", 
+	IF_EVENT(printk(KERN_INFO DEV_LABEL "(itf %d): open %d.%d\n", 
                                  vcc->dev->number, vcc->vpi, vcc->vci);)  
   
 	/* Device dependent initialization */  
@@ -2701,14 +2701,14 @@ static int ia_open(struct atm_vcc *vcc)
   
 	if ((error = open_rx(vcc)))  
 	{  
-		IF_EVENT(printk("iadev: error in open_rx, closing\n");)  
+		IF_EVENT(printk(KERN_ERR  "iadev: error in open_rx, closing\n");)  
 		ia_close(vcc);  
 		return error;  
 	}  
   
 	if ((error = open_tx(vcc)))  
 	{  
-		IF_EVENT(printk("iadev: error in open_tx, closing\n");)  
+		IF_EVENT(printk(KERN_ERR "iadev: error in open_tx, closing\n");)  
 		ia_close(vcc);  
 		return error;  
 	}  
@@ -2725,13 +2725,13 @@ static int ia_open(struct atm_vcc *vcc)
            }           
         }
 #endif
-	IF_EVENT(printk("ia open returning\n");)  
+	IF_EVENT(printk(KERN_ERR "ia open returning\n");)  
 	return 0;  
 }  
   
 static int ia_change_qos(struct atm_vcc *vcc, struct atm_qos *qos, int flags)  
 {  
-	IF_EVENT(printk(">ia_change_qos\n");)  
+	IF_EVENT(printk(KERN_ERR ">ia_change_qos\n");)  
 	return 0;  
 }  
   
@@ -2741,7 +2741,7 @@ static int ia_ioctl(struct atm_dev *dev,
    IADEV *iadev;
    int i, board;
    u16 __user *tmps;
-   IF_EVENT(printk(">ia_ioctl\n");)  
+   IF_EVENT(printk(KERN_ERR ">ia_ioctl\n");)  
    if (cmd != IA_CMD) {
       if (!dev->phy->ioctl) return -EINVAL;
       return dev->phy->ioctl(dev,cmd,arg);
@@ -2800,7 +2800,7 @@ static int ia_ioctl(struct atm_dev *dev,
                 return -EFAULT;
              }
              kfree(regs_local);
-             printk("Board %d registers dumped\n", board);
+             printk(KERN_ERR "Board %d registers dumped\n", board);
              ia_cmds.status = 0;                  
 	 }	
     	     break;        
@@ -2814,23 +2814,23 @@ static int ia_ioctl(struct atm_dev *dev,
          case 0x6:
          {  
              ia_cmds.status = 0; 
-             printk("skb = 0x%lx\n", (long)skb_peek(&iadev->tx_backlog));
-             printk("rtn_q: 0x%lx\n",(long)ia_deque_rtn_q(&iadev->tx_return_q));
+             printk(KERN_DEBUG "skb = 0x%lx\n", (long)skb_peek(&iadev->tx_backlog));
+             printk(KERN_DEBUG "rtn_q: 0x%lx\n",(long)ia_deque_rtn_q(&iadev->tx_return_q));
          }
              break;
          case 0x8:
          {
              struct k_sonet_stats *stats;
              stats = &PRIV(_ia_dev[board])->sonet_stats;
-             printk("section_bip: %d\n", atomic_read(&stats->section_bip));
-             printk("line_bip   : %d\n", atomic_read(&stats->line_bip));
-             printk("path_bip   : %d\n", atomic_read(&stats->path_bip));
-             printk("line_febe  : %d\n", atomic_read(&stats->line_febe));
-             printk("path_febe  : %d\n", atomic_read(&stats->path_febe));
-             printk("corr_hcs   : %d\n", atomic_read(&stats->corr_hcs));
-             printk("uncorr_hcs : %d\n", atomic_read(&stats->uncorr_hcs));
-             printk("tx_cells   : %d\n", atomic_read(&stats->tx_cells));
-             printk("rx_cells   : %d\n", atomic_read(&stats->rx_cells));
+             printk(KERN_DEBUG "section_bip: %d\n", atomic_read(&stats->section_bip));
+             printk(KERN_DEBUG "line_bip   : %d\n", atomic_read(&stats->line_bip));
+             printk(KERN_DEBUG "path_bip   : %d\n", atomic_read(&stats->path_bip));
+             printk(KERN_DEBUG "line_febe  : %d\n", atomic_read(&stats->line_febe));
+             printk(KERN_DEBUG "path_febe  : %d\n", atomic_read(&stats->path_febe));
+             printk(KERN_DEBUG "corr_hcs   : %d\n", atomic_read(&stats->corr_hcs));
+             printk(KERN_DEBUG "uncorr_hcs : %d\n", atomic_read(&stats->uncorr_hcs));
+             printk(KERN_DEBUG "tx_cells   : %d\n", atomic_read(&stats->tx_cells));
+             printk(KERN_DEBUG "rx_cells   : %d\n", atomic_read(&stats->rx_cells));
          }
             ia_cmds.status = 0;
             break;
@@ -2854,7 +2854,7 @@ static int ia_ioctl(struct atm_dev *dev,
          {  
              ia_cmds.status = 0; 
              IADebugFlag = ia_cmds.maddr;
-             printk("New debug option loaded\n");
+             printk(KERN_INFO "New debug option loaded\n");
          }
              break;
          default:
@@ -2873,14 +2873,14 @@ static int ia_ioctl(struct atm_dev *dev,
 static int ia_getsockopt(struct atm_vcc *vcc, int level, int optname,   
 	void __user *optval, int optlen)  
 {  
-	IF_EVENT(printk(">ia_getsockopt\n");)  
+	IF_EVENT(printk(KERN_ERR ">ia_getsockopt\n");)  
 	return -EINVAL;  
 }  
   
 static int ia_setsockopt(struct atm_vcc *vcc, int level, int optname,   
 	void __user *optval, int optlen)  
 {  
-	IF_EVENT(printk(">ia_setsockopt\n");)  
+	IF_EVENT(printk(KERN_ERR ">ia_setsockopt\n");)  
 	return -EINVAL;  
 }  
   
@@ -2897,7 +2897,7 @@ static int ia_pkt_tx (struct atm_vcc *vc
         iadev = INPH_IA_DEV(vcc->dev);  
         iavcc = INPH_IA_VCC(vcc);
         if (!iavcc->txing) {
-           printk("discard packet on closed VC\n");
+           printk(KERN_INFO "discard packet on closed VC\n");
            if (vcc->pop)
 		vcc->pop(vcc, skb);
            else
@@ -2906,7 +2906,7 @@ static int ia_pkt_tx (struct atm_vcc *vc
         }
 
         if (skb->len > iadev->tx_buf_sz - 8) {
-           printk("Transmit size over tx buffer size\n");
+           printk(KERN_INFO "Transmit size over tx buffer size\n");
            if (vcc->pop)
                  vcc->pop(vcc, skb);
            else
@@ -2914,7 +2914,7 @@ static int ia_pkt_tx (struct atm_vcc *vc
           return 0;
         }
         if ((u32)skb->data & 3) {
-           printk("Misaligned SKB\n");
+           printk(KERN_INFO "Misaligned SKB\n");
            if (vcc->pop)
                  vcc->pop(vcc, skb);
            else
@@ -2934,7 +2934,7 @@ static int ia_pkt_tx (struct atm_vcc *vc
   
 	if ((desc = 0) || (desc > iadev->num_tx_desc))  
 	{  
-		IF_ERR(printk(DEV_LABEL "invalid desc for send: %d\n", desc);) 
+		IF_ERR(printk(KERN_ERR DEV_LABEL "invalid desc for send: %d\n", desc);) 
                 atomic_inc(&vcc->stats->tx);
 		if (vcc->pop)   
 		    vcc->pop(vcc, skb);   
@@ -2945,7 +2945,7 @@ static int ia_pkt_tx (struct atm_vcc *vc
   
 	if (comp_code)  
 	{  
-	    IF_ERR(printk(DEV_LABEL "send desc:%d completion code %d error\n", 
+	    IF_ERR(printk(KERN_ERR DEV_LABEL "send desc:%d completion code %d error\n", 
                                                             desc, comp_code);)  
 	}  
        
@@ -2973,11 +2973,11 @@ static int ia_pkt_tx (struct atm_vcc *vc
            make it  aligned on a 48 byte boundary.  */
 	total_len = skb->len + sizeof(struct cpcs_trailer);  
 	total_len = ((total_len + 47) / 48) * 48;
-	IF_TX(printk("ia packet len:%d padding:%d\n", total_len, total_len - skb->len);)  
+	IF_TX(printk(KERN_DEBUG "ia packet len:%d padding:%d\n", total_len, total_len - skb->len);)  
  
 	/* Put the packet in a tx buffer */   
 	trailer = iadev->tx_buf[desc-1].cpcs;
-        IF_TX(printk("Sent: skb = 0x%x skb->data: 0x%x len: %d, desc: %d\n",
+        IF_TX(printk(KERN_DEBUG "Sent: skb = 0x%x skb->data: 0x%x len: %d, desc: %d\n",
                   (u32)skb, (u32)skb->data, skb->len, desc);)
 	trailer->control = 0; 
         /*big endian*/ 
@@ -2985,7 +2985,7 @@ static int ia_pkt_tx (struct atm_vcc *vc
 	trailer->crc32 = 0;	/* not needed - dummy bytes */  
 
 	/* Display the packet */  
-	IF_TXPKT(printk("Sent data: len = %d MsgNum = %d\n", 
+	IF_TXPKT(printk(KERN_DEBUG "Sent data: len = %d MsgNum = %d\n", 
                                                         skb->len, tcnter++);  
         xdump(skb->data, skb->len, "TX: ");
         printk("\n");)
@@ -3060,7 +3060,7 @@ static int ia_pkt_tx (struct atm_vcc *vc
            }
         }
 #endif
-	IF_TX(printk("ia send done\n");)  
+	IF_TX(printk(KERN_DEBUG "ia send done\n");)  
 	return 0;  
 }  
 
@@ -3182,7 +3182,7 @@ static int __devinit ia_init_one(struct 
 	memset(iadev, 0, sizeof(*iadev));
 	iadev->pci = pdev;
 
-	IF_INIT(printk("ia detected at bus:%d dev: %d function:%d\n",
+	IF_INIT(printk(KERN_INFO "ia detected at bus:%d dev: %d function:%d\n",
 		pdev->bus->number, PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));)
 	if (pci_enable_device(pdev)) {
 		ret = -ENODEV;
@@ -3194,8 +3194,8 @@ static int __devinit ia_init_one(struct 
 		goto err_out_disable_dev;
 	}
 	dev->dev_data = iadev;
-	IF_INIT(printk(DEV_LABEL "registered at (itf :%d)\n", dev->number);)
-	IF_INIT(printk("dev_id = 0x%x iadev->LineRate = %d \n", (u32)dev,
+	IF_INIT(printk(KERN_INFO DEV_LABEL "registered at (itf :%d)\n", dev->number);)
+	IF_INIT(printk(KERN_INFO "dev_id = 0x%x iadev->LineRate = %d \n", (u32)dev,
 		iadev->LineRate);)
 
 	ia_dev[iadev_count] = iadev;
@@ -3205,7 +3205,7 @@ static int __devinit ia_init_one(struct 
 	/* First fixes first. I don't want to think about this now. */
 	spin_lock_irqsave(&iadev->misc_lock, flags); 
 	if (ia_init(dev) || ia_start(dev)) {  
-		IF_INIT(printk("IA register failed!\n");)
+		IF_INIT(printk(KERN_INFO "IA register failed!\n");)
 		iadev_count--;
 		ia_dev[iadev_count] = NULL;
 		_ia_dev[iadev_count] = NULL;
@@ -3214,7 +3214,7 @@ static int __devinit ia_init_one(struct 
 		goto err_out_deregister_dev;
 	}
 	spin_unlock_irqrestore(&iadev->misc_lock, flags); 
-	IF_EVENT(printk("iadev_count = %d\n", iadev_count);)
+	IF_EVENT(printk(KERN_INFO "iadev_count = %d\n", iadev_count);)
 
 	iadev->next_board = ia_boards;  
 	ia_boards = dev;  
@@ -3246,7 +3246,7 @@ static void __devexit ia_remove_one(stru
 	iadev_count--;
 	ia_dev[iadev_count] = NULL;
 	_ia_dev[iadev_count] = NULL;
-	IF_EVENT(printk("deregistering iav at (itf:%d)\n", dev->number);)
+	IF_EVENT(printk(KERN_INFO "deregistering iav at (itf:%d)\n", dev->number);)
 	atm_dev_deregister(dev);
 
       	iounmap(iadev->base);  
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
