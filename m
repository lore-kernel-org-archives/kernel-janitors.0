From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 13 Jan 2020 01:31:23 +0000
Subject: [PATCH -next] ASoC: rt711: remove unused including <linux/version.h>
Message-Id: <20200113013123.47561-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shuming Fan <shumingf@realtek.com>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/codecs/rt711.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 3bebba7a63be..2daed7692a3b 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -8,7 +8,6 @@
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/version.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/delay.h>
