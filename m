From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 May 2014 20:36:26 +0000
Subject: [patch] module: static checker complains about negative values
Message-Id: <20140519203626.GC5671@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We cap "stat.size" at INT_MAX but we don't check for negative values so
my static checker complains.  At this point, you already have control of
the kernel and if you start passing negative values here then you
deserve what happens next.

On 64 bit systems the vmalloc() will definitely fail.  On 32 bit systems
we truncate the upper 32 bits away so that could succeed.  I haven't
followed it further than that.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/module.c b/kernel/module.c
index 626d164..26e0d15 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -2536,7 +2536,7 @@ static int copy_module_from_fd(int fd, struct load_info *info)
 	}
 
 	/* Don't hand 0 to vmalloc, it whines. */
-	if (stat.size = 0) {
+	if (stat.size <= 0) {
 		err = -EINVAL;
 		goto out;
 	}
