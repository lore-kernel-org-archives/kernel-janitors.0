From: Colin King <colin.king@canonical.com>
Date: Mon, 09 Nov 2020 12:40:08 +0000
Subject: [PATCH][next] net: dsa: fix unintended sign extension on a u16 left shift
Message-Id: <20201109124008.2079873-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Kurt Kanzenbach <kurt@linutronix.de>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The left shift of u16 variable high is promoted to the type int and
then sign extended to a 64 bit u64 value.  If the top bit of high is
set then the upper 32 bits of the result end up being set by the
sign extension. Fix this by explicitly casting the value in high to
a u64 before left shifting by 16 places.

Also, remove the initialisation of variable value to 0 at the start
of each loop iteration as the value is never read and hence the
assignment it is redundant.

Addresses-Coverity: ("Unintended sign extension")
Fixes: e4b27ebc780f ("net: dsa: Add DSA driver for Hirschmann Hellcreek switches")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/dsa/hirschmann/hellcreek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/hirschmann/hellcreek.c b/drivers/net/dsa/hirschmann/hellcreek.c
index dfa66f7260d6..d42f40c76ba5 100644
--- a/drivers/net/dsa/hirschmann/hellcreek.c
+++ b/drivers/net/dsa/hirschmann/hellcreek.c
@@ -308,7 +308,7 @@ static void hellcreek_get_ethtool_stats(struct dsa_switch *ds, int port,
 		const struct hellcreek_counter *counter = &hellcreek_counter[i];
 		u8 offset = counter->offset + port * 64;
 		u16 high, low;
-		u64 value = 0;
+		u64 value;
 
 		mutex_lock(&hellcreek->reg_lock);
 
@@ -320,7 +320,7 @@ static void hellcreek_get_ethtool_stats(struct dsa_switch *ds, int port,
 		 */
 		high  = hellcreek_read(hellcreek, HR_CRDH);
 		low   = hellcreek_read(hellcreek, HR_CRDL);
-		value = (high << 16) | low;
+		value = ((u64)high << 16) | low;
 
 		hellcreek_port->counter_values[i] += value;
 		data[i] = hellcreek_port->counter_values[i];
-- 
2.28.0
