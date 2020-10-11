From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 11 Oct 2020 09:19:32 +0000
Subject: [PATCH 1/8] ASoC: wm8350: use semicolons rather than commas to separate statements
Message-Id: <1602407979-29038-2-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1602407979-29038-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1602407979-29038-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org

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
 sound/soc/codecs/wm8350.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8350.c b/sound/soc/codecs/wm8350.c
index a6aa212fa0c8..15d42ce3b21d 100644
--- a/sound/soc/codecs/wm8350.c
+++ b/sound/soc/codecs/wm8350.c
@@ -218,7 +218,8 @@ static void wm8350_pga_work(struct work_struct *work)
 
 	/* PGA volumes have 6 bits of resolution to ramp */
 	for (i = 0; i <= 63; i++) {
-		out1_complete = 1, out2_complete = 1;
+		out1_complete = 1;
+		out2_complete = 1;
 		if (out1->ramp != WM8350_RAMP_NONE)
 			out1_complete = wm8350_out1_ramp_step(wm8350_data);
 		if (out2->ramp != WM8350_RAMP_NONE)
