From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Nov 2013 07:58:38 +0000
Subject: [patch] ALSA: isa: not allocating enough space
Message-Id: <20131113075838.GK25541@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, Bill Pemberton <wfp5p@virginia.edu>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

We allocate only 4 bytes here "sizeof(int)" instead of WF_MSAMPLE_BYTES
(259) which was intended.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/isa/wavefront/wavefront_synth.c b/sound/isa/wavefront/wavefront_synth.c
index a2f87f9..e5db001 100644
--- a/sound/isa/wavefront/wavefront_synth.c
+++ b/sound/isa/wavefront/wavefront_synth.c
@@ -1196,7 +1196,7 @@ wavefront_send_multisample (snd_wavefront_t *dev, wavefront_patch_info *header)
 	int num_samples;
 	unsigned char *msample_hdr;
 
-	msample_hdr = kmalloc(sizeof(WF_MSAMPLE_BYTES), GFP_KERNEL);
+	msample_hdr = kmalloc(WF_MSAMPLE_BYTES, GFP_KERNEL);
 	if (! msample_hdr)
 		return -ENOMEM;
 
