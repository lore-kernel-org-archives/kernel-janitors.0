From: Colin King <colin.king@canonical.com>
Date: Wed, 27 May 2020 12:01:29 +0000
Subject: [PATCH] net: dsa: b53: remove redundant premature assignment to new_pvid
Message-Id: <20200527120129.172676-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable new_pvid is being assigned with a value that is never read,
the following if statement updates new_pvid with a new value in both
of the if paths. The assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/dsa/b53/b53_common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index ceb8be653182..1df05841ab6b 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1325,7 +1325,6 @@ int b53_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering)
 	u16 pvid, new_pvid;
 
 	b53_read16(dev, B53_VLAN_PAGE, B53_VLAN_PORT_DEF_TAG(port), &pvid);
-	new_pvid = pvid;
 	if (!vlan_filtering) {
 		/* Filtering is currently enabled, use the default PVID since
 		 * the bridge does not expect tagging anymore
-- 
2.25.1
