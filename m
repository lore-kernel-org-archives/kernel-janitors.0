From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 18:42:53 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 3/3] md/raid1: replace
Message-Id: <20040917184253.GC5755@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69274547942513509=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916234735.GJ1777@us.ibm.com>
In-Reply-To: <20040916234735.GJ1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============69274547942513509==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/md/raid1.c	2004-09-09 23:05:58.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/md/raid1.c	2004-09-10 11:51:56.000000000 -0700
@@ -1013,7 +1013,7 @@ static int sync_request(mddev_t *mddev, 
 	 * put in a delay to throttle resync.
 	 */
 	if (!go_faster && waitqueue_active(&conf->wait_resume))
-		schedule_timeout(HZ);
+		msleep_interruptible(1000);
 	device_barrier(conf, sector_nr + RESYNC_SECTORS);
 
 	/*

--===============69274547942513509==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69274547942513509==--
