From: Domen Puncer <domen@coderock.org>
Date: Sat, 08 May 2004 23:38:21 +0000
Subject: [Kernel-janitors] [patch 2.6.6-rc3 12/16] ifdefs:
Message-Id: <20040508233821.GA4148@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0347714575932212=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============0347714575932212==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

--- c/drivers/scsi/aic7xxx/cam.h	2004-04-04 05:37:06.000000000 +0200
+++ a/drivers/scsi/aic7xxx/cam.h	2004-05-08 23:52:49.000000000 +0200
@@ -85,12 +85,6 @@
 	CAM_STATUS_MASK		= 0x3F
 } cam_status;
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,0)
-#define	SCSI_DATA_READ	1
-#define	SCSI_DATA_WRITE 2
-#define SCSI_DATA_NONE  3
-#endif
-
 /*
  * Definitions for the asynchronous callback CCB fields.
  */

--===============0347714575932212==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0347714575932212==--
