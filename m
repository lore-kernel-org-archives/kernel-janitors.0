From: solt@dns.toxicfilms.tv
Date: Sun, 03 Jul 2005 18:08:52 +0000
Subject: [KJ] Spelling
Message-Id: <20050703180852.13613.qmail@dns.toxicfilms.tv>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45053898571606865=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050703180846.13599.qmail@dns.toxicfilms.tv>
In-Reply-To: <20050703180846.13599.qmail@dns.toxicfilms.tv>
To: kernel-janitors@vger.kernel.org

--===============45053898571606865==

Hello Janitors!

This is a small patchlet that fixes 3 common spelling mistakes I found
using grep on 2.6.13-rc1-git5

These are:
- "to big" instead of "too big"
- "to much" instead of "too much"
- "to many" instead of "too many"

Here is a diffstat of the patch:

 Documentation/networking/x25-iface.txt   |    2 +-
 Documentation/scsi/scsi-changer.txt      |    2 +-
 Documentation/video4linux/Zoran          |    2 +-
 arch/arm/common/locomo.c                 |    2 +-
 arch/ia64/hp/sim/simeth.c                |    2 +-
 arch/m68k/fpsp040/setox.S                |    2 +-
 arch/m68k/ifpsp060/src/fplsp.S           |    2 +-
 arch/m68k/ifpsp060/src/fpsp.S            |    2 +-
 drivers/block/cciss.c                    |    2 +-
 drivers/block/cpqarray.c                 |    2 +-
 drivers/block/floppy.c                   |    2 +-
 drivers/media/dvb/ttpci/av7110.c         |    2 +-
 drivers/net/wireless/prism54/isl_ioctl.c |    2 +-
 drivers/serial/crisv10.c                 |    2 +-
 drivers/usb/media/se401.c                |    6 +++---
 drivers/usb/serial/cyberjack.c           |    4 ++--
 drivers/video/fm2fb.c                    |    2 +-
 include/net/irda/irlap_event.h           |    4 ++--
 net/irda/af_irda.c                       |   10 +++++-----
 net/irda/ircomm/ircomm_tty_attach.c      |    2 +-
 net/irda/irlmp.c                         |    2 +-
 sound/pci/cs46xx/dsp_spos.c              |    2 +-
 sound/pci/cs46xx/dsp_spos_scb_lib.c      |    2 +-
 sound/pci/rme9652/hdspm.c                |    9 +++++----
 24 files changed, 36 insertions(+), 35 deletions(-)


In case of problems you may always get this patch from

	http://soltysiak.com/linux/spelling1.diff

Regards,
Maciej

Here goes:

diff -ru /var/tmp/linux-2.6.12.orig/Documentation/networking/x25-iface.txt /usr/src/1/linux-2.6.12/Documentation/networking/x25-iface.txt
--- /var/tmp/linux-2.6.12.orig/Documentation/networking/x25-iface.txt	2005-07-03 19:26:42.000000000 +0200
+++ /usr/src/1/linux-2.6.12/Documentation/networking/x25-iface.txt	2005-07-03 19:36:47.000000000 +0200
@@ -113,7 +113,7 @@
     Alternatively, the driver can queue the frame internally and call
     netif_rx() later when netif_dropping is 0 again. In that case, delivery
     confirmation should also be deferred such that the internal queue
-    cannot grow to much.
+    cannot grow too much.
     This will not reliably avoid packet loss, but the probability
     of packet loss in netif_rx() path will be significantly reduced.
 (3) Additionally, driver authors might consider to support
