From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 21 Jul 2004 23:04:06 +0000
Subject: [Kernel-janitors] [PATCH] ec3104: replace schedule_timeout() with
Message-Id: <20040721230405.GA7244@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48310951397467328=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============48310951397467328==
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
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/char/ec3104_keyb.c	2004-06-16 05:19:22.000000000 +0000
+++ linux-dev/drivers/char/ec3104_keyb.c	2004-07-10 18:33:37.000000000 +0000
@@ -412,7 +412,7 @@ static void ec3104_keyb_clear_state(void
 	k->last_msr = 0;
 
 	for (;;) {
-		schedule_timeout(HZ/10);
+		msleep(100);
 
 		msr = ctrl_inb(EC3104_SER4_MSR);
 	

--===============48310951397467328==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48310951397467328==--
