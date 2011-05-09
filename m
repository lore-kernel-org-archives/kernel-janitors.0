From: Vladimir Motyka <vladimir.motyka@gmail.com>
Date: Mon, 09 May 2011 14:05:31 +0000
Subject: [PATCH] drivers/mmc/card/block.c: fix potential null dereference
Message-Id: <4DC7F4AB.90607@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cjb@laptop.org
Cc: kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org

When allocation of idata fails there was a null dereferece.

Signed-off-by: Vladimir Motyka <vladimir.motyka@gmail.com>

---
diff --git a/drivers/mmc/card/block.c b/drivers/mmc/card/block.c
index 407836d..3dec493 100644
--- a/drivers/mmc/card/block.c
+++ b/drivers/mmc/card/block.c
@@ -266,10 +266,10 @@ static struct mmc_blk_ioc_data
*mmc_blk_ioctl_copy_from_user(
 	return idata;

 copy_err:
-	kfree(idata->buf);
+	if(idata)
+		kfree(idata->buf);
 	kfree(idata);
 	return ERR_PTR(err);
-
 }

 static int mmc_blk_ioctl_cmd(struct block_device *bdev,
