From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Jan 2013 06:55:18 +0000
Subject: [patch] Staging: bcm: add a missing break statement
Message-Id: <20130111065517.GE13207@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

My static checker complains that there is a missing break statement
here.  From the context, it does look like a break statement was
intended.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Untested.

diff --git a/drivers/staging/bcm/nvm.c b/drivers/staging/bcm/nvm.c
index 4283753..e6152f4 100644
--- a/drivers/staging/bcm/nvm.c
+++ b/drivers/staging/bcm/nvm.c
@@ -2810,6 +2810,7 @@ int BcmGetSectionValEndOffset(struct bcm_mini_adapter *Adapter, enum bcm_flash2x
 	case CONTROL_SECTION:
 		/* Not Clear So Putting failure. confirm and fix it. */
 		SectEndOffset = STATUS_FAILURE;
+		break;
 	case ISO_IMAGE1_PART2:
 		if (Adapter->psFlash2xCSInfo->OffsetISOImage1Part2End != UNINIT_PTR_IN_CS)
 			SectEndOffset = (Adapter->psFlash2xCSInfo->OffsetISOImage1Part2End);
