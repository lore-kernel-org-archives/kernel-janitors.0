From: Colin King <colin.king@canonical.com>
Date: Sat, 07 Sep 2019 07:37:17 +0000
Subject: [PATCH] ASoC: rt1011: make array pd static const, makes object smaller
Message-Id: <20190907073717.21632-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bard Liao <bardliao@realtek.com>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array pd on the stack but instead make it
static const. Makes the object code smaller by 100 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  51463	  13016	    128	  64607	   fc5f	sound/soc/codecs/rt1011.o

After:
   text	   data	    bss	    dec	    hex	filename
  51299	  13080	    128	  64507	   fbfb	sound/soc/codecs/rt1011.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/rt1011.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index f9235764ad32..be1e276e3631 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1519,7 +1519,8 @@ static const struct snd_soc_dapm_route rt1011_dapm_routes[] = {
 
 static int rt1011_get_clk_info(int sclk, int rate)
 {
-	int i, pd[] = {1, 2, 3, 4, 6, 8, 12, 16};
+	int i;
+	static const int pd[] = {1, 2, 3, 4, 6, 8, 12, 16};
 
 	if (sclk <= 0 || rate <= 0)
 		return -EINVAL;
-- 
2.20.1
