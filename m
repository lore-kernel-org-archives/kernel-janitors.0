From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:44:14 +0000
Subject: [Kernel-janitors] [PATCH] dvb/dvb_functions: replace
Message-Id: <20040726174414.GG1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61347851313655255=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============61347851313655255==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Remove dvb_delay(), replacing its invocations with
msleep() to guarantee the task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/dvb-core/dvb_functions.h	2004-06-16 05:19:23.000000000 +0000
+++ linux-dev/drivers/media/dvb/dvb-core/dvb_functions.h	2004-07-02 18:39:37.000000000 +0000
@@ -24,17 +24,6 @@
 #ifndef __DVB_FUNCTIONS_H__
 #define __DVB_FUNCTIONS_H__
 
-/**
- *  a sleeping delay function, waits i ms
- *
- */
-static inline
-void dvb_delay(int i)
-{
-	current->state=TASK_INTERRUPTIBLE;
-	schedule_timeout((HZ*i)/1000);
-}
-
 /* we don't mess with video_usercopy() any more,
 we simply define out own dvb_usercopy(), which will hopefull become
 generic_usercopy()  someday... */

--===============61347851313655255==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61347851313655255==--
