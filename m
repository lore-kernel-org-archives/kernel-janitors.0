From: Tony Breeds <tony@bakeyournoodle.com>
Date: Sat, 27 Mar 2004 05:12:03 +0000
Subject: [Kernel-janitors] [PATCH 0/5] remove concatenation with
Message-Id: <20040327051203.GD3445@bakeyournoodle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040322052155.GF17221@bakeyournoodle.com>
In-Reply-To: <20040322052155.GF17221@bakeyournoodle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


--------------------------------------------------------------------------------
diff -X dontdiff -purN 2.6.4.clean/drivers/char/ftape/lowlevel/ftape-tracing.h 2.6.4.kj_func/drivers/char/ftape/lowlevel/ftape-tracing.h
--- 2.6.4.clean/drivers/char/ftape/lowlevel/ftape-tracing.h	2000-09-04 05:22:09.000000000 +1100
+++ 2.6.4.kj_func/drivers/char/ftape/lowlevel/ftape-tracing.h	2004-03-26 14:38:24.000000000 +1100
@@ -70,8 +70,8 @@ typedef enum {
 #define TRACE(l, m, i...)						\
 {									\
 	if ((ft_trace_t)(l) = FT_TRACE_TOP_LEVEL) {			\
-		printk(KERN_INFO"ftape"__FILE__"("__FUNCTION__"):\n"	\
-		       KERN_INFO m".\n" ,##i);				\
+		printk(KERN_INFO"ftape%s(%s):\n"	                \
+		       KERN_INFO m".\n" ,__FILE__, __FUNCTION__ , ##i);	\
 	}								\
 }
 #define SET_TRACE_LEVEL(l)      if ((l) = (l)) do {} while(0)
diff -X dontdiff -purN 2.6.4.clean/drivers/char/serial_tx3912.h 2.6.4.kj_func/drivers/char/serial_tx3912.h
--- 2.6.4.clean/drivers/char/serial_tx3912.h	2004-01-15 16:40:24.000000000 +1100
+++ 2.6.4.kj_func/drivers/char/serial_tx3912.h	2004-03-26 14:32:44.000000000 +1100
@@ -59,9 +59,9 @@ int rs_debug = TX3912_UART_DEBUG_ALL & ~
 
 #define rs_dprintk(f, str...) if (rs_debug & f) printk (str)
 #define func_enter() rs_dprintk (TX3912_UART_DEBUG_FLOW,	\
-				"rs: enter " __FUNCTION__ "\n")
+				"rs: enter %s\n", __FUNCTION__)
 #define func_exit() rs_dprintk (TX3912_UART_DEBUG_FLOW,	\
-				"rs: exit " __FUNCTION__ "\n")
+				"rs: exit %s\n", __FUNCTION__)
 
 #else
 #define rs_dprintk(f, str...)
diff -X dontdiff -purN 2.6.4.clean/drivers/char/watchdog/machzwd.c 2.6.4.kj_func/drivers/char/watchdog/machzwd.c
--- 2.6.4.clean/drivers/char/watchdog/machzwd.c	2004-03-11 17:57:13.000000000 +1100
+++ 2.6.4.kj_func/drivers/char/watchdog/machzwd.c	2004-03-26 14:32:44.000000000 +1100
@@ -151,7 +151,7 @@ static unsigned long next_heartbeat = 0;
 #ifndef ZF_DEBUG
 #	define dprintk(format, args...)
 #else
-#	define dprintk(format, args...) printk(KERN_DEBUG PFX; ":" __FUNCTION__ ":%d: " format, __LINE__ , ## args)
+#	define dprintk(format, args...) printk(KERN_DEBUG PFX ":%s:%d: " format, __FUNCTION__, __LINE__ , ## args)
 #endif
 
 
diff -X dontdiff -purN 2.6.4.clean/drivers/isdn/i4l/isdn_net.h 2.6.4.kj_func/drivers/isdn/i4l/isdn_net.h
--- 2.6.4.clean/drivers/isdn/i4l/isdn_net.h	2004-03-11 17:57:21.000000000 +1100
+++ 2.6.4.kj_func/drivers/isdn/i4l/isdn_net.h	2004-03-26 14:32:44.000000000 +1100
@@ -106,8 +106,8 @@ static __inline__ void isdn_net_add_to_b
 	spin_lock_irqsave(&nd->queue_lock, flags);
 
 	lp = nd->queue;
