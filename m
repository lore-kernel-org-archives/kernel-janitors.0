From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 24 Sep 2004 22:10:52 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 35/38] net/tms380tr: replace
Message-Id: <20040924221052.GT1757@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5418775229611672=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============5418775229611672==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/net/tokenring/tms380tr.c	2004-09-09 23:05:31.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/net/tokenring/tms380tr.c	2004-09-13 14:45:50.000000000 -0700
@@ -1244,7 +1244,7 @@ void tms380tr_wait(unsigned long time)
 	
 	tmp = jiffies + time/(1000000/HZ);
 	do {
-  		current->state 		= TASK_INTERRUPTIBLE;
+		set_current_state(TASK_INTERRUPTIBLE);
 		tmp = schedule_timeout(tmp);
 	} while(time_after(tmp, jiffies));
 #else

--===============5418775229611672==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5418775229611672==--
