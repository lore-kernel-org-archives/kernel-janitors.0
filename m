From: Yufen Yu <yuyufen@huawei.com>
Date: Mon, 28 Jan 2019 09:06:46 +0000
Subject: [PATCH] floppy: check_events callback should not return a negative number
Message-Id: <20190128090646.44747-1-yuyufen@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: axboe@kernel.dk, osandov@fb.com
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

Since .check_events interface return an unsigned int value,
floppy_check_events() should not return a negative error number.
Otherwise, disk_check_events() may process wiht an unexpected path.

fixes: a0c80efe5956 ("floppy: fix lock_fdc() signal handling")
Signed-off-by: Yufen Yu <yuyufen@huawei.com>
---
 drivers/block/floppy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index 6f2856c6d0f2..55481b40df9a 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -4075,7 +4075,7 @@ static unsigned int floppy_check_events(struct gendisk *disk,
 
 	if (time_after(jiffies, UDRS->last_checked + UDP->checkfreq)) {
 		if (lock_fdc(drive))
-			return -EINTR;
+			return 0;
 		poll_drive(false, 0);
 		process_fd_request();
 	}
-- 
2.16.2.dirty
