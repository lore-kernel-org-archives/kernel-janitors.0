From: Julia Lawall <julia@diku.dk>
Date: Wed, 10 Sep 2008 11:57:43 +0000
Subject: [PATCH 2/4] arch/x86/kernel/kdebugfs.c: introduce missing kfree
Message-Id: <Pine.LNX.4.64.0809101357210.15308@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, linux-kernel@vger.kernel.orglinux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Error handling code following a kmalloc should free the allocated data.
Note that at the point of the change, node has not yet been stored in d, so
it is not affected by the existing cleanup code.

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
 arch/x86/kernel/kdebugfs.c    |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/x86/kernel/kdebugfs.c b/arch/x86/kernel/kdebugfs.c
index f2d43bc..ff7d3b0 100644
--- a/arch/x86/kernel/kdebugfs.c
+++ b/arch/x86/kernel/kdebugfs.c
@@ -139,6 +139,7 @@ static int __init create_setup_data_nodes(struct dentry *parent)
 		if (PageHighMem(pg)) {
 			data = ioremap_cache(pa_data, sizeof(*data));
 			if (!data) {
+				kfree(node);
 				error = -ENXIO;
 				goto err_dir;
 			}
