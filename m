From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:49:02 +0000
Subject: [Kernel-janitors] [PATCH] scsi/qla_init: replace schedule_timeout()
Message-Id: <20040727224902.GD4537@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============093546482319077917=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============093546482319077917==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/scsi/qla2xxx/qla_init.c	2004-06-16 05:20:03.000000000 +0000
+++ linux-dev/drivers/scsi/qla2xxx/qla_init.c	2004-07-03 03:53:27.000000000 +0000
@@ -963,8 +963,7 @@ qla2x00_fw_ready(scsi_qla_host_t *ha)
 			break;
 
 		/* Delay for a while */
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ / 2);
+		msleep(2000);
 
 		DEBUG3(printk("scsi(%ld): fw_state=%x curr time=%lx.\n",
 		    ha->host_no, fw_state, jiffies));

--===============093546482319077917==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============093546482319077917==--
