From: Julia Lawall <julia@diku.dk>
Date: Sun, 29 Aug 2010 09:52:40 +0000
Subject: [PATCH 1/7] drivers/macintosh/via-pmu-led.c: Add of_node_put to avoid memory leak
Message-Id: <1283075566-27441-2-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283075566-27441-1-git-send-email-julia@diku.dk>
In-Reply-To: <1283075566-27441-1-git-send-email-julia-dAYI7NvHqcQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Add a call to of_node_put in the error handling code following a call to
of_find_node_by_path.

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
 drivers/macintosh/via-pmu-led.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/macintosh/via-pmu-led.c b/drivers/macintosh/via-pmu-led.c
index d242976..19c3718 100644
--- a/drivers/macintosh/via-pmu-led.c
+++ b/drivers/macintosh/via-pmu-led.c
@@ -92,8 +92,10 @@ static int __init via_pmu_led_init(void)
 	if (dt = NULL)
 		return -ENODEV;
 	model = of_get_property(dt, "model", NULL);
-	if (model = NULL)
+	if (model = NULL) {
+		of_node_put(dt);
 		return -ENODEV;
+	}
 	if (strncmp(model, "PowerBook", strlen("PowerBook")) != 0 &&
 	    strncmp(model, "iBook", strlen("iBook")) != 0 &&
 	    strcmp(model, "PowerMac7,2") != 0 &&

