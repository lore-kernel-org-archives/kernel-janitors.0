From: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 28 Feb 2015 10:23:28 +0000
Subject: [PATCH 4/5] UBI: fix check for "too many bytes"
Message-Id: <1425119009-28634-5-git-send-email-computersforpeace@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

The comparison from the previous line seems to have been erroneously
(partially) copied-and-pasted onto the next. The second line should be
checking req.bytes, not req.lnum.

Coverity CID #139400

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/ubi/cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index d647e504f9b1..7691a2a015cb 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -455,7 +455,7 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
 		/* Validate the request */
 		err = -EINVAL;
 		if (req.lnum < 0 || req.lnum >= vol->reserved_pebs ||
-		    req.bytes < 0 || req.lnum >= vol->usable_leb_size)
+		    req.bytes < 0 || req.bytes >= vol->usable_leb_size)
 			break;
 
 		err = get_exclusive(desc);
-- 
2.1.0

