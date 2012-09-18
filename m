From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Tue, 18 Sep 2012 16:36:12 +0000
Subject: [PATCH] arch/arm/plat-mxc/ulpi.c: Remove unecessary semicolon
Message-Id: <1347986174-30287-5-git-send-email-peter.senna@gmail.com>
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
 arch/arm/plat-mxc/ulpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/plat-mxc/ulpi.c b/arch/arm/plat-mxc/ulpi.c
index d296342..a799afb 100644
--- a/arch/arm/plat-mxc/ulpi.c
+++ b/arch/arm/plat-mxc/ulpi.c
@@ -51,7 +51,7 @@ static int ulpi_poll(void __iomem *view, u32 bit)
 			return 0;
 
 		cpu_relax();
-	};
+	}
 
 	printk(KERN_WARNING "timeout polling for ULPI device\n");
 
-- 
1.7.11.4

