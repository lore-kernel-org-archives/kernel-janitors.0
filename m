From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 01 Jan 2018 17:53:41 +0000
Subject: [PATCH 1/2] benet: Delete an error message for a failed memory allocation in be_alloc_work()
Message-Id: <d0ce16d9-9fd0-dcf0-c78b-70efb2d76db1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <86e577a3-77a4-2e74-dd2d-4d63e90ffb72@users.sourceforge.net>
In-Reply-To: <86e577a3-77a4-2e74-dd2d-4d63e90ffb72@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Ajit Khaparde <ajit.khaparde@broadcom.com>, Sathya Perla <sathya.perla@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 Jan 2018 18:38:06 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/ethernet/emulex/benet/be_main.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/emulex/benet/be_main.c b/drivers/net/ethernet/emulex/benet/be_main.c
index c6e859a27ee6..475d94762306 100644
--- a/drivers/net/ethernet/emulex/benet/be_main.c
+++ b/drivers/net/ethernet/emulex/benet/be_main.c
@@ -4930,11 +4930,8 @@ static struct be_cmd_work *be_alloc_work(struct be_adapter *adapter,
 	struct be_cmd_work *work;
 
 	work = kzalloc(sizeof(*work), GFP_ATOMIC);
-	if (!work) {
-		dev_err(&adapter->pdev->dev,
-			"be_work memory allocation failed\n");
+	if (!work)
 		return NULL;
-	}
 
 	INIT_WORK(&work->work, func);
 	work->adapter = adapter;
-- 
2.15.1

