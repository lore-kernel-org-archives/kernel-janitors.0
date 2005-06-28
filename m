From: Jesse Millan <jessem@cs.pdx.edu>
Date: Tue, 28 Jun 2005 04:34:17 +0000
Subject: [KJ] [PATCH] Fix GCC4 warning: 'current_time.tv_sec &
Message-Id: <42C0D349.4010008@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060108040904080904090003"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------060108040904080904090003
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------060108040904080904090003
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch"


The timeval current_time is conditionally initialized and unconditionally
used. Moving the call to do_gettimeofday() above the #if directive eliminates
the possibility of using current_time uninitialized.

Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>

--- linux-2.6.12-rc6/drivers/net/wireless/prism54/isl_38xx.c.orig	2005-06-27 21:22:42.914051560 -0700
+++ linux-2.6.12-rc6/drivers/net/wireless/prism54/isl_38xx.c	2005-06-27 21:22:42.914051560 -0700
@@ -122,8 +122,10 @@ isl38xx_trigger_device(int asleep, void
 	/* check whether the device is in power save mode */
 	if (asleep) {
 		/* device is in powersave, trigger the device for wakeup */
-#if VERBOSE > SHOW_ERROR_MESSAGES
+
 		do_gettimeofday(&current_time);
+
+#if VERBOSE > SHOW_ERROR_MESSAGES
 		DEBUG(SHOW_TRACING, "%08li.%08li Device wakeup triggered\n",
 		      current_time.tv_sec, (long)current_time.tv_usec);
 #endif

--------------060108040904080904090003
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------060108040904080904090003--
