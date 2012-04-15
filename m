From: Peter Huewe <peterhuewe@gmx.de>
Date: Sun, 15 Apr 2012 00:20:27 +0000
Subject: [PATCH] fs/fuse: Convert to kstrtoul_from_user
Message-Id: <1334449227-12011-1-git-send-email-peterhuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>

This patch replaces the code for getting an number from a
userspace buffer by a simple call to kstroul_from_user.
This makes it easier to read and less error prone.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 fs/fuse/control.c |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/fs/fuse/control.c b/fs/fuse/control.c
index 42593c5..03ff5b1 100644
--- a/fs/fuse/control.c
+++ b/fs/fuse/control.c
@@ -75,19 +75,13 @@ static ssize_t fuse_conn_limit_write(struct file *file, const char __user *buf,
 				     unsigned global_limit)
 {
 	unsigned long t;
-	char tmp[32];
 	unsigned limit = (1 << 16) - 1;
 	int err;
 
-	if (*ppos || count >= sizeof(tmp) - 1)
-		return -EINVAL;
-
-	if (copy_from_user(tmp, buf, count))
+	if (*ppos)
 		return -EINVAL;
 
-	tmp[count] = '\0';
-
-	err = strict_strtoul(tmp, 0, &t);
+	err = kstrtoul_from_user(buf, count, 0, &t);
 	if (err)
 		return err;
 
-- 
1.7.3.4

