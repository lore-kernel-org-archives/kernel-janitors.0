From: Domen Puncer <domen@coderock.org>
Date: Sat, 08 May 2004 23:38:22 +0000
Subject: [Kernel-janitors] [patch 2.6.6-rc3 14/16] ifdefs:
Message-Id: <20040508233822.GA4160@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70757521430924553=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============70757521430924553==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

--- c/drivers/scsi/scsiiom.c	2004-04-04 05:36:16.000000000 +0200
+++ a/drivers/scsi/scsiiom.c	2004-05-08 23:57:34.000000000 +0200
@@ -1619,9 +1619,7 @@
 	  pACB->scan_devices = 0;
      };
 
-#if LINUX_VERSION_CODE > KERNEL_VERSION(2,3,30)
     pcmd->resid = pcmd->request_bufflen - pSRB->TotalXferredLen;
-#endif
 
     if (!DCB_removed) dc390_Going_remove (pDCB, pSRB);
     /* Add to free list */

--===============70757521430924553==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70757521430924553==--
