From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:28 +0000
Subject: [KJ] [PATCH][14/26] drivers/scsi/aic7xxx/* - compile warning cleanup
Message-Id: <420BEF84.25472.587543@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27704997089062777=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============27704997089062777==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - handle error return from 
scsi_add_host

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/scsi/aic7xxx/aic79xx_osm.c linux-2.6.11-rc3-mm/drivers/scsi/aic7xxx/aic79xx_osm.c
--- linux-2.6.11-rc3-mm-original/drivers/scsi/aic7xxx/aic79xx_osm.c	2005-02-03 03:55:53.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/aic7xxx/aic79xx_osm.c	2005-02-09 23:06:17.000000000 +0200
@@ -2065,7 +2065,8 @@ ahd_linux_register_host(struct ahd_softc
 	ahd_unlock(ahd, &s);
 
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
-	scsi_add_host(host, &ahd->dev_softc->dev); /* XXX handle failure */
+	if(scsi_add_host(host, &ahd->dev_softc->dev))
+		return (EIO);
 	scsi_scan_host(host);
 #endif
 	return (0);
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/scsi/aic7xxx/aic7xxx_osm.c linux-2.6.11-rc3-mm/drivers/scsi/aic7xxx/aic7xxx_osm.c
--- linux-2.6.11-rc3-mm-original/drivers/scsi/aic7xxx/aic7xxx_osm.c	2005-02-03 03:55:07.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/aic7xxx/aic7xxx_osm.c	2005-02-09 23:07:10.000000000 +0200
@@ -1729,7 +1729,8 @@ ahc_linux_register_host(struct ahc_softc
 	ahc_unlock(ahc, &s);
 
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
-	scsi_add_host(host, (ahc->dev_softc ? &ahc->dev_softc->dev : NULL)); /* XXX handle failure */
+	if(scsi_add_host(host, (ahc->dev_softc ? &ahc->dev_softc->dev : NULL)))
+		return (EIO);
 	scsi_scan_host(host);
 #endif
 	return (0);




--===============27704997089062777==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27704997089062777==--
