From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Nov 2014 22:34:43 +0000
Subject: [patch] ALSA: hda - using uninitialized data
Message-Id: <20141126223443.GA443@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Danny Tholen <obiwan@mailmij.org>
Cc: Takashi Iwai <tiwai@suse.de>, Mengdong Lin <mengdong.lin@intel.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, David Henningsson <david.henningsson@canonical.com>

In olden times the snd_hda_param_read() function always set "*start_id"
but in 2007 we introduced a new return and it causes uninitialized data
bugs in a couple of the callers: print_codec_info() and
hdmi_parse_codec().

Fixes: e8a7f136f5ed ('[ALSA] hda-intel - Improve HD-audio codec probing robustness')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is from static analysis.  Untested.

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index b2d5899..2fe86d2 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -346,8 +346,10 @@ int snd_hda_get_sub_nodes(struct hda_codec *codec, hda_nid_t nid,
 	unsigned int parm;
 
 	parm = snd_hda_param_read(codec, nid, AC_PAR_NODE_COUNT);
-	if (parm = -1)
+	if (parm = -1) {
+		*start_id = 0;
 		return 0;
+	}
 	*start_id = (parm >> 16) & 0x7fff;
 	return (int)(parm & 0x7fff);
 }
