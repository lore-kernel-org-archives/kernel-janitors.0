From: Colin King <colin.king@canonical.com>
Date: Wed, 08 Jul 2020 18:37:23 +0000
Subject: [PATCH][next] net: systemport: fix double shift of a vlan_tci by VLAN_PRIO_SHIFT
Message-Id: <20200708183723.1212652-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the u16 skb->vlan_tci is being right  shifted twice by
VLAN_PRIO_SHIFT, once in the macro skb_vlan_tag_get_pri and explicitly
by VLAN_PRIO_SHIFT afterwards. The combined shift amount is larger than
the u16 so the end result is always zero.  Remove the second explicit
shift as this is extraneous.

Fixes: 6e9fdb60d362 ("net: systemport: Add support for VLAN transmit acceleration")
Addresses-Coverity: ("Operands don't affect result")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/broadcom/bcmsysport.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcmsysport.c b/drivers/net/ethernet/broadcom/bcmsysport.c
index b470551bae4f..dfed9ade6950 100644
--- a/drivers/net/ethernet/broadcom/bcmsysport.c
+++ b/drivers/net/ethernet/broadcom/bcmsysport.c
@@ -1250,8 +1250,7 @@ static struct sk_buff *bcm_sysport_insert_tsb(struct sk_buff *skb,
 	memset(tsb, 0, sizeof(*tsb));
 
 	if (skb_vlan_tag_present(skb)) {
-		tsb->pcp_dei_vid = (skb_vlan_tag_get_prio(skb) >>
-				    VLAN_PRIO_SHIFT & PCP_DEI_MASK);
+		tsb->pcp_dei_vid = skb_vlan_tag_get_prio(skb) & PCP_DEI_MASK;
 		tsb->pcp_dei_vid |= (u32)skb_vlan_tag_get_id(skb) << VID_SHIFT;
 	}
 
-- 
2.27.0
