From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 11 Oct 2020 09:19:33 +0000
Subject: [PATCH 2/8] ALSA: hda: use semicolons rather than commas to separate statements
Message-Id: <1602407979-29038-3-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1602407979-29038-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1602407979-29038-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>

Replace commas with semicolons.  What is done is essentially described by
the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 sound/pci/hda/patch_ca0132.c |    2 +-
 sound/pci/hda/patch_hdmi.c   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 9779978e4bc7..2b38b2a716a1 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -3114,7 +3114,7 @@ static int dspxfr_one_seg(struct hda_codec *codec,
 	}
 
 	data = fls->data;
-	chip_addx = fls->chip_addr,
+	chip_addx = fls->chip_addr;
 	words_to_write = fls->count;
 
 	if (!words_to_write)
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 055440740184..0ffbfcb91256 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2451,7 +2451,7 @@ static int alloc_generic_hdmi(struct hda_codec *codec)
 	spec->chmap.ops.get_chmap = hdmi_get_chmap;
 	spec->chmap.ops.set_chmap = hdmi_set_chmap;
 	spec->chmap.ops.is_pcm_attached = is_hdmi_pcm_attached;
-	spec->chmap.ops.get_spk_alloc = hdmi_get_spk_alloc,
+	spec->chmap.ops.get_spk_alloc = hdmi_get_spk_alloc;
 
 	codec->spec = spec;
 	hdmi_array_init(spec, 4);