-//	printk(KERN_DEBUG __FUNCTION__": lp:%s(%p) nlp:%s(%p) last(%p)\n",
-//		lp->name, lp, nlp->name, nlp, lp->last); 
+//	printk(KERN_DEBUG "%s: lp:%s(%p) nlp:%s(%p) last(%p)\n",
+//		__FUNCTION__, lp->name, lp, nlp->name, nlp, lp->last); 
 	nlp->last = lp->last;
 	lp->last->next = nlp;
 	lp->last = nlp;
@@ -127,8 +127,8 @@ static __inline__ void isdn_net_rm_from_
 	if (lp->master)
 		master_lp = (isdn_net_local *) lp->master->priv;
 
-//	printk(KERN_DEBUG __FUNCTION__": lp:%s(%p) mlp:%s(%p) last(%p) next(%p) mndq(%p)\n",
-//		lp->name, lp, master_lp->name, master_lp, lp->last, lp->next, master_lp->netdev->queue); 
+//	printk(KERN_DEBUG "%s: lp:%s(%p) mlp:%s(%p) last(%p) next(%p) mndq(%p)\n",
+//		__FUNCTION__, lp->name, lp, master_lp->name, master_lp, lp->last, lp->next, master_lp->netdev->queue); 
 	spin_lock_irqsave(&master_lp->netdev->queue_lock, flags);
 	lp->last->next = lp->next;
 	lp->next->last = lp->last;
@@ -139,8 +139,8 @@ static __inline__ void isdn_net_rm_from_
 		}
 	}
 	lp->next = lp->last = lp;	/* (re)set own pointers */
-//	printk(KERN_DEBUG __FUNCTION__": mndq(%p)\n",
-//		master_lp->netdev->queue); 
+//	printk(KERN_DEBUG "%s: mndq(%p)\n",
+//		__FUNCTION__, master_lp->netdev->queue); 
 	spin_unlock_irqrestore(&master_lp->netdev->queue_lock, flags);
 }
 
diff -X dontdiff -purN 2.6.4.clean/drivers/media/video/w9966.c 2.6.4.kj_func/drivers/media/video/w9966.c
--- 2.6.4.clean/drivers/media/video/w9966.c	2004-03-11 17:57:23.000000000 +1100
+++ 2.6.4.kj_func/drivers/media/video/w9966.c	2004-03-26 14:38:30.000000000 +1100
@@ -63,7 +63,7 @@
 //#define DEBUG				// Undef me for production
 
 #ifdef DEBUG
-#define DPRINTF(x, a...) printk(KERN_DEBUG "W9966: "__FUNCTION__ "(): "x, ##a)
+#define DPRINTF(x, a...) printk(KERN_DEBUG "W9966: %s(): "x, __FUNCTION__ , ##a)
 #else
 #define DPRINTF(x...)
 #endif
diff -X dontdiff -purN 2.6.4.clean/drivers/mtd/chips/cfi_cmdset_0001.c 2.6.4.kj_func/drivers/mtd/chips/cfi_cmdset_0001.c
--- 2.6.4.clean/drivers/mtd/chips/cfi_cmdset_0001.c	2004-02-19 07:18:53.000000000 +1100
+++ 2.6.4.kj_func/drivers/mtd/chips/cfi_cmdset_0001.c	2004-03-26 14:32:44.000000000 +1100
@@ -1575,7 +1575,7 @@ static int cfi_intelext_lock(struct mtd_
 					ofs, len, DO_XXLOCK_ONEBLOCK_LOCK);
 	
 #ifdef DEBUG_LOCK_BITS
