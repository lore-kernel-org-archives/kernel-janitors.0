From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Jan 2017 15:00:25 +0000
Subject: [PATCH][net-next] net: ethernet: aquantia: remove another redundant err check
Message-Id: <20170127150025.18886-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170127144346.18565-1-colin.king@canonical.com>
In-Reply-To: <20170127144346.18565-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Pavel Belous <Pavel.Belous@aquantia.com>, Alexander Loktionov <Alexander.Loktionov@aquantia.com>, Dmitry Bezrukov <Dmitry.Bezrukov@aquantia.com>, David VomLehn <vomlehn@texas.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check on err < 0 is redundant and can be removed. Detected
by CoverityScan, CID#1398318 ("Logically Dead Code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/aquantia/atlantic/aq_ring.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ring.c b/drivers/net/ethernet/aquantia/atlantic/aq_ring.c
index b517b26..817c145 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_ring.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_ring.c
@@ -304,8 +304,6 @@ int aq_ring_rx_fill(struct aq_ring_s *self)
 
 		buff = NULL;
 	}
-	if (err < 0)
-		goto err_exit;
 
 err_exit:
 	if (err < 0) {
-- 
2.10.2

