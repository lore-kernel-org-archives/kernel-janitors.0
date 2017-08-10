From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 10 Aug 2017 13:05:07 +0000
Subject: [PATCH 5/5] ASoC: dapm: Adjust seven checks for null pointers
Message-Id: <32343b0d-447a-6b1a-ff11-506d14a82d15@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e8013ddb-687d-ee56-8153-2791bb9f46fe@users.sourceforge.net>
In-Reply-To: <e8013ddb-687d-ee56-8153-2791bb9f46fe@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 10 Aug 2017 14:41:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/soc-dapm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 4eea84d821c4..5a85b8773289 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -146,7 +146,7 @@ static void pop_dbg(struct device *dev, u32 pop_time, const char *fmt, ...)
 		return;
 
 	buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
-	if (buf = NULL)
+	if (!buf)
 		return;
 
 	va_start(args, fmt);
@@ -883,7 +883,7 @@ static int dapm_create_or_share_kcontrol(struct snd_soc_dapm_widget *w,
 			long_name = kasprintf(GFP_KERNEL, "%s %s",
 				 w->name + prefix_len,
 				 w->kcontrol_news[kci].name);
-			if (long_name = NULL)
+			if (!long_name)
 				return -ENOMEM;
 
 			name = long_name;
@@ -1086,7 +1086,7 @@ static int dapm_widget_list_create(struct snd_soc_dapm_widget_list **list,
 		size++;
 
 	*list = kzalloc(sizeof(**list) + size * sizeof(*w), GFP_KERNEL);
-	if (*list = NULL)
+	if (!*list)
 		return -ENOMEM;
 
 	list_for_each_entry(w, widgets, work_list)
@@ -2668,7 +2668,7 @@ static int snd_soc_dapm_add_path(struct snd_soc_dapm_context *dapm,
 		path->is_supply = 1;
 
 	/* connect static paths */
-	if (control = NULL) {
+	if (!control) {
 		path->connect = 1;
 	} else {
 		switch (wsource->id) {
@@ -2777,12 +2777,12 @@ static int snd_soc_dapm_add_route(struct snd_soc_dapm_context *dapm,
 	if (!wsource)
 		wsource = wtsource;
 
-	if (wsource = NULL) {
+	if (!wsource) {
 		dev_err(dapm->dev, "ASoC: no source widget found for %s\n",
 			route->source);
 		return -ENODEV;
 	}
-	if (wsink = NULL) {
+	if (!wsink) {
 		dev_err(dapm->dev, "ASoC: no sink widget found for %s\n",
 			route->sink);
 		return -ENODEV;
@@ -3489,7 +3489,7 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 		w->name = kasprintf(GFP_KERNEL, "%s %s", prefix, widget->name);
 	else
 		w->name = kstrdup_const(widget->name, GFP_KERNEL);
-	if (w->name = NULL) {
+	if (!w->name) {
 		kfree(w);
 		return NULL;
 	}
-- 
2.14.0

