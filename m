From: Colin King <colin.king@canonical.com>
Date: Sun, 16 Dec 2018 13:33:15 +0000
Subject: [PATCH] bonding: fix indentation issues, remove extra spaces
Message-Id: <20181216133315.5269-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jay Vosburgh <j.vosburgh@gmail.com>, Veaceslav Falico <vfalico@gmail.com>, Andy Gospodarek <andy@greyhouse.net>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two statements that are indented too much by one space each,
fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/bonding/bond_3ad.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/bonding/bond_3ad.c b/drivers/net/bonding/bond_3ad.c
index 93dfcef8afc4..7c46d9f4fefd 100644
--- a/drivers/net/bonding/bond_3ad.c
+++ b/drivers/net/bonding/bond_3ad.c
@@ -1220,7 +1220,7 @@ static void ad_churn_machine(struct port *port)
 		port->sm_churn_partner_state = AD_CHURN_MONITOR;
 		port->sm_churn_actor_timer_counter  			__ad_timer_to_ticks(AD_ACTOR_CHURN_TIMER, 0);
-		 port->sm_churn_partner_timer_counter +		port->sm_churn_partner_timer_counter  			 __ad_timer_to_ticks(AD_PARTNER_CHURN_TIMER, 0);
 		return;
 	}
@@ -2128,7 +2128,7 @@ void bond_3ad_unbind_slave(struct slave *slave)
 				if ((new_aggregator->lag_ports = port) &&
 				    new_aggregator->is_active) {
 					netdev_info(bond->dev, "Removing an active aggregator\n");
-					 select_new_active_agg = 1;
+					select_new_active_agg = 1;
 				}
 
 				new_aggregator->is_individual = aggregator->is_individual;
-- 
2.19.1
