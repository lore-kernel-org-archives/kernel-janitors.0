From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 22 Jul 2004 22:17:50 +0000
Subject: [Kernel-janitors] [PATCH] scx200_acb: replace schedule_timeout()
Message-Id: <20040722221750.GQ2165@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69932429984198752=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============69932429984198752==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
a few) places where I had to make a decision to set the state before the
call to

schedule_timeout();

This of course affected any decision to replace the code with msleep()
or not. Please inform if the other state from the one I used is desired.

Thanks,
Nish



Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays the requested time. 

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/i2c/busses/scx200_acb.c	2004-06-16 05:19:23.000000000 +0000
+++ linux-dev/drivers/i2c/busses/scx200_acb.c	2004-07-21 16:55:39.000000000 +0000
@@ -32,6 +32,7 @@
 #include <linux/i2c.h>
 #include <linux/smp_lock.h>
 #include <linux/pci.h>
+#include <linux/delay.h>
 #include <asm/io.h>
 
 #include <linux/scx200.h>
@@ -254,7 +255,7 @@ static void scx200_acb_poll(struct scx20
 			scx200_acb_machine(iface, status);
 			return;
 		}
-		schedule_timeout(HZ/100+1);
+		msleep(10);		/* sleep 10ms */
 	}
 
 	scx200_acb_timeout(iface);

--===============69932429984198752==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69932429984198752==--
