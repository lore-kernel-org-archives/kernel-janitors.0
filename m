From: Colin King <colin.king@canonical.com>
Date: Sat, 22 Apr 2017 12:22:01 +0000
Subject: [PATCH] net: netcp: fix spelling mistake: "memomry" -> "memory"
Message-Id: <20170422122201.7979-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wingman Kwok <w-kwok2@ti.com>, Murali Karicheri <m-karicheri2@ti.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err message and rejoin
line.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/ti/netcp_ethss.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/netcp_ethss.c b/drivers/net/ethernet/ti/netcp_ethss.c
index eece3e2eec14..897176fc5043 100644
--- a/drivers/net/ethernet/ti/netcp_ethss.c
+++ b/drivers/net/ethernet/ti/netcp_ethss.c
@@ -3048,8 +3048,7 @@ static void init_secondary_ports(struct gbe_priv *gbe_dev,
 	for_each_child_of_node(node, port) {
 		slave = devm_kzalloc(dev, sizeof(*slave), GFP_KERNEL);
 		if (!slave) {
-			dev_err(dev,
-				"memomry alloc failed for secondary port(%s), skipping...\n",
+			dev_err(dev, "memory alloc failed for secondary port(%s), skipping...\n",
 				port->name);
 			continue;
 		}
-- 
2.11.0

