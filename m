From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 22 Oct 2004 23:52:38 +0000
Subject: [KJ] [PATCH] scsi/qla_os: replace schedule_timeout() with ssleep()
Message-Id: <20041022235238.GK18906@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61732335433710994=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============61732335433710994==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be, as always, appreciated.

-Nish

Description: Use ssleep() instead of schedule_timeout() to guarantee the
task delays as expected. Change the values of the constants being used
appropriately. I left the arithmetic there as it was before, even though
it could be easily simplified away.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-bk7-vanilla/drivers/scsi/qla2xxx/qla_os.c	2004-10-22 10:41:10.000000000 -0700
+++ 2.6.9-bk7/drivers/scsi/qla2xxx/qla_os.c	2004-10-22 15:27:07.000000000 -0700
@@ -888,8 +888,8 @@ qla2x00_queuecommand(struct scsi_cmnd *c
 static int
 qla2x00_eh_wait_on_command(scsi_qla_host_t *ha, struct scsi_cmnd *cmd)
 {
-#define ABORT_POLLING_PERIOD	HZ
-#define ABORT_WAIT_TIME		((10 * HZ) / (ABORT_POLLING_PERIOD))
+#define ABORT_POLLING_PERIOD	1000
+#define ABORT_WAIT_TIME		((10 * 1000) / ABORT_POLLING_PERIOD)
 
 	int		found = 0;
 	int		done = 0;
@@ -926,8 +926,7 @@ qla2x00_eh_wait_on_command(scsi_qla_host
 
 		spin_unlock_irq(ha->host->host_lock);
 
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(ABORT_POLLING_PERIOD);
+		ssleep(ABORT_POLLING_PERIOD / 1000);
 
 		spin_lock_irq(ha->host->host_lock);
 

--===============61732335433710994==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61732335433710994==--
