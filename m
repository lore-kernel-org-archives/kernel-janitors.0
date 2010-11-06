From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sat, 06 Nov 2010 14:41:24 +0000
Subject: [PATCH] mtd: mtdchar: fix information leak to userland
Message-Id: <1289054485-18190-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org

Structure mtd_info_user is copied to userland with padding byted
between "type" and "flags" fields uninitialized.  It leads to leaking
of contents of kernel stack memory.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/mtd/mtdchar.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 3eff1e5..2a0bc9e 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -601,6 +601,7 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 	}
 
 	case MEMGETINFO:
+		memset(&info, 0, sizeof(info));
 		info.type	= mtd->type;
 		info.flags	= mtd->flags;
 		info.size	= mtd->size;
@@ -609,7 +610,6 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		info.oobsize	= mtd->oobsize;
 		/* The below fields are obsolete */
 		info.ecctype	= -1;
-		info.eccsize	= 0;
 		if (copy_to_user(argp, &info, sizeof(struct mtd_info_user)))
 			return -EFAULT;
 		break;
-- 
1.7.0.4

