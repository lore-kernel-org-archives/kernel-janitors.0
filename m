From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 22 Jul 2004 22:10:27 +0000
Subject: [Kernel-janitors] [PATCH] i2c-ite: replace schedule_timeout() with
Message-Id: <20040722221026.GM2165@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4687934030808627=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============4687934030808627==
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

Description: Remove iic_ite_sleep() and replace invocations with msleep().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/i2c/busses/i2c-ite.c	2004-06-16 05:19:01.000000000 +0000
+++ linux-dev/drivers/i2c/busses/i2c-ite.c	2004-07-02 17:53:08.000000000 +0000
@@ -102,14 +102,6 @@ static int iic_ite_getclock(void *data)
 }
 
 
-#if 0
-static void iic_ite_sleep(unsigned long timeout)
-{
-	schedule_timeout( timeout * HZ);
-}
-#endif
-
-
 /* Put this process to sleep.  We will wake up when the
  * IIC controller interrupts.
  */

--===============4687934030808627==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4687934030808627==--
