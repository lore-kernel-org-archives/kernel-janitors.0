From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 18:11:57 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/16] scsi/53c700: replace
Message-Id: <20040927181157.GP1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============084727742522122895=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============084727742522122895==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/scsi/53c700.c	2004-09-13 17:15:58.000000000 -0700
+++ 2.6.9-rc2/drivers/scsi/53c700.c	2004-09-14 09:10:24.000000000 -0700
@@ -1961,7 +1961,7 @@ NCR_700_bus_reset(struct scsi_cmnd * SCp
 	 * reset via sg or something */
 	while(hostdata->eh_complete != NULL) {
 		spin_unlock_irq(SCp->device->host->host_lock);
-		schedule_timeout(HZ/10);
+		msleep_interruptible(100);
 		spin_lock_irq(SCp->device->host->host_lock);
 	}
 	hostdata->eh_complete = &complete;

--===============084727742522122895==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============084727742522122895==--
