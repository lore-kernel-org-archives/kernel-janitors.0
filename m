From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 23 May 2018 19:07:12 +0000
Subject: [PATCH 1/5] pinctrl: at91-pio4: add missing of_node_put
Message-Id: <1527102436-13447-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1527102436-13447-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1527102436-13447-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

The device node iterators perform an of_node_get on each iteration, so a
jump out of the loop requires an of_node_put.

The semantic patch that fixes this problem is as follows
(http://coccinelle.lip6.fr):

// <smpl>
@@
expression root,e;
local idexpression child;
iterator name for_each_child_of_node;
@@

 for_each_child_of_node(root, child) {
   ... when != of_node_put(child)
       when != e = child
+  of_node_put(child);
?  break;
   ...
}
... when != child
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pinctrl/pinctrl-at91-pio4.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 4b57a13..bafb3d4 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -576,8 +576,10 @@ static int atmel_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		for_each_child_of_node(np_config, np) {
 			ret = atmel_pctl_dt_subnode_to_map(pctldev, np, map,
 						    &reserved_maps, num_maps);
-			if (ret < 0)
+			if (ret < 0) {
+				of_node_put(np);
 				break;
+			}
 		}
 	}
 

