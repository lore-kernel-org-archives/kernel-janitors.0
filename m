From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 18:14:03 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 2/16] scsi/dpt_i2o: replace
Message-Id: <20040927181403.GQ1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12386968658886355=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============12386968658886355==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/scsi/dpt_i2o.c	2004-09-13 17:16:01.000000000 -0700
+++ 2.6.9-rc2/drivers/scsi/dpt_i2o.c	2004-09-14 09:10:42.000000000 -0700
@@ -1179,7 +1179,7 @@ static int adpt_i2o_post_wait(adpt_hba* 
 				// dangerous.
 				status = -ETIME;
 			}
-			schedule_timeout(timeout*HZ);
+			msleep_interruptible(timeout * 1000);
 		}
 		if(pHba->host)
 			spin_lock_irq(pHba->host->host_lock);

--===============12386968658886355==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12386968658886355==--
