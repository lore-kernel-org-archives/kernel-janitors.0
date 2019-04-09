From: Colin King <colin.king@canonical.com>
Date: Tue, 09 Apr 2019 11:43:33 +0000
Subject: [PATCH][V2] brcmfmac: fix leak of mypkt on error return path
Message-Id: <20190409114333.24342-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently if the call to brcmf_sdiod_set_backplane_window fails then
then error return path leaks mypkt. Fix this by returning by a new
error path labelled 'out' that calls brcmu_pkt_buf_free_skb to free
mypkt.  Also remove redundant check on err before calling
brcmf_sdiod_skbuff_write.

Addresses-Coverity: ("Resource Leak")
Fixes: a7c3aa1509e2 ("brcmfmac: Remove brcmf_sdiod_addrprep()")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: Remove  redundant check on err before calling
brcmf_sdiod_skbuff_write, kudos to Dan Carpenter and Arend Van Spriel
for spotting this.

---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
index ec129864cc9c..60aede5abb4d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
@@ -628,15 +628,13 @@ int brcmf_sdiod_send_buf(struct brcmf_sdio_dev *sdiodev, u8 *buf, uint nbytes)
 
 	err = brcmf_sdiod_set_backplane_window(sdiodev, addr);
 	if (err)
-		return err;
+		goto out;
 
 	addr &= SBSDIO_SB_OFT_ADDR_MASK;
 	addr |= SBSDIO_SB_ACCESS_2_4B_FLAG;
 
-	if (!err)
-		err = brcmf_sdiod_skbuff_write(sdiodev, sdiodev->func2, addr,
-					       mypkt);
-
+	err = brcmf_sdiod_skbuff_write(sdiodev, sdiodev->func2, addr, mypkt);
+out:
 	brcmu_pkt_buf_free_skb(mypkt);
 
 	return err;
-- 
2.20.1
