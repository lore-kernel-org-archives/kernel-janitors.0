From: Richard <h.vanberkum@chello.nl>
Date: Sun, 02 Jul 2006 13:55:20 +0000
Subject: [KJ] [Kj] [PATCH] drivers/atm/idt77252.c: Fix KERN_* in printk
Message-Id: <44A7EED4.10905@chello.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is my first patch. If there's anything wrong with it I would like to hear it. There are far more printk statements to be fixed, but I would like to see if this patch survives.
I also used KERN_INFO and KERN_ERR on an intuitive level. Any recommendations on this are welcome.

Signed-off-by: Richard van Berkum


--- janitor-2.6/drivers/atm/idt77252.c	2006-07-01 11:54:45.529132728 +0200
+++ mytree/drivers/atm/idt77252.c	2006-07-02 17:24:27.844282464 +0200
@@ -194,7 +194,7 @@ write_sram(struct idt77252_dev *card, un
 	      (addr < card->tst[0] + card->tst_size)) ||
 	     ((addr > card->tst[1] + card->tst_size - 2) &&
 	      (addr < card->tst[1] + card->tst_size)))) {
-		printk("%s: ERROR: TST JMP section at %08lx written: %08x\n",
+		printk(KERN_ERR "%s: ERROR: TST JMP section at %08lx written: %08x\n",
 		       card->name, addr, value);
 	}
 
@@ -213,7 +213,7 @@ read_utility(void *dev, unsigned long ub
 	u8 value;
 
 	if (!card) {
-		printk("Error: No such device.\n");
+		printk(KERN_ERR "Error: No such device.\n");
 		return -1;
 	}
 
@@ -232,7 +232,7 @@ write_utility(void *dev, unsigned long u
 	unsigned long flags;
 
 	if (!card) {
-		printk("Error: No such device.\n");
+		printk(KERN_ERR "Error: No such device.\n");
 		return;
 	}
 
@@ -539,7 +539,7 @@ dump_tct(struct idt77252_dev *card, int 
 
 	tct = (unsigned long) (card->tct_base + index * SAR_SRAM_TCT_SIZE);
 
-	printk("%s: TCT %x:", card->name, index);
+	printk(KERN_INFO "%s: TCT %x:", card->name, index);
 	for (i = 0; i < 8; i++) {
 		printk(" %08x", read_sram(card, tct + i));
 	}
@@ -553,7 +553,7 @@ idt77252_tx_dump(struct idt77252_dev *ca
 	struct vc_map *vc;
 	int i;
 
-	printk("%s\n", __FUNCTION__);
+	printk(KERN_DEBUG "%s\n", __FUNCTION__);
 	for (i = 0; i < card->tct_size; i++) {
 		vc = card->vcs[i];
 		if (!vc)
@@ -568,7 +568,7 @@ idt77252_tx_dump(struct idt77252_dev *ca
 		if (!vcc)
 			continue;
 
-		printk("%s: Connection %d:\n", card->name, vc->index);
+		printk(KERN_INFO "%s: Connection %d:\n", card->name, vc->index);
 		dump_tct(card, vc->index);
 	}
 }
@@ -843,14 +843,14 @@ queue_skb(struct idt77252_dev *card, str
 	int aal;
 
 	if (skb->len = 0) {
-		printk("%s: invalid skb->len (%d)\n", card->name, skb->len);
+		printk(KERN_ERR "%s: invalid skb->len (%d)\n", card->name, skb->len);
 		return -EINVAL;
 	}
 
 	TXPRINTK("%s: Sending %d bytes of data.\n",
 		 card->name, skb->len);
 
-	tbd = &IDT77252_PRV_TBD(skb);
+	tbd = &DT77252_PRV_TBD(skb);
 	vcc = ATM_SKB(skb)->vcc;
 
 	IDT77252_PRV_PADDR(skb) = pci_map_single(card->pcidev, skb->data,
@@ -875,7 +875,7 @@ queue_skb(struct idt77252_dev *card, str
 	}
 
 	if (test_bit(VCF_RSV, &vc->flags)) {
-		printk("%s: Trying to transmit on reserved VC\n", card->name);
+		printk(KERN_INFO "%s: Trying to transmit on reserved VC\n", card->name);
 		goto errout;
 	}
 
@@ -911,7 +911,7 @@ queue_skb(struct idt77252_dev *card, str
 	case ATM_AAL1:
 	case ATM_AAL2:
 	default:
-		printk("%s: Traffic type not supported.\n", card->name);
+		printk(KERN_INFO "%s: Traffic type not supported.\n", card->name);
 		error = -EPROTONOSUPPORT;
 		goto errout;
 	}
@@ -980,7 +980,7 @@ init_rsq(struct idt77252_dev *card)
 	card->rsq.base = pci_alloc_consistent(card->pcidev, RSQSIZE,
 					      &card->rsq.paddr);
 	if (card->rsq.base = NULL) {
-		printk("%s: can't allocate RSQ.\n", card->name);
+		printk(KERN_ERR "%s: can't allocate RSQ.\n", card->name);
 		return -1;
 	}
 	memset(card->rsq.base, 0, RSQSIZE);
@@ -1034,7 +1034,7 @@ dequeue_rx(struct idt77252_dev *card, st
 
 	skb = sb_pool_skb(card, le32_to_cpu(rsqe->word_2));
 	if (skb = NULL) {
-		printk("%s: NULL skb in %s, rsqe: %08x %08x %08x %08x\n",
+		printk(KERN_ERR "%s: NULL skb in %s, rsqe: %08x %08x %08x %08x\n",
 		       card->name, __FUNCTION__,
 		       le32_to_cpu(rsqe->word_1), le32_to_cpu(rsqe->word_2),
 		       le32_to_cpu(rsqe->word_3), le32_to_cpu(rsqe->word_4));
@@ -1049,7 +1049,7 @@ dequeue_rx(struct idt77252_dev *card, st
 		 card->name, vpi, vci, skb, skb->data);
 
 	if ((vpi >= (1 << card->vpibits)) || (vci != (vci & card->vcimask))) {
-		printk("%s: SDU received for out-of-range vc %u.%u\n",
+		printk(KERN_INFO "%s: SDU received for out-of-range vc %u.%u\n",
 		       card->name, vpi, vci);
 		recycle_rx_skb(card, skb);
 		return;
@@ -1057,7 +1057,7 @@ dequeue_rx(struct idt77252_dev *card, st
 
 	vc = card->vcs[VPCI2VC(card, vpi, vci)];
 	if (!vc || !test_bit(VCF_RX, &vc->flags)) {
-		printk("%s: SDU received on non RX vc %u.%u\n",
+		printk(KERN_INFO "%s: SDU received on non RX vc %u.%u\n",
 		       card->name, vpi, vci);
 		recycle_rx_skb(card, skb);
 		return;
@@ -1077,7 +1077,7 @@ dequeue_rx(struct idt77252_dev *card, st
 		cell = skb->data;
 		for (i = (stat & SAR_RSQE_CELLCNT); i; i--) {
 			if ((sb = dev_alloc_skb(64)) = NULL) {
-				printk("%s: Can't allocate buffers for aal0.\n",
+				printk(KERN_ERR "%s: Can't allocate buffers for aal0.\n",
 				       card->name);
 				atomic_add(i, &vcc->stats->rx_drop);
 				break;
@@ -1111,7 +1111,7 @@ dequeue_rx(struct idt77252_dev *card, st
 		return;
 	}
 	if (vcc->qos.aal != ATM_AAL5) {
-		printk("%s: Unexpected AAL type in dequeue_rx(): %d.\n",
+		printk(KERN_ERR "%s: Unexpected AAL type in dequeue_rx(): %d.\n",
 		       card->name, vcc->qos.aal);
 		recycle_rx_skb(card, skb);
 		return;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
