From: Colin King <colin.king@canonical.com>
Date: Fri, 09 Aug 2019 17:22:17 +0000
Subject: [PATCH] brcmfmac: remove redundant assignment to pointer hash
Message-Id: <20190809172217.1809-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arend van Spriel <arend.vanspriel@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer hash is being initialized with a value that is never read
and is being re-assigned a little later on. The assignment is
redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
index 8428be8b8d43..e3dd8623be4e 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
@@ -1468,7 +1468,6 @@ static int brcmf_msgbuf_stats_read(struct seq_file *seq, void *data)
 	seq_printf(seq, "\nh2d_flowrings: depth %u\n",
 		   BRCMF_H2D_TXFLOWRING_MAX_ITEM);
 	seq_puts(seq, "Active flowrings:\n");
-	hash = msgbuf->flow->hash;
 	for (i = 0; i < msgbuf->flow->nrofrings; i++) {
 		if (!msgbuf->flow->rings[i])
 			continue;
-- 
2.20.1
