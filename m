From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 24 Sep 2004 22:27:14 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 36/38] net/xirc2ps_cs: replace
Message-Id: <20040924222714.GU1757@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34911625193857343=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34911625193857343==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of Wait() to guarantee the task delays
as expected. Remove definition of Wait().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/pcmcia/xirc2ps_cs.c	2004-09-13 17:15:42.000000000 -0700
+++ 2.6.9-rc2/drivers/net/pcmcia/xirc2ps_cs.c	2004-09-15 09:45:40.000000000 -0700
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
@@ -1716,12 +1711,12 @@ hardreset(struct net_device *dev)
     SelectPage(4);
     udelay(1);
     PutByte(XIRCREG4_GPR1, 0);	     /* clear bit 0: power down */
-    Wait(HZ/25);		     /* wait 40 msec */
+    msleep(40);				     /* wait 40 msec */
     if (local->mohawk)
 	PutByte(XIRCREG4_GPR1, 1);	 /* set bit 0: power up */
     else
 	PutByte(XIRCREG4_GPR1, 1 | 4);	 /* set bit 0: power up, bit 2: AIC */
-    Wait(HZ/50);		     /* wait 20 msec */
+    msleep(20);			     /* wait 20 msec */
 }
 
 static void
@@ -1735,9 +1730,9 @@ do_reset(struct net_device *dev, int ful
 
     hardreset(dev);
     PutByte(XIRCREG_CR, SoftReset); /* set */
-    Wait(HZ/50);		     /* wait 20 msec */
+    msleep(20);			     /* wait 20 msec */
     PutByte(XIRCREG_CR, 0);	     /* clear */
-    Wait(HZ/25);		     /* wait 40 msec */
+    msleep(40);			     /* wait 40 msec */
     if (local->mohawk) {
 	SelectPage(4);
 	/* set pin GP1 and GP2 to output  (0x0c)
@@ -1748,7 +1743,7 @@ do_reset(struct net_device *dev, int ful
     }
 
     /* give the circuits some time to power up */
-    Wait(HZ/2);		/* about 500ms */
+    msleep(500);			/* about 500ms */
 
     local->last_ptr_value = 0;
     local->silicon = local->mohawk ? (GetByte(XIRCREG4_BOV) & 0x70) >> 4
@@ -1767,7 +1762,7 @@ do_reset(struct net_device *dev, int ful
 	SelectPage(0x42);
 	PutByte(XIRCREG42_SWC1, 0x80);
     }
-    Wait(HZ/25);		     /* wait 40 msec to let it complete */
+    msleep(40);			     /* wait 40 msec to let it complete */
 
   #ifdef PCMCIA_DEBUG
     if (pc_debug) {
@@ -1826,7 +1821,7 @@ do_reset(struct net_device *dev, int ful
 	    printk(KERN_INFO "%s: MII selected\n", dev->name);
 	    SelectPage(2);
 	    PutByte(XIRCREG2_MSR, GetByte(XIRCREG2_MSR) | 0x08);
-	    Wait(HZ/50);
+	    msleep(20);
 	} else {
 	    printk(KERN_INFO "%s: MII detected; using 10mbs\n",
 		   dev->name);
@@ -1835,7 +1830,7 @@ do_reset(struct net_device *dev, int ful
 		PutByte(XIRCREG42_SWC1, 0xC0);
 	    else  /* enable 10BaseT */
 		PutByte(XIRCREG42_SWC1, 0x80);
-	    Wait(HZ/25);	/* wait 40 msec to let it complete */
+	    msleep(40);			/* wait 40 msec to let it complete */
 	}
 	if (full_duplex)
 	    PutByte(XIRCREG1_ECR, GetByte(XIRCREG1_ECR | FullDuplex));
@@ -1928,7 +1923,7 @@ init_mii(struct net_device *dev)
 	 * Fixme: Better to use a timer here!
 	 */
 	for (i=0; i < 35; i++) {
-	    Wait(HZ/10);	 /* wait 100 msec */
+	    msleep(100);	 /* wait 100 msec */
 	    status = mii_rd(ioaddr,  0, 1);
 	    if ((status & 0x0020) && (status & 0x0004))
 		break;

--===============34911625193857343==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34911625193857343==--
