From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 06 Aug 2017 19:24:55 +0000
Subject: [PATCH 5/5] mtip32xx: Adjust an input validation check in mtip_hw_debugfs_exit()
Message-Id: <40d24351-3d62-e4f7-751a-637c0c3b7977@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <524db5d1-1411-a839-6461-7c33403c1843@users.sourceforge.net>
In-Reply-To: <524db5d1-1411-a839-6461-7c33403c1843@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart Van Assche <Bart.VanAssche@sandisk.com>, Jens Axboe <axboe@kernel.dk>, Johannes Thumshirn <jthumshirn@suse.de>, Ming Lei <ming.lei@redhat.com>, Sagi Grimberg <sagi@grimberg.me>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 6 Aug 2017 20:52:26 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: debugfs_remove_recursive(NULL) is safe and this check is probably not required

Thus adjust this source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/mtip32xx/mtip32xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index 18e634efed95..db37ff872d56 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -2572,7 +2572,7 @@ static int mtip_hw_debugfs_init(struct driver_data *dd)
 
 static void mtip_hw_debugfs_exit(struct driver_data *dd)
 {
-	if (dd->dfs_node)
+	if (dd)
 		debugfs_remove_recursive(dd->dfs_node);
 }
 
-- 
2.13.4

