From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 06 Aug 2017 19:22:00 +0000
Subject: [PATCH 3/5] mtip32xx: Delete an unnecessary variable initialisation in mtip_pci_probe()
Message-Id: <9173bae4-e19d-46d4-541c-a1f05a2e54ab@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <524db5d1-1411-a839-6461-7c33403c1843@users.sourceforge.net>
In-Reply-To: <524db5d1-1411-a839-6461-7c33403c1843@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart Van Assche <Bart.VanAssche@sandisk.com>, Jens Axboe <axboe@kernel.dk>, Johannes Thumshirn <jthumshirn@suse.de>, Ming Lei <ming.lei@redhat.com>, Sagi Grimberg <sagi@grimberg.me>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 6 Aug 2017 20:06:42 +0200

The local variable "dd" will be set to an appropriate pointer a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/mtip32xx/mtip32xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index 97cbf39b4273..cba5bc2a1493 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -4193,7 +4193,7 @@ static int mtip_pci_probe(struct pci_dev *pdev,
 			const struct pci_device_id *ent)
 {
 	int rv = 0;
-	struct driver_data *dd = NULL;
+	struct driver_data *dd;
 	char cpu_list[256];
 	const struct cpumask *node_mask;
 	int cpu, i = 0, j = 0;
-- 
2.13.4

