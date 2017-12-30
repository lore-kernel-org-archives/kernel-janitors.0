From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 30 Dec 2017 20:33:44 +0000
Subject: [PATCH] wireless: b43: Delete an error message for a failed memory allocation in b43_sdio_probe()
Message-Id: <175d361f-0c00-2a32-c860-a5ad198e74ba@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: b43-dev@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 30 Dec 2017 21:23:47 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/wireless/broadcom/b43/sdio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/b43/sdio.c b/drivers/net/wireless/broadcom/b43/sdio.c
index 59a521800694..5a6dbcf170f9 100644
--- a/drivers/net/wireless/broadcom/b43/sdio.c
+++ b/drivers/net/wireless/broadcom/b43/sdio.c
@@ -146,7 +146,6 @@ static int b43_sdio_probe(struct sdio_func *func,
 	sdio = kzalloc(sizeof(*sdio), GFP_KERNEL);
 	if (!sdio) {
 		error = -ENOMEM;
-		dev_err(&func->dev, "failed to allocate ssb bus\n");
 		goto err_disable_func;
 	}
 	error = ssb_bus_sdiobus_register(&sdio->ssb, func,
-- 
2.15.1

