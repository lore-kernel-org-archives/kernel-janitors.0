From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Dec 2020 12:59:13 +0000
Subject: [PATCH] ASoC: SOF: Fix spelling mistake in Kconfig "ond" -> "and"
Message-Id: <20201216125913.16041-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/sof/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 031dad5fc4c7..3e8b6c035ce3 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -122,7 +122,7 @@ config SND_SOC_SOF_DEBUG_XRUN_STOP
 	bool "SOF stop on XRUN"
 	help
 	  This option forces PCMs to stop on any XRUN event. This is useful to
-	  preserve any trace data ond pipeline status prior to the XRUN.
+	  preserve any trace data and pipeline status prior to the XRUN.
 	  Say Y if you are debugging SOF FW pipeline XRUNs.
 	  If unsure select "N".
 
-- 
2.29.2
