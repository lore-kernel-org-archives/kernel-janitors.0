From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 24 Sep 2004 18:08:25 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 28/38] net/pcnet32: replace
Message-Id: <20040924180825.GH1757@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71548992713586923=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============71548992713586923==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use ssleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.9-rc1-mm4-vanilla/drivers/net/pcnet32.c	2004-09-09 23:05:32.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/net/pcnet32.c	2004-09-13 14:38:47.000000000 -0700
@@ -847,7 +847,7 @@ static int pcnet32_phys_id(struct net_de
     if ((!data) || (data > (u32)(MAX_SCHEDULE_TIMEOUT / HZ)))
     data = (u32)(MAX_SCHEDULE_TIMEOUT / HZ);
 
-    schedule_timeout(data * HZ);
+    msleep_interruptible(data * 1000);
     del_timer_sync(&lp->blink_timer);
 
     /* Restore the original value of the bcrs */

--===============71548992713586923==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71548992713586923==--
