From: Richard <h.vanberkum@chello.nl>
Date: Sun, 02 Jul 2006 18:57:45 +0000
Subject: [KJ] [PATCH 2] drivers/atm/idt77252.c: Fix more KERN_* in printk
Message-Id: <44A83604.5090700@chello.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Second part of the patch. Third will follow

Signed-off-by: Richard van Berkum



--- janitor-2.6/drivers/atm/idt77252.c	2006-07-02 22:54:11.964639008 +0200
+++ mytree/drivers/atm/idt77252.c	2006-07-02 23:01:58.560705624 +0200
@@ -1285,14 +1285,14 @@ idt77252_rx_raw(struct idt77252_dev *car
 		if (debug & DBG_RAW_CELL) {
 			int i;
 
-			printk("%s: raw cell %x.%02x.%04x.%x.%x\n",
+			printk(KERN_DEBUG "%s: raw cell %x.%02x.%04x.%x.%x\n",
 			       card->name, (header >> 28) & 0x000f,
 			       (header >> 20) & 0x00ff,
 			       (header >>  4) & 0xffff,
 			       (header >>  1) & 0x0007,
 			       (header >>  0) & 0x0001);
 			for (i = 16; i < 64; i++)
-				printk(" %02x", queue->data[i]);
+				printk("KERN_DEBUG %02x", queue->data[i]);
 			printk("\n");
 		}
 #endif
@@ -1320,7 +1320,7 @@ idt77252_rx_raw(struct idt77252_dev *car
 		}
 	
 		if ((sb = dev_alloc_skb(64)) = NULL) {
-			printk("%s: Can't allocate buffers for AAL0.\n",
+			printk(KERN_ERR "%s: Can't allocate buffers for AAL0.\n",
 			       card->name);
 			atomic_inc(&vcc->stats->rx_err);
 			goto drop;
@@ -1368,7 +1368,7 @@ drop:
 							    PCI_DMA_FROMDEVICE);
 			} else {
 				card->raw_cell_head = NULL;
-				printk("%s: raw cell queue overrun\n",
+				printk(KERN_ERR "%s: raw cell queue overrun\n",
 				       card->name);
 				break;
 			}
@@ -1391,7 +1391,7 @@ init_tsq(struct idt77252_dev *card)
 	card->tsq.base = pci_alloc_consistent(card->pcidev, RSQSIZE,
 					      &card->tsq.paddr);
 	if (card->tsq.base = NULL) {
-		printk("%s: can't allocate TSQ.\n", card->name);
+		printk(KERN_ERR "%s: can't allocate TSQ.\n", card->name);
 		return -1;
 	}
 	memset(card->tsq.base, 0, TSQSIZE);
@@ -1456,7 +1456,7 @@ idt77252_tx(struct idt77252_dev *card)
 
 			if (SAR_TSQE_TAG(stat) = 0x10) {
 #ifdef	NOTDEF
-				printk("%s: Connection %d halted.\n",
+				printk(KERN_INFO "%s: Connection %d halted.\n",
 				       card->name,
 				       le32_to_cpu(tsqe->word_1) & 0x1fff);
 #endif
@@ -1465,12 +1465,12 @@ idt77252_tx(struct idt77252_dev *card)
 
 			vc = card->vcs[conn & 0x1fff];
 			if (!vc) {
-				printk("%s: could not find VC from conn %d\n",
+				printk(KERN_ERR "%s: could not find VC from conn %d\n",
 				       card->name, conn & 0x1fff);
 				break;
 			}
 
-			printk("%s: Connection %d IDLE.\n",
+			printk(KERN_INFO "%s: Connection %d IDLE.\n",
 			       card->name, vc->index);
 
 			set_bit(VCF_IDLE, &vc->flags);
@@ -1482,7 +1482,7 @@ idt77252_tx(struct idt77252_dev *card)
 
 			vc = card->vcs[conn & 0x1fff];
 			if (!vc) {
-				printk("%s: no VC at index %d\n",
+				printk("KERN_INFO %s: no VC at index %d\n",
 				       card->name,
 				       le32_to_cpu(tsqe->word_1) & 0x1fff);
 				break;
@@ -1500,7 +1500,7 @@ idt77252_tx(struct idt77252_dev *card)
 
 			if (vpi >= (1 << card->vpibits) ||
 			    vci >= (1 << card->vcibits)) {
-				printk("%s: TBD complete: "
+				printk(KERN_INFO "%s: TBD complete: "
 				       "out of range VPI.VCI %u.%u\n",
 				       card->name, vpi, vci);
 				break;
@@ -1508,7 +1508,7 @@ idt77252_tx(struct idt77252_dev *card)
 
 			vc = card->vcs[VPCI2VC(card, vpi, vci)];
 			if (!vc) {
-				printk("%s: TBD complete: "
+				printk(KERN_INFO "%s: TBD complete: "
 				       "no VC at VPI.VCI %u.%u\n",
 				       card->name, vpi, vci);
 				break;
@@ -1620,7 +1620,7 @@ __fill_tst(struct idt77252_dev *card, st
 			break;
 	}
 	if (e >= avail) {
-		printk("%s: No free TST entries found\n", card->name);
+		printk(KERN_ERR "%s: No free TST entries found\n", card->name);
 		return -1;
 	}
 
@@ -1870,7 +1870,7 @@ add_rx_skb(struct idt77252_dev *card, in
 			return;
 
 		if (sb_pool_add(card, skb, queue)) {
-			printk("%s: SB POOL full\n", __FUNCTION__);
+			printk(KERN_DEBUG "%s: SB POOL full\n", __FUNCTION__);
 			goto outfree;
 		}
 
@@ -1880,7 +1880,7 @@ add_rx_skb(struct idt77252_dev *card, in
 		IDT77252_PRV_PADDR(skb) = paddr;
 
 		if (push_rx_skb(card, skb, queue)) {
-			printk("%s: FB QUEUE full\n", __FUNCTION__);
+			printk(KERN_DEBUG "%s: FB QUEUE full\n", __FUNCTION__);
 			goto outunmap;
 		}
 	}
@@ -1969,13 +1969,13 @@ idt77252_send_skb(struct atm_vcc *vcc, s
 	int err;
 
 	if (vc = NULL) {
-		printk("%s: NULL connection in send().\n", card->name);
+		printk(KERN_ERR "%s: NULL connection in send().\n", card->name);
 		atomic_inc(&vcc->stats->tx_err);
 		dev_kfree_skb(skb);
 		return -EINVAL;
 	}
 	if (!test_bit(VCF_TX, &vc->flags)) {
-		printk("%s: Trying to transmit on a non-tx VC.\n", card->name);
+		printk(KERN_ERR "%s: Trying to transmit on a non-tx VC.\n", card->name);
 		atomic_inc(&vcc->stats->tx_err);
 		dev_kfree_skb(skb);
 		return -EINVAL;
@@ -1987,14 +1987,14 @@ idt77252_send_skb(struct atm_vcc *vcc, s
 	case ATM_AAL5:
 		break;
 	default:
-		printk("%s: Unsupported AAL: %d\n", card->name, vcc->qos.aal);
+		printk(KERN_ERR "%s: Unsupported AAL: %d\n", card->name, vcc->qos.aal);
 		atomic_inc(&vcc->stats->tx_err);
 		dev_kfree_skb(skb);
 		return -EINVAL;
 	}
 
 	if (skb_shinfo(skb)->nr_frags != 0) {
-		printk("%s: No scatter-gather yet.\n", card->name);
+		printk(KERN_ERR "%s: No scatter-gather yet.\n", card->name);
 		atomic_inc(&vcc->stats->tx_err);
 		dev_kfree_skb(skb);
 		return -EINVAL;
@@ -2026,7 +2026,7 @@ idt77252_send_oam(struct atm_vcc *vcc, v
 
 	skb = dev_alloc_skb(64);
 	if (!skb) {
-		printk("%s: Out of memory in send_oam().\n", card->name);
+		printk(KERN_ERR "%s: Out of memory in send_oam().\n", card->name);
 		atomic_inc(&vcc->stats->tx_err);
 		return -ENOMEM;
 	}
@@ -2172,7 +2172,7 @@ idt77252_init_cbr(struct idt77252_dev *c
 
 	if ((qos->txtp.max_pcr = 0) &&
 	    (qos->txtp.pcr = 0) && (qos->txtp.min_pcr = 0)) {
-		printk("%s: trying to open a CBR VC with cell rate = 0\n",
+		printk(KERN_ERR "%s: trying to open a CBR VC with cell rate = 0\n",
 		       card->name);
 		return -EINVAL;
 	}
@@ -2198,19 +2198,19 @@ idt77252_init_cbr(struct idt77252_dev *c
 	} else if (tcr = 0) {
 		tst_entries = tst_free - SAR_TST_RESERVED;
 		if (tst_entries <= 0) {
-			printk("%s: no CBR bandwidth free.\n", card->name);
+			printk(KERN_ERR "%s: no CBR bandwidth free.\n", card->name);
 			return -ENOSR;
 		}
 	}
 
 	if (tst_entries = 0) {
-		printk("%s: selected CBR bandwidth < granularity.\n",
+		printk(KERN_ERR "%s: selected CBR bandwidth < granularity.\n",
 		       card->name);
 		return -EINVAL;
 	}
 
 	if (tst_entries > (tst_free - SAR_TST_RESERVED)) {
-		printk("%s: not enough CBR bandwidth free.\n", card->name);
+		printk(KERN_ERR "%s: not enough CBR bandwidth free.\n", card->name);
 		return -ENOSR;
 	}
 
@@ -2290,13 +2290,13 @@ idt77252_init_tx(struct idt77252_dev *ca
 
 	vc->scq = alloc_scq(card, vc->class);
 	if (!vc->scq) {
-		printk("%s: can't get SCQ.\n", card->name);
+		printk(KERN_ERR "%s: can't get SCQ.\n", card->name);
 		return -ENOMEM;
 	}
 
 	vc->scq->scd = get_free_scd(card, vc);
 	if (vc->scq->scd = 0) {
-		printk("%s: no SCD available.\n", card->name);
+		printk(KERN_ERR "%s: no SCD available.\n", card->name);
 		free_scq(card, vc->scq);
 		return -ENOMEM;
 	}
@@ -2422,12 +2422,12 @@ idt77252_open(struct atm_vcc *vcc)
 		return 0;
 
 	if (vpi >= (1 << card->vpibits)) {
-		printk("%s: unsupported VPI: %d\n", card->name, vpi);
+		printk(KERN_ERR "%s: unsupported VPI: %d\n", card->name, vpi);
 		return -EINVAL;
 	}
 
 	if (vci >= (1 << card->vcibits)) {
-		printk("%s: unsupported VCI: %d\n", card->name, vci);
+		printk(KERN_ERR "%s: unsupported VCI: %d\n", card->name, vci);
 		return -EINVAL;
 	}
 
@@ -2443,7 +2443,7 @@ idt77252_open(struct atm_vcc *vcc)
 	case ATM_AAL5:
 		break;
 	default:
-		printk("%s: Unsupported AAL: %d\n", card->name, vcc->qos.aal);
+		printk(KERN_ERR "%s: Unsupported AAL: %d\n", card->name, vcc->qos.aal);
 		up(&card->mutex);
 		return -EPROTONOSUPPORT;
 	}
@@ -2452,7 +2452,7 @@ idt77252_open(struct atm_vcc *vcc)
 	if (!card->vcs[index]) {
 		card->vcs[index] = kmalloc(sizeof(struct vc_map), GFP_KERNEL);
 		if (!card->vcs[index]) {
-			printk("%s: can't alloc vc in open()\n", card->name);
+			printk(KERN_ERR "%s: can't alloc vc in open()\n", card->name);
 			up(&card->mutex);
 			return -ENOMEM;
 		}
@@ -2482,7 +2482,7 @@ idt77252_open(struct atm_vcc *vcc)
 		inuse += 2;
 
 	if (inuse) {
-		printk("%s: %s vci already in use.\n", card->name,
+		printk(KERN_ERR "%s: %s vci already in use.\n", card->name,
 		       inuse = 1 ? "tx" : inuse = 2 ? "rx" : "tx and rx");
 		up(&card->mutex);
 		return -EADDRINUSE;
@@ -2575,7 +2575,7 @@ done:
 				break;
 		}
 		if (!timeout)
-			printk("%s: SCQ drain timeout: %u used\n",
+			printk(KERN_INFO "%s: SCQ drain timeout: %u used\n",
 			       card->name, atomic_read(&vc->scq->used));
 
 		writel(TCMDQ_HALT | vc->index, SAR_REG_TCMDQ);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
