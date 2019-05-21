From: Colin King <colin.king@canonical.com>
Date: Tue, 21 May 2019 08:56:24 +0000
Subject: [PATCH][next] soc: fsl: fix spelling mistake "Firmaware" -> "Firmware"
Message-Id: <20190521085624.13665-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a pr_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/soc/fsl/dpaa2-console.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/dpaa2-console.c b/drivers/soc/fsl/dpaa2-console.c
index 9168d8ddc932..27243f706f37 100644
--- a/drivers/soc/fsl/dpaa2-console.c
+++ b/drivers/soc/fsl/dpaa2-console.c
@@ -73,7 +73,7 @@ static u64 get_mc_fw_base_address(void)
 
 	mcfbaregs = ioremap(mc_base_addr.start, resource_size(&mc_base_addr));
 	if (!mcfbaregs) {
-		pr_err("could not map MC Firmaware Base registers\n");
+		pr_err("could not map MC Firmware Base registers\n");
 		return 0;
 	}
 
-- 
2.20.1
