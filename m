From: Chris Mason <clm@fb.com>
Date: Thu, 29 Jan 2015 18:56:45 +0000
Subject: Re: [patch -next] eventfd: type bug in eventfd_poll()
Message-Id: <20150129185645.GA11557@ret.DHCP.TheFacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150119193319.GA32634@mwanda>
In-Reply-To: <20150119193319.GA32634@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jan 19, 2015 at 10:33:19PM +0300, Dan Carpenter wrote:
> Since "count" is an unsigned int, then these conditions are never true:
> 
>         if (count = ULLONG_MAX)
>                 events |= POLLERR;
>         if (ULLONG_MAX - 1 > count)
>                 events |= POLLOUT;
> 
> It should be a u64, because that's what ctx->count is.  Also GCC
> complains that "flags" is unused.
> 
> Fixes: a90de8a54127 ('eventfd: don't take the spinlock in eventfd_poll')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/fs/eventfd.c b/fs/eventfd.c
> index 439e6f0..8d0c0df 100644
> --- a/fs/eventfd.c
> +++ b/fs/eventfd.c
> @@ -118,8 +118,7 @@ static unsigned int eventfd_poll(struct file *file, poll_table *wait)
>  {
>  	struct eventfd_ctx *ctx = file->private_data;
>  	unsigned int events = 0;
> -	unsigned long flags;
> -	unsigned int count;
> +	u64 count;
>  
>  	poll_wait(file, &ctx->wqh, wait);
>  	smp_rmb();

Andrew, not sure if you want to take Dan's incremental or a new v2.  I
ran this one through the ltp poll and event fd tests.

From: Chris Mason <clm@fb.com>
Date: Wed, 28 Jan 2015 10:15:58 -0800
Subject: [PATCH v2] eventfd: don't take the spinlock in eventfd_poll

The spinlock in eventfd_poll is trying to protect the count of events
so it can decide if it should return POLLIN, POLLERR, or POLLOUT.  But,
because of the way we drop the lock after calling poll_wait, and drop it
again before returning, we have the same pile of races with the lock as
we do with a single read of ctx->count().

This replaces the lock with a read barrier and single read.

eventfd_write does a single bump of ctx->count, so this should not add
new races with adding events.  eventfd_read is similar, it will do a
single decrement with the lock held, and so we're making the race with
concurrent readers slightly larger.

This spinlock is the top CPU user in kernel code during one of our workloads.
Removing it gives us a ~2% boost.

Signed-off-by: Chris Mason <clm@fb.com>
Fixed-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/eventfd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

 v1->v2 use a u64 for count and get rid of unused flags (Dan Carpenter)

diff --git a/fs/eventfd.c b/fs/eventfd.c
index 4b0a226..8d0c0df 100644
--- a/fs/eventfd.c
+++ b/fs/eventfd.c
@@ -118,18 +118,18 @@ static unsigned int eventfd_poll(struct file *file, poll_table *wait)
 {
 	struct eventfd_ctx *ctx = file->private_data;
 	unsigned int events = 0;
-	unsigned long flags;
+	u64 count;
 
 	poll_wait(file, &ctx->wqh, wait);
+	smp_rmb();
+	count = ctx->count;
 
-	spin_lock_irqsave(&ctx->wqh.lock, flags);
-	if (ctx->count > 0)
+	if (count > 0)
 		events |= POLLIN;
-	if (ctx->count = ULLONG_MAX)
+	if (count = ULLONG_MAX)
 		events |= POLLERR;
-	if (ULLONG_MAX - 1 > ctx->count)
+	if (ULLONG_MAX - 1 > count)
 		events |= POLLOUT;
-	spin_unlock_irqrestore(&ctx->wqh.lock, flags);
 
 	return events;
 }
-- 
1.8.1