diff -ru /var/tmp/linux-2.6.12.orig/Documentation/scsi/scsi-changer.txt /usr/src/1/linux-2.6.12/Documentation/scsi/scsi-changer.txt
--- /var/tmp/linux-2.6.12.orig/Documentation/scsi/scsi-changer.txt	2005-07-03 19:26:41.000000000 +0200
+++ /usr/src/1/linux-2.6.12/Documentation/scsi/scsi-changer.txt	2005-07-03 19:41:27.000000000 +0200
@@ -88,7 +88,7 @@
 device [ try "dmesg" if you don't see anything ] and should show up in
 /proc/devices. If not....  some changers use ID ? / LUN 0 for the
 device and ID ? / LUN 1 for the robot mechanism. But Linux does *not*
-look for LUN's other than 0 as default, becauce there are to many
+look for LUN's other than 0 as default, becauce there are too many
 broken devices. So you can try:
 
   1) echo "scsi add-single-device 0 0 ID 1" > /proc/scsi/scsi
diff -ru /var/tmp/linux-2.6.12.orig/Documentation/video4linux/Zoran /usr/src/1/linux-2.6.12/Documentation/video4linux/Zoran
--- /var/tmp/linux-2.6.12.orig/Documentation/video4linux/Zoran	2005-07-03 19:26:42.000000000 +0200
+++ /usr/src/1/linux-2.6.12/Documentation/video4linux/Zoran	2005-07-03 19:37:04.000000000 +0200
@@ -130,7 +130,7 @@
 The CCIR defines parameters needed for broadcasting the signal. 
 The CCIR has defined different standards: A,B,D,E,F,G,D,H,I,K,K1,L,M,N,...
 The CCIR says not much about about the colorsystem used !!!
-And talking about a colorsystem says not to much about how it is broadcast.
+And talking about a colorsystem says not too much about how it is broadcast.
 
 The CCIR standards A,E,F are not used any more.
 
diff -ru /var/tmp/linux-2.6.12.orig/arch/arm/common/locomo.c /usr/src/1/linux-2.6.12/arch/arm/common/locomo.c
--- /var/tmp/linux-2.6.12.orig/arch/arm/common/locomo.c	2005-07-03 19:24:20.000000000 +0200
+++ /usr/src/1/linux-2.6.12/arch/arm/common/locomo.c	2005-07-03 19:42:24.000000000 +0200
@@ -127,7 +127,7 @@
 
 
 /** LoCoMo interrupt handling stuff.
- * NOTE: LoCoMo has a 1 to many mapping on all of its IRQs.
+ * NOTE: LoCoMo has a 1 too many mapping on all of its IRQs.
  * that is, there is only one real hardware interrupt
  * we determine which interrupt it is by reading some IO memory.
  * We have two levels of expansion, first in the handler for the
diff -ru /var/tmp/linux-2.6.12.orig/arch/ia64/hp/sim/simeth.c /usr/src/1/linux-2.6.12/arch/ia64/hp/sim/simeth.c
--- /var/tmp/linux-2.6.12.orig/arch/ia64/hp/sim/simeth.c	2005-07-03 19:24:34.000000000 +0200
+++ /usr/src/1/linux-2.6.12/arch/ia64/hp/sim/simeth.c	2005-07-03 19:42:54.000000000 +0200
@@ -449,7 +449,7 @@
 	local = dev->priv;
 	/*
 	 * the loop concept has been borrowed from other drivers
-	 * looks to me like it's a throttling thing to avoid pushing to many
+	 * looks to me like it's a throttling thing to avoid pushing too many
 	 * packets at one time into the stack. Making sure we can process them
 	 * upstream and make forward progress overall
 	 */
diff -ru /var/tmp/linux-2.6.12.orig/arch/m68k/fpsp040/setox.S /usr/src/1/linux-2.6.12/arch/m68k/fpsp040/setox.S
--- /var/tmp/linux-2.6.12.orig/arch/m68k/fpsp040/setox.S	2005-07-03 19:24:42.000000000 +0200
+++ /usr/src/1/linux-2.6.12/arch/m68k/fpsp040/setox.S	2005-07-03 19:37:20.000000000 +0200
@@ -166,7 +166,7 @@
 |		 Possible exception in 6.4 is overflow or underflow.
 |		 The inexact exception is not generated in 6.4. Although
 |		 one can argue that the inexact flag should always be
-|		 raised, to simulate that exception cost to much than the
+|		 raised, to simulate that exception cost too much than the
 |		 flag is worth in practical uses.
 |
 |	Step 7.	Return 1 + X.
