From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 26 Jul 2020 10:58:27 +0000
Subject: [PATCH 2/7] sfc: drop unnecessary list_empty
Message-Id: <1595761112-11003-3-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solarflare linux maintainers <linux-net-drivers@solarflare.com>
Cc: kernel-janitors@vger.kernel.org, Edward Cree <ecree@solarflare.com>, Martin Habets <mhabets@solarflare.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

list_for_each_safe is able to handle an empty list.
The only effect of avoiding the loop is not initializing the
index variable.
Drop list_empty tests in cases where these variables are not
used.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@
expression x,e;
iterator name list_for_each_safe;
statement S;
identifier i,j;
@@

-if (!(list_empty(x))) {
   list_for_each_safe(i,j,x) S
- }
 ... when != i
     when != j
(
  i = e;
|
? j = e;
)
</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/net/ethernet/sfc/ptp.c |   20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/sfc/ptp.c b/drivers/net/ethernet/sfc/ptp.c
index 393b7cb..bea4725 100644
--- a/drivers/net/ethernet/sfc/ptp.c
+++ b/drivers/net/ethernet/sfc/ptp.c
@@ -1154,17 +1154,15 @@ static void efx_ptp_drop_time_expired_events(struct efx_nic *efx)
 
 	/* Drop time-expired events */
 	spin_lock_bh(&ptp->evt_lock);
-	if (!list_empty(&ptp->evt_list)) {
-		list_for_each_safe(cursor, next, &ptp->evt_list) {
-			struct efx_ptp_event_rx *evt;
-
-			evt = list_entry(cursor, struct efx_ptp_event_rx,
-					 link);
-			if (time_after(jiffies, evt->expiry)) {
-				list_move(&evt->link, &ptp->evt_free_list);
-				netif_warn(efx, hw, efx->net_dev,
-					   "PTP rx event dropped\n");
-			}
+	list_for_each_safe(cursor, next, &ptp->evt_list) {
+		struct efx_ptp_event_rx *evt;
+
+		evt = list_entry(cursor, struct efx_ptp_event_rx,
+				 link);
+		if (time_after(jiffies, evt->expiry)) {
+			list_move(&evt->link, &ptp->evt_free_list);
+			netif_warn(efx, hw, efx->net_dev,
+				   "PTP rx event dropped\n");
 		}
 	}
 	spin_unlock_bh(&ptp->evt_lock);
