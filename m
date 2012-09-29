From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 29 Sep 2012 07:11:38 +0000
Subject: [patch 2/2] memstick: memory leak on error in msb_ftl_scan()
Message-Id: <20120929071138.GC10993@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxim Levitsky <maximlevitsky@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>

We need to free "overwrite_flags" before returning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index a8e8915..1f9d5cf 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -1408,8 +1408,10 @@ static int msb_ftl_scan(struct msb_data *msb)
 			msb_mark_block_used(msb, pba);
 			msb_erase_block(msb, pba);
 			continue;
-		} else if (error)
+		} else if (error) {
+			kfree(overwrite_flags);
 			return error;
+		}
 
 		lba = be16_to_cpu(extra.logical_address);
 		managment_flag = extra.management_flag;
