From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Oct 2016 08:50:24 +0000
Subject: [patch] relay: check array offset before using it
Message-Id: <20161013084947.GC16198@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Akash Goel <akash.goel@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Al Viro <viro@zeniv.linux.org.uk>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Weinberger <richard@nod.at>, Zhouyi Zhou <yizhouzhou@ict.ac.cn>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that we started using the array offset before we
checked that it was valid.

Fixes: 017c59c042d0 ('relay: Use per CPU constructs for the relay channel buffer pointers')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/relay.c b/kernel/relay.c
index da79a10..8f18d31 100644
--- a/kernel/relay.c
+++ b/kernel/relay.c
@@ -809,11 +809,11 @@ void relay_subbufs_consumed(struct rchan *chan,
 {
 	struct rchan_buf *buf;
 
-	if (!chan)
+	if (!chan || cpu >= NR_CPUS)
 		return;
 
 	buf = *per_cpu_ptr(chan->buf, cpu);
-	if (cpu >= NR_CPUS || !buf || subbufs_consumed > chan->n_subbufs)
+	if (!buf || subbufs_consumed > chan->n_subbufs)
 		return;
 
 	if (subbufs_consumed > buf->subbufs_produced - buf->subbufs_consumed)
