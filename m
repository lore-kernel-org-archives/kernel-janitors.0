From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Jan 2015 19:33:19 +0000
Subject: [patch -next] eventfd: type bug in eventfd_poll()
Message-Id: <20150119193319.GA32634@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, Chris Mason <clm@fb.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

Since "count" is an unsigned int, then these conditions are never true:

        if (count = ULLONG_MAX)
                events |= POLLERR;
        if (ULLONG_MAX - 1 > count)
                events |= POLLOUT;

It should be a u64, because that's what ctx->count is.  Also GCC
complains that "flags" is unused.

Fixes: a90de8a54127 ('eventfd: don't take the spinlock in eventfd_poll')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/eventfd.c b/fs/eventfd.c
index 439e6f0..8d0c0df 100644
--- a/fs/eventfd.c
+++ b/fs/eventfd.c
@@ -118,8 +118,7 @@ static unsigned int eventfd_poll(struct file *file, poll_table *wait)
 {
 	struct eventfd_ctx *ctx = file->private_data;
 	unsigned int events = 0;
-	unsigned long flags;
-	unsigned int count;
+	u64 count;
 
 	poll_wait(file, &ctx->wqh, wait);
 	smp_rmb();
