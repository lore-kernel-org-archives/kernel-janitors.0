From: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 28 Feb 2015 10:23:29 +0000
Subject: [PATCH 5/5] UBI: align comment for readability
Message-Id: <1425119009-28634-6-git-send-email-computersforpeace@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

The kerneldoc for @vid_hdr_aloffset continues onto a second line, but
this is not obvious, because the second line isn't indented, and it
begins with '@'.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/ubi/ubi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index c5be82d9d345..2251a6c4c8fa 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -479,7 +479,7 @@ struct ubi_debug_info {
  * @vid_hdr_offset: starting offset of the volume identifier header (might be
  *                  unaligned)
  * @vid_hdr_aloffset: starting offset of the VID header aligned to
- * @hdrs_min_io_size
+ *                    @hdrs_min_io_size
  * @vid_hdr_shift: contains @vid_hdr_offset - @vid_hdr_aloffset
  * @bad_allowed: whether the MTD device admits of bad physical eraseblocks or
  *               not
-- 
2.1.0

