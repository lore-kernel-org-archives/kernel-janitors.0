From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 31 Jul 2013 08:52:44 +0000
Subject: [patch] ASoC: dapm: using freed pointer in dapm_kcontrol_add_widget()
Message-Id: <20130731085244.GB8210@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org

There is a typo here so we end up using the old freed pointer instead of
the newly allocated one.  (If the "n" is zero then the code works,
obviously).

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only needed in linux-next

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 9abb3b2..d74c356 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -225,13 +225,13 @@ static int dapm_kcontrol_add_widget(struct snd_kcontrol *kcontrol,
 
 	new_data = krealloc(data, sizeof(*data) + sizeof(widget) * n,
 		GFP_KERNEL);
-	if (!data)
+	if (!new_data)
 		return -ENOMEM;
 
-	data->wlist.widgets[n - 1] = widget;
-	data->wlist.num_widgets = n;
+	new_data->wlist.widgets[n - 1] = widget;
+	new_data->wlist.num_widgets = n;
 
-	kcontrol->private_data = data;
+	kcontrol->private_data = new_data;
 
 	return 0;
 }
