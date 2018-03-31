From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 31 Mar 2018 06:11:41 +0000
Subject: [PATCH net-next] vlan: vlan_hw_filter_capable() can be static
Message-Id: <1522476701-93237-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vishakha Narvekar <Vishakha.Narvekar@dell.com>, Toshiaki Makita <makita.toshiaki@lab.ntt.co.jp>, Kate Stewart <kstewart@linuxfoundation.org>, Tariq Toukan <tariqt@mellanox.com>, Gal Pressman <galp@mellanox.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

net/8021q/vlan_core.c:168:6: warning:
 symbol 'vlan_hw_filter_capable' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/8021q/vlan_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/8021q/vlan_core.c b/net/8021q/vlan_core.c
index c8d7abd..4f60e86 100644
--- a/net/8021q/vlan_core.c
+++ b/net/8021q/vlan_core.c
@@ -165,7 +165,7 @@ struct vlan_vid_info {
 	int refcount;
 };
 
-bool vlan_hw_filter_capable(const struct net_device *dev, __be16 proto)
+static bool vlan_hw_filter_capable(const struct net_device *dev, __be16 proto)
 {
 	if (proto = htons(ETH_P_8021Q) &&
 	    dev->features & NETIF_F_HW_VLAN_CTAG_FILTER)

