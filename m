From: Colin King <colin.king@canonical.com>
Date: Fri, 12 Feb 2021 11:38:57 +0000
Subject: [PATCH][next] octeontx2-af: Fix spelling mistake "recievd" -> "received"
Message-Id: <20210212113857.213008-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>, hariprasad <hkelam@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the text in array rpm_rx_stats_fields,
fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
index dfeea587a27e..48a84c65804c 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
@@ -121,7 +121,7 @@ static char *rpm_rx_stats_fields[] = {
 	"Packets received with FrameCheckSequenceErrors",
 	"Packets received with VLAN header",
 	"Error packets",
-	"Packets recievd with unicast DMAC",
+	"Packets received with unicast DMAC",
 	"Packets received with multicast DMAC",
 	"Packets received with broadcast DMAC",
 	"Dropped packets",
-- 
2.30.0
