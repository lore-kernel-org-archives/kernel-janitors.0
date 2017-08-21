From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Aug 2017 20:53:44 +0000
Subject: [PATCH 1/4] w1: Delete an error message for a failed memory allocation in two functions
Message-Id: <2caa1294-178b-b7da-8f1c-e3200a88a62f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cb845ee0-0826-6a68-1246-0beab38129c1@users.sourceforge.net>
In-Reply-To: <cb845ee0-0826-6a68-1246-0beab38129c1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Andrew F. Davis" <afd@ti.com>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Evgeniy Polyakov <zbr@ioremap.net>, "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, Sebastian Reichel <sre@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Aug 2017 21:05:42 +0200

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/w1/w1.c     | 7 +------
 drivers/w1/w1_int.c | 6 +-----
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index 74471e7aa5cc..f26c1ea280dd 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -715,10 +715,5 @@ int w1_attach_slave_device(struct w1_master *dev, struct w1_reg_num *rn)
-	if (!sl) {
-		dev_err(&dev->dev,
-			 "%s: failed to allocate new slave device.\n",
-			 __func__);
+	if (!sl)
 		return -ENOMEM;
-	}
-
 
 	sl->owner = THIS_MODULE;
 	sl->master = dev;
diff --git a/drivers/w1/w1_int.c b/drivers/w1/w1_int.c
index 1c776178f598..9e37463960ed 100644
--- a/drivers/w1/w1_int.c
+++ b/drivers/w1/w1_int.c
@@ -44,9 +44,5 @@ static struct w1_master *w1_alloc_dev(u32 id, int slave_count, int slave_ttl,
-	if (!dev) {
-		pr_err("Failed to allocate %zd bytes for new w1 device.\n",
-			sizeof(struct w1_master));
+	if (!dev)
 		return NULL;
-	}
-
 
 	dev->bus_master = (struct w1_bus_master *)(dev + 1);
 
-- 
2.14.0

