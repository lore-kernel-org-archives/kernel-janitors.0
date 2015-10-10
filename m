From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 10 Oct 2015 12:30:53 +0000
Subject: [PATCH 4/5] regulator: of: add missing of_node_put
Message-Id: <1444480254-14399-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1444480254-14399-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1444480254-14399-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>

for_each_child_of_node performs an of_node_get on each iteration, so
a break out of the loop requires an of_node_put.

The semantic patch that fixes this problem is as follows
(http://coccinelle.lip6.fr):

// <smpl>
@@
expression root,e;
local idexpression child;
@@

 for_each_child_of_node(root, child) {
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
 drivers/regulator/of_regulator.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 499e437..f9d77b4 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -274,6 +274,7 @@ int of_regulator_match(struct device *dev, struct device_node *node,
 				dev_err(dev,
 					"failed to parse DT for regulator %s\n",
 					child->name);
+				of_node_put(child);
 				return -EINVAL;
 			}
 			match->of_node = of_node_get(child);

