From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 08 Jun 2005 08:25:10 +0000
Subject: [KJ] [PATCH] aic7xxx/aic79xx_osm.c : kernel_thread audit return code
Message-Id: <20050608082510.GB15627@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="tKW2IUtsqtDRztdT"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Perhaps, I am wrong, but I think here return code must be negative.
Here, ahd->platform_data->dv_pid is negative and we return postive
value. The return of this function is always tested agains 0, but ...

If I say mistake, I will be happy to know where I am wrong.

description:
audit kernel_thread() return code.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-aic7xxx_aic79xx_osm.c-kernel_thread_audit_return_code.diff"

diff -urpNX dontdiff a/drivers/scsi/aic7xxx/aic79xx_osm.c b/drivers/scsi/aic7xxx/aic79xx_osm.c
--- a/drivers/scsi/aic7xxx/aic79xx_osm.c	2005-06-06 17:22:29.000000000 +0200
+++ b/drivers/scsi/aic7xxx/aic79xx_osm.c	2005-06-08 10:19:28.457547096 +0200
@@ -2031,7 +2031,7 @@ ahd_linux_register_host(struct ahd_softc
 	if (ahd->platform_data->dv_pid < 0) {
 		printf("%s: Failed to create DV thread, error= %d\n",
 		       ahd_name(ahd), ahd->platform_data->dv_pid);
-		return (-ahd->platform_data->dv_pid);
+		return ahd->platform_data->dv_pid;
 	}
 	/*
 	 * Initially allocate *all* of our linux target objects

--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--tKW2IUtsqtDRztdT--
