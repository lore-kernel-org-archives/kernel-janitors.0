From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 18:25:34 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 10/16] scsi/qla_init: replace
Message-Id: <20040927182534.GY1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============04697552005838368=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============04697552005838368==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/scsi/qla2xxx/qla_init.c	2004-09-13 17:15:55.000000000 -0700
+++ 2.6.9-rc2/drivers/scsi/qla2xxx/qla_init.c	2004-09-14 09:14:15.000000000 -0700
@@ -967,8 +967,7 @@ qla2x00_fw_ready(scsi_qla_host_t *ha)
 			break;
 
 		/* Delay for a while */
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ / 2);
+		msleep(500);
 
 		DEBUG3(printk("scsi(%ld): fw_state=%x curr time=%lx.\n",
 		    ha->host_no, fw_state, jiffies));

--===============04697552005838368==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============04697552005838368==--
