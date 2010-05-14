From: Julia Lawall <julia@diku.dk>
Date: Fri, 14 May 2010 19:31:26 +0000
Subject: [PATCH 10/10] arch/powerpc/platforms/iseries: Use kstrdup
Message-Id: <Pine.LNX.4.64.1005142131080.28935@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Grant Likely <grant.likely@secretlab.ca>, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kstrdup when the goal of an allocation is copy a string into the
allocated region.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression from,to;
expression flag,E1,E2;
statement S;
@@

-  to = kmalloc(strlen(from) + 1,flag);
+  to = kstrdup(from, flag);
   ... when != \(from = E1 \| to = E1 \)
   if (to=NULL || ...) S
   ... when != \(from = E2 \| to = E2 \)
-  strcpy(to, from);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/powerpc/platforms/iseries/vio.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/arch/powerpc/platforms/iseries/vio.c b/arch/powerpc/platforms/iseries/vio.c
--- a/arch/powerpc/platforms/iseries/vio.c
+++ b/arch/powerpc/platforms/iseries/vio.c
@@ -87,12 +87,11 @@ static struct device_node *new_node(cons
 
 	if (!np)
 		return NULL;
-	np->full_name = kmalloc(strlen(path) + 1, GFP_KERNEL);
+	np->full_name = kstrdup(path, GFP_KERNEL);
 	if (!np->full_name) {
 		kfree(np);
 		return NULL;
 	}
-	strcpy(np->full_name, path);
 	of_node_set_flag(np, OF_DYNAMIC);
 	kref_init(&np->kref);
 	np->parent = of_node_get(parent);
