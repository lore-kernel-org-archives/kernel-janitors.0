From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 18:37:52 +0000
Subject: [Kernel-janitors] [PATCH] net/xirc2ps_cs: replace
Message-Id: <20040727183752.GS2099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============012207777385696339=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============012207777385696339==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Replace Wait() with msleep() to guarantee the
task delays for the desired time. Remove the definition of Wait().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/pcmcia/xirc2ps_cs.c	2004-06-15 22:19:13.000000000 -0700
+++ linux-dev/drivers/net/pcmcia/xirc2ps_cs.c	2004-07-27 11:33:27.000000000 -0700
@@ -418,11 +418,6 @@ next_tuple(client_handle_t handle, tuple
 #define PutByte(reg,value) outb((value), ioaddr+(reg))
 #define PutWord(reg,value) outw((value), ioaddr+(reg))
 
-#define Wait(n) do { \
-	set_current_state(TASK_UNINTERRUPTIBLE); \
-	schedule_timeout(n); \
-} while (0)
-
 /*====== Functions used for debugging =================================*/
 #if defined(PCMCIA_DEBUG) && 0 /* reading regs may change system status */
 static void
@@ -1716,13 +1711,13 @@ hardreset(struct net_device *dev)
 
     SelectPage(4);
     udelay(1);
-    Wait(HZ/25);		     /* wait 40 msec */
+    msleep(40);				/* wait 40msec */
     if (local->mohawk)
 	PutByte(XIRCREG4_GPR1, 1);	 /* set bit 0: power up */
     else
 	PutByte(XIRCREG4_GPR1, 1 | 4);	 /* set bit 0: power up, bit 2: AIC */
-    Wait(HZ/50);		     /* wait 20 msec */
+    msleep(20);				/* wait 20msec */
 }
 
 static void
@@ -1736,9 +1731,9 @@ do_reset(struct net_device *dev, int ful
 
     hardreset(dev);
     PutByte(XIRCREG_CR, SoftReset); /* set */
-    Wait(HZ/50);		     /* wait 20 msec */
+    msleep(20);				/* wait 20msec */
     PutByte(XIRCREG_CR, 0);	     /* clear */
-    Wait(HZ/25);		     /* wait 40 msec */
+    msleep(40);				/* wait 40msec */
     if (local->mohawk) {
 	SelectPage(4);
 	/* set pin GP1 and GP2 to output  (0x0c)
@@ -1749,7 +1744,7 @@ do_reset(struct net_device *dev, int ful
     }
 
     /* give the circuits some time to power up */
-    Wait(HZ/2);		/* about 500ms */
+    msleep(500);			/* wait 500msec */
 
     local->last_ptr_value = 0;
     local->silicon = local->mohawk ? (GetByte(XIRCREG4_BOV) & 0x70) >> 4
@@ -1768,7 +1763,7 @@ do_reset(struct net_device *dev, int ful
 	SelectPage(0x42);
 	PutByte(XIRCREG42_SWC1, 0x80);
     }
-    Wait(HZ/25);		     /* wait 40 msec to let it complete */
+    msleep(40);				/* wait 40msec */
 
   #ifdef PCMCIA_DEBUG
     if (pc_debug) {
@@ -1827,7 +1822,7 @@ do_reset(struct net_device *dev, int ful
 	    printk(KERN_INFO "%s: MII selected\n", dev->name);
 	    SelectPage(2);
 	    PutByte(XIRCREG2_MSR, GetByte(XIRCREG2_MSR) | 0x08);
-	    Wait(HZ/50);
+	    msleep(20);				/* wait 20msec */
 	} else {
 	    printk(KERN_INFO "%s: MII detected; using 10mbs\n",
 		   dev->name);
@@ -1836,7 +1831,7 @@ do_reset(struct net_device *dev, int ful
 		PutByte(XIRCREG42_SWC1, 0xC0);
 	    else  /* enable 10BaseT */
 		PutByte(XIRCREG42_SWC1, 0x80);
-	    Wait(HZ/25);	/* wait 40 msec to let it complete */
+	    msleep(40);				/* wait 40msec */
 	}
 	if (full_duplex)
 	    PutByte(XIRCREG1_ECR, GetByte(XIRCREG1_ECR | FullDuplex));
@@ -1929,7 +1924,7 @@ init_mii(struct net_device *dev)
 	 * Fixme: Better to use a timer here!
 	 */
 	for (i=0; i < 35; i++) {
-	    Wait(HZ/10);	 /* wait 100 msec */
+	    msleep(100);			/* wait 100msec */
 	    status = mii_rd(ioaddr,  0, 1);
 	    if ((status & 0x0020) && (status & 0x0004))
 		break;

--===============012207777385696339==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============012207777385696339==--
