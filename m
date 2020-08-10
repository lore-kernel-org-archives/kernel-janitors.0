From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Aug 2020 08:02:47 +0000
Subject: [PATCH] ms_block: fix spelling mistake "doesn'" -> "doesn't"
Message-Id: <20200810080247.47024-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a debug message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/memstick/core/ms_block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index d9ee8e3dc72d..ad1c6f2db089 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -1223,7 +1223,7 @@ static int msb_read_boot_blocks(struct msb_data *msb)
 		}
 
 		if (be16_to_cpu(page->header.block_id) != MS_BLOCK_BOOT_ID) {
-			dbg("the pba at %d doesn' contain boot block ID", pba);
+			dbg("the pba at %d doesn't contain boot block ID", pba);
 			continue;
 		}
 
-- 
2.27.0
