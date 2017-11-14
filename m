From: Colin King <colin.king@canonical.com>
Date: Tue, 14 Nov 2017 17:26:53 +0000
Subject: [PATCH] ALSA: synth: emux: remove redundant test for r <= 13
Message-Id: <20171114172653.6690-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The calculation r = (3 - ((rate >> 6) & 3)) * 3 results in r being
0, 3, 6 or 9 and so the check (13 > r) is always true and hence we
can remove the redundant check and the else path.

Detected by CoverityScan, CID#744415 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/synth/emux/soundfont.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index 31a4ea94830e..0beb5a737c8b 100644
--- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -858,10 +858,7 @@ calc_gus_envelope_time(int rate, int start, int end)
 	p = rate & 0x3f;
 	t = end - start;
 	if (t < 0) t = -t;
-	if (13 > r)
-		t = t << (13 - r);
-	else
-		t = t >> (r - 13);
+	t = t << (13 - r);
 	return (t * 10) / (p * 441);
 }
 
-- 
2.14.1

