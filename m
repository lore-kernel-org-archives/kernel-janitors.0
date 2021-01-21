From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Jan 2021 06:08:05 +0000
Subject: [PATCH can tree] can: dev: prevent potential information leak in can_fill_info()
Message-Id: <YAkaRdRJncsJO8Ve@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfgang Grandegger <wg@grandegger.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, linux-can@vger.kernel.org, kernel-janitors@vger.kernel.org

The "bec" struct isn't necessarily always initialized.  For example,
the mcp251xfd_get_berr_counter() function doesn't initialize anything
if the interface is down.

Fixes: 52c793f24054 ("can: netlink support for bus-error reporting and counters")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/can/dev/netlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/dev/netlink.c b/drivers/net/can/dev/netlink.c
index 3ae884cdf677..7a1ff6fcbb8f 100644
--- a/drivers/net/can/dev/netlink.c
+++ b/drivers/net/can/dev/netlink.c
@@ -263,7 +263,7 @@ static int can_fill_info(struct sk_buff *skb, const struct net_device *dev)
 {
 	struct can_priv *priv = netdev_priv(dev);
 	struct can_ctrlmode cm = {.flags = priv->ctrlmode};
-	struct can_berr_counter bec;
+	struct can_berr_counter bec = {};
 	enum can_state state = priv->state;
 
 	if (priv->do_get_state)
-- 
2.29.2
