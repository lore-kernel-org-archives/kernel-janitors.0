From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 25 Jan 2005 23:25:59 +0000
Subject: [KJ] [PATCH] 16/34: char/istallion: replace
Message-Id: <20050125232559.GF12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93544435743259258=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============93544435743259258==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_interruptible() instead of the deprecated
interruptible_sleep_on(). The replacements were all straight-forward as every
sleep was conditionally-looped. Patch is compile-tested (still warns about
{save,restore}_flags(),cli()).

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/char/istallion.c	2005-01-24 09:28:32.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/char/istallion.c	2005-01-24 14:57:01.000000000 -0800
@@ -41,6 +41,7 @@
 #include <linux/init.h>
 #include <linux/devfs_fs_kernel.h>
 #include <linux/device.h>
+#include <linux/wait.h>
 
 #include <asm/io.h>
 #include <asm/uaccess.h>
@@ -1068,11 +1069,10 @@ static int stli_open(struct tty_struct *
 	tty->driver_data = portp;
 	portp->refcount++;
 
-	while (test_bit(ST_INITIALIZING, &portp->state)) {
-		if (signal_pending(current))
-			return(-ERESTARTSYS);
-		interruptible_sleep_on(&portp->raw_wait);
-	}
+	wait_event_interruptible(portp->raw_wait,
+			!test_bit(ST_INITIALIZING, &portp->state));
+	if (signal_pending(current))
+		return(-ERESTARTSYS);
 
 	if ((portp->flags & ASYNC_INITIALIZED) == 0) {
 		set_bit(ST_INITIALIZING, &portp->state);
@@ -1275,12 +1275,11 @@ static int stli_rawopen(stlibrd_t *brdp,
  *	order of opens and closes may not be preserved across shared
  *	memory, so we must wait until it is complete.
  */
-	while (test_bit(ST_CLOSING, &portp->state)) {
-		if (signal_pending(current)) {
-			restore_flags(flags);
-			return(-ERESTARTSYS);
-		}
-		interruptible_sleep_on(&portp->raw_wait);
+	wait_event_interruptible(portp->raw_wait,
+			!test_bit(ST_CLOSING, &portp->state));
+	if (signal_pending(current)) {
+		restore_flags(flags);
+		return -ERESTARTSYS;
 	}
 
 /*
@@ -1309,13 +1308,10 @@ static int stli_rawopen(stlibrd_t *brdp,
  */
 	rc = 0;
 	set_bit(ST_OPENING, &portp->state);
-	while (test_bit(ST_OPENING, &portp->state)) {
-		if (signal_pending(current)) {
-			rc = -ERESTARTSYS;
-			break;
-		}
-		interruptible_sleep_on(&portp->raw_wait);
-	}
+	wait_event_interruptible(portp->raw_wait,
+			!test_bit(ST_OPENING, &portp->state));
+	if (signal_pending(current))
+		rc = -ERESTARTSYS;
 	restore_flags(flags);
 
 	if ((rc == 0) && (portp->rc != 0))
@@ -1352,13 +1348,12 @@ static int stli_rawclose(stlibrd_t *brdp
  *	occurs on this port.
  */
 	if (wait) {
-		while (test_bit(ST_CLOSING, &portp->state)) {
-			if (signal_pending(current)) {
-				restore_flags(flags);
-				return(-ERESTARTSYS);
-			}
-			interruptible_sleep_on(&portp->raw_wait);
-		}
+		wait_event_interruptible(portp->raw_wait,
+				!test_bit(ST_CLOSING, &portp->state));
+		if (signal_pending(current)) {
+			restore_flags(flags);
+			return -ERESTARTSYS;
+		}	
 	}
 
 /*
@@ -1385,13 +1380,10 @@ static int stli_rawclose(stlibrd_t *brdp
  *	to come back.
  */
 	rc = 0;
-	while (test_bit(ST_CLOSING, &portp->state)) {
-		if (signal_pending(current)) {
-			rc = -ERESTARTSYS;
-			break;
-		}
-		interruptible_sleep_on(&portp->raw_wait);
-	}
+	wait_event_interruptible(portp->raw_wait,
+			!test_bit(ST_CLOSING, &portp->state));
+	if (signal_pending(current))
+		rc = -ERESTARTSYS;
 	restore_flags(flags);
 
 	if ((rc == 0) && (portp->rc != 0))
@@ -1420,22 +1412,20 @@ static int stli_cmdwait(stlibrd_t *brdp,
 
 	save_flags(flags);
 	cli();
-	while (test_bit(ST_CMDING, &portp->state)) {
-		if (signal_pending(current)) {
-			restore_flags(flags);
-			return(-ERESTARTSYS);
-		}
-		interruptible_sleep_on(&portp->raw_wait);
+	wait_event_interruptible(portp->raw_wait,
+			!test_bit(ST_CMDING, &portp->state));
+	if (signal_pending(current)) {
+		restore_flags(flags);
+		return -ERESTARTSYS;
 	}
 
 	stli_sendcmd(brdp, portp, cmd, arg, size, copyback);
 
-	while (test_bit(ST_CMDING, &portp->state)) {
-		if (signal_pending(current)) {
-			restore_flags(flags);
-			return(-ERESTARTSYS);
-		}
-		interruptible_sleep_on(&portp->raw_wait);
+	wait_event_interruptible(portp->raw_wait, 
+			!test_bit(ST_CMDING, &portp->state));
+	if (signal_pending(current)) {
+		restore_flags(flags);
+		return -ERESTARTSYS;
 	}
 	restore_flags(flags);
 

--===============93544435743259258==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93544435743259258==--
