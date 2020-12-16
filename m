From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Dec 2020 11:28:59 +0000
Subject: [PATCH] ASoC: codecs: fix spelling mistake in Kconfig "comunicate" -> "communicate"
Message-Id: <20201216112859.11564-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ba4eb54aafcb..9bf6bfdaf11e 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -457,7 +457,7 @@ config SND_SOC_ADAU7118_HW
 	help
 	  Enable support for the Analog Devices ADAU7118 8 Channel PDM-to-I2S/TDM
 	  Converter. In this mode, the device works in standalone mode which
-	  means that there is no bus to comunicate with it. Stereo mode is not
+	  means that there is no bus to communicate with it. Stereo mode is not
 	  supported in this mode.
 
 	  To compile this driver as a module, choose M here: the module
-- 
2.29.2
