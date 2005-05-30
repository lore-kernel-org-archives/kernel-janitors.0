From: Chuck Short <zulcss@gmail.com>
Date: Mon, 30 May 2005 02:06:09 +0000
Subject: [KJ] [PATCH] aic79xx_osm scsi_add_host error checking
Message-Id: <429A7511.9020007@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020100050201070008010401"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------020100050201070008010401
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This patch checks for the return value of scsi_add_host.

Signed-off by: Chuck Short <zuclss@gmail.com>

--------------020100050201070008010401
Content-Type: text/plain;
	name="aic79xx_osm-scsi_add_host_error_checking.dpatch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="aic79xx_osm-scsi_add_host_error_checking.dpatch"

diff -Naur linux-source-2.6.12-2.6.11.93.orig/drivers/scsi/aic7xxx/aic79xx_osm.c linux-source-2.6.12-2.6.11.93/drivers/scsi/aic7xxx/aic79xx_osm.c
--- linux-source-2.6.12-2.6.11.93.orig/drivers/scsi/aic7xxx/aic79xx_osm.c	2005-04-21 06:39:57.000000000 -0400
+++ linux-source-2.6.12-2.6.11.93/drivers/scsi/aic7xxx/aic79xx_osm.c	2005-05-29 21:12:45.099645176 -0400
@@ -1989,7 +1989,8 @@
 	char	*new_name;
 	u_long	s;
 	u_long	target;
-
+	int error;
+	
 	template->name = ahd->description;
 	host = scsi_host_alloc(template, sizeof(struct ahd_softc *));
 	if (host == NULL)
@@ -2065,7 +2066,9 @@
 	ahd_unlock(ahd, &s);
 
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
-	scsi_add_host(host, &ahd->dev_softc->dev); /* XXX handle failure */
+	error = scsi_add_host(host, &ahd->dev_softc->dev);
+	if (error)
+		return (ENOMEM);	
 	scsi_scan_host(host);
 #endif
 	return (0);

--------------020100050201070008010401
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------020100050201070008010401--
