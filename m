From: Matthew Martin <lihnucks@gmail.com>
Date: Fri, 17 Feb 2006 17:29:47 +0000
Subject: [KJ] [PATCH] Fix warning drivers/scisi/lpfc/lpfc_sli.c
Message-Id: <1140197387.7633.7.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51597809976950537=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============51597809976950537==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


Hello,
Gcc 4.0.1 gave the warning:

drivers/scsi/lpfc/lpfc_sli.c: In function 'lpfc_sli_issue_iocb'
drivers/scsi/lpfc/lpfc_sli.c:2196: warning: 'iocb' may be used uninitialized in
this function

This fixes that warning.

Signed-off-by: Matthew Martin <lihnucks@gmail.com>

---

--- orig-linux-2.6.15/drivers/scsi/lpfc/lpfc_sli.c	2003-12-03 10:03:49.000000000 -0500
+++ linux-2.6.15/drivers/scsi/lpfc/lpfc_sli.c	2003-12-04 16:35:59.000000000 -0500
@@ -2193,7 +2193,7 @@ lpfc_sli_issue_iocb(struct lpfc_hba *phb
 		    struct lpfc_iocbq *piocb, uint32_t flag)
 {
 	struct lpfc_iocbq *nextiocb;
-	IOCB_t *iocb;
+	IOCB_t *iocb = NULL;
 
 	/*
 	 * We should never get an IOCB if we are in a < LINK_DOWN state




--===============51597809976950537==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51597809976950537==--
