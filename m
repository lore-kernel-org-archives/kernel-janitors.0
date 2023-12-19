Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8634EC132
	for <kernel-janitors@vger.kernel.org>; Tue, 19 Dec 2023 04:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="n4pVtjAF"
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id FRv4rqervb4TgFRv4rjXAp; Tue, 19 Dec 2023 05:41:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1702960888;
	bh=cUzYcHCIluQtLI47YxLbQmZaKW4i/ciHI8Ppn0igCjw=;
	h=From:To:Cc:Subject:Date;
	b=n4pVtjAFR1nQ9jwRE978HzDHV4WihO5oeBif9lN/ekFNsTqr8TUjJJptyXGUc+Qcg
	 FVoGWZfceeHRzTMI2DGnzPPlyrNNdvSfmZZkyO+hWcUnIWC5JvHv5J4UNpMgKFtKGK
	 mXA3v343MUz7R/a7sNYw96q/Q7sPinC8X/KKwQ0P6hj3bdaKyTOb2eABkReShL3vNn
	 DOOzvCwbNLcrDM6icYrm62NMNDC7/ftidCS3bG4ZGyrQtFcIukgWdfq5q5BqktlJBW
	 ucF9z0oNOozTE8D0tVCCA0CKI2zAOqbvlRDKcEno2cg8Otm/giED5GCRjldFDs/wen
	 zdgLpnhYR30Og==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 19 Dec 2023 05:41:28 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: sprd: Simplify memory allocation in sprd_platform_compr_dma_config()
Date: Tue, 19 Dec 2023 05:41:19 +0100
Message-Id: <d16f22ae0627249a9fc658927832590cd88c544e.1702960856.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'sg' is freed at the end sprd_platform_compr_dma_config() both in the
normal and in the error handling path.

There is no need to use the devm_kcalloc()/devm_kfree(), kcalloc()/kfree()
is enough.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/sprd/sprd-pcm-compress.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm-compress.c
index 6cfab8844d0f..57bd1a0728ac 100644
--- a/sound/soc/sprd/sprd-pcm-compress.c
+++ b/sound/soc/sprd/sprd-pcm-compress.c
@@ -160,7 +160,7 @@ static int sprd_platform_compr_dma_config(struct snd_soc_component *component,
 		return -ENODEV;
 	}
 
-	sgt = sg = devm_kcalloc(dev, sg_num, sizeof(*sg), GFP_KERNEL);
+	sgt = sg = kcalloc(sg_num, sizeof(*sg), GFP_KERNEL);
 	if (!sg) {
 		ret = -ENOMEM;
 		goto sg_err;
@@ -250,12 +250,12 @@ static int sprd_platform_compr_dma_config(struct snd_soc_component *component,
 		dma->desc->callback_param = cstream;
 	}
 
-	devm_kfree(dev, sg);
+	kfree(sg);
 
 	return 0;
 
 config_err:
-	devm_kfree(dev, sg);
+	kfree(sg);
 sg_err:
 	dma_release_channel(dma->chan);
 	return ret;
-- 
2.34.1

