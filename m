From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Aug 2018 15:16:27 +0000
Subject: [PATCH][next] be2net: fix spelling mistake "seqence" -> "sequence"
Message-Id: <20180802151627.22639-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sathya Perla <sathya.perla@broadcom.com>, Ajit Khaparde <ajit.khaparde@broadcom.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_info message.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/emulex/benet/be_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/emulex/benet/be_main.c b/drivers/net/ethernet/emulex/benet/be_main.c
index 580cdec2d2ce..d0b9415d9ae7 100644
--- a/drivers/net/ethernet/emulex/benet/be_main.c
+++ b/drivers/net/ethernet/emulex/benet/be_main.c
@@ -1461,7 +1461,7 @@ static void be_tx_timeout(struct net_device *netdev)
 						 ntohs(tcphdr->source));
 					dev_info(dev, "TCP dest port %d\n",
 						 ntohs(tcphdr->dest));
-					dev_info(dev, "TCP seqence num %d\n",
+					dev_info(dev, "TCP sequence num %d\n",
 						 ntohs(tcphdr->seq));
 					dev_info(dev, "TCP ack_seq %d\n",
 						 ntohs(tcphdr->ack_seq));
-- 
2.17.1

