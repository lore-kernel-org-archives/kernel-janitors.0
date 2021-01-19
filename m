From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Jan 2021 14:53:35 +0000
Subject: [PATCH net-next] net: dsa: Fix off by one in dsa_loop_port_vlan_add()
Message-Id: <YAbyb5kBJQlpYCs2@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: "; Andrew Lunn" <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The > comparison is intended to be >= to prevent reading beyond the
end of the ps->vlans[] array.  It doesn't affect run time though because
the ps->vlans[] array has VLAN_N_VID (4096) elements and the vlan->vid
cannot be > 4094 because it is checked earlier.

Fixes: 98cd1552ea27 ("net: dsa: Mock-up driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I'm not 100% sure where this is checked but the other code has comments
and assumptions that say that it is and Smatch says that it is.  If I
had to guess, I would say that the check is in the nla policy.

[NL80211_ATTR_VLAN_ID] = NLA_POLICY_RANGE(NLA_U16, 1, VLAN_N_VID - 2),

This patch is against linux-next.  I could re-write it against net if
you want.  Another option would be to just delete the sanity check.

 drivers/net/dsa/dsa_loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/dsa_loop.c b/drivers/net/dsa/dsa_loop.c
index 5f69216376fe..8c283f59158b 100644
--- a/drivers/net/dsa/dsa_loop.c
+++ b/drivers/net/dsa/dsa_loop.c
@@ -207,7 +207,7 @@ static int dsa_loop_port_vlan_add(struct dsa_switch *ds, int port,
 	struct mii_bus *bus = ps->bus;
 	struct dsa_loop_vlan *vl;
 
-	if (vlan->vid > ARRAY_SIZE(ps->vlans))
+	if (vlan->vid >= ARRAY_SIZE(ps->vlans))
 		return -ERANGE;
 
 	/* Just do a sleeping operation to make lockdep checks effective */
-- 
2.29.2
