From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 18:24:28 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 9/16] scsi/qla1280: replace
Message-Id: <20040927182428.GX1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18384511914091028=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============18384511914091028==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/scsi/qla1280.c	2004-09-13 17:16:01.000000000 -0700
+++ 2.6.9-rc2/drivers/scsi/qla1280.c	2004-09-14 09:14:08.000000000 -0700
@@ -2940,7 +2940,7 @@ qla1280_bus_reset(struct scsi_qla_host *
 		ha->bus_settings[bus].failed_reset_count++;
 	} else {
 		spin_unlock_irq(HOST_LOCK);
-		schedule_timeout(reset_delay * HZ);
+		msleep(reset_delay * 1000);
 		spin_lock_irq(HOST_LOCK);
 
 		ha->bus_settings[bus].scsi_bus_dead = 0;

--===============18384511914091028==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18384511914091028==--
