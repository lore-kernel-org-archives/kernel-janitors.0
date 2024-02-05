Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116141CD05
	for <kernel-janitors@vger.kernel.org>; Mon,  5 Feb 2024 12:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707137077; cv=none; b=e5PObQJfxAJnE/YP3+3DZsOwbDCPYP2CzWCVUjWHnQZq6JZZkZVNLBgw7utumz6u675VCgPutOQMd6UVEs8NU7y+EtCbHV/rjchQuY5POVo6y0XHhecKrU0B8DlfRmpNEaHja44ZhNpD9nql8zLOOhxkdzxFODIXjq879okxnSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707137077; c=relaxed/simple;
	bh=2LucDbaKWnc43eYl6V2+NFUWC00In0EAYHQmGvq+4OE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EuYUstFzQhd8pNMZqm9XKwKIXIPffdp4oGMXk2blC3r8p0Ps1Sj8gQwYHjeDiTr+ja9Qx7fYf214qBghmJhtwlYDPHLCZ3zWNe14vBpp1TQbQf9yyXYaignznOTSdP24EfAQuk+e3DG0BbTO0eRGpIssBVQl4+IPqqGInbN5yuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QsFq9+aY; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QsFq9+aY"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a349ed467d9so510552466b.1
        for <kernel-janitors@vger.kernel.org>; Mon, 05 Feb 2024 04:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707137074; x=1707741874; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G4Vl82m2zEorDZ7pWMk9i0Xlp64g/8z9zNmyXXlM3Ww=;
        b=QsFq9+aYmq8eoNC+vBZJUfqY3wHp2qxaDBzJO2GTqVezsx/mYHUouoAwYbLEar77SB
         NKyIcRqzIsYBDJb8orbHAGgc2gXtD1GlkanV65kGe000pzbVOPkrWcq/oLMo1+4/DKpM
         pL6nHJN5gAhFg/R4WO2kE/wL9NYmgqYGjUA8uaK75CYmiQ0saAZpQqlz72uhf77ZBzm4
         Vi5a/OnJW6H84c6SxlWfBHhkCOoWM/57Voo0y4xABziRcyiL1rEm40/utuWildNb8mvv
         fPlUNEoM+J3XzJ90QEFp7NuTXsRlleEcE/526m8vyaMsa7CmTFPaJ+QBTkamFAv4Ua/B
         bNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707137074; x=1707741874;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G4Vl82m2zEorDZ7pWMk9i0Xlp64g/8z9zNmyXXlM3Ww=;
        b=mDvpggdBF63aaS3GxT5+suTsTxDa5wIIgNnKRpaIALzgi9/fUCMjKiNkO/GREcmMgc
         SIxuPyNsw+lzq6HRbvJdNVy5w9jJZmcbjlWmFPkDkhVzemq6VsWkf8VrXqxNZMyKHMrY
         1IXa+Y1zZ/KgXpjouHcirY5FRq7JIpZooF/G/hfvcohTaWoE5fU4WcZIaCKm58RnXFyB
         gD0ClH0Ui6DIbeNRrfom9rlvRdE2gQNVRRA1PG1hD7xm54MY0gAYepOTNPNO7N+cVSkf
         DyGqSfsmQTmqAK3jxO2HhyES+JZCSq91PAsflFMg3RWbkKpAo4XKUP6Tk3QW5xEdR4hC
         Wi1Q==
X-Gm-Message-State: AOJu0Yw/jCPJYt7Q0IA0gA5yT8Yi3HaXl1BVz/cmfNc1MPEviI9RXM0x
	Yqu1ZdGzjRGAA3irbuarbxHTKnkXxAOoiV1HgzSwnPGAkA+fWOphwIoHbLMsZ3bN/alyfObtiMO
	A
X-Google-Smtp-Source: AGHT+IFcCBosTBE78GusQ6RADTjnIHb6MB9A+FrK1+MA3FZHOcbc8Iblcq/I7+Slr1+SiFtgUSoo3g==
X-Received: by 2002:a17:906:7853:b0:a31:4e96:f40a with SMTP id p19-20020a170906785300b00a314e96f40amr7218077ejm.26.1707137074271;
        Mon, 05 Feb 2024 04:44:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW4WiNmIJTwOQBdIusFKWvbUqNu81vffJtRd1DoC8f/9LiqEWIS+V1mSm6nQfEhW2qzARfp0/POzL6npsKHd4796GaGtgSCgHsBz0U9VlZ+EXQIo/iGEct5EQS4b/XYC3ioesFeptDuF6egOuCSjybk/ot9TKooH4FYvAnK1K5nFyTCNePDxDUQlTi4OkRPT9IUM6z9teerFQfOWaZ6fVMa6NJN7RDxeS5/J6mEW8oQHi9myZFSZjVF1/XrmkCdjuNUYFhngJlFP9pLH30RQgQpM//LR7gFDCmsY2O0NuXClfBWn53ENpktlgzxg4hFCOrHzb1cSQgX0jCHn6f2FhdaMt9h9sQMr8Pql2NoAf77yWtbPNmgUU5PVO5VpEPJKXSwJuOB91nHnHgNzhVYJyP/nrS/dkPlJmOUh72rKCfPFtdJ
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id th7-20020a1709078e0700b00a3742b09617sm3102294ejc.182.2024.02.05.04.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 04:44:33 -0800 (PST)
Date: Mon, 5 Feb 2024 15:44:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: cs35l56: fix reversed if statement in
 cs35l56_dspwait_asp1tx_put()
Message-ID: <0c254c07-d1c0-4a5c-a22b-7e135cab032c@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

It looks like the "!" character was added accidentally.  The
regmap_update_bits_check() function is normally going to succeed.  This
means the rest of the function is unreachable and we don't handle the
situation where "changed" is true correctly.

Fixes: 07f7d6e7a124 ("ASoC: cs35l56: Fix for initializing ASP1 mixer registers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis and review, not tested.
---
 sound/soc/codecs/cs35l56.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index c23e29da4cfb..ebed5ab1245b 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -115,7 +115,7 @@ static int cs35l56_dspwait_asp1tx_put(struct snd_kcontrol *kcontrol,
 
 	ret = regmap_update_bits_check(cs35l56->base.regmap, addr,
 				       CS35L56_ASP_TXn_SRC_MASK, val, &changed);
-	if (!ret)
+	if (ret)
 		return ret;
 
 	if (changed)
-- 
2.43.0

