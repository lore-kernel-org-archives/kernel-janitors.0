From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 06 Feb 2012 07:52:18 +0000
Subject: [patch] ALSA: hda/realtek - cleanup a condition
Message-Id: <20120206075218.GA14304@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, David Henningsson <david.henningsson@canonical.com>

Sparse complains that "spec->multiout.dac_nids" is a pointer.

sound/pci/hda/patch_realtek.c:2321:37: error: incompatible types for operation (>)
sound/pci/hda/patch_realtek.c:2321:37:    left side has type unsigned short const [usertype] *dac_nids
sound/pci/hda/patch_realtek.c:2321:37:    right side has type int

I think the intent here was just to check if it was non-NULL, but please
double check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't have this hardware.

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a8e82be..7da4fd7 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -2318,7 +2318,7 @@ static int alc_build_pcms(struct hda_codec *codec)
 		 "%s Analog", codec->chip_name);
 	info->name = spec->stream_name_analog;
 
-	if (spec->multiout.dac_nids > 0) {
+	if (spec->multiout.dac_nids) {
 		p = spec->stream_analog_playback;
 		if (!p)
 			p = &alc_pcm_analog_playback;
