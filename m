From: "Hannes Eder" <hannes@hanneseder.net>
Date: Fri, 21 Nov 2008 15:03:24 +0000
Subject: [PATCH] ALSA: hda - fix sparse warning
Message-Id: <154e089b0811210703h3b63273et77acddfc0e6612e8@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix the following sparse warning:

sound/pci/hda/patch_nvhdmi.c:161:25: warning: symbol
'snd_hda_preset_nvhdmi' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 sound/pci/hda/patch_nvhdmi.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/sound/pci/hda/patch_nvhdmi.c b/sound/pci/hda/patch_nvhdmi.c
index 2eed2c8..1360d54 100644
--- a/sound/pci/hda/patch_nvhdmi.c
+++ b/sound/pci/hda/patch_nvhdmi.c
@@ -28,6 +28,7 @@
 #include <sound/core.h>
 #include "hda_codec.h"
 #include "hda_local.h"
+#include "hda_patch.h"

 struct nvhdmi_spec {
 	struct hda_multi_out multiout;
