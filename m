From: Tony Breeds <tony@bakeyournoodle.com>
Date: Sun, 04 Apr 2004 03:16:00 +0000
Subject: [Kernel-janitors] [PATCH 1/5] remove concatenation with
Message-Id: <1081048590.676@bakeyournoodle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040322052155.GF17221@bakeyournoodle.com>
In-Reply-To: <20040322052155.GF17221@bakeyournoodle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

diff -X dontdiff -purN 2.6.5-rc3.clean/arch/arm/mach-sa1100/h3600.c 2.6.5-rc3.kj_func/arch/arm/mach-sa1100/h3600.c
--- 2.6.5-rc3.clean/arch/arm/mach-sa1100/h3600.c	2004-01-16 21:12:30.000000000 +1100
+++ 2.6.5-rc3.kj_func/arch/arm/mach-sa1100/h3600.c	2004-04-04 12:30:29.000000000 +1000
@@ -481,7 +481,7 @@ static void h3800_control_egpio(enum ipa
 	case IPAQ_EGPIO_CODEC_NRESET:
 	case IPAQ_EGPIO_AUDIO_ON:
 	case IPAQ_EGPIO_QMUTE:
-		printk(__FUNCTION__ ": error - should not be called\n");
+		printk("%s: error - should not be called\n", __FUNCTION__);
 		break;
 	case IPAQ_EGPIO_OPT_NVRAM_ON:
 		SET_ASIC2(GPIO2_OPT_ON_NVRAM);
@@ -523,7 +523,7 @@ static int h3800_pm_callback(int req)
 	static u16 asic2_data;
 	int result = 0;
 
-	printk(__FUNCTION__ " %d\n", req);
+	printk("%s %d\n", __FUNCTION__, req);
 
 	switch (req) {
 	case PM_RESUME:
@@ -551,7 +551,7 @@ static int h3800_pm_callback(int req)
 		asic2_data = H3800_ASIC2_GPIOPIOD;
 		break;
 	default:
-		printk(__FUNCTION__ ": unrecognized PM callback\n");
+		printk("%s: unrecognized PM callback\n", __FUNCTION__);
 		break;
 	}
 	return result;
@@ -591,7 +591,7 @@ static void h3800_IRQ_demux(unsigned int
 {
 	int i;
 
-	if (0) printk(__FUNCTION__ ": interrupt received\n");
+	if (0) printk("%s: interrupt received\n", __FUNCTION__);
 
 	desc->chip->ack(irq);
 
@@ -601,21 +601,21 @@ static void h3800_IRQ_demux(unsigned int
 
 		/* KPIO */
 		irq = H3800_ASIC2_KPIINTFLAG;
-		if (0) printk(__FUNCTION__" KPIO 0x%08X\n", irq);
+		if (0) printk("%s KPIO 0x%08X\n", __FUNCTION__, irq);
 		for (j = 0; j < H3800_KPIO_IRQ_COUNT; j++)
 			if (irq & kpio_irq_mask[j])
 				do_edge_IRQ(H3800_KPIO_IRQ_COUNT + j, irq_desc + H3800_KPIO_IRQ_COUNT + j, regs);
 
 		/* GPIO2 */
 		irq = H3800_ASIC2_GPIINTFLAG;
-		if (0) printk(__FUNCTION__" GPIO 0x%08X\n", irq);
+		if (0) printk("%s GPIO 0x%08X\n", __FUNCTION__, irq);
 		for (j = 0; j < H3800_GPIO_IRQ_COUNT; j++)
 			if (irq & gpio_irq_mask[j])
 				do_edge_IRQ(H3800_GPIO_IRQ_COUNT + j, irq_desc + H3800_GPIO_IRQ_COUNT + j , regs);
 	}
 
 	if (i >= MAX_ASIC_ISR_LOOPS)
-		printk(__FUNCTION__ ": interrupt processing overrun\n");
+		printk("%s: interrupt processing overrun\n", __FUNCTION__);
 
 	/* For level-based interrupts */
 	desc->chip->unmask(irq);
diff -X dontdiff -purN 2.6.5-rc3.clean/arch/mips/au1000/common/usbdev.c 2.6.5-rc3.kj_func/arch/mips/au1000/common/usbdev.c
--- 2.6.5-rc3.clean/arch/mips/au1000/common/usbdev.c	2004-03-11 17:56:57.000000000 +1100
+++ 2.6.5-rc3.kj_func/arch/mips/au1000/common/usbdev.c	2004-04-04 12:55:17.000000000 +1000
@@ -199,12 +199,12 @@ get_std_req_name(int req)
 static void
 dump_setup(struct usb_ctrlrequest* s)
 {
-	dbg(__FUNCTION__ ": requesttype=%d", s->requesttype);
-	dbg(__FUNCTION__ ": request=%d %s", s->request,
+	dbg("%s: requesttype=%d", __FUNCTION__, s->requesttype);
+	dbg("%s: request=%d %s", __FUNCTION__, s->request,
 	    get_std_req_name(s->request));
-	dbg(__FUNCTION__ ": value=0x%04x", s->wValue);
-	dbg(__FUNCTION__ ": index=%d", s->index);
-	dbg(__FUNCTION__ ": length=%d", s->length);
+	dbg("%s: value=0x%04x", __FUNCTION__, s->wValue);
+	dbg("%s: index=%d", __FUNCTION__, s->index);
+	dbg("%s: length=%d", __FUNCTION__, s->length);
 }
 #endif
 
@@ -436,10 +436,10 @@ kickstart_send_packet(endpoint_t * ep)
 	u32 cs;
 	usbdev_pkt_t *pkt = ep->inlist.head;
 
-	vdbg(__FUNCTION__ ": ep%d, pkt=%p", ep->address, pkt);
+	vdbg("%s: ep%d, pkt=%p", __FUNCTION__, ep->address, pkt);
 
 	if (!pkt) {
-		err(__FUNCTION__ ": head=NULL! list->count=%d",
+		err("%s: head=NULL! list->count=%d", __FUNCTION__,
 		    ep->inlist.count);
 		return;
 	}
@@ -484,7 +484,7 @@ send_packet_complete(endpoint_t * ep)
 			(au_readl(ep->reg->ctrl_stat) & USBDEV_CS_NAK) ?
 			PKT_STATUS_NAK : PKT_STATUS_ACK;
 
-		vdbg(__FUNCTION__ ": ep%d, %s pkt=%p, list count=%d",
+		vdbg("%s: ep%d, %s pkt=%p, list count=%d", __FUNCTION__,
 		     ep->address, (pkt->status & PKT_STATUS_NAK) ?
 		     "NAK" : "ACK", pkt, ep->inlist.count);
 	}
@@ -529,7 +529,7 @@ send_packet(struct usb_dev* dev, usbdev_
 
 	link_tail(ep, list, pkt);
 
-	vdbg(__FUNCTION__ ": ep%d, pkt=%p, size=%d, list count=%d",
+	vdbg("%s: ep%d, pkt=%p, size=%d, list count=%d", __FUNCTION__, 
 	     ep->address, pkt, pkt->size, list->count);
 
 	if (list->count = 1) {
@@ -555,7 +555,7 @@ kickstart_receive_packet(endpoint_t * ep
 
 	// get and link a new packet for next reception
 	if (!(pkt = add_packet(ep, &ep->outlist, ep->max_pkt_size))) {
-		err(__FUNCTION__ ": could not alloc new packet");
+		err("%s: could not alloc new packet", __FUNCTION__);
 		return;
 	}
 
@@ -615,7 +615,7 @@ receive_packet_complete(endpoint_t * ep)
 	if (ep->address = 0 && (cs & USBDEV_CS_SU))
 		pkt->status |= PKT_STATUS_SU;
 
-	vdbg(__FUNCTION__ ": ep%d, %s pkt=%p, size=%d",
+	vdbg("%s: ep%d, %s pkt=%p, size=%d", __FUNCTION__,
 	     ep->address, (pkt->status & PKT_STATUS_NAK) ?
 	     "NAK" : "ACK", pkt, pkt->size);
 
@@ -719,7 +719,7 @@ do_set_address(struct usb_dev* dev, stru
 	int new_state = dev->state;
 	int new_addr = le16_to_cpu(setup->wValue);
 
-	dbg(__FUNCTION__ ": our address=%d", new_addr);
+	dbg("%s: our address=%d", __FUNCTION__, new_addr);
 
 	if (new_addr > 127) {
 			// usb spec doesn't tell us what to do, so just go to
@@ -918,18 +918,18 @@ do_setup (struct usb_dev* dev, struct us
 {
 	req_method_t m;
 
-	dbg(__FUNCTION__ ": req %d %s", setup->bRequestType,
+	dbg("%s: req %d %s", __FUNCTION__, setup->bRequestType,
 	    get_std_req_name(setup->bRequestType));
 
 	if ((setup->bRequestType & USB_TYPE_MASK) != USB_TYPE_STANDARD ||
 	    (setup->bRequestType & USB_RECIP_MASK) != USB_RECIP_DEVICE) {
-		err(__FUNCTION__ ": invalid requesttype 0x%02x",
+		err("%s: invalid requesttype 0x%02x", __FUNCTION__,
 		    setup->bRequestType);
 		return;
 		}
 
 	if ((setup->bRequestType & 0x80) = USB_DIR_OUT && setup->wLength)
-		dbg(__FUNCTION__ ": OUT phase! length=%d", setup->wLength);
+		dbg("%s: OUT phase! length=%d", __FUNCTION__, setup->wLength);
 
 	if (setup->bRequestType < sizeof(req_method)/sizeof(req_method_t))
 		m = req_method[setup->bRequestType];
@@ -980,7 +980,7 @@ process_ep0_receive (struct usb_dev* dev
 #endif
 			do_setup(dev, (struct usb_ctrlrequest*)pkt->payload);
 		} else
-			err(__FUNCTION__ ": wrong size SETUP received");
+			err("%s: wrong size SETUP received", __FUNCTION__);
 		break;
 	case DATA_STAGE:
 		/*
diff -X dontdiff -purN 2.6.5-rc3.clean/arch/mips/mm-64/tlb-dbg-r4k.c 2.6.5-rc3.kj_func/arch/mips/mm-64/tlb-dbg-r4k.c
--- 2.6.5-rc3.clean/arch/mips/mm-64/tlb-dbg-r4k.c	2004-01-16 21:09:09.000000000 +1100
+++ 2.6.5-rc3.kj_func/arch/mips/mm-64/tlb-dbg-r4k.c	2004-04-04 12:30:29.000000000 +1000
@@ -24,7 +24,7 @@ asmlinkage void do_page_fault(struct pt_
 asmlinkage void tlb_refill_debug(struct pt_regs regs)
 {
 	show_regs(&regs);
-	panic(__FUNCTION__ " called.  This Does Not Happen (TM).");
+	panic("%s called.  This Does Not Happen (TM).", __FUNCTION__);
 }
 
 asmlinkage void xtlb_refill_debug(struct pt_regs *regs)

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
