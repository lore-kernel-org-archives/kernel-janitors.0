From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Jun 2016 10:44:34 +0000
Subject: [patch] bfa: clean up some bounds checking
Message-Id: <20160616104434.GB24067@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anil Gurumurthy <anil.gurumurthy@qlogic.com>
Cc: Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

This code is supposed to search ->adapter_hwpath[] and replace the
second colon with a NUL character.  Unfortunately, the boundary checks
that ensure we don't go beyond the end of the buffer have a couple
problems.

Imagine that the string has no colons.  In that case, in the first loop,
we read one space beyond the end of the buffer and then exit the loop.
In the next loop, we increment once, read two characters beyond the end
of the buffer and then exit.  Then after the loop we put a NUL character
two characters past the end of the buffer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is from static analysis and not tested.  Caveat emptor.

diff --git a/drivers/scsi/bfa/bfad_bsg.c b/drivers/scsi/bfa/bfad_bsg.c
index d1ad020..dfb26f0 100644
--- a/drivers/scsi/bfa/bfad_bsg.c
+++ b/drivers/scsi/bfa/bfad_bsg.c
@@ -106,10 +106,17 @@ bfad_iocmd_ioc_get_info(struct bfad_s *bfad, void *cmd)
 
 	/* set adapter hw path */
 	strcpy(iocmd->adapter_hwpath, bfad->pci_name);
-	for (i = 0; iocmd->adapter_hwpath[i] != ':' && i < BFA_STRING_32; i++)
-		;
-	for (; iocmd->adapter_hwpath[++i] != ':' && i < BFA_STRING_32; )
-		;
+	i = -1;
+	while (++i < BFA_STRING_32) {
+		if (iocmd->adapter_hwpath[i] = ':')
+			break;
+	}
+	while (++i < BFA_STRING_32) {
+		if (iocmd->adapter_hwpath[i] = ':')
+			break;
+	}
+	if (i >= BFA_STRING_32)
+		i = BFA_STRING_32 - 1;
 	iocmd->adapter_hwpath[i] = '\0';
 	iocmd->status = BFA_STATUS_OK;
 	return 0;
