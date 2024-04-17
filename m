Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D5CF516
	for <kernel-janitors@vger.kernel.org>; Wed, 17 Apr 2024 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713347561; cv=none; b=dBEOEv1IuRlRzBqgn1DsYv7NTXaxcc1o7OO+jYk1cSGvg6NDbOW5SIGkYigzXx/Fmr40NX1N1za4Me2apSLpIWEtve7tiQahZEKEA82hoSOjP/iCNO+KQHdEhoe2RTocfp06RoT0GT5X+UzVH/I/0FD4GGMbFSF8n/tF7n4tCqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713347561; c=relaxed/simple;
	bh=EMzVQWGtX/eIzEA/zdNuq2XVLHcIfNLVAyy5jrhNRxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B1uvQei+sOPYDQ1m4dpCOSYrGVvFaW8KtCjuH4IC0WyXjtKBtqYpXjBT5UaeQQFb00JzC2b3mzqZlnoz2tpBiMEYbRZHoeY/4XRN44MHn6Rs3VSkSejRw7x8NeuwSGBuzGdUu4tKOlIYczsUZgiFGnOKYZLjr7QrKJQ2O1F0ssw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OBZDvi9O; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OBZDvi9O"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56e47843cc7so5430287a12.0
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Apr 2024 02:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713347559; x=1713952359; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aS8oohQSnWtm5/ggCUPuCf5r4nvKB3/gwwUVKLME+0Q=;
        b=OBZDvi9OfrkcfWIYDyLBAcDRvZ/R9VbnEdxDLBZIyraRG+Iw0ccNXKQYc4u6ycJb2R
         6MgwIf2d4HLzZlz8dEL7hRrfLgcZ5sXRPtLxNCT4ScAMsYIGdLMKUwVdukkzxUi1tgFF
         0017szbW7mcJkH55SgwUT4375an/VtVsm/bVwuPpqpaambn9OCyQN9PgPTk5aysw3ryU
         xmDyKrflI8Un6xxHMWdPcxGqQx6sqAP0u4ocQcdfQfQF747UyMv9HCrQFZp//sPp4VtZ
         bHjs5m5EoRo8KPBH1OSu532PvFOqLjo4sVgReocKh8KW8IRs6zE9LC/RBbVgQr1+z0Xh
         N71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713347559; x=1713952359;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aS8oohQSnWtm5/ggCUPuCf5r4nvKB3/gwwUVKLME+0Q=;
        b=BrG1zu1VvjU+Ct+0mk9U8f8tUHIQFgc8vMZwmXTlt5by47nsgohutX09wCONU9xlz3
         p5qgShDqgviVAaitgwjrILbUybv6UXZMv96cit/kZjkeuGgTVXdZ7NfwsLoQoSKUyMv/
         YAP6p85+/q4/E1Chhot8hGhaidD/NNjRo6ySKV9ZMeeL60yK4W0skQOcu+HcGRlPvDye
         BmZW+5d6Cp3OczYIe8fvH2oWfD8TC6MdYIJ0z5C9bu4AWpXEAaPQSsOwl8qpsO8XKU3E
         bZQs30sjZ743Xf+Z+Pe/Mz9pVGZB5u6osj7rt/FMrkwYbREh84whZtyRe6q1tvvG6vsA
         R33A==
X-Forwarded-Encrypted: i=1; AJvYcCW393hKk7lc5gaSXw750k0syRSvqTlXWpq/W56dMGfDietXl3wIQT5JTohNlVrOp4GRfmKAKTCX9nMg8RyV2hpy+jx/hsxXfV84GytvjAp4
X-Gm-Message-State: AOJu0Yy15ps3iAwlL/ORG9vL2rJFbVG+oJ48HSqd2WmbZGlXWagJ4KZg
	Ca6i0O5OUupZYTfqXeE8ReEqyQM+a0NfA6TZWoB2xMhmC0Oa/EBuTm/i6HCzNwc=
X-Google-Smtp-Source: AGHT+IHjbEE1PXIxusfNci6KoXg1ftVPH3rWidgWbOaaR9occvuaSUnnQtaaZswO2dIcUCmYmpgEHg==
X-Received: by 2002:a50:9b1e:0:b0:568:bfcd:e895 with SMTP id o30-20020a509b1e000000b00568bfcde895mr10176685edi.41.1713347558535;
        Wed, 17 Apr 2024 02:52:38 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id j1-20020aa7de81000000b0056e62321eedsm7001133edv.17.2024.04.17.02.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 02:52:38 -0700 (PDT)
Date: Wed, 17 Apr 2024 12:52:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Rhodes <drhodes@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: cs35l41: Delete unnecessary condition in
 cs35l41_pcm_hw_params()
Message-ID: <1ee32bfb-6f6c-4b61-887b-6f655abbfc47@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code returns -EINVAL if "i" is out of bounds a few lines earlier.
Delete this unnecessary check and pull the code in a tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/cs35l41.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 2799ccd6b5c7..d3da6a9f7f2b 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -772,10 +772,9 @@ static int cs35l41_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	asp_wl = params_width(params);
 
-	if (i < ARRAY_SIZE(cs35l41_fs_rates))
-		regmap_update_bits(cs35l41->regmap, CS35L41_GLOBAL_CLK_CTRL,
-				   CS35L41_GLOBAL_FS_MASK,
-				   cs35l41_fs_rates[i].fs_cfg << CS35L41_GLOBAL_FS_SHIFT);
+	regmap_update_bits(cs35l41->regmap, CS35L41_GLOBAL_CLK_CTRL,
+			   CS35L41_GLOBAL_FS_MASK,
+			   cs35l41_fs_rates[i].fs_cfg << CS35L41_GLOBAL_FS_SHIFT);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
-- 
2.43.0

