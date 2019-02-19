From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Feb 2019 12:04:27 +0000
Subject: [PATCH] ASoC: dapm: Potential small memory leak in dapm_cnew_widget()
Message-Id: <20190219120427.GA26719@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

We should free "w" on the error path.

Fixes: 199ed3e81c49 ("ASoC: dapm: fix use-after-free issue with dailink sname")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/soc-dapm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index dea6fc2353e4..1ec06ef6d161 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -332,8 +332,10 @@ static inline struct snd_soc_dapm_widget *dapm_cnew_widget(
 	 */
 	if (_widget->sname) {
 		w->sname = kstrdup_const(_widget->sname, GFP_KERNEL);
-		if (!w->sname)
+		if (!w->sname) {
+			kfree(w);
 			return NULL;
+		}
 	}
 	return w;
 }
-- 
2.17.1
