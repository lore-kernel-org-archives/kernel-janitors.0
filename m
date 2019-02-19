From: Mark Brown <broonie@kernel.org>
Date: Tue, 19 Feb 2019 15:50:22 +0000
Subject: Applied "ASoC: dapm: Potential small memory leak in dapm_cnew_widget()" to the asoc tree
Message-Id: <20190219155022.A1E3211284C2@debutante.sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190219120427.GA26719@kadam>
In-Reply-To: <20190219120427.GA26719@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>

The patch

   ASoC: dapm: Potential small memory leak in dapm_cnew_widget()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From a6d9cef30eb11b2de8cbfed9065e3dc5b1f829a8 Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Feb 2019 15:04:27 +0300
Subject: [PATCH] ASoC: dapm: Potential small memory leak in dapm_cnew_widget()

We should free "w" on the error path.

Fixes: 199ed3e81c49 ("ASoC: dapm: fix use-after-free issue with dailink sname")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1
