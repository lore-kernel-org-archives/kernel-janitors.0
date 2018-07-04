From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Jul 2018 07:01:35 +0000
Subject: [PATCH] net: alteon: acenic: remove redundant pointer rxdesc
Message-Id: <20180704070135.13938-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jes Sorensen <jes@trained-monkey.org>, "David S . Miller" <davem@davemloft.net>, linux-acenic@sunsite.dk, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer rxdesc is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'rxdesc' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/alteon/acenic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/alteon/acenic.c b/drivers/net/ethernet/alteon/acenic.c
index 8f71b79b4949..08945baee48a 100644
--- a/drivers/net/ethernet/alteon/acenic.c
+++ b/drivers/net/ethernet/alteon/acenic.c
@@ -1933,7 +1933,7 @@ static void ace_rx_int(struct net_device *dev, u32 rxretprd, u32 rxretcsm)
 	while (idx != rxretprd) {
 		struct ring_info *rip;
 		struct sk_buff *skb;
-		struct rx_desc *rxdesc, *retdesc;
+		struct rx_desc *retdesc;
 		u32 skbidx;
 		int bd_flags, desc_type, mapsize;
 		u16 csum;
@@ -1959,19 +1959,16 @@ static void ace_rx_int(struct net_device *dev, u32 rxretprd, u32 rxretcsm)
 		case 0:
 			rip = &ap->skb->rx_std_skbuff[skbidx];
 			mapsize = ACE_STD_BUFSIZE;
-			rxdesc = &ap->rx_std_ring[skbidx];
 			std_count++;
 			break;
 		case BD_FLG_JUMBO:
 			rip = &ap->skb->rx_jumbo_skbuff[skbidx];
 			mapsize = ACE_JUMBO_BUFSIZE;
-			rxdesc = &ap->rx_jumbo_ring[skbidx];
 			atomic_dec(&ap->cur_jumbo_bufs);
 			break;
 		case BD_FLG_MINI:
 			rip = &ap->skb->rx_mini_skbuff[skbidx];
 			mapsize = ACE_MINI_BUFSIZE;
-			rxdesc = &ap->rx_mini_ring[skbidx];
 			mini_count++;
 			break;
 		default:
-- 
2.17.1

