From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 26 Apr 2017 13:04:11 +0000
Subject: [PATCH 1/3] ASoC: simple-card: Use devm_kcalloc() in asoc_simple_card_parse_aux_devs()
Message-Id: <8c8c6979-0368-9ef5-2e10-57199f0bc03e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8b5e37d1-17c5-4551-801f-ca7939d5efd7@users.sourceforge.net>
In-Reply-To: <8b5e37d1-17c5-4551-801f-ca7939d5efd7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 26 Apr 2017 14:21:51 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "devm_kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/generic/simple-card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 2c9dedab5184..b59d51374b89 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -334,8 +334,8 @@ static int asoc_simple_card_parse_aux_devs(struct device_node *node,
 	if (n <= 0)
 		return -EINVAL;
 
-	card->aux_dev = devm_kzalloc(dev,
-			n * sizeof(*card->aux_dev), GFP_KERNEL);
+	card->aux_dev = devm_kcalloc(dev, n, sizeof(*card->aux_dev),
+				     GFP_KERNEL);
 	if (!card->aux_dev)
 		return -ENOMEM;
 
-- 
2.12.2