diff -ru /var/tmp/linux-2.6.12.orig/arch/m68k/ifpsp060/src/fplsp.S /usr/src/1/linux-2.6.12/arch/m68k/ifpsp060/src/fplsp.S
--- /var/tmp/linux-2.6.12.orig/arch/m68k/ifpsp060/src/fplsp.S	2005-07-03 19:24:44.000000000 +0200
+++ /usr/src/1/linux-2.6.12/arch/m68k/ifpsp060/src/fplsp.S	2005-07-03 19:37:37.000000000 +0200
@@ -6826,7 +6826,7 @@
 #		or underflow. The inexact exception is not generated in	#
 #		6.4. Although one can argue that the inexact flag	#
 #		should always be raised, to simulate that exception	#
-#		cost to much than the flag is worth in practical uses.	#
+#		cost too much than the flag is worth in practical uses.	#
 #									#
 #	Step 7.	Return 1 + X.						#
 #		7.1	ans := X					#
diff -ru /var/tmp/linux-2.6.12.orig/arch/m68k/ifpsp060/src/fpsp.S /usr/src/1/linux-2.6.12/arch/m68k/ifpsp060/src/fpsp.S
--- /var/tmp/linux-2.6.12.orig/arch/m68k/ifpsp060/src/fpsp.S	2005-07-03 19:24:46.000000000 +0200
+++ /usr/src/1/linux-2.6.12/arch/m68k/ifpsp060/src/fpsp.S	2005-07-03 19:38:02.000000000 +0200
@@ -6932,7 +6932,7 @@
 #		or underflow. The inexact exception is not generated in	#
 #		6.4. Although one can argue that the inexact flag	#
 #		should always be raised, to simulate that exception	#
-#		cost to much than the flag is worth in practical uses.	#
+#		cost too much than the flag is worth in practical uses.	#
 #									#
 #	Step 7.	Return 1 + X.						#
 #		7.1	ans := X					#
diff -ru /var/tmp/linux-2.6.12.orig/drivers/block/cciss.c /usr/src/1/linux-2.6.12/drivers/block/cciss.c
--- /var/tmp/linux-2.6.12.orig/drivers/block/cciss.c	2005-07-03 19:26:27.000000000 +0200
+++ /usr/src/1/linux-2.6.12/drivers/block/cciss.c	2005-07-03 19:43:37.000000000 +0200
@@ -458,7 +458,7 @@
 	 * so array config can still work. Root is also allowed to open any
 	 * volume that has a LUN ID, so it can issue IOCTL to reread the
 	 * disk information.  I don't think I really like this
