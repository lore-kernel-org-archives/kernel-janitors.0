From: Colin King <colin.king@canonical.com>
Date: Sun, 24 May 2020 16:10:43 +0000
Subject: [PATCH][next] loop: remove redundant assignment to variable error
Message-Id: <20200524161043.20292-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable error is being assigned a value that is never
read so the assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/block/loop.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index c20d01c08e5c..060da16b3743 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1136,8 +1136,6 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 	if (error)
 		goto out_unlock;
 
-	error = 0;
-
 	set_device_ro(bdev, (lo->lo_flags & LO_FLAGS_READ_ONLY) != 0);
 
 	lo->use_dio = lo->lo_flags & LO_FLAGS_DIRECT_IO;
-- 
2.25.1
