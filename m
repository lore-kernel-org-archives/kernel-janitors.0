From: Julia Lawall <julia@diku.dk>
Date: Mon, 08 Aug 2011 11:18:02 +0000
Subject: [PATCH 8/9] arch/powerpc/sysdev/ehv_pic.c: add missing kfree
Message-Id: <1312802283-9107-8-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: kernel-janitors@vger.kernel.org, Ashish Kalra <ashish.kalra@freescale.com>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Timur Tabi <timur@freescale.com>

From: Julia Lawall <julia@diku.dk>

At this point, ehv_pic has been allocated but not stored anywhere, so it
should be freed before leaving the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@exists@
local idexpression x;
statement S,S1;
expression E;
identifier fl;
expression *ptr != NULL;
@@

x = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x = NULL) S
<... when != x
     when != if (...) { <+...kfree(x)...+> }
     when any
     when != true x = NULL
x->fl
...>
(
if (x = NULL) S1
|
if (...) { ... when != x
               when forall
(
 return \(0\|<+...x...+>\|ptr\);
|
* return ...;
)
}
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/powerpc/sysdev/ehv_pic.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/sysdev/ehv_pic.c b/arch/powerpc/sysdev/ehv_pic.c
index af1a5df..b6731e4 100644
--- a/arch/powerpc/sysdev/ehv_pic.c
+++ b/arch/powerpc/sysdev/ehv_pic.c
@@ -280,6 +280,7 @@ void __init ehv_pic_init(void)
 
 	if (!ehv_pic->irqhost) {
 		of_node_put(np);
+		kfree(ehv_pic);
 		return;
 	}
 

