From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Thu, 20 Aug 2020 08:52:00 +0000
Subject: [PATCH 5/6] staging: wfx/hif_rx.c: Fix spelling mistake "negociation" => "negotiation"
Message-Id: <eab6bcb570dcd1407efc8163ff8ff976f623ae9c.1597913333.git.usuraj35@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <834139101223e627665c939388cd7c542920c531.1597913333.git.usuraj35@gmail.com>
In-Reply-To: <834139101223e627665c939388cd7c542920c531.1597913333.git.usuraj35@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jerome.pouiller@silabs.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/staging/wfx/hif_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wfx/hif_rx.c b/drivers/staging/wfx/hif_rx.c
index cc7c0cf226ba..1d32973d8ec1 100644
--- a/drivers/staging/wfx/hif_rx.c
+++ b/drivers/staging/wfx/hif_rx.c
@@ -118,7 +118,7 @@ static int hif_keys_indication(struct wfx_dev *wdev,
 
 	// SL_PUB_KEY_EXCHANGE_STATUS_SUCCESS is used by legacy secure link
 	if (body->status && body->status != HIF_STATUS_SLK_NEGO_SUCCESS)
-		dev_warn(wdev->dev, "secure link negociation error\n");
+		dev_warn(wdev->dev, "secure link negotiation error\n");
 	memcpy(pubkey, body->ncp_pub_key, sizeof(pubkey));
 	memreverse(pubkey, sizeof(pubkey));
 	wfx_sl_check_pubkey(wdev, pubkey, body->ncp_pub_key_mac);
-- 
2.17.1
