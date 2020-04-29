From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 29 Apr 2020 06:52:34 +0000
Subject: [PATCH 1/4 v2] firmware: stratix10-svc: Fix genpool creation error handling
Message-Id: <660774ee8e63c03cb93a24d605c381eb0dce3b67.1588142343.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1588142343.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1588142343.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: richard.gong@linux.intel.com, gregkh@linuxfoundation.org, atull@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'svc_create_memory_pool()' returns an error pointer on error, not NULL.
Fix the corresponding test and return value accordingly.

Move the genpool allocation after a few devm_kzalloc in order to ease
error handling.

Fixes: 7ca5ce896524 ("firmware: add Intel Stratix10 service layer driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/firmware/stratix10-svc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index d5f0769f3761..3a176e62754a 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -997,10 +997,6 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	genpool = svc_create_memory_pool(pdev, sh_memory);
-	if (!genpool)
-		return -ENOMEM;
-
 	/* allocate service controller and supporting channel */
 	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
 	if (!controller)
@@ -1011,6 +1007,10 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 	if (!chans)
 		return -ENOMEM;
 
+	genpool = svc_create_memory_pool(pdev, sh_memory);
+	if (IS_ERR(genpool))
+		return PTR_ERR(genpool);
+
 	controller->dev = dev;
 	controller->num_chans = SVC_NUM_CHANNEL;
 	controller->num_active_client = 0;
-- 
2.25.1