-	printk(KERN_DEBUG __FUNCTION__
+	printk(KERN_DEBUG 
 	       "%s: lock status after, ret=%d\n", __FUNCTION__, ret);
 	cfi_intelext_varsize_frob(mtd, do_printlockstatus_oneblock,
 				  ofs, len, 0);
diff -X dontdiff -purN 2.6.4.clean/drivers/net/gt96100eth.c 2.6.4.kj_func/drivers/net/gt96100eth.c
--- 2.6.4.clean/drivers/net/gt96100eth.c	2004-03-11 17:57:25.000000000 +1100
+++ 2.6.4.kj_func/drivers/net/gt96100eth.c	2004-03-26 14:32:44.000000000 +1100
@@ -1212,7 +1212,7 @@ gt96100_rx(struct net_device *dev, u32 s
 		    cmdstat, nextOut);
 
 		if (cmdstat & (u32)rxOwn) {
-			//err(__FUNCTION__ ": device owns descriptor!\n");
+			//err("%s: device owns descriptor!\n", __FUNCTION__);
 			// DMA is not finished updating descriptor???
 			// Leave and come back later to pick-up where
 			// we left off.
diff -X dontdiff -purN 2.6.4.clean/drivers/net/irda/smsc-ircc2.c 2.6.4.kj_func/drivers/net/irda/smsc-ircc2.c
--- 2.6.4.clean/drivers/net/irda/smsc-ircc2.c	2004-03-11 17:57:26.000000000 +1100
+++ 2.6.4.kj_func/drivers/net/irda/smsc-ircc2.c	2004-03-26 14:32:44.000000000 +1100
@@ -1429,7 +1429,7 @@ static irqreturn_t smsc_ircc_interrupt(i
 	}
 
 	if (iir & IRCC_IIR_ACTIVE_FRAME) {
-		/*printk(KERN_WARNING __FUNCTION__ "(): Active Frame\n");*/
+		/*printk(KERN_WARNING "%s(): Active Frame\n", __FUNCTION__);*/
 	}
 
 	/* Enable interrupts again */
@@ -1995,7 +1995,7 @@ static int __init smsc_ircc_look_for_chi
 	while(address->cfg_base){
 		cfg_base = address->cfg_base;
 		
-		/*printk(KERN_WARNING __FUNCTION__ "(): probing: 0x%02x for: 0x%02x\n", cfg_base, address->type);*/
+		/*printk(KERN_WARNING "%s(): probing: 0x%02x for: 0x%02x\n", __FUNCTION__, cfg_base, address->type);*/
 		
 		if( address->type & SMSCSIO_TYPE_FDC){
 			type = "FDC";
@@ -2040,7 +2040,7 @@ static int __init smsc_superio_flat(cons
 	outb(SMSCSIOFLAT_UARTMODE0C_REG, cfgbase);
 	mode = inb(cfgbase+1);
 	
-	/*printk(KERN_WARNING __FUNCTION__ "(): mode: 0x%02x\n", mode);*/
+	/*printk(KERN_WARNING "%s(): mode: 0x%02x\n", __FUNCTION__, mode);*/
 	
 	if(!(mode & SMSCSIOFLAT_UART2MODE_VAL_IRDA))
 		WARNING("%s(): IrDA not enabled\n", __FUNCTION__);
diff -X dontdiff -purN 2.6.4.clean/drivers/net/irda/via-ircc.c 2.6.4.kj_func/drivers/net/irda/via-ircc.c
--- 2.6.4.clean/drivers/net/irda/via-ircc.c	2004-03-11 17:57:26.000000000 +1100
+++ 2.6.4.kj_func/drivers/net/irda/via-ircc.c	2004-03-26 14:32:44.000000000 +1100
@@ -360,7 +360,7 @@ static __devinit int via_ircc_open(int i
 
 	/* Reserve the ioports that we need */
 	if (!request_region(self->io.fir_base, self->io.fir_ext, driver_name)) {
-//              WARNING(__FUNCTION__ "(), can't get iobase of 0x%03x\n",self->io.fir_base);
+//              WARNING("%s(), can't get iobase of 0x%03x\n", __FUNCTION__, self->io.fir_base);
 		err = -ENODEV;
 		goto err_out1;
 	}
diff -X dontdiff -purN 2.6.4.clean/drivers/net/wireless/orinoco.h 2.6.4.kj_func/drivers/net/wireless/orinoco.h
--- 2.6.4.clean/drivers/net/wireless/orinoco.h	2004-01-15 17:03:46.000000000 +1100
+++ 2.6.4.kj_func/drivers/net/wireless/orinoco.h	2004-03-26 14:32:44.000000000 +1100
@@ -125,8 +125,8 @@ extern int orinoco_debug;
 #define DEBUG(n, args...) do { } while (0)
 #endif	/* ORINOCO_DEBUG */
 
-#define TRACE_ENTER(devname) DEBUG(2, "%s: -> " __FUNCTION__ "()\n", devname);
-#define TRACE_EXIT(devname)  DEBUG(2, "%s: <- " __FUNCTION__ "()\n", devname);
+#define TRACE_ENTER(devname) DEBUG(2, "%s: -> %s()\n", __FUNCTION__, devname);
+#define TRACE_EXIT(devname)  DEBUG(2, "%s: <- %s()\n", __FUNCTION__, devname);
 
 extern struct net_device *alloc_orinocodev(int sizeof_card,
 					   int (*hard_reset)(struct orinoco_private *));
diff -X dontdiff -purN 2.6.4.clean/drivers/pci/hotplug/pcihp_skeleton.c 2.6.4.kj_func/drivers/pci/hotplug/pcihp_skeleton.c
--- 2.6.4.clean/drivers/pci/hotplug/pcihp_skeleton.c	2004-02-06 10:36:18.000000000 +1100
+++ 2.6.4.kj_func/drivers/pci/hotplug/pcihp_skeleton.c	2004-03-26 14:32:44.000000000 +1100
@@ -224,7 +224,7 @@ static int get_power_status (struct hotp
 	if (slot = NULL)
 		return -ENODEV;
 	
-	dbg(__FUNCTION__" - physical_slot = %s\n", hotplug_slot->name);
+	dbg("%s - physical_slot = %s\n", __FUNCTION__, hotplug_slot->name);
 
 	/*
 	 * Fill in logic to get the current power status of the specific
@@ -242,7 +242,7 @@ static int get_attention_status (struct 
 	if (slot = NULL)
 		return -ENODEV;
 	
-	dbg(__FUNCTION__" - physical_slot = %s\n", hotplug_slot->name);
+	dbg("%s - physical_slot = %s\n", __FUNCTION__, hotplug_slot->name);
 
 	/*
 	 * Fill in logic to get the current attention status of the specific
@@ -260,7 +260,7 @@ static int get_latch_status (struct hotp
 	if (slot = NULL)
 		return -ENODEV;
 	
-	dbg(__FUNCTION__" - physical_slot = %s\n", hotplug_slot->name);
+	dbg("%s - physical_slot = %s\n", __FUNCTION__, hotplug_slot->name);
 
 	/*
 	 * Fill in logic to get the current latch status of the specific
@@ -278,7 +278,7 @@ static int get_adapter_status (struct ho
 	if (slot = NULL)
 		return -ENODEV;
 	
-	dbg(__FUNCTION__" - physical_slot = %s\n", hotplug_slot->name);
+	dbg("%s - physical_slot = %s\n", __FUNCTION__, hotplug_slot->name);
 
 	/*
 	 * Fill in logic to get the current adapter status of the specific
@@ -296,7 +296,7 @@ static void release_slots(struct hotplug
 	if (slot = NULL)
 		return -ENODEV;
 
-	dbg(__FUNCTION__" - physical_slot = %s\n", hotplug_slot->name);
+	dbg("%s - physical_slot = %s\n", __FUNCTION__, hotplug_slot->name);
 	kfree(slot->hotplug_slot->info);
 	kfree(slot->hotplug_slot->name);
 	kfree(slot->hotplug_slot);
diff -X dontdiff -purN 2.6.4.clean/drivers/pcmcia/sa1100_pfs168.c 2.6.4.kj_func/drivers/pcmcia/sa1100_pfs168.c
--- 2.6.4.clean/drivers/pcmcia/sa1100_pfs168.c	2004-01-15 16:59:03.000000000 +1100
+++ 2.6.4.kj_func/drivers/pcmcia/sa1100_pfs168.c	2004-03-26 14:32:44.000000000 +1100
@@ -101,7 +101,7 @@ pfs168_pcmcia_configure_socket(struct sa
     }
 
     if (state->Vpp != state->Vcc && state->Vpp != 0) {
-      printk(KERN_ERR "%s(): CompactFlash socket does not support VPP %uV\n"
+      printk(KERN_ERR "%s(): CompactFlash socket does not support VPP %uV\n",
 	     __FUNCTION__, state->Vpp / 10);
       return -1;
     }
diff -X dontdiff -purN 2.6.4.clean/drivers/pcmcia/sa1100_shannon.c 2.6.4.kj_func/drivers/pcmcia/sa1100_shannon.c
--- 2.6.4.clean/drivers/pcmcia/sa1100_shannon.c	2004-01-15 16:59:03.000000000 +1100
+++ 2.6.4.kj_func/drivers/pcmcia/sa1100_shannon.c	2004-03-26 14:32:44.000000000 +1100
@@ -74,19 +74,19 @@ shannon_pcmcia_configure_socket(struct s
 {
 	switch (state->Vcc) {
 	case 0:	/* power off */
-		printk(KERN_WARNING __FUNCTION__"(): CS asked for 0V, still applying 3.3V..\n");
+		printk(KERN_WARNING "%s(): CS asked for 0V, still applying 3.3V..\n", __FUNCTION__);
 		break;
 	case 50:
-		printk(KERN_WARNING __FUNCTION__"(): CS asked for 5V, applying 3.3V..\n");
+		printk(KERN_WARNING "%s(): CS asked for 5V, applying 3.3V..\n", __FUNCTION__);
 	case 33:
 		break;
 	default:
-		printk(KERN_ERR __FUNCTION__"(): unrecognized Vcc %u\n",
-		       state->Vcc);
+		printk(KERN_ERR _"%s(): unrecognized Vcc %u\n",
+		       __FUNCTION__, state->Vcc);
 		return -1;
 	}
 
-	printk(KERN_WARNING __FUNCTION__"(): Warning, Can't perform reset\n");
+	printk(KERN_WARNING "%s(): Warning, Can't perform reset\n", __FUNCTION__);
 	
 	/* Silently ignore Vpp, output enable, speaker enable. */
 
diff -X dontdiff -purN 2.6.4.clean/drivers/pcmcia/sa1100_stork.c 2.6.4.kj_func/drivers/pcmcia/sa1100_stork.c
--- 2.6.4.clean/drivers/pcmcia/sa1100_stork.c	2004-01-18 17:51:21.000000000 +1100
+++ 2.6.4.kj_func/drivers/pcmcia/sa1100_stork.c	2004-03-26 14:32:44.000000000 +1100
@@ -50,7 +50,7 @@ static void stork_pcmcia_hw_shutdown(str
 {
 	int i;
 
-        printk(__FUNCTION__ "\n");
+        printk("%s\n", __FUNCTION__);
 
         /* disable IRQs */
         sa11xx_free_irqs(skt, irqs, ARRAY_SIZE(irqs));
@@ -68,7 +68,7 @@ stork_pcmcia_socket_state(struct sa1100_
         unsigned long levels = GPLR;
 
 	if (debug > 1)
-		printk(__FUNCTION__ " GPLR=%x IRQ[1:0]=%x\n", levels,
+		printk("%s GPLR=%x IRQ[1:0]=%x\n", __FUNCTION__, levels,
 			(levels & (GPIO_STORK_PCMCIA_A_RDY|GPIO_STORK_PCMCIA_B_RDY)));
 
 	switch (skt->nr) {
diff -X dontdiff -purN 2.6.4.clean/drivers/pcmcia/sa1100_yopy.c 2.6.4.kj_func/drivers/pcmcia/sa1100_yopy.c
--- 2.6.4.clean/drivers/pcmcia/sa1100_yopy.c	2004-01-15 16:59:03.000000000 +1100
+++ 2.6.4.kj_func/drivers/pcmcia/sa1100_yopy.c	2004-03-26 14:32:44.000000000 +1100
@@ -76,13 +76,13 @@ yopy_pcmcia_configure_socket(struct sa11
 		pcmcia_power(0);
 		break;
 	case 50:
-		printk(KERN_WARNING __FUNCTION__"(): CS asked for 5V, applying 3.3V..\n");
+		printk(KERN_WARNING "%s(): CS asked for 5V, applying 3.3V..\n", __FUNCTION__);
 	case 33:
 		pcmcia_power(1);
 		break;
 	default:
-		printk(KERN_ERR __FUNCTION__"(): unrecognized Vcc %u\n",
-		       state->Vcc);
+		printk(KERN_ERR "%s(): unrecognized Vcc %u\n",
+		       __FUNCTION__, state->Vcc);
 		return -1;
 	}
 
diff -X dontdiff -purN 2.6.4.clean/drivers/scsi/pcmcia/nsp_debug.c 2.6.4.kj_func/drivers/scsi/pcmcia/nsp_debug.c
--- 2.6.4.clean/drivers/scsi/pcmcia/nsp_debug.c	2004-01-16 21:10:47.000000000 +1100
+++ 2.6.4.kj_func/drivers/scsi/pcmcia/nsp_debug.c	2004-03-26 14:32:44.000000000 +1100
@@ -90,7 +90,7 @@ static void print_commandk (unsigned cha
 	int i, s;
 	printk(KERN_DEBUG);
 	print_opcodek(command[0]);
-	/*printk(KERN_DEBUG __FUNCTION__ " ");*/
+	/*printk(KERN_DEBUG "%s ", __FUNCTION__);*/
 	if ((command[0] >> 5) = 6 ||
 	    (command[0] >> 5) = 7 ) {
 		s = 12; /* vender specific */
diff -X dontdiff -purN 2.6.4.clean/drivers/tc/lk201.c 2.6.4.kj_func/drivers/tc/lk201.c
--- 2.6.4.clean/drivers/tc/lk201.c	2004-01-15 16:50:23.000000000 +1100
+++ 2.6.4.kj_func/drivers/tc/lk201.c	2004-03-26 14:32:44.000000000 +1100
@@ -74,7 +74,7 @@ static int __init lk201_reset(struct dec
 
 	for (i = 0; i < sizeof(lk201_reset_string); i++)
 		if (info->hook->poll_tx_char(info, lk201_reset_string[i])) {
-			printk(__FUNCTION__" transmit timeout\n");
+			printk("%s transmit timeout\n", __FUNCTION__);
 			return -EIO;
 		}
 	return 0;
diff -X dontdiff -purN 2.6.4.clean/drivers/tc/zs.c 2.6.4.kj_func/drivers/tc/zs.c
--- 2.6.4.clean/drivers/tc/zs.c	2004-03-11 17:57:36.000000000 +1100
+++ 2.6.4.kj_func/drivers/tc/zs.c	2004-03-26 14:32:44.000000000 +1100
@@ -1988,7 +1988,8 @@ unsigned int register_zs_hook(unsigned i
 	struct dec_serial *info = &zs_soft[channel];
 
 	if (info->hook) {
-		printk(__FUNCTION__": line %d has already a hook registered\n", channel);
+		printk("%s: line %d has already a hook registered\n",
+		       __FUNCTION__, channel);
 
 		return 0;
 	} else {
@@ -2015,8 +2016,8 @@ unsigned int unregister_zs_hook(unsigned
                 info->hook = NULL;
                 return 1;
         } else {
-                printk(__FUNCTION__": trying to unregister hook on line %d,"
-                       " but none is registered\n", channel);
+                printk("%s: trying to unregister hook on line %d,"
+                       " but none is registered\n", __FUNCTION__, channel);
                 return 0;
         }
 }
diff -X dontdiff -purN 2.6.4.clean/drivers/usb/serial/kobil_sct.c 2.6.4.kj_func/drivers/usb/serial/kobil_sct.c
--- 2.6.4.clean/drivers/usb/serial/kobil_sct.c	2004-02-19 07:19:10.000000000 +1100
+++ 2.6.4.kj_func/drivers/usb/serial/kobil_sct.c	2004-03-26 14:32:44.000000000 +1100
@@ -503,7 +503,7 @@ static int kobil_write (struct usb_seria
 
 static int kobil_write_room (struct usb_serial_port *port)
 {
-	//dbg(__FUNCTION__ " - port %d", port->number);
+	//dbg("%s - port %d", __FUNCTION__, port->number);
 	return 8;
 }
 
--------------------------------------------------------------------------------
Yours Tony

        linux.conf.au       http://lca2005.linux.org.au/
	Apr 18-23 2005      The Australian Linux Technical Conference!

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
