From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Dec 2020 06:54:09 +0000
Subject: [PATCH] ASoC: wm_adsp: remove "ctl" from list on error in wm_adsp_create_control()
Message-Id: <X9B0keV/02wrx9Xs@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, Adam Brickman <Adam.Brickman@cirrus.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>, Mark Brown <broonie@kernel.org>, Luo Meng <luomeng12@huawei.com>, James Schulman <james.schulman@cirrus.com>, Vlad Karpovich <Vlad.Karpovich@cirrus.com>

The error handling frees "ctl" but it's still on the "dsp->ctl_list"
list so that could result in a use after free.  Remove it from the list
before returning.

Fixes: 2323736dca72 ("ASoC: wm_adsp: Add basic support for rev 1 firmware file format")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/codecs/wm_adsp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index e61d00486c65..dec8716aa8ef 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1519,7 +1519,7 @@ static int wm_adsp_create_control(struct wm_adsp *dsp,
 	ctl_work = kzalloc(sizeof(*ctl_work), GFP_KERNEL);
 	if (!ctl_work) {
 		ret = -ENOMEM;
-		goto err_ctl_cache;
+		goto err_list_del;
 	}
 
 	ctl_work->dsp = dsp;
@@ -1529,7 +1529,8 @@ static int wm_adsp_create_control(struct wm_adsp *dsp,
 
 	return 0;
 
-err_ctl_cache:
+err_list_del:
+	list_del(&ctl->list);
 	kfree(ctl->cache);
 err_ctl_subname:
 	kfree(ctl->subname);
-- 
2.29.2
