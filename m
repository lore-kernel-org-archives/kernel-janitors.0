From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 24 Oct 2015 14:42:31 +0000
Subject: [PATCH 5/9] drm/tegra: dc: add missing of_node_put
Message-Id: <1445697755-26341-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1445697755-26341-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1445697755-26341-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Alexandre Courbot <gnurou@gmail.com>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, Jason Cooper <jason@lakedaemon.net>, Stephen Warren <swarren@wwwdotorg.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>, Andrew Lunn <andrew@lunn.ch>, linux-tegra@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>

for_each_matching_node performs an of_node_get on each iteration, so
a break out of the loop requires an of_node_put.

A simplified version of the semantic patch that fixes this problem is as
follows (http://coccinelle.lip6.fr):

// <smpl>
@@
local idexpression n;
expression e;
@@

 for_each_matching_node(n,...) {
   ...
(
   of_node_put(n);
|
   e = n
|
+  of_node_put(n);
?  break;
)
   ...
 }
... when != n
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpu/drm/tegra/dc.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index b4af4ab..f0e6f37 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1945,8 +1945,10 @@ static int tegra_dc_parse_dt(struct tegra_dc *dc)
 		 * cases where only a single display controller is used.
 		 */
 		for_each_matching_node(np, tegra_dc_of_match) {
-			if (np = dc->dev->of_node)
+			if (np = dc->dev->of_node) {
+				of_node_put(np);
 				break;
+			}
 
 			value++;
 		}

