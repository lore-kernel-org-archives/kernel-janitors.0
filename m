From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:30 +0000
Subject: [KJ] [PATCH][2/26] drivers/block/* - compile warning cleanup
Message-Id: <420BEF86.15477.587C48@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74923460942963072=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============74923460942963072==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanups - handle error return from 
scsi_add_host, cast argument to sprintf to silence warning

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/block/cciss_scsi.c linux-2.6.11-rc3-mm/drivers/block/cciss_scsi.c
--- linux-2.6.11-rc3-mm-original/drivers/block/cciss_scsi.c	2005-02-03 03:55:22.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/block/cciss_scsi.c	2005-02-09 23:04:23.000000000 +0200
@@ -706,7 +706,8 @@ cciss_scsi_detect(int ctlr)
 	sh->hostdata[0] = (unsigned long) hba[ctlr];
 	sh->irq = hba[ctlr]->intr;
 	sh->unique_id = sh->irq;
-	scsi_add_host(sh, &hba[ctlr]->pdev->dev); /* XXX handle failure */
+	if(scsi_add_host(sh, &hba[ctlr]->pdev->dev))
+		return 0;
 	scsi_scan_host(sh);
 
 	return 1;
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/block/sx8.c linux-2.6.11-rc3-mm/drivers/block/sx8.c
--- linux-2.6.11-rc3-mm-original/drivers/block/sx8.c	2005-02-03 
03:57:16.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/block/sx8.c	2005-02-07 15:35:49.000000000 +0200
@@ -1503,7 +1503,7 @@ static int carm_init_disks(struct carm_h
 		}
 
 		port->disk = disk;
-		sprintf(disk->disk_name, DRV_NAME "/%u", (host->id * CARM_MAX_PORTS) + i);
+		sprintf(disk->disk_name, DRV_NAME "/%u", (unsigned int)((host->id * CARM_MAX_PORTS) + i));
 		sprintf(disk->devfs_name, DRV_NAME "/%u_%u", host->id, i);
 		disk->major = host->major;
 		disk->first_minor = i * CARM_MINORS_PER_MAJOR;




--===============74923460942963072==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74923460942963072==--
