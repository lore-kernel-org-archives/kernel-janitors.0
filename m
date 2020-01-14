From: Colin King <colin.king@canonical.com>
Date: Tue, 14 Jan 2020 15:44:12 +0000
Subject: [PATCH] ALSA: hda - fix out of bounds read on spec->smux_paths
Message-Id: <20200114154412.365395-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

It is possible for the call to snd_hda_get_num_conns to fail and return
a negative error code that gets assigned to num_conns. In that specific
case, the check of very large values of val against num_conns will not
fail the -EINVAL check and later on an out of bounds array read on
spec->smux_paths will occur.  Fix this by sanity checking for an error
return from the call to snd_hda_get_num_conns.

Addresses-Coverity: ("Out-of-bounds read")
Fixes: 272f3ea31776 ("ALSA: hda - Add SPDIF mux control to AD codec auto-parser")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/pci/hda/patch_analog.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_analog.c b/sound/pci/hda/patch_analog.c
index 88c46b051d14..399561369495 100644
--- a/sound/pci/hda/patch_analog.c
+++ b/sound/pci/hda/patch_analog.c
@@ -756,9 +756,11 @@ static int ad1988_auto_smux_enum_put(struct snd_kcontrol *kcontrol,
 	struct ad198x_spec *spec = codec->spec;
 	unsigned int val = ucontrol->value.enumerated.item[0];
 	struct nid_path *path;
-	int num_conns = snd_hda_get_num_conns(codec, 0x0b) + 1;
+	int num_conns = snd_hda_get_num_conns(codec, 0x0b);
 
-	if (val >= num_conns)
+	if (num_conns < 0)
+		return num_conns;
+	if (val >= num_conns + 1)
 		return -EINVAL;
 	if (spec->cur_smux = val)
 		return 0;
-- 
2.24.0
