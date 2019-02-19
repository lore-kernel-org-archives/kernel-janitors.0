From: Colin King <colin.king@canonical.com>
Date: Tue, 19 Feb 2019 14:05:17 +0000
Subject: [PATCH][next] soc: fsl: dpio: fix memory leak of a struct qbman on error exit path
Message-Id: <20190219140517.10709-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roy Pledge <Roy.Pledge@nxp.com>, Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the error check for a null reg leaks a struct qbman
that was allocated earlier. Fix this by kfree'ing p on the error exit
path.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/soc/fsl/dpio/qbman-portal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbman-portal.c
index 0bddb85c0ae5..5a73397ae79e 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.c
+++ b/drivers/soc/fsl/dpio/qbman-portal.c
@@ -180,6 +180,7 @@ struct qbman_swp *qbman_swp_init(const struct qbman_swp_desc *d)
 	reg = qbman_read_register(p, QBMAN_CINH_SWP_CFG);
 	if (!reg) {
 		pr_err("qbman: the portal is not enabled!\n");
+		kfree(p);
 		return NULL;
 	}
 
-- 
2.20.1
