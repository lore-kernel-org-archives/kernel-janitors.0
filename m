From: YueHaibing <yuehaibing@huawei.com>
Date: Sun, 02 Feb 2020 07:39:17 +0000
Subject: [PATCH -next] ASoC: Remove unused including <linux/version.h>
Message-Id: <20200202073917.195880-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Jeff Chang <jeff_chang@richtek.com>
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/codecs/mt6660.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
index a36c416caad4..1a3515df1764 100644
--- a/sound/soc/codecs/mt6660.c
+++ b/sound/soc/codecs/mt6660.c
@@ -4,7 +4,6 @@
 
 #include <linux/module.h>
 #include <linux/kernel.h>
-#include <linux/version.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/pm_runtime.h>
