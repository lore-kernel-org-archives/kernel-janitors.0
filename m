From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 23:49:27 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2] mmc: replace schedule_timeout()
Message-Id: <20040920234927.GC2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34912428020696762=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34912428020696762==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/mmc/mmc.c	2004-09-09 23:05:59.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/mmc/mmc.c	2004-09-10 13:53:04.000000000 -0700
@@ -270,8 +270,7 @@ static inline void mmc_delay(unsigned in
 		yield();
 		mdelay(ms);
 	} else {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(ms * HZ / 1000);
+		msleep_interruptible (ms);
 	}
 }
 

--===============34912428020696762==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34912428020696762==--
