From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:18:11 +0000
Subject: [Kernel-janitors] [PATCH] s390/zfcp_fsf: replace schedule_timeout()
Message-Id: <20040727221811.GH3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8200447056388922=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8200447056388922==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/s390/scsi/zfcp_fsf.c	2004-06-16 05:19:43.000000000 +0000
+++ linux-dev/drivers/s390/scsi/zfcp_fsf.c	2004-07-03 03:45:33.000000000 +0000
@@ -180,8 +180,7 @@ zfcp_fsf_req_dismiss_all(struct zfcp_ada
 		ZFCP_LOG_DEBUG("fsf req list of adapter %s not yet empty\n",
 			       zfcp_get_busid_by_adapter(adapter));
 		/* wait for woken intiators to clean up their requests */
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(ZFCP_FSFREQ_CLEANUP_TIMEOUT);
+		msleep(jiffies_to_msecs(ZFCP_FSFREQ_CLEANUP_TIMEOUT));
 	}
 
 	/* consistency check */

--===============8200447056388922==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8200447056388922==--
