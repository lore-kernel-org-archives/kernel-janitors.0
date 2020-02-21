From: Colin King <colin.king@canonical.com>
Date: Fri, 21 Feb 2020 23:11:43 +0000
Subject: [PATCH][next] soc: fsl: dpio: fix dereference of pointer p before null check
Message-Id: <20200221231143.30131-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roy Pledge <Roy.Pledge@nxp.com>, Li Yang <leoyang.li@nxp.com>, Youri Querry <youri.querry_1@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer p is currently being dereferenced before it is null
checked on a memory allocation failure check. Fix this by
checking if p is null before dereferencing it.

Addresses-Coverity: ("Dereference before null check")
Fixes: 3b2abda7d28c ("soc: fsl: dpio: Replace QMAN array mode with ring mode enqueue")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/soc/fsl/dpio/qbman-portal.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbman-portal.c
index 740ee0d19582..d1f49caa5b13 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.c
+++ b/drivers/soc/fsl/dpio/qbman-portal.c
@@ -249,10 +249,11 @@ struct qbman_swp *qbman_swp_init(const struct qbman_swp_desc *d)
 	u32 mask_size;
 	u32 eqcr_pi;
 
-	spin_lock_init(&p->access_spinlock);
-
 	if (!p)
 		return NULL;
+
+	spin_lock_init(&p->access_spinlock);
+
 	p->desc = d;
 	p->mc.valid_bit = QB_VALID_BIT;
 	p->sdq = 0;
-- 
2.25.0
