From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Jul 2020 08:36:16 +0000
Subject: [PATCH][next] dmaengine: ioat: fix spelling mistake "idel" -> "idle"
Message-Id: <20200707083616.573910-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, Leonid Ravich <Leonid.Ravich@emc.com>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the module parameter description for
idle_timeout. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma/ioat/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ioat/dma.c b/drivers/dma/ioat/dma.c
index fd782aee02d9..863e2ddba75b 100644
--- a/drivers/dma/ioat/dma.c
+++ b/drivers/dma/ioat/dma.c
@@ -33,7 +33,7 @@ MODULE_PARM_DESC(completion_timeout,
 int idle_timeout = 2000;
 module_param(idle_timeout, int, 0644);
 MODULE_PARM_DESC(idle_timeout,
-		"set ioat idel timeout [msec] (default 2000 [msec])");
+		"set ioat idle timeout [msec] (default 2000 [msec])");
 
 #define IDLE_TIMEOUT msecs_to_jiffies(idle_timeout)
 #define COMPLETION_TIMEOUT msecs_to_jiffies(completion_timeout)
-- 
2.27.0
