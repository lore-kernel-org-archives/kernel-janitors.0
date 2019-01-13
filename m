From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Jan 2019 09:44:50 +0000
Subject: [PATCH 2/3] OF: properties: add missing of_node_put
Message-Id: <1547372691-28324-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547372691-28324-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1547372691-28324-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt@kernel.org>
Cc: kernel-janitors@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Add an of_node_put when the result of of_graph_get_remote_port_parent is
not available.

The semantic match that finds this problem is as follows
(http://coccinelle.lip6.fr):

// <smpl>
@r exists@
local idexpression e;
expression x;
@@
e = of_graph_get_remote_port_parent(...);
... when != x = e
    when != true e = NULL
    when != of_node_put(e)
    when != of_fwnode_handle(e)
(
return e;
|
*return ...;
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/of/property.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 0843003..8631efa 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -806,6 +806,7 @@ struct device_node *of_graph_get_remote_node(const struct device_node *node,
 
 	if (!of_device_is_available(remote)) {
 		pr_debug("not available for remote node\n");
+		of_node_put(remote);
 		return NULL;
 	}
 
