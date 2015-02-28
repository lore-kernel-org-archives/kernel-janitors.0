From: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 28 Feb 2015 10:23:26 +0000
Subject: [PATCH 2/5] UBI: fix out of bounds write
Message-Id: <1425119009-28634-3-git-send-email-computersforpeace@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

If aeb->len >= vol->reserved_pebs, we should not be writing aeb into the
PEB->LEB mapping.

Caught by Coverity, CID #711212.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/ubi/eba.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index da4c79259f67..6442d3fbcb73 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1418,7 +1418,8 @@ int ubi_eba_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 				 * during re-size.
 				 */
 				ubi_move_aeb_to_list(av, aeb, &ai->erase);
-			vol->eba_tbl[aeb->lnum] = aeb->pnum;
+			else
+				vol->eba_tbl[aeb->lnum] = aeb->pnum;
 		}
 	}
 
-- 
2.1.0

