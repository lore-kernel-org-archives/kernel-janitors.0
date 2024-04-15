Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B822C101F2
	for <kernel-janitors@vger.kernel.org>; Mon, 15 Apr 2024 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713177284; cv=none; b=I8sgNDn4j+kOH/PyWzmVXFYsTPMCQVsdEUaUGDJfqTLrq06Dv8GN9HaRCIXatWG1kC4ISHKKI7qVoTCcIm0rpl6sLRUlv/dcngVMpZq9ptEEneMVEzT79Lc95R4TUO1NzEK553IbPySILm+Qc7AKPlGlotho2hnFa4k70ZwepBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713177284; c=relaxed/simple;
	bh=r+M9Bk+4YRd+zQ8ivjTlZYC6qhnETV86VeSJFPKxcBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UPzJRnELsU4qMvxnCYxwojZB6ffGqfivTIC+7Enmz92mtqXJzrqtxxL1avqryjtSF6evSs3gEX9exBDUeMI1cCcK0zBhxS9itODc5KUsk0APJAvp6unM7nDcMiYigjGiD9WsqW27yN9Ep+JISChW2syHWSx9zW1ky5Dphdg9Byg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hToGEX5H; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hToGEX5H"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so6617487a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Apr 2024 03:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713177280; x=1713782080; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ixcHPOvFOOXtJqtF3vNA0iGHZzONIeZBn6zmJrMcgH0=;
        b=hToGEX5HZtif/uUshqXAbmdUpUFNAUC+U+6Lw1EdLTFUHzI/diKb9dtiBV/ne/xXIx
         sMqTt9fOF0dt8qcsbXvnXkWQlxNP4rFvtLeYdF+xd/4Sg+qghCmn8i1yvBuQiyRsSjOI
         Qss46CFjAPpTF1ZH20qAhqK7c5gzMWewG6Jf8BAYN/pIEU0oZhqbWixyIgNgqzt60vrc
         p4Qjqwz05uojIdOamJ8mizixKj14RXwXY1LQh0XKcH4AlceicjfePESiIDBOZOgePjst
         +6LyC7BwNWkinc8pOtadnsK3EMye+vnWGIm8TShAmB4xnNfl+VggJNhjF70PKUlts5LN
         UT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713177280; x=1713782080;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ixcHPOvFOOXtJqtF3vNA0iGHZzONIeZBn6zmJrMcgH0=;
        b=sPQHR1i7oK05cvvpYbshujqR1OuphsMl36zVCSjpu5wxerdtaLcuYqUbVIczNNgMLh
         4l8hVYMBIMIB+QGjUbRyxK9WE4m6KkhuEXdGYzV3T1qvBhw3iAzt2jEgRCrZhbdS/RGd
         ocn3H4f1/2wjCaCydBPpUCNJtyNpON+erCVIy7U+i4CAhgf6a7m0qlWtx4QHZfBKuNZ5
         jq4dpdOl+KCjGUSI7vcK1hG2ZO8JzfLJpH2CSQLKqqTCjn4CyUshCG+VchhJ+y3eoNIA
         p8T6SvhCtdhe1N44Yfva/yn7PGhSh9Y3diQpSKkXw7TBgZKK8xXN0/HoixdNvgQzY4h0
         4iaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwnw5O0VFyLxpKVJObv4qmMSDOFJJ2qBhVuynmMail5L20Sg/1oVU18uEAC7t1RkOnF4vHVqXP0t1sDplfdEOQHhhkZD3NuLnOeKR73dCO
X-Gm-Message-State: AOJu0YzoEm7olFC+qT6A34hueLjsY7P9l7u29do1KP3iR1Fp2tro2LHr
	n6xmJCTYGjiYRbZe3l5geKJlk6B6wBJhr8oAK3EKjQfT3Bh4nl7DgumAoxS1jNo=
X-Google-Smtp-Source: AGHT+IE8taSRi7cZZenb22Hrhoo4IcK5IkZ6zpDWyZ3iR0Lu0U9yZ+r/3VZ74qZxKOLyEcvqXb+uAA==
X-Received: by 2002:a17:907:bb82:b0:a52:2a65:cf2 with SMTP id xo2-20020a170907bb8200b00a522a650cf2mr7787401ejc.13.1713177279707;
        Mon, 15 Apr 2024 03:34:39 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id v13-20020a17090606cd00b00a526562de1fsm1589133ejb.73.2024.04.15.03.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 03:34:39 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:34:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: cs35l41: Fix error code in cs35l41_dsp_init()
Message-ID: <a50d27fd-716e-4fb0-8519-8798e3c79543@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Set the error code on this error path.  Don't return success.

Fixes: eefb831d2e4d ("ASoC: cs35l41: Update DSP1RX5/6 Sources for DSP config")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/cs35l41.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index f8e57a2fc3e3..2799ccd6b5c7 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1126,6 +1126,7 @@ static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
 	default:
 		dev_err(cs35l41->dev, "wm_halo_init failed - Invalid Boost Type: %d\n",
 			cs35l41->hw_cfg.bst_type);
+		ret = -EINVAL;
 		goto err_dsp;
 	}
 
-- 
2.43.0

