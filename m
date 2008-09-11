From: Julia Lawall <julia@diku.dk>
Date: Thu, 11 Sep 2008 12:34:09 +0000
Subject: [PATCH 4/5] net/atm/lec.c: Drop code after return
Message-Id: <Pine.LNX.4.64.0809111433510.9593@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: chas@cmf.nrl.navy.mil, vigneshbabu@gmail.com, richard.genoud@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The break after the return serves no purpose.

Signed-off-by: Julia Lawall <julia@diku.dk>
---

 net/atm/lec.c                 |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/net/atm/lec.c b/net/atm/lec.c
index 5799fb5..8f701cd 100644
--- a/net/atm/lec.c
+++ b/net/atm/lec.c
@@ -1931,7 +1931,6 @@ static struct atm_vcc *lec_arp_resolve(struct lec_priv *priv,
 		switch (priv->lane_version) {
 		case 1:
 			return priv->mcast_vcc;
-			break;
 		case 2:	/* LANE2 wants arp for multicast addresses */
 			if (!compare_ether_addr(mac_to_find, bus_mac))
 				return priv->mcast_vcc;
