From: Christoph Lameter <cl@linux.com>
Date: Fri, 28 Sep 2012 17:35:24 +0000
Subject: Re: [glommer-memcg:slab-common/kmalloc 27/30] fs/proc/stat.c:191:3: warning: large integer implicitl
Message-Id: <0000013a0df2766a-023df2f5-91b1-4695-871c-ca01a521c1bc-000000@email.amazonses.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120928111724.GC31784@localhost>
In-Reply-To: <20120928111724.GC31784@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 28 Sep 2012, Fengguang Wu wrote:

> fs/proc/stat.c: In function 'stat_open':
> fs/proc/stat.c:191:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]

I guess we need this patch:

Subject: stat: Use size_t for sizes instead of unsigned

On some platforms (such as IA64) the large page size may results in
slab allocations to be allowed of numbers that do not fit in 32 bit.

Signed-off-by: Christoph Lameter <cl@linux.com>

Index: linux/fs/proc/stat.c
=================================--- linux.orig/fs/proc/stat.c	2012-09-18 12:21:56.301459334 -0500
+++ linux/fs/proc/stat.c	2012-09-28 12:33:29.428759019 -0500
@@ -178,7 +178,7 @@ static int show_stat(struct seq_file *p,

 static int stat_open(struct inode *inode, struct file *file)
 {
-	unsigned size = 1024 + 128 * num_possible_cpus();
+	size_t size = 1024 + 128 * num_possible_cpus();
 	char *buf;
 	struct seq_file *m;
 	int res;
