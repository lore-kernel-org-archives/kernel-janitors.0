From: Colin King <colin.king@canonical.com>
Date: Thu, 11 Jun 2020 14:35:27 +0000
Subject: [PATCH] umem: remove redundant initialization of variable ret
Message-Id: <20200611143527.925712-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/block/umem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/umem.c b/drivers/block/umem.c
index d84e8a878df2..1e2aa5ae2796 100644
--- a/drivers/block/umem.c
+++ b/drivers/block/umem.c
@@ -784,7 +784,7 @@ static const struct block_device_operations mm_fops = {
 
 static int mm_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
-	int ret = -ENODEV;
+	int ret;
 	struct cardinfo *card = &cards[num_cards];
 	unsigned char	mem_present;
 	unsigned char	batt_status;
-- 
2.27.0.rc0
