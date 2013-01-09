From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Jan 2013 07:09:19 +0000
Subject: [patch] Staging: bcm: copying more data than intended
Message-Id: <20130109070919.GA2454@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This was changed to bcm_flash2x_cs_info instead of bcm_flash_cs_info
when we got rid of the typedefs.  bcm_flash2x_cs_info is quite a bit
larger than bcm_flash_cs_info (436 bytes instead of 96) so it would
corrupt user memory and it's an info leak.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only needed in linux-next.  I'm not sure how I missed this when the
patch was originally submitted.  I reviewed the patchset.

diff --git a/drivers/staging/bcm/Bcmchar.c b/drivers/staging/bcm/Bcmchar.c
index 4ba1a5d..491e2bf 100644
--- a/drivers/staging/bcm/Bcmchar.c
+++ b/drivers/staging/bcm/Bcmchar.c
@@ -1792,7 +1792,7 @@ cntrlEnd:
 			if (IoBuffer.OutputLength < sizeof(struct bcm_flash_cs_info))
 				return -EINVAL;
 
-			if (copy_to_user(IoBuffer.OutputBuffer, Adapter->psFlashCSInfo, sizeof(struct bcm_flash2x_cs_info)))
+			if (copy_to_user(IoBuffer.OutputBuffer, Adapter->psFlashCSInfo, sizeof(struct bcm_flash_cs_info)))
 				return -EFAULT;
 		}
 	}
