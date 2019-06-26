From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Jun 2019 09:42:51 +0000
Subject: [PATCH] md/raid1: Fix a warning message in remove_wb()
Message-Id: <20190626094251.GA3242@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The WARN_ON() macro doesn't take an error message, it just takes a
condition.  I've changed this to use WARN(1, "...") instead.

Fixes: 3e148a320979 ("md/raid1: fix potential data inconsistency issue with write behind device")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I also considered changing it to:

	WARN(!found, "...");

but I decided this way was more clear.  It's to have the error path
indented an extra tab.

---
 drivers/md/raid1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 3d44da663797..34e26834ad28 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -96,7 +96,7 @@ static void remove_wb(struct md_rdev *rdev, sector_t lo, sector_t hi)
 		}
 
 	if (!found)
-		WARN_ON("The write behind IO is not recorded\n");
+		WARN(1, "The write behind IO is not recorded\n");
 	spin_unlock_irqrestore(&rdev->wb_list_lock, flags);
 	wake_up(&rdev->wb_io_wait);
 }
-- 
2.20.1
