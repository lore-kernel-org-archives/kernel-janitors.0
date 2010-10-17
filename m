From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 17 Oct 2010 14:41:28 +0000
Subject: [PATCH 5/8] char: ppdev: fix information leak to userland
Message-Id: <1287326489-8071-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Julia Lawall <julia@diku.dk>, Tejun Heo <tj@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org

Structure par_timeout is copied to userland with some padding fields unitialized.
Field tv_usec has type __kernel_suseconds_t, it differs from tv_sec's type on
some architectures.  It leads to leaking of stack memory.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/char/ppdev.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/char/ppdev.c b/drivers/char/ppdev.c
index 723152d..f176dba 100644
--- a/drivers/char/ppdev.c
+++ b/drivers/char/ppdev.c
@@ -613,6 +613,7 @@ static int pp_do_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 	case PPGETTIME:
 		to_jiffies = pp->pdev->timeout;
+		memset(&par_timeout, 0, sizeof(par_timeout));
 		par_timeout.tv_sec = to_jiffies / HZ;
 		par_timeout.tv_usec = (to_jiffies % (long)HZ) * (1000000/HZ);
 		if (copy_to_user (argp, &par_timeout, sizeof(struct timeval)))
-- 
1.7.0.4

