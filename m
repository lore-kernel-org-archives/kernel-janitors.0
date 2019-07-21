From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 21 Jul 2019 16:33:58 +0000
Subject: [PATCH] thermal: tegra: Fix a typo
Message-Id: <20190721163358.2377-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, thierry.reding@gmail.com, jonathanh@nvidia.com, wni@nvidia.com, tiny.windzz@gmail.com
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

s/sochterm/soctherm/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/thermal/tegra/soctherm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index fcf70a3728b6..0ff4b22ddca7 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -202,7 +202,7 @@
 /* get dividend from the depth */
 #define THROT_DEPTH_DIVIDEND(depth)	((256 * (100 - (depth)) / 100) - 1)
 
-/* gk20a nv_therm interface N:3 Mapping. Levels defined in tegra124-sochterm.h
+/* gk20a nv_therm interface N:3 Mapping. Levels defined in tegra124-soctherm.h
  * level	vector
  * NONE		3'b000
  * LOW		3'b001
-- 
2.20.1
