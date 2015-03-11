From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 11 Mar 2015 16:56:33 +0000
Subject: [PATCH 11/15] ASoC: ab8500-codec: don't export static symbol
Message-Id: <1426092997-30605-12-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, daniel@iogearbox.net, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>

From: Julia Lawall <Julia.Lawall@lip6.fr>

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
type T;
identifier f;
@@

static T f (...) { ... }

@@
identifier r.f;
declarer name EXPORT_SYMBOL_GPL;
@@

-EXPORT_SYMBOL_GPL(f);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 sound/soc/codecs/ab8500-codec.c |    2 --
 1 file changed, 2 deletions(-)

diff -u -p a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -2003,7 +2003,6 @@ static int ab8500_audio_setup_mics(struc
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(ab8500_audio_setup_mics);
 
 static int ab8500_audio_set_ear_cmv(struct snd_soc_codec *codec,
 				enum ear_cm_voltage ear_cmv)
@@ -2036,7 +2035,6 @@ static int ab8500_audio_set_ear_cmv(stru
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(ab8500_audio_set_ear_cmv);
 
 static int ab8500_audio_set_bit_delay(struct snd_soc_dai *dai,
 				unsigned int delay)

