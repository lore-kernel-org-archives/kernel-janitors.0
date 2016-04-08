From: Alexandre TORGUE <alexandre.torgue@st.com>
Date: Fri, 08 Apr 2016 09:18:03 +0000
Subject: [PATCH net-next] net: ethernet: stmmac: GMAC4.xx: Fix TX descriptor preparation
Message-Id: <1460107083-25577-1-git-send-email-alexandre.torgue@st.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, peppe.cavallaro@st.com
Cc: dan.carpenter@oracle.com, kernel-janitors@vger.kernel.org

On GMAC4.xx each descriptor contains 2 buffers of 16KB (each).
Initially, those 2 buffers was filled in dwmac4_rd_prepare_tx_desc but
it is actually not needed. Indeed, stmmac driver supports frame up to
9000 bytes (jumbo). So only one buffer is needed.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index d4952c7..4ec7397 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -254,14 +254,7 @@ static void dwmac4_rd_prepare_tx_desc(struct dma_desc *p, int is_fs, int len,
 {
 	unsigned int tdes3 = p->des3;
 
-	if (unlikely(len > BUF_SIZE_16KiB)) {
-		p->des2 |= (((len - BUF_SIZE_16KiB) <<
-			     TDES2_BUFFER2_SIZE_MASK_SHIFT)
-			    & TDES2_BUFFER2_SIZE_MASK)
-			    | (BUF_SIZE_16KiB & TDES2_BUFFER1_SIZE_MASK);
-	} else {
-		p->des2 |= (len & TDES2_BUFFER1_SIZE_MASK);
-	}
+	p->des2 |= (len & TDES2_BUFFER1_SIZE_MASK);
 
 	if (is_fs)
 		tdes3 |= TDES3_FIRST_DESCRIPTOR;
-- 
1.9.1

