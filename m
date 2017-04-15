From: Colin King <colin.king@canonical.com>
Date: Sat, 15 Apr 2017 17:49:54 +0000
Subject: [PATCH] ASoC: topology: use j for internal loop counter
Message-Id: <20170415174954.90707-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently variable i is being for 2 nested for loops. Fix this by
using integer loop counter j for the inside for loop.

Fixes: 1a7dd6e2f1929 ("ASoC: topology: Allow a widget to have multiple enum controls")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/soc-topology.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 058bc99c6c34..002772e3ba2c 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -495,12 +495,13 @@ static void remove_widget(struct snd_soc_component *comp,
 			struct snd_kcontrol *kcontrol = w->kcontrols[i];
 			struct soc_enum *se  				(struct soc_enum *)kcontrol->private_value;
+			int j;
 
 			snd_ctl_remove(card, kcontrol);
 
 			kfree(se->dobj.control.dvalues);
-			for (i = 0; i < se->items; i++)
-				kfree(se->dobj.control.dtexts[i]);
+			for (j = 0; j < se->items; j++)
+				kfree(se->dobj.control.dtexts[j]);
 
 			kfree(se);
 		}
-- 
2.11.0

