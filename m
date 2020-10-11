From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 11 Oct 2020 09:19:35 +0000
Subject: [PATCH 4/8] ALSA: fireworks: use semicolons rather than commas to separate statements
Message-Id: <1602407979-29038-5-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1602407979-29038-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1602407979-29038-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clemens Ladisch <clemens@ladisch.de>
Cc: alsa-devel@alsa-project.org, =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>

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
 sound/firewire/fireworks/fireworks_pcm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index 980580dfbb39..a0d5db1d8eb2 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -148,7 +148,7 @@ pcm_init_hw_params(struct snd_efw *efw,
 	}
 
 	/* limit rates */
-	runtime->hw.rates = efw->supported_sampling_rate,
+	runtime->hw.rates = efw->supported_sampling_rate;
 	snd_pcm_limit_hw_rates(runtime);
 
 	limit_channels(&runtime->hw, pcm_channels);
