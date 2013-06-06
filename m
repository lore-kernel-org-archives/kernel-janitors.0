From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Jun 2013 10:51:45 +0000
Subject: [patch] cw1200: remove an unreachable goto
Message-Id: <20130606105145.GC12953@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solomon Peachy <pizza@shaftnet.org>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The "return" is correct and the unreachable "goto" line is wrong.
I have deleted it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/cw1200/hwio.c b/drivers/net/wireless/cw1200/hwio.c
index 1af7b3d..f6b5efd 100644
--- a/drivers/net/wireless/cw1200/hwio.c
+++ b/drivers/net/wireless/cw1200/hwio.c
@@ -178,7 +178,6 @@ int cw1200_indirect_read(struct cw1200_common *priv, u32 addr, void *buf,
 	if ((buf_len / 2) >= 0x1000) {
 		pr_err("Can't read more than 0xfff words.\n");
 		return -EINVAL;
-		goto out;
 	}
 
 	priv->sbus_ops->lock(priv->sbus_priv);
