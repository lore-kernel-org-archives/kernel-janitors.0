From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 12 Oct 2015 20:43:15 +0000
Subject: [PATCH 2/3] soc: qcom: smd: delete unneeded of_node_put
Message-Id: <1444682596-3065-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1444682596-3065-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1444682596-3065-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Gala <galak@codeaurora.org>
Cc: kernel-janitors@vger.kernel.org, Andy Gross <agross@codeaurora.org>, David Brown <davidb@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>

Device node iterators perform an of_node_put on each iteration, so putting
an of_node_put before a continue results in a double put.

A simplified version of the semantic match that finds this problem is as
follows (http://coccinelle.lip6.fr):

// <smpl>
@@
expression root,e;
local idexpression child;
iterator i;
@@

 i(..., child, ...) {
   ... when != of_node_get(child)
*  of_node_put(child);
   ...
*  continue;
}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/soc/qcom/smd.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/smd.c b/drivers/soc/qcom/smd.c
index 6da0463..8c7a489 100644
--- a/drivers/soc/qcom/smd.c
+++ b/drivers/soc/qcom/smd.c
@@ -916,10 +916,8 @@ static struct device_node *qcom_smd_match_channel(struct device_node *edge_node,
 	for_each_available_child_of_node(edge_node, child) {
 		key = "qcom,smd-channels";
 		ret = of_property_read_string(child, key, &name);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			continue;
-		}
 
 		if (strcmp(name, channel) = 0)
 			return child;

