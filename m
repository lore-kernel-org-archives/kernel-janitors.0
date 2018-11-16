From: Colin King <colin.king@canonical.com>
Date: Fri, 16 Nov 2018 13:36:36 +0000
Subject: [PATCH][next] net: aquantia: fix spelling mistake "specfield" -> "specified"
Message-Id: <20181116133636.6913-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Igor Russkikh <igor.russkikh@aquantia.com>, Dmitry Bogdanov <dmitry.bogdanov@aquantia.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a netdev_err message. Fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/aquantia/atlantic/aq_filters.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_filters.c b/drivers/net/ethernet/aquantia/atlantic/aq_filters.c
index f6145e7473b1..18bc035da850 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_filters.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_filters.c
@@ -136,7 +136,7 @@ aq_check_approve_fl2(struct aq_nic_s *aq_nic,
 	if (be16_to_cpu(fsp->m_ext.vlan_tci) = VLAN_PRIO_MASK &&
 	    fsp->m_u.ether_spec.h_proto = 0U) {
 		netdev_err(aq_nic->ndev,
-			   "ethtool: proto (ether_type) parameter must be specfied");
+			   "ethtool: proto (ether_type) parameter must be specified");
 		return -EINVAL;
 	}
 
-- 
2.19.1
