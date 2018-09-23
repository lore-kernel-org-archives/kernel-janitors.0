From: Colin King <colin.king@canonical.com>
Date: Sun, 23 Sep 2018 22:46:55 +0000
Subject: [PATCH] memstick: core: fix spelling mistake "randomally" -> "randomly"
Message-Id: <20180923224655.8249-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxim Levitsky <maximlevitsky@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dbg_verbose message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/memstick/core/ms_block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index 716fc8ed31d3..1c12cdb34482 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -1091,7 +1091,7 @@ static u16 msb_get_free_block(struct msb_data *msb, int zone)
 
 	pos %= msb->free_block_count[zone];
 
-	dbg_verbose("have %d choices for a free block, selected randomally: %d",
+	dbg_verbose("have %d choices for a free block, selected randomly: %d",
 		msb->free_block_count[zone], pos);
 
 	pba = find_next_zero_bit(msb->used_blocks_bitmap,
-- 
2.17.1
