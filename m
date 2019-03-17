From: Colin King <colin.king@canonical.com>
Date: Sun, 17 Mar 2019 22:47:03 +0000
Subject: [PATCH] gpu: host1x: fix mismatch between function definitions and declarations
Message-Id: <20190317224703.6706-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Three functions have arguments r and v swapped in their function
declarations in the header file dev.h compared to their definitions
in dev.c.  Swap the order in the header file to fix this.

Fixes: f1b53c4e2c08 ("gpu: host1x: Add Tegra186 support")
Fixes: 6579324a41cc ("gpu: host1x: Add channel support")
Fixes: 754716874389 ("gpu: host1x: Add host1x driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/host1x/dev.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index 05216a7e4830..f85138229fbe 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -153,11 +153,11 @@ struct host1x {
 	struct list_head list;
 };
 
-void host1x_hypervisor_writel(struct host1x *host1x, u32 r, u32 v);
+void host1x_hypervisor_writel(struct host1x *host1x, u32 v, u32 r);
 u32 host1x_hypervisor_readl(struct host1x *host1x, u32 r);
-void host1x_sync_writel(struct host1x *host1x, u32 r, u32 v);
+void host1x_sync_writel(struct host1x *host1x, u32 v, u32 r);
 u32 host1x_sync_readl(struct host1x *host1x, u32 r);
-void host1x_ch_writel(struct host1x_channel *ch, u32 r, u32 v);
+void host1x_ch_writel(struct host1x_channel *ch, u32 v, u32 r);
 u32 host1x_ch_readl(struct host1x_channel *ch, u32 r);
 
 static inline void host1x_hw_syncpt_restore(struct host1x *host,
-- 
2.20.1