-	 * but I'm already using way to many device nodes to claim another one
+	 * but I'm already using way too many device nodes to claim another one
 	 * for "raw controller".
 	 */
 	if (drv->nr_blocks == 0) {
diff -ru /var/tmp/linux-2.6.12.orig/drivers/block/cpqarray.c /usr/src/1/linux-2.6.12/drivers/block/cpqarray.c
--- /var/tmp/linux-2.6.12.orig/drivers/block/cpqarray.c	2005-07-03 19:26:26.000000000 +0200
+++ /usr/src/1/linux-2.6.12/drivers/block/cpqarray.c	2005-07-03 19:43:27.000000000 +0200
@@ -830,7 +830,7 @@
 	/*
 	 * Root is allowed to open raw volume zero even if it's not configured
 	 * so array config can still work.  I don't think I really like this,
-	 * but I'm already using way to many device nodes to claim another one
+	 * but I'm already using way too many device nodes to claim another one
 	 * for "raw controller".
 	 */
 	if (!drv->nr_blks) {
diff -ru /var/tmp/linux-2.6.12.orig/drivers/block/floppy.c /usr/src/1/linux-2.6.12/drivers/block/floppy.c
--- /var/tmp/linux-2.6.12.orig/drivers/block/floppy.c	2005-07-03 19:26:27.000000000 +0200
+++ /usr/src/1/linux-2.6.12/drivers/block/floppy.c	2005-07-03 19:39:38.000000000 +0200
@@ -1262,7 +1262,7 @@
 			DPRINT("Invalid data rate for perpendicular mode!\n");
 			cont->done(0);
 			FDCS->reset = 1;	/* convenient way to return to
-						 * redo without to much hassle (deep
+						 * redo without too much hassle (deep
 						 * stack et al. */
 			return;
 		}
diff -ru /var/tmp/linux-2.6.12.orig/drivers/media/dvb/ttpci/av7110.c /usr/src/1/linux-2.6.12/drivers/media/dvb/ttpci/av7110.c
--- /var/tmp/linux-2.6.12.orig/drivers/media/dvb/ttpci/av7110.c	2005-07-03 19:26:30.000000000 +0200
+++ /usr/src/1/linux-2.6.12/drivers/media/dvb/ttpci/av7110.c	2005-07-03 19:33:46.000000000 +0200
@@ -1437,7 +1437,7 @@
 	len = ntohl(*(u32*) ptr);
 	ptr += 4;
 	if (len >= 512) {
-		printk("dvb-ttpci: dpram file is way to big.\n");
+		printk("dvb-ttpci: dpram file is way too big.\n");
 		return -EINVAL;
 	}
 	if (crc != crc32_le(0, ptr, len)) {
diff -ru /var/tmp/linux-2.6.12.orig/drivers/net/wireless/prism54/isl_ioctl.c /usr/src/1/linux-2.6.12/drivers/net/wireless/prism54/isl_ioctl.c
--- /var/tmp/linux-2.6.12.orig/drivers/net/wireless/prism54/isl_ioctl.c	2005-07-03 19:25:46.000000000 +0200
+++ /usr/src/1/linux-2.6.12/drivers/net/wireless/prism54/isl_ioctl.c	2005-07-03 19:33:10.000000000 +0200
@@ -751,7 +751,7 @@
 
 	if (essid->length) {
 		dwrq->flags = 1;	/* set ESSID to ON for Wireless Extensions */
-		/* if it is to big, trunk it */
+		/* if it is too big, truncate it */
 		dwrq->length = min(IW_ESSID_MAX_SIZE, essid->length + 1);
 	} else {
 		dwrq->flags = 0;
diff -ru /var/tmp/linux-2.6.12.orig/drivers/serial/crisv10.c /usr/src/1/linux-2.6.12/drivers/serial/crisv10.c
--- /var/tmp/linux-2.6.12.orig/drivers/serial/crisv10.c	2005-07-03 19:26:39.000000000 +0200
+++ /usr/src/1/linux-2.6.12/drivers/serial/crisv10.c	2005-07-03 19:40:12.000000000 +0200
@@ -2533,7 +2533,7 @@
 	 * Since we use DMA, 1 SERIAL_DESCR_BUF_SIZE could be on the way.
 	 * Lets buffer data here and let flow control take care of it.
 	 * Since we normally flip large chunks, the ldisc don't react
-	 * with throttle until too late if we flip to much.
+	 * with throttle until too late if we flip too much.
 	 */
 	max_flip_size = tty->ldisc.receive_room(tty);
 	if (max_flip_size < 0)
diff -ru /var/tmp/linux-2.6.12.orig/drivers/usb/media/se401.c /usr/src/1/linux-2.6.12/drivers/usb/media/se401.c
--- /var/tmp/linux-2.6.12.orig/drivers/usb/media/se401.c	2005-07-03 19:25:52.000000000 +0200
+++ /usr/src/1/linux-2.6.12/drivers/usb/media/se401.c	2005-07-03 19:38:19.000000000 +0200
@@ -720,7 +720,7 @@
 		return;
 	}
 
-	/* Check if we have to much data */
+	/* Check if we have too much data */
 	if (frame->curpix+len > datasize) {
 		len=datasize-frame->curpix;
 	}
@@ -829,7 +829,7 @@
 		);
 		if (se401->nullpackets > SE401_MAX_NULLPACKETS) {
 			se401->nullpackets=0;
-			info("to many null length packets, restarting capture");
+			info("too many null length packets, restarting capture");
 			se401_stop_stream(se401);
 			se401_start_stream(se401);			
 		} else {
@@ -849,7 +849,7 @@
 				se401->scratch_use=0;
 			if (errors > SE401_MAX_ERRORS) {
 				errors=0;
-				info("to much errors, restarting capture");
+				info("too much errors, restarting capture");
 				se401_stop_stream(se401);
 				se401_start_stream(se401);
 			}
diff -ru /var/tmp/linux-2.6.12.orig/drivers/usb/serial/cyberjack.c /usr/src/1/linux-2.6.12/drivers/usb/serial/cyberjack.c
--- /var/tmp/linux-2.6.12.orig/drivers/usb/serial/cyberjack.c	2005-07-03 19:25:52.000000000 +0200
+++ /usr/src/1/linux-2.6.12/drivers/usb/serial/cyberjack.c	2005-07-03 19:39:01.000000000 +0200
@@ -225,7 +225,7 @@
 	spin_lock_irqsave(&priv->lock, flags);
 
 	if( (count+priv->wrfilled)>sizeof(priv->wrbuf) ) {
-		/* To much data for buffer. Reset buffer. */
+		/* Too much data for buffer. Reset buffer. */
 		priv->wrfilled=0;
 		spin_unlock_irqrestore(&priv->lock, flags);
 		port->write_urb_busy = 0;
@@ -326,7 +326,7 @@
 		old_rdtodo = priv->rdtodo;
 
 		if( (old_rdtodo+size)<(old_rdtodo) ) {
-			dbg( "To many bulk_in urbs to do." );
+			dbg( "Too many bulk_in urbs to do." );
 			spin_unlock(&priv->lock);
 			goto resubmit;
 		}
diff -ru /var/tmp/linux-2.6.12.orig/drivers/video/fm2fb.c /usr/src/1/linux-2.6.12/drivers/video/fm2fb.c
--- /var/tmp/linux-2.6.12.orig/drivers/video/fm2fb.c	2005-07-03 19:26:37.000000000 +0200
+++ /usr/src/1/linux-2.6.12/drivers/video/fm2fb.c	2005-07-03 19:39:49.000000000 +0200
@@ -108,7 +108,7 @@
  *	must copied ca. 1.7 MBytes to another place inside this
  *	frame buffer. This means 1.7 MByte read and 1.7 MByte write
  *	over the slow 16 bit wide Zorro2 bus! A scroll of one
- *	line needs 1 second so do not expect to much from this
+ *	line needs 1 second so do not expect too much from this
  *	driver - he is at the limit!
  *
  */
diff -ru /var/tmp/linux-2.6.12.orig/include/net/irda/irlap_event.h /usr/src/1/linux-2.6.12/include/net/irda/irlap_event.h
--- /var/tmp/linux-2.6.12.orig/include/net/irda/irlap_event.h	2005-07-03 19:26:43.000000000 +0200
+++ /usr/src/1/linux-2.6.12/include/net/irda/irlap_event.h	2005-07-03 19:43:51.000000000 +0200
@@ -113,8 +113,8 @@
  */
 typedef enum { /* FIXME check the two first reason codes */
 	LAP_DISC_INDICATION=1, /* Received a disconnect request from peer */
-	LAP_NO_RESPONSE,       /* To many retransmits without response */
-	LAP_RESET_INDICATION,  /* To many retransmits, or invalid nr/ns */
+	LAP_NO_RESPONSE,       /* Too many retransmits without response */
+	LAP_RESET_INDICATION,  /* Too many retransmits, or invalid nr/ns */
 	LAP_FOUND_NONE,        /* No devices were discovered */
 	LAP_MEDIA_BUSY,
 	LAP_PRIMARY_CONFLICT,
diff -ru /var/tmp/linux-2.6.12.orig/net/irda/af_irda.c /usr/src/1/linux-2.6.12/net/irda/af_irda.c
--- /var/tmp/linux-2.6.12.orig/net/irda/af_irda.c	2005-07-03 19:24:13.000000000 +0200
+++ /usr/src/1/linux-2.6.12/net/irda/af_irda.c	2005-07-03 19:34:51.000000000 +0200
@@ -1301,7 +1301,7 @@
 	if (sk->sk_state != TCP_ESTABLISHED)
 		return -ENOTCONN;
 
-	/* Check that we don't send out to big frames */
+	/* Check that we don't send out too big frames */
 	if (len > self->max_data_size) {
 		IRDA_DEBUG(2, "%s(), Chopping frame from %zd to %d bytes!\n",
 			   __FUNCTION__, len, self->max_data_size);
@@ -1544,11 +1544,11 @@
 	IRDA_ASSERT(self != NULL, return -1;);
 
 	/*
-	 * Check that we don't send out to big frames. This is an unreliable
+	 * Check that we don't send out too big frames. This is an unreliable
 	 * service, so we have no fragmentation and no coalescence
 	 */
 	if (len > self->max_data_size) {
-		IRDA_DEBUG(0, "%s(), Warning to much data! "
+		IRDA_DEBUG(0, "%s(), Warning too much data! "
 			   "Chopping frame from %zd to %d bytes!\n",
 			   __FUNCTION__, len, self->max_data_size);
 		len = self->max_data_size;
@@ -1640,11 +1640,11 @@
 	}
 
 	/*
-	 * Check that we don't send out to big frames. This is an unreliable
+	 * Check that we don't send out too big frames. This is an unreliable
 	 * service, so we have no fragmentation and no coalescence
 	 */
 	if (len > self->max_data_size) {
-		IRDA_DEBUG(0, "%s(), Warning to much data! "
+		IRDA_DEBUG(0, "%s(), Warning too much data! "
 			   "Chopping frame from %zd to %d bytes!\n",
 			   __FUNCTION__, len, self->max_data_size);
 		len = self->max_data_size;
diff -ru /var/tmp/linux-2.6.12.orig/net/irda/ircomm/ircomm_tty_attach.c /usr/src/1/linux-2.6.12/net/irda/ircomm/ircomm_tty_attach.c
--- /var/tmp/linux-2.6.12.orig/net/irda/ircomm/ircomm_tty_attach.c	2005-07-03 19:24:13.000000000 +0200
+++ /usr/src/1/linux-2.6.12/net/irda/ircomm/ircomm_tty_attach.c	2005-07-03 19:40:23.000000000 +0200
@@ -610,7 +610,7 @@
 /*
  * Function ircomm_tty_watchdog_timer_expired (data)
  *
- *    Called when the connect procedure have taken to much time.
+ *    Called when the connect procedure have taken too much time.
  *
  */
 static void ircomm_tty_watchdog_timer_expired(void *data)
diff -ru /var/tmp/linux-2.6.12.orig/net/irda/irlmp.c /usr/src/1/linux-2.6.12/net/irda/irlmp.c
--- /var/tmp/linux-2.6.12.orig/net/irda/irlmp.c	2005-07-03 19:24:13.000000000 +0200
+++ /usr/src/1/linux-2.6.12/net/irda/irlmp.c	2005-07-03 19:44:42.000000000 +0200
@@ -1826,7 +1826,7 @@
 		IRDA_DEBUG( 1, "%s(), LAP_DISC_INDICATION\n", __FUNCTION__);
 		reason = LM_USER_REQUEST;
 		break;
-	case LAP_NO_RESPONSE:    /* To many retransmits without response */
+	case LAP_NO_RESPONSE:    /* Too many retransmits without response */
 		IRDA_DEBUG( 1, "%s(), LAP_NO_RESPONSE\n", __FUNCTION__);
 		reason = LM_LAP_DISCONNECT;
 		break;
diff -ru /var/tmp/linux-2.6.12.orig/sound/pci/cs46xx/dsp_spos.c /usr/src/1/linux-2.6.12/sound/pci/cs46xx/dsp_spos.c
--- /var/tmp/linux-2.6.12.orig/sound/pci/cs46xx/dsp_spos.c	2005-07-03 19:25:29.000000000 +0200
+++ /usr/src/1/linux-2.6.12/sound/pci/cs46xx/dsp_spos.c	2005-07-03 19:44:55.000000000 +0200
@@ -307,7 +307,7 @@
 	u32 doffset, dsize;
 
 	if (ins->nmodules == DSP_MAX_MODULES - 1) {
-		snd_printk(KERN_ERR "dsp_spos: to many modules loaded into DSP\n");
+		snd_printk(KERN_ERR "dsp_spos: too many modules loaded into DSP\n");
 		return -ENOMEM;
 	}
 
diff -ru /var/tmp/linux-2.6.12.orig/sound/pci/cs46xx/dsp_spos_scb_lib.c /usr/src/1/linux-2.6.12/sound/pci/cs46xx/dsp_spos_scb_lib.c
--- /var/tmp/linux-2.6.12.orig/sound/pci/cs46xx/dsp_spos_scb_lib.c	2005-07-03 19:25:29.000000000 +0200
+++ /usr/src/1/linux-2.6.12/sound/pci/cs46xx/dsp_spos_scb_lib.c	2005-07-03 19:45:03.000000000 +0200
@@ -1288,7 +1288,7 @@
 
 	if (src_scb == NULL) {
 		if (ins->nsrc_scb >= DSP_MAX_SRC_NR) {
-			snd_printk(KERN_ERR "dsp_spos: to many SRC instances\n!");
+			snd_printk(KERN_ERR "dsp_spos: too many SRC instances\n!");
 			return NULL;
 		}
 
diff -ru /var/tmp/linux-2.6.12.orig/sound/pci/rme9652/hdspm.c /usr/src/1/linux-2.6.12/sound/pci/rme9652/hdspm.c
--- /var/tmp/linux-2.6.12.orig/sound/pci/rme9652/hdspm.c	2005-07-03 19:25:29.000000000 +0200
+++ /usr/src/1/linux-2.6.12/sound/pci/rme9652/hdspm.c	2005-07-03 19:40:55.000000000 +0200
@@ -394,7 +394,7 @@
 
 	/* Mixer vars */
 	snd_kcontrol_t *playback_mixer_ctls[HDSPM_MAX_CHANNELS];	/* fast alsa mixer */
-	snd_kcontrol_t *input_mixer_ctls[HDSPM_MAX_CHANNELS];	/* but input to much, so not used */
+	snd_kcontrol_t *input_mixer_ctls[HDSPM_MAX_CHANNELS];	/* but input too much, so not used */
 	hdspm_mixer_t *mixer;	/* full mixer accessable over mixer ioctl or hwdep-device */
 
 };
@@ -660,7 +660,7 @@
 	}
 
 	/* hwpointer comes in bytes and is 64Bytes accurate (by docu since PCI Burst)
-	   i have experimented that it is at most 64 Byte to much for playing 
+	   i have experimented that it is at most 64 Byte too much for playing 
 	   so substraction of 64 byte should be ok for ALSA, but use it only
 	   for application where you know what you do since if you come to
 	   near with record pointer it can be a disaster */
@@ -1928,7 +1928,7 @@
 }
 
 /*           Simple Mixer
-  deprecated since to much faders ???
+  deprecated since too much faders ???
   MIXER interface says output (source, destination, value)
    where source > MAX_channels are playback channels 
    on MADICARD 
@@ -2270,7 +2270,8 @@
 	}
 
 	/* Channel playback mixer as default control 
-	   Note: the whole matrix would be 128*HDSPM_MIXER_CHANNELS Faders, thats to big for any alsamixer 
+	   Note: the whole matrix would be 128*HDSPM_MIXER_CHANNELS Faders,
+	   that is too big for any alsamixer 
 	   they are accesible via special IOCTL on hwdep
 	   and the mixer 2dimensional mixer control */
 

--===============45053898571606865==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45053898571606865==--
