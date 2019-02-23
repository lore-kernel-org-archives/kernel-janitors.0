From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 23 Feb 2019 13:20:40 +0000
Subject: [PATCH 09/12] meson-gx-socinfo: add missing of_node_put after of_device_is_available
Message-Id: <1550928043-14889-10-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550928043-14889-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1550928043-14889-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

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

Fixes: a9daaba2965e8 ("soc: Add Amlogic SoC Information driver")
Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/soc/amlogic/meson-gx-socinfo.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff -u -p a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -123,8 +123,10 @@ static int __init meson_gx_socinfo_init(
 		return -ENODEV;
 
 	/* check if interface is enabled */
-	if (!of_device_is_available(np))
+	if (!of_device_is_available(np)) {
+		of_node_put(np);
 		return -ENODEV;
+	}
 
 	/* check if chip-id is available */
 	if (!of_property_read_bool(np, "amlogic,has-chip-id"))
