From: Vladimir Motyka <vladimir.motyka@gmail.com>
Date: Mon, 09 May 2011 16:08:28 +0000
Subject: Re: [PATCH] drivers/mmc/card/block.c: fix potential null dereference
Message-Id: <4DC8117C.7060200@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4DC7F4AB.90607@gmail.com> <Pine.LNX.4.64.1105091631400.15483@pc-004.diku.dk> <4DC802C0.9040302@gmail.com> <Pine.LNX.4.64.1105091713080.15483@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1105091713080.15483@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cjb@laptop.org
Cc: Julia Lawall <julia@diku.dk>, kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org

When allocation of idata fails there was a null dereference.

Signed-off-by: Vladimir Motyka <vladimir.motyka@gmail.com>
---
diff --git a/drivers/mmc/card/block.c b/drivers/mmc/card/block.c
index 407836d..a03cdc6 100644
--- a/drivers/mmc/card/block.c
+++ b/drivers/mmc/card/block.c
@@ -237,7 +237,7 @@ static struct mmc_blk_ioc_data
*mmc_blk_ioctl_copy_from_user(
 	idata = kzalloc(sizeof(*idata), GFP_KERNEL);
 	if (!idata) {
 		err = -ENOMEM;
-		goto copy_err;
+		goto alloc_err;
 	}

 	if (copy_from_user(&idata->ic, user, sizeof(idata->ic))) {
@@ -268,8 +268,8 @@ static struct mmc_blk_ioc_data
*mmc_blk_ioctl_copy_from_user(
 copy_err:
 	kfree(idata->buf);
 	kfree(idata);
+alloc_err:
 	return ERR_PTR(err);
-
 }

 static int mmc_blk_ioctl_cmd(struct block_device *bdev,
