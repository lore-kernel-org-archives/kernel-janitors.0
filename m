From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 23:54:17 +0000
Subject: Re: [Kernel-janitors] [PATCH] scsi/qla_init: replace
Message-Id: <20040727235417.GA6107@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============04186306831495612=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727224902.GD4537@us.ibm.com>
In-Reply-To: <20040727224902.GD4537@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============04186306831495612==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Error in the patch, corrected below. Thanks, Domen.


Applys-to: 2.6.7

Description: Replaces schedule_timeout() with msleep() to guarantee task
delays as desired.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- linux-vanilla/drivers/scsi/qla2xxx/qla_init.c	2004-06-15 22:20:03.000000000 -0700
+++ linux-dev/drivers/scsi/qla2xxx/qla_init.c	2004-07-27 16:53:25.000000000 -0700
@@ -963,8 +963,7 @@ qla2x00_fw_ready(scsi_qla_host_t *ha)
 			break;
 
 		/* Delay for a while */
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ / 2);
+		msleep(500);
 
 		DEBUG3(printk("scsi(%ld): fw_state=%x curr time=%lx.\n",
 		    ha->host_no, fw_state, jiffies));

--===============04186306831495612==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============04186306831495612==--
