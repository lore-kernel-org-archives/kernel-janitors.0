Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D610B405FF
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Apr 2024 12:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712923631; cv=none; b=VHKvCxAFUAMPuJzhcpheLS5BBlGgTAh+yXKoxva5FkGOMQywv5zMqHFQ3teAe39lZZFDgRlInZBA9nFvM9nT3AcnVuqin1sCM5wfJFptB/DCKFqfekRVFOxnzZnx0grzMuYpyr+eYYxZCod53FwsprwGpuvNAcsMfH391+q6vcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712923631; c=relaxed/simple;
	bh=IOTdpDcLctt+VkvAio8Kum20MmwxSQ0d9vkjIzuih3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yxssr0vCzO0CjBWAqVCOEnaC1bz70fivKfLouT/UEpwiiqBGVfidBD6Pq8J1ULvamBeBRuU2WngrJAktsW7PY/2462qejqZnciCg3x4H5O3yFe7oMIuY8G5O+QYdVhVhAcuHs5owVvq2lwSd0NFuxq4XpccHgc3xwiw13c08Pmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ppOi1gtU; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ppOi1gtU"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a51ddc783e3so101128066b.0
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Apr 2024 05:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712923627; x=1713528427; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q1D1D/76pZL8xkvO+Zl4MfJEXAKiV0qu65MW+cm5Jkw=;
        b=ppOi1gtUNTEP5zeDjfsFHKDccsLa0qh7gLcgqIRqBix5Tdr4RsHfUlh0HAhYVn3C0E
         PnQUu7Z+TWWdsoabmzYuKSIsZCFfYEOrKgsFCGB4AOhQ16Ixo06FfFPxs/yuivcMDKZG
         plTSHppuPXwH5X6AxWsHyKDJbonWAvFtwJh2td9hDhEvuAJSAOIhhpKVZOx8OkqYTBlK
         lGMBrP2U39ws+aTb6xrHjAKmc105obVWYLtgx/D044CJNFpoNNuoWJZ/GahtKWxHJpFS
         35Wkws0JM36W7nG5UGtxO+WZTjSLtRWeBhmk1TDB74vLE8UjNrpa+/fBEHSQ61pPgo11
         piDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712923627; x=1713528427;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1D1D/76pZL8xkvO+Zl4MfJEXAKiV0qu65MW+cm5Jkw=;
        b=HxCccohEICdRPtryGDSc2RE0JVqBsELKPQextcXq/IxKrl9vJFJydv+F1ofqrRyhu8
         KkK8wlTwLcJshOXVrPCTwebPWnkfkV2xNaAHAQL1PiMDt26KUtGShEOlQbwfPvidCmv1
         /MZB/xPJMQ6RLEnP4HvsuuHdZdTpXFgleM80tOHYSbBBjOmBLAgTXLdE3CFivsyiwCcN
         nLUN3gL9X99nm+zDm2XTLs8Y4PPzwNnklBM5E+48fzW7ye8mr+mxvnznD+xHg/X/tiXZ
         ar1NAH7VLOKd+KJ543PR9LKlMFeqMKTd0UjHhY4Ngo5xI2Hzkn2XJHA7dNmpELE08w4g
         IHmw==
X-Forwarded-Encrypted: i=1; AJvYcCVy6AS0dGgw7kAeZ4DDsocUyNFwn98ObhZU/Ux74LTOxGeMfLrU4RDCftgqx2HxnkDjBAQfJkugAZzKsEzDgbe3c1HbewWZA0r05kMyDGoC
X-Gm-Message-State: AOJu0YzrzWBmL+0XO7uA7C+NzMDhWbPnD2+1+MJt3TslQCLBa67TXQHU
	tcmGiESuChmUj32aU/SXOYw70yHG9j2JpMWPLsfpHKwLhp+sw6ZGpxqvB4K5naA=
X-Google-Smtp-Source: AGHT+IHKWyLR01XM1uFwPEideIK/tNLMPLuxBY8bNXm6QEtfX+uaCUFJa38WK6GZtUqEJE6nT4Opaw==
X-Received: by 2002:a17:907:da3:b0:a51:db9a:47ca with SMTP id go35-20020a1709070da300b00a51db9a47camr1816051ejc.28.1712923626736;
        Fri, 12 Apr 2024 05:07:06 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id pj24-20020a170906d79800b00a46a3ad035esm1756964ejb.179.2024.04.12.05.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 05:07:06 -0700 (PDT)
Date: Fri, 12 Apr 2024 15:07:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v3] ASoC: soc-card: soc-card-test: Fix some error handling in
 init()
Message-ID: <450dd21a-b24b-48ba-9aa4-c02e4617852f@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There are two issues here:
1) The get_device() needs a matching put_device() on error paths.
2) The "if (!ret)" was supposed to be "if (ret)".

I re-arranged the code a bit to do the allocation before the
get_device().

Fixes: ef7784e41db7 ("ASoC: soc-card: Add KUnit test case for snd_soc_card_get_kcontrol")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: add a put_device()
v3: move the kunit_kzalloc() to avoid a second put_device().  Btw,
    kunit_kzalloc() is cleaned up automatically.

 sound/soc/soc-card-test.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-card-test.c b/sound/soc/soc-card-test.c
index 075c52fe82e5..e4a4b101d743 100644
--- a/sound/soc/soc-card-test.c
+++ b/sound/soc/soc-card-test.c
@@ -134,22 +134,24 @@ static int soc_card_test_case_init(struct kunit *test)
 
 	test->priv = priv;
 
+	priv->card = kunit_kzalloc(test, sizeof(*priv->card), GFP_KERNEL);
+	if (!priv->card)
+		return -ENOMEM;
+
 	priv->card_dev = kunit_device_register(test, "sound-soc-card-test");
 	priv->card_dev = get_device(priv->card_dev);
 	if (!priv->card_dev)
 		return -ENODEV;
 
-	priv->card = kunit_kzalloc(test, sizeof(*priv->card), GFP_KERNEL);
-	if (!priv->card)
-		return -ENOMEM;
-
 	priv->card->name = "soc-card-test";
 	priv->card->dev = priv->card_dev;
 	priv->card->owner = THIS_MODULE;
 
 	ret = snd_soc_register_card(priv->card);
-	if (!ret)
+	if (ret) {
+		put_device(priv->card_dev);
 		return ret;
+	}
 
 	return 0;
 }
-- 
2.43.0

