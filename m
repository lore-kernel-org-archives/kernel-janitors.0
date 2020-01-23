From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jan 2020 00:29:21 +0000
Subject: [PATCH] partitions/ldm: fix spelling mistake "to" -> "too"
Message-Id: <20200123002921.2832716-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Russon <ldm@flatcap.org>, Jens Axboe <axboe@kernel.dk>, linux-ntfs-dev@lists.sourceforge.net, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a ldm_error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 block/partitions/ldm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/partitions/ldm.c b/block/partitions/ldm.c
index fe5d970e2e60..a2d97ee1908c 100644
--- a/block/partitions/ldm.c
+++ b/block/partitions/ldm.c
@@ -1233,7 +1233,7 @@ static bool ldm_frag_add (const u8 *data, int size, struct list_head *frags)
 	BUG_ON (!data || !frags);
 
 	if (size < 2 * VBLK_SIZE_HEAD) {
-		ldm_error("Value of size is to small.");
+		ldm_error("Value of size is too small.");
 		return false;
 	}
 
-- 
2.24.0
