From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Aug 2014 08:28:48 +0000
Subject: [patch] timerfd: remove an always true check
Message-Id: <20140801082848.GF28869@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Cyrill Gorcunov <gorcunov@openvz.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

We would have returned -EINVAL earlier if ticks wasn't set.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/timerfd.c b/fs/timerfd.c
index 80c3502..b46ffa9 100644
--- a/fs/timerfd.c
+++ b/fs/timerfd.c
@@ -333,8 +333,7 @@ static long timerfd_ioctl(struct file *file, unsigned int cmd, unsigned long arg
 		spin_lock_irq(&ctx->wqh.lock);
 		if (!timerfd_canceled(ctx)) {
 			ctx->ticks = ticks;
-			if (ticks)
-				wake_up_locked(&ctx->wqh);
+			wake_up_locked(&ctx->wqh);
 		} else
 			ret = -ECANCELED;
 		spin_unlock_irq(&ctx->wqh.lock);
