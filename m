From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 18 Nov 2015 22:04:13 +0000
Subject: [PATCH 3/4] iio: adc: spmi-vadc: add missing of_node_put
Message-Id: <1447884254-26336-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1447884254-26336-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1447884254-26336-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>
Cc: kernel-janitors@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>

for_each_available_child_of_node performs an of_node_get on each iteration,
so a break out of the loop requires an of_node_put.

A simplified version of the semantic patch that fixes this problem is as
follows (http://coccinelle.lip6.fr):

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
 drivers/iio/adc/qcom-spmi-vadc.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/qcom-spmi-vadc.c b/drivers/iio/adc/qcom-spmi-vadc.c
index 0c4618b..c2babe5 100644
--- a/drivers/iio/adc/qcom-spmi-vadc.c
+++ b/drivers/iio/adc/qcom-spmi-vadc.c
@@ -839,8 +839,10 @@ static int vadc_get_dt_data(struct vadc_priv *vadc, struct device_node *node)
 
 	for_each_available_child_of_node(node, child) {
 		ret = vadc_get_dt_channel_data(vadc->dev, &prop, child);
-		if (ret)
+		if (ret) {
+			of_node_put(child);
 			return ret;
+		}
 
 		vadc->chan_props[index] = prop;
 

