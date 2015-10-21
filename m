From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 21 Oct 2015 20:41:40 +0000
Subject: [PATCH 5/5] clk: scpi: add missing of_node_put
Message-Id: <1445460100-26727-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1445460100-26727-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1445460100-26727-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

for_each_available_child_of_node performs an of_node_get on each iteration,
so a break out of the loop requires an of_node_put.

The semantic patch that fixes this problem is as follows
(http://coccinelle.lip6.fr):

// <smpl>
@@
expression root,e;
local idexpression child;
@@

 for_each_available_child_of_node(root, child) {
   ... when != of_node_put(child)
       when != e = child
(
   return child;
|
+  of_node_put(child);
?  return ...;
)
   ...
 }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/clk/clk-scpi.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 0b501a9..cd0f272 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -292,6 +292,7 @@ static int scpi_clocks_probe(struct platform_device *pdev)
 		ret = scpi_clk_add(dev, child, match);
 		if (ret) {
 			scpi_clocks_remove(pdev);
+			of_node_put(child);
 			return ret;
 		}
 	}

