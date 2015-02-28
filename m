From: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 28 Feb 2015 10:23:27 +0000
Subject: [PATCH 3/5] UBI: initialize LEB number variable
Message-Id: <1425119009-28634-4-git-send-email-computersforpeace@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

In some of the 'out_not_moved' error paths, lnum may be used
uninitialized. Don't ignore the warning; let's fix it.

This uninitialized variable doesn't have much visible effect in the end,
since we just schedule the PEB for erasure, and its LEB number doesn't
really matter (it just gets printed in debug messages). But let's get it
straight anyway.

Coverity CID #113449

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/ubi/wl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 8f7bde6a85d6..0bd92d816391 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1002,7 +1002,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 				int shutdown)
 {
 	int err, scrubbing = 0, torture = 0, protect = 0, erroneous = 0;
-	int vol_id = -1, uninitialized_var(lnum);
+	int vol_id = -1, lnum = -1;
 #ifdef CONFIG_MTD_UBI_FASTMAP
 	int anchor = wrk->anchor;
 #endif
-- 
2.1.0

