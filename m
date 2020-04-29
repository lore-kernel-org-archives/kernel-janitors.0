From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 29 Apr 2020 06:52:59 +0000
Subject: [PATCH 4/4 v2] firmware: stratix10-svc: Slightly simplify code
Message-Id: <8c505c686438c54da61ad4fe15e1eae722011153.1588142343.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1588142343.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1588142343.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: richard.gong@linux.intel.com, gregkh@linuxfoundation.org, atull@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Replace 'devm_kmalloc_array(... | __GFP_ZERO)' with the equivalent and
shorter 'devm_kcalloc(...)'.

'ctrl->genpool' can not be NULL, so axe a useless test in the remove
function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/firmware/stratix10-svc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 739004398877..c228337cb0a1 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -1002,8 +1002,7 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 	if (!controller)
 		return -ENOMEM;
 
-	chans = devm_kmalloc_array(dev, SVC_NUM_CHANNEL,
-				   sizeof(*chans), GFP_KERNEL | __GFP_ZERO);
+	chans = devm_kcalloc(dev, SVC_NUM_CHANNEL, sizeof(*chans), GFP_KERNEL);
 	if (!chans)
 		return -ENOMEM;
 
@@ -1086,8 +1085,7 @@ static int stratix10_svc_drv_remove(struct platform_device *pdev)
 		kthread_stop(ctrl->task);
 		ctrl->task = NULL;
 	}
-	if (ctrl->genpool)
-		gen_pool_destroy(ctrl->genpool);
+	gen_pool_destroy(ctrl->genpool);
 	list_del(&ctrl->node);
 
 	return 0;
-- 
2.25.1
