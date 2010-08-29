From: Julia Lawall <julia@diku.dk>
Date: Sun, 29 Aug 2010 09:52:43 +0000
Subject: [PATCH 4/7] arch/powerpc/platforms/powermac/pfunc_core.c: Add of_node_put to avoid memory leak
Message-Id: <1283075566-27441-5-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283075566-27441-1-git-send-email-julia@diku.dk>
In-Reply-To: <1283075566-27441-1-git-send-email-julia-dAYI7NvHqcQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org

Add a call to of_node_put in the error handling code following a call to
of_find_node_by_phandle.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
local idexpression x;
expression E,E1;
statement S;
@@

*x = 
(of_find_node_by_path
|of_find_node_by_name
|of_find_node_by_phandle
|of_get_parent
|of_get_next_parent
|of_get_next_child
|of_find_compatible_node
|of_match_node
)(...);
...
if (x = NULL) S
<... when != x = E
*if (...) {
  ... when != of_node_put(x)
      when != if (...) { ... of_node_put(x); ... }
(
  return <+...x...+>;
|
*  return ...;
)
}
...>
of_node_put(x);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/powerpc/platforms/powermac/pfunc_core.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/pfunc_core.c b/arch/powerpc/platforms/powermac/pfunc_core.c
index cec6359..b0c3777 100644
--- a/arch/powerpc/platforms/powermac/pfunc_core.c
+++ b/arch/powerpc/platforms/powermac/pfunc_core.c
@@ -837,8 +837,10 @@ struct pmf_function *__pmf_find_function(struct device_node *target,
 		return NULL;
  find_it:
 	dev = pmf_find_device(actor);
-	if (dev = NULL)
-		return NULL;
+	if (dev = NULL) {
+		result = NULL;
+		goto out;
+	}
 
 	list_for_each_entry(func, &dev->functions, link) {
 		if (name && strcmp(name, func->name))
@@ -850,8 +852,9 @@ struct pmf_function *__pmf_find_function(struct device_node *target,
 		result = func;
 		break;
 	}
-	of_node_put(actor);
 	pmf_put_device(dev);
+out:
+	of_node_put(actor);
 	return result;
 }
 

