From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 00:02:37 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 2/2] ieee1394/sbp2: replace
Message-Id: <20040917000237.GL1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87388333935743079=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916230412.GD1777@us.ibm.com>
In-Reply-To: <20040916230412.GD1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============87388333935743079==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Uses msleep_interruptible() in place of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/ieee1394/sbp2.c	2004-09-13 17:16:07.000000000 -0700
+++ 2.6.9-rc2/drivers/ieee1394/sbp2.c	2004-09-14 13:54:17.000000000 -0700
@@ -357,8 +357,7 @@ static int sbp2util_down_timeout(atomic_
 	int i;
 
 	for (i = timeout; (i > 0 && atomic_read(done) == 0); i-= HZ/10) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		if (schedule_timeout(HZ/10))	/* 100ms */
+		if (msleep_interruptible(100))	/* 100ms */
 			return(1);
 	}
 	return ((i > 0) ? 0:1);
@@ -903,8 +902,7 @@ alloc_fail:
 	 * connected to the sbp2 device being removed. That host would
 	 * have a certain amount of time to relogin before the sbp2 device
 	 * allows someone else to login instead. One second makes sense. */
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ);
+	msleep_interruptible(1000);
 
 	/*
 	 * Login to the sbp-2 device

--===============87388333935743079==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87388333935743079==--
