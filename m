From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Tue, 18 Sep 2012 16:36:10 +0000
Subject: [PATCH] arch/arm/mach-omap1/devices.c: Remove unecessary semicolon
Message-Id: <1347986174-30287-3-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347986174-30287-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1347986174-30287-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Found by http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 arch/arm/mach-omap1/devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap1/devices.c b/arch/arm/mach-omap1/devices.c
index fa1fa4d..688b23a 100644
--- a/arch/arm/mach-omap1/devices.c
+++ b/arch/arm/mach-omap1/devices.c
@@ -232,7 +232,7 @@ void __init omap1_init_mmc(struct omap_mmc_platform_data **mmc_data,
 
 		omap_mmc_add("mmci-omap", i, base, size, irq,
 				rx_req, tx_req, mmc_data[i]);
-	};
+	}
 }
 
 #endif
-- 
1.7.11.4

