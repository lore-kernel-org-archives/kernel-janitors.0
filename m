From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:43:05 +0000
Subject: [Kernel-janitors] [PATCH] dvb/dvb_frontend: replace
Message-Id: <20040726174305.GF1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80339511088602622=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============80339511088602622==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replace dvb_delay() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/dvb-core/dvb_frontend.c	2004-06-16 05:19:01.000000000 +0000
+++ linux-dev/drivers/media/dvb/dvb-core/dvb_frontend.c	2004-07-21 16:56:57.000000000 +0000
@@ -32,6 +32,7 @@
 #include <linux/poll.h>
 #include <linux/module.h>
 #include <linux/list.h>
+#include <linux/delay.h>
 #include <asm/processor.h>
 #include <asm/semaphore.h>
 
@@ -233,7 +234,7 @@ static void dvb_call_frontend_notifiers 
 	dprintk ("%s\n", __FUNCTION__);
 
 	if (((s ^ fe->status) & FE_HAS_LOCK) && (s & FE_HAS_LOCK))
-		dvb_delay (fe->info->notifier_delay);
+		msleep (fe->info->notifier_delay);
 
 	fe->status = s;
 

--===============80339511088602622==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80339511088602622==--
