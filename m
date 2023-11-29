Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGCDV07R"
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FB51BD4;
	Wed, 29 Nov 2023 01:10:02 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50bc7706520so240510e87.3;
        Wed, 29 Nov 2023 01:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701249001; x=1701853801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7SygEgSZBbpHZdUiWup7DXOCloS8YLNYVc8N3bxy+Lg=;
        b=KGCDV07RRBALN2JYkO8qbCai+09QwDGJgPeJshGmfsfBLs92nCB6/sA7Hg9d/Bzmzp
         A1+opuUh81toxsb4MV6HOLh5bD9Fkv//90tDy3m9emdYi8MYe+5G/2HUowemptqajtrq
         5R0I7H+aN6frahZDUbggcZg1leWc+aRbEsFQKEB12y9O5D7esrrnCtrJU6Wmo1RqK1pp
         Yxu2jhC6TbNvLwWikoWXBf56vzY33FXgIEojX0zvcQutBZH9pCdGYCk8xUiM/GMHe+8a
         SRP/dUKKWIBNtBDGMO7RvhSFYuIAYGM2YfKT4t5ilfGNvuQthg9FPO8YdGJX3b/BubUD
         sTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701249001; x=1701853801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SygEgSZBbpHZdUiWup7DXOCloS8YLNYVc8N3bxy+Lg=;
        b=RWlQuHprRGtjHIssc9oTKWzbWkFWmABUj6ddq0Q+qvuRHEjQaZbDJVgD99kmzZgA5o
         BLlLn/sBUVIQtEVs+xAgzhp1zrbNsOzweED2pGIXh8XGmoK8cWoMLPooLduQ/M5axtCS
         Z1KZ3Ysal0/M8ULnTES0HNcX6hiTr84BolmLLJ70my8e0oa0yMkSEtZrKsSKnk76KUm1
         kjIvDcglmnkM0hPDDQN8UXGvzT9V/96YjfgalmJ3gptp3XnBgirm8RyX1K8I2driPUSG
         bufeQ2L+fEx1gZvmRrmwt3TrwtYSH7T0H8U7CkcJDo5V8CmwzDtJaLRBmg3dHUVcoxKs
         mqLw==
X-Gm-Message-State: AOJu0YzN/Ua6BS5f/cA1384HHaCLxLVr+nnA0KXpyizTX2nkh2e7abOf
	qktVZlR0emeO3Fo30kWrHiE=
X-Google-Smtp-Source: AGHT+IFlHo7BDX4W4K7IsTgxCgo21fqInvpekoWD/Ui4zDyCD5ufzbHOu6adI32JTKjG8Hln1yWNYQ==
X-Received: by 2002:ac2:5922:0:b0:50b:be63:8e09 with SMTP id v2-20020ac25922000000b0050bbe638e09mr2618753lfi.57.1701249000720;
        Wed, 29 Nov 2023 01:10:00 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c4f0f00b0040b33222a39sm1456975wmq.45.2023.11.29.01.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 01:10:00 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: core: Fix a handful of spelling mistakes.
Date: Wed, 29 Nov 2023 09:09:58 +0000
Message-Id: <20231129090958.815775-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err message and several
spelling mistakes in comments. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/soc-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 4ca3319a8e19..132946f82a29 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1059,7 +1059,7 @@ static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
 	/* it should have ch_maps if connection was N:M */
 	if (dai_link->num_cpus > 1 && dai_link->num_codecs > 1 &&
 	    dai_link->num_cpus != dai_link->num_codecs && !dai_link->ch_maps) {
-		dev_err(card->dev, "need to have ch_maps when N:M connction (%s)",
+		dev_err(card->dev, "need to have ch_maps when N:M connection (%s)",
 			dai_link->name);
 		return -EINVAL;
 	}
@@ -1299,7 +1299,7 @@ static void snd_soc_runtime_get_dai_fmt(struct snd_soc_pcm_runtime *rtd)
 	 *
 	 * To avoid such issue, loop from 63 to 0 here.
 	 * Small number of SND_SOC_POSSIBLE_xxx will be Hi priority.
-	 * Basic/Default settings of each part and aboves are defined
+	 * Basic/Default settings of each part and above are defined
 	 * as Hi priority (= small number) of SND_SOC_POSSIBLE_xxx.
 	 */
 	for (i = 63; i >= 0; i--) {
@@ -1845,7 +1845,7 @@ static void append_dmi_string(struct snd_soc_card *card, const char *str)
  * @flavour: The flavour "differentiator" for the card amongst its peers.
  *
  * An Intel machine driver may be used by many different devices but are
- * difficult for userspace to differentiate, since machine drivers ususally
+ * difficult for userspace to differentiate, since machine drivers usually
  * use their own name as the card short name and leave the card long name
  * blank. To differentiate such devices and fix bugs due to lack of
  * device-specific configurations, this function allows DMI info to be used
@@ -1866,7 +1866,7 @@ static void append_dmi_string(struct snd_soc_card *card, const char *str)
  * We only keep number and alphabet characters and a few separator characters
  * in the card long name since UCM in the user space uses the card long names
  * as card configuration directory names and AudoConf cannot support special
- * charactors like SPACE.
+ * characters like SPACE.
  *
  * Returns 0 on success, otherwise a negative error code.
  */
@@ -2461,7 +2461,7 @@ EXPORT_SYMBOL_GPL(snd_soc_add_card_controls);
 
 /**
  * snd_soc_add_dai_controls - add an array of controls to a DAI.
- * Convienience function to add a list of controls.
+ * Convenience function to add a list of controls.
  *
  * @dai: DAI to add controls to
  * @controls: array of controls to add
-- 
2.39.2

