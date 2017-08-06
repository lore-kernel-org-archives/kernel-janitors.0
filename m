From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 06 Aug 2017 19:23:46 +0000
Subject: [PATCH 4/5] mtip32xx: Fix a typo in a comment line in mtip_hw_get_identify()
Message-Id: <a9161afb-c4fe-342b-c636-7a98b1d2f37d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <524db5d1-1411-a839-6461-7c33403c1843@users.sourceforge.net>
In-Reply-To: <524db5d1-1411-a839-6461-7c33403c1843@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart Van Assche <Bart.VanAssche@sandisk.com>, Jens Axboe <axboe@kernel.dk>, Johannes Thumshirn <jthumshirn@suse.de>, Ming Lei <ming.lei@redhat.com>, Sagi Grimberg <sagi@grimberg.me>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 6 Aug 2017 20:28:48 +0200

Add a missing character in this description.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/mtip32xx/mtip32xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index cba5bc2a1493..18e634efed95 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -2981,7 +2981,7 @@ static int mtip_hw_get_identify(struct driver_data *dd)
 		}
 	}
 
-	/* get write protect progess */
+	/* get write protect progress */
 	memset(&attr242, 0, sizeof(struct smart_attr));
 	if (mtip_get_smart_attr(dd->port, 242, &attr242))
 		dev_warn(&dd->pdev->dev,
-- 
2.13.4

