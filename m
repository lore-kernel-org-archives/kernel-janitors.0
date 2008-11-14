From: Julia Lawall <julia@diku.dk>
Date: Fri, 14 Nov 2008 18:05:31 +0000
Subject: [PATCH 1/3] kernel/trace/trace.c: introduce missing kfree
Message-Id: <Pine.LNX.4.64.0811141904580.10023@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: srostedt@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Error handling code following a kzalloc should free the allocated data.

The semantic match that finds the problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
statement S;
expression E;
identifier f,l;
position p1,p2;
expression *ptr != NULL;
@@

(
if ((x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...)) = NULL) S
|
x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x = NULL) S
)
<... when != x
     when != if (...) { <+...x...+> }
x->f = E
...>
(
 return \(0\|<+...x...+>\|ptr\);
|
 return@p2 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---
 kernel/trace/trace.c          |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 697eda3..d86e325 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -1936,6 +1936,7 @@ __tracing_open(struct inode *inode, struct file *file, int *ret)
 			ring_buffer_read_finish(iter->buffer_iter[cpu]);
 	}
 	mutex_unlock(&trace_types_lock);
+	kfree(iter);
 
 	return ERR_PTR(-ENOMEM);
 }
