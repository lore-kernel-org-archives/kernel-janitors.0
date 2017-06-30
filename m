From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Jun 2017 08:01:06 +0000
Subject: [PATCH] cxlflash: return -EFAULT if copy_from_user() fails
Message-Id: <20170630080106.yxyckztimezvpzrt@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Manoj N. Kumar" <manoj@linux.vnet.ibm.com>, "Matthew R. Ochs" <mrochs@linux.vnet.ibm.com>
Cc: Uma Krishnan <ukrishn@linux.vnet.ibm.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

The copy_from/to_user() functions return the number of bytes remaining
to be copied but we had intended to return -EFAULT here.

Fixes: bc88ac47d5cb ("scsi: cxlflash: Support AFU debug")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/cxlflash/main.c b/drivers/scsi/cxlflash/main.c
index 7a787b6e21c4..56b6e294ab78 100644
--- a/drivers/scsi/cxlflash/main.c
+++ b/drivers/scsi/cxlflash/main.c
@@ -3415,9 +3415,10 @@ static int cxlflash_afu_debug(struct cxlflash_cfg *cfg,
 		if (is_write) {
 			req_flags |= SISL_REQ_FLAGS_HOST_WRITE;
 
-			rc = copy_from_user(kbuf, ubuf, ulen);
-			if (unlikely(rc))
+			if (copy_from_user(kbuf, ubuf, ulen)) {
+				rc = -EFAULT;
 				goto out;
+			}
 		}
 	}
 
@@ -3445,8 +3446,10 @@ static int cxlflash_afu_debug(struct cxlflash_cfg *cfg,
 		goto out;
 	}
 
-	if (ulen && !is_write)
-		rc = copy_to_user(ubuf, kbuf, ulen);
+	if (ulen && !is_write) {
+		if (copy_to_user(ubuf, kbuf, ulen))
+			rc = -EFAULT;
+	}
 out:
 	kfree(buf);
 	dev_dbg(dev, "%s: returning rc=%d\n", __func__, rc);
