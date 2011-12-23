From: Julia Lawall <julia@diku.dk>
Date: Fri, 23 Dec 2011 17:39:29 +0000
Subject: [PATCH 4/9] drivers/xen/gntalloc.c: introduce missing kfree
Message-Id: <1324661974-17281-4-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Jeremy Fitzhardinge <jeremy@goop.org>, xen-devel@lists.xensource.com, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org

Error handling code following a kmalloc should free the allocated data.
Out_unlock is used on both success and failure, so free vm_priv before
jumping to that label.

A simplified version of the semantic match that finds the problem is as
follows: (http://coccinelle.lip6.fr)

// <smpl>
@r exists@
local idexpression x;
statement S;
identifier f1;
position p1,p2;
expression *ptr != NULL;
@@

x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x = NULL) S
<... when != x
     when != if (...) { <+...x...+> }
x->f1
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
 drivers/xen/gntalloc.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/xen/gntalloc.c b/drivers/xen/gntalloc.c
index e2400c8..934985d 100644
--- a/drivers/xen/gntalloc.c
+++ b/drivers/xen/gntalloc.c
@@ -525,6 +525,7 @@ static int gntalloc_mmap(struct file *filp, struct vm_area_struct *vma)
 		rv = -ENOENT;
 		pr_debug("%s: Could not find grant reference",
 				__func__);
+		kfree(vm_priv);
 		goto out_unlock;
 	}
 

