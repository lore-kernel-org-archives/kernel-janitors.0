From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Apr 2018 19:02:45 +0000
Subject: [PATCH] ALSA: cs46xx: fix spelling mistake: "amplifer" -> "amplifier"
Message-Id: <20180427190245.16861-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in module parameter description text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/pci/cs46xx/cs46xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/cs46xx/cs46xx.c b/sound/pci/cs46xx/cs46xx.c
index 655fbea1692c..4910d3f46d4b 100644
--- a/sound/pci/cs46xx/cs46xx.c
+++ b/sound/pci/cs46xx/cs46xx.c
@@ -58,7 +58,7 @@ MODULE_PARM_DESC(id, "ID string for the CS46xx soundcard.");
 module_param_array(enable, bool, NULL, 0444);
 MODULE_PARM_DESC(enable, "Enable CS46xx soundcard.");
 module_param_array(external_amp, bool, NULL, 0444);
-MODULE_PARM_DESC(external_amp, "Force to enable external amplifer.");
+MODULE_PARM_DESC(external_amp, "Force to enable external amplifier.");
 module_param_array(thinkpad, bool, NULL, 0444);
 MODULE_PARM_DESC(thinkpad, "Force to enable Thinkpad's CLKRUN control.");
 module_param_array(mmap_valid, bool, NULL, 0444);
-- 
2.17.0

