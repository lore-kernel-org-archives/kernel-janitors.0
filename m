From: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 28 Feb 2015 10:23:25 +0000
Subject: [PATCH 1/5] UBI: account for bitflips in both the VID header and data
Message-Id: <1425119009-28634-2-git-send-email-computersforpeace@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

We are completely discarding the earlier value of 'bitflips', which
could reflect a bitflip found in ubi_io_read_vid_hdr(). Let's use the
bitwise OR of header and data 'bitflip' statuses instead.

Coverity CID #1226856

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/ubi/attach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 9d2e16f3150a..b5e154856994 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -410,7 +410,7 @@ int ubi_compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_peb *aeb,
 		second_is_newer = !second_is_newer;
 	} else {
 		dbg_bld("PEB %d CRC is OK", pnum);
-		bitflips = !!err;
+		bitflips |= !!err;
 	}
 	mutex_unlock(&ubi->buf_mutex);
 
-- 
2.1.0

