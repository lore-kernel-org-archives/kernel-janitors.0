From: Colin King <colin.king@canonical.com>
Date: Fri, 25 Sep 2020 13:22:24 +0000
Subject: [PATCH] qtnfmac: fix resource leaks on unsupported iftype error return path
Message-Id: <20200925132224.21638-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Igor Mitsyanko <imitsyanko@quantenna.com>, Sergey Matyukevich <geomatsi@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Avinash Patil <avinashp@quantenna.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently if an unsupported iftype is detected the error return path
does not free the cmd_skb leading to a resource leak. Fix this by
free'ing cmd_skb.

Addresses-Coverity: ("Resource leak")
Fixes: 805b28c05c8e ("qtnfmac: prepare for AP_VLAN interface type support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/quantenna/qtnfmac/commands.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/quantenna/qtnfmac/commands.c b/drivers/net/wireless/quantenna/qtnfmac/commands.c
index f40d8c3c3d9e..f3ccbd2b1084 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/commands.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/commands.c
@@ -869,6 +869,7 @@ int qtnf_cmd_send_del_intf(struct qtnf_vif *vif)
 	default:
 		pr_warn("VIF%u.%u: unsupported iftype %d\n", vif->mac->macid,
 			vif->vifid, vif->wdev.iftype);
+		dev_kfree_skb(cmd_skb);
 		ret = -EINVAL;
 		goto out;
 	}
@@ -1924,6 +1925,7 @@ int qtnf_cmd_send_change_sta(struct qtnf_vif *vif, const u8 *mac,
 		break;
 	default:
 		pr_err("unsupported iftype %d\n", vif->wdev.iftype);
+		dev_kfree_skb(cmd_skb);
 		ret = -EINVAL;
 		goto out;
 	}
-- 
2.27.0
