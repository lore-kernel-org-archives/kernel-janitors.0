From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Mon, 14 Feb 2005 22:02:51 +0000
Subject: [KJ] [PATCH][RESUBMIT][2/21] drivers/block/* - compile warning
Message-Id: <42113C2B.3809.52B9FA@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16950189786516767=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============16950189786516767==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanups - handle error return from 
scsi_add_host

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/block/cciss_scsi.c linux-2.6.11-rc3-mm2/drivers/block/cciss_scsi.c
--- linux-2.6.11-rc3-mm2-original/drivers/block/cciss_scsi.c	2005-02-12 12:06:24.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/block/cciss_scsi.c	2005-02-12 14:08:33.000000000 +0200
@@ -706,7 +706,8 @@ cciss_scsi_detect(int ctlr)
 	sh->hostdata[0] = (unsigned long) hba[ctlr];
 	sh->irq = hba[ctlr]->intr;
 	sh->unique_id = sh->irq;
-	scsi_add_host(sh, &hba[ctlr]->pdev->dev); /* XXX handle failure */
+	if (scsi_add_host(sh, &hba[ctlr]->pdev->dev))
+		return 0;
 	scsi_scan_host(sh);
 
 	return 1;



--===============16950189786516767==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16950189786516767==--
