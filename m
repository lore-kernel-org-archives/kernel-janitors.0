From: Colin King <colin.king@canonical.com>
Date: Thu, 08 Nov 2018 11:08:09 +0000
Subject: [PATCH][next] ms_block: remove unused pointer 'set'
Message-Id: <20181108110809.2145-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Maxim Levitsky <maximlevitsky@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer 'set' is declared but not used, remove it. Cleans up warning:

warning: unused variable ‘set’ [-Wunused-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/memstick/core/ms_block.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index ee0be66a9a03..82daccc9ea62 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -2104,7 +2104,6 @@ static const struct blk_mq_ops msb_mq_ops = {
 static int msb_init_disk(struct memstick_dev *card)
 {
 	struct msb_data *msb = memstick_get_drvdata(card);
-	struct blk_mq_tag_set *set = NULL;
 	int rc;
 	unsigned long capacity;
 
-- 
2.19.1
