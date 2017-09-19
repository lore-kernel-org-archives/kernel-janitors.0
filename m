From: Colin King <colin.king@canonical.com>
Date: Tue, 19 Sep 2017 21:50:00 +0000
Subject: [PATCH] ASoC: rl6231: make arrays div and pd static const, reduces object code size
Message-Id: <20170919215000.32040-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bard Liao <bardliao@realtek.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the read-only arrays div and pd on the stack,
instead make them static const. Makes the object code smaller by 210 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
   2869	    720	      0	   3589	    e05	sound/soc/codecs/rl6231.o

After:
   text	   data	    bss	    dec	    hex	filename
   2495	    880	      0	   3375	    d2f	sound/soc/codecs/rl6231.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/rl6231.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rl6231.c b/sound/soc/codecs/rl6231.c
index 7b447d0b173a..974a9040651d 100644
--- a/sound/soc/codecs/rl6231.c
+++ b/sound/soc/codecs/rl6231.c
@@ -71,7 +71,7 @@ EXPORT_SYMBOL_GPL(rl6231_get_pre_div);
  */
 int rl6231_calc_dmic_clk(int rate)
 {
-	int div[] = {2, 3, 4, 6, 8, 12};
+	static const int div[] = {2, 3, 4, 6, 8, 12};
 	int i;
 
 	if (rate < 1000000 * div[0]) {
@@ -189,7 +189,8 @@ EXPORT_SYMBOL_GPL(rl6231_pll_calc);
 
 int rl6231_get_clk_info(int sclk, int rate)
 {
-	int i, pd[] = {1, 2, 3, 4, 6, 8, 12, 16};
+	int i;
+	static const int pd[] = {1, 2, 3, 4, 6, 8, 12, 16};
 
 	if (sclk <= 0 || rate <= 0)
 		return -EINVAL;
-- 
2.14.1

