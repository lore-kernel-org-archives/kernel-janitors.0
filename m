From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Mon, 14 Feb 2005 22:02:53 +0000
Subject: [KJ] [PATCH][RESUBMIT][12/21] drivers/scsi/aic7xxx/* - compile
Message-Id: <42113C2D.23785.52BFB7@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4137804953754205=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============4137804953754205==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - handle error return from 
scsi_add_host

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/scsi/aic7xxx/aic79xx_osm.c linux-2.6.11-rc3-mm2/drivers/scsi/aic7xxx/aic79xx_osm.c
--- linux-2.6.11-rc3-mm2-original/drivers/scsi/aic7xxx/aic79xx_osm.c	2005-02-12 12:06:25.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/scsi/aic7xxx/aic79xx_osm.c	2005-02-12 17:35:49.000000000 +0200
@@ -2065,7 +2065,8 @@ ahd_linux_register_host(struct ahd_softc
 	ahd_unlock(ahd, &s);
 
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
-	scsi_add_host(host, &ahd->dev_softc->dev); /* XXX handle failure */
+	if (scsi_add_host(host, &ahd->dev_softc->dev))
+		return (EIO);
 	scsi_scan_host(host);
 #endif
 	return (0);
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/scsi/aic7xxx/aic7xxx_osm.c linux-2.6.11-rc3-mm2/drivers/scsi/aic7xxx/aic7xxx_osm.c
--- linux-2.6.11-rc3-mm2-original/drivers/scsi/aic7xxx/aic7xxx_osm.c	2005-02-12 12:06:25.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/scsi/aic7xxx/aic7xxx_osm.c	2005-02-12 17:35:49.000000000 +0200
@@ -1729,7 +1729,8 @@ ahc_linux_register_host(struct ahc_softc
 	ahc_unlock(ahc, &s);
 
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
-	scsi_add_host(host, (ahc->dev_softc ? &ahc->dev_softc->dev : NULL)); /* XXX handle failure */
+	if (scsi_add_host(host, (ahc->dev_softc ? &ahc->dev_softc->dev : NULL)))
+		return (EIO);
 	scsi_scan_host(host);
 #endif
 	return (0);




--===============4137804953754205==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4137804953754205==--
