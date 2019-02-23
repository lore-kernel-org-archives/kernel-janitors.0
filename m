From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 23 Feb 2019 13:20:42 +0000
Subject: [PATCH 11/12] ARM: OMAP2+: add missing of_node_put after of_device_is_available
Message-Id: <1550928043-14889-12-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550928043-14889-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1550928043-14889-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, kernel-janitors@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Add an of_node_put when a tested device node is not available.

The semantic patch that fixes this problem is as follows
(http://coccinelle.lip6.fr):

// <smpl>
@@
identifier f;
local idexpression e;
expression x;
@@

e = f(...);
... when != of_node_put(e)
    when != x = e
    when != e = x
    when any
if (<+...of_device_is_available(e)...+>) {
  ... when != of_node_put(e)
(
  return e;
|
+ of_node_put(e);
  return ...;
)
}
// </smpl>

Fixes: e0c827aca0730 ("drm/omap: Populate DSS children in omapdss driver")
Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/arm/mach-omap2/display.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff -u -p a/arch/arm/mach-omap2/display.c b/arch/arm/mach-omap2/display.c
--- a/arch/arm/mach-omap2/display.c
+++ b/arch/arm/mach-omap2/display.c
@@ -250,8 +250,10 @@ static int __init omapdss_init_of(void)
 	if (!node)
 		return 0;
 
-	if (!of_device_is_available(node))
+	if (!of_device_is_available(node)) {
+		of_node_put(node);
 		return 0;
+	}
 
 	pdev = of_find_device_by_node(node);
 
