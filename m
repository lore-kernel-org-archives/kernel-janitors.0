From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Sep 2019 15:48:26 +0000
Subject: [PATCH] ALSA: hda/hdmi: remove redundant assignment to variable pcm_idx
Message-Id: <20190905154826.5916-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable pcm_idx is being initialized with a value that is never read
and is being re-assigned immediately afterwards. The assignment is
redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/pci/hda/patch_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 83b8b9d27711..bca5de78e9ad 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1440,7 +1440,7 @@ static bool update_eld(struct hda_codec *codec,
 	struct hdmi_spec *spec = codec->spec;
 	bool old_eld_valid = pin_eld->eld_valid;
 	bool eld_changed;
-	int pcm_idx = -1;
+	int pcm_idx;
 
 	/* for monitor disconnection, save pcm_idx firstly */
 	pcm_idx = per_pin->pcm_idx;
-- 
2.20.1
