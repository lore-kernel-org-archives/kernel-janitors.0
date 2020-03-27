From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Mar 2020 16:13:49 +0000
Subject: [PATCH] soc: fsl: qe: clean up an indentation issue
Message-Id: <20200327161349.284679-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statement that not indented correctly, remove the
extraneous space.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/soc/fsl/qe/ucc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/ucc.c b/drivers/soc/fsl/qe/ucc.c
index d6c93970df4d..cac0fb7693a0 100644
--- a/drivers/soc/fsl/qe/ucc.c
+++ b/drivers/soc/fsl/qe/ucc.c
@@ -519,7 +519,7 @@ int ucc_set_tdm_rxtx_clk(u32 tdm_num, enum qe_clock clock,
 	int clock_bits;
 	u32 shift;
 	struct qe_mux __iomem *qe_mux_reg;
-	 __be32 __iomem *cmxs1cr;
+	__be32 __iomem *cmxs1cr;
 
 	qe_mux_reg = &qe_immr->qmx;
 
-- 
2.25.1
