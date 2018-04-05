From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Apr 2018 11:25:18 +0000
Subject: [PATCH] ASoC: topology: fix some tiny memory leaks
Message-Id: <20180405112518.GE4218@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

These tiny memory leaks don't have a huge real life impact but they
cause static checker warnings so let's fix them.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index fa27d0fca6dc..942c6e5eb4b7 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1325,8 +1325,10 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_denum_create(
 			ec->hdr.name);
 
 		kc[i].name = kstrdup(ec->hdr.name, GFP_KERNEL);
-		if (kc[i].name = NULL)
+		if (kc[i].name = NULL) {
+			kfree(se);
 			goto err_se;
+		}
 		kc[i].private_value = (long)se;
 		kc[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 		kc[i].access = ec->hdr.access;
@@ -1442,8 +1444,10 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dbytes_create(
 			be->hdr.name, be->hdr.access);
 
 		kc[i].name = kstrdup(be->hdr.name, GFP_KERNEL);
-		if (kc[i].name = NULL)
+		if (kc[i].name = NULL) {
+			kfree(sbe);
 			goto err;
+		}
 		kc[i].private_value = (long)sbe;
 		kc[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 		kc[i].access = be->hdr.access;
