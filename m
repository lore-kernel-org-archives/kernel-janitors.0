From: Julia Lawall <julia@diku.dk>
Date: Fri, 23 Dec 2011 17:39:31 +0000
Subject: [PATCH 6/9] arch/arm/mach-omap2/devices.c: introduce missing kfree
Message-Id: <1324661974-17281-6-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

pdata needs to be freed before leaving the function in an error case.

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
 arch/arm/mach-omap2/devices.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
index 46dfd1a..3334a47 100644
--- a/arch/arm/mach-omap2/devices.c
+++ b/arch/arm/mach-omap2/devices.c
@@ -393,6 +393,7 @@ static int omap_mcspi_init(struct omap_hwmod *oh, void *unused)
 			break;
 	default:
 			pr_err("Invalid McSPI Revision value\n");
+			kfree(pdata);
 			return -EINVAL;
 	}
 

