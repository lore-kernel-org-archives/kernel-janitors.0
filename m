Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D2F349B0F
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 13:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732131; cv=none; b=JwfRmHYU6qSxahDu9fRIAsHxnaRIpMpbzFgwAWq1kTS8cvLEHJosuBDj9nmP4ZQICv9qhxdBkNgQPcMUKcpsCH7RqJAK/OiFnCvxBANDhJshwEmxJLVXRlq4lB2QxQHxIg5SEl9ilMc4PdZrCjwF/vF3zrpfpxarVCpnzcZbgkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732131; c=relaxed/simple;
	bh=9Pa+Fr3oSUeaGPwoTMwtX4AxVa6R4SE47D3NqA7G8H4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UA5aNQZVRJZsg5X9IFc4l0H3o4X/osaFdLTW4G4IREsBS7AnwM8uWndLAasWZ7uxwWFdbFxMQNXHZxrZxvGyee/MHsSUAF6m0hERIWESRBDypPkxxT7DexpByNHr30mIteaO/j6evkErbUbo2sV7UppTWvNz/+QLxVxAa4O8Bq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SPtuAfY3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SPtuAfY3"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477770019e4so19419245e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 05:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763732128; x=1764336928; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=66UVQQhDMBjb5zMOOPPfWwCZAscr/157KjUn6X4HOLI=;
        b=SPtuAfY3KA4yecgNsXBdm/SXoackZ3EnP+l5t9yYA9u0kUnjo8HXLo/mRt8Z108Fh3
         ZYyN2cvG/d+sn8T081tctOd+RBZFNgzPMpc9+ow5oCzXZdSBkYZIy6s59j+HwfecA/43
         Tm+hse3YErxp5qmuD9yy1PNz2PQp3Jkc1/AShEA12siReedfudsGKzQZ3k78JsBXwcQn
         euCF4L5YkkK382I3yrgqq/OoHBGkT0xqlqqBTRcQV+PMp5uEVuj0pBiekdXU3sUKh/tc
         tUX08P0EITxWawmyAaESCk4e928V1qOgKN7EWZ35B9YDsX+MFZ8HYZJyfaQeu6ezWtwh
         ZfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732128; x=1764336928;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66UVQQhDMBjb5zMOOPPfWwCZAscr/157KjUn6X4HOLI=;
        b=Vqi5PDdc3LVpgio0D6tTjL1jsc8t4fTfJpAuz7UDewNOXnCCuXjgU1YnEwlxFOAn7o
         nTuL+hx/dQZyO4mR6wGHljQ9zGKrWHI7AzOcqQJlQxRYLY17ERYFHeO22CM6i7gj+rh7
         E0Pqz4GN6fp4gL3vQZf1RSKITxofp0hAzXlcmgcgH4ael2u0ErK0pr/g7RtHJWM8GRfc
         vD19RzM4GQ9FETcqwlt0K17Xv96MmOeufTyMc5RbQ6Hncvr7/Gna6uckaE7WjGj232N6
         wYlFqdq2AAXp+q2W5HP51sg5yNypgf+7N9/0e+UBk4oRwJfri6sjSS5frSWWeuW/7zRj
         rVrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9G9XBjiQsiMaueT2gB1Lm9zraUzoKAmbnr6LU7j0LnTpAJzuljaR+MIguGP0I0k0QnTxKuM2dpKtnHNPeW6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbkPt32R5kvt1PzMHHj1xLBbbbTK+9rTyPPvWOorC8mvF9K5fm
	SvXIzeRpEV4gdsmwMDhLgn3u7qwh0DmWh3Djvs/sQaShDsaX9jSl5nWK+d4mPfIgnT4=
X-Gm-Gg: ASbGnct9BuD0TTTmROShEExdoXyGU/xSS1zf/vPi39VDIUeDnjzYeniBx/Q+NVRsbyg
	bqvRC48LV3SXBe2H3cEuFAdRV+U+WylDhRLHBPn2g9ZtDTuYHyJhMfjnNjrxC227orn936lwVQQ
	efBFDE/7as6FjZpqmTT572Wmh5Qq3/UKAVvUSpldQD6NyUt4NA/9KXYm0E+u6CZYuR7U21pP3vN
	nyDh6lF/BSz757pVsw+2RONTARZpyWxrYj4+qKrW5r1vIwilgn2ZfqnBD8DeVRIpXUykWBA8vh/
	CrkyqwEYu+xaqYVylferHxSukjUadLx0YX/GU8dwyhfHs5ohpAwGvkYWM/5oZOjPQLrgJf3G/Sb
	qk6c+FwOduIjCXSupTl/9c1d/b4Tz/wmSmJq3CiaxGyoo42Fce25RHAcyOTNPpDnKtKzL/Vn+XA
	MHn8IkjfRA4CB6znBV
X-Google-Smtp-Source: AGHT+IFIZiyU8NOGm8Lhz2hEpHlsg5AKbwlmTXjbe/S9sO2GGcTDuOeFmLCnVtntzCSaqXZC5DBmlg==
X-Received: by 2002:a05:600c:a08:b0:477:54cd:2030 with SMTP id 5b1f17b1804b1-477c01be3f6mr20684095e9.21.1763732128342;
        Fri, 21 Nov 2025 05:35:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477a9dbec2bsm87292025e9.5.2025.11.21.05.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:35:27 -0800 (PST)
Date: Fri, 21 Nov 2025 16:35:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] regulator: pca9450: Fix error code in probe()
Message-ID: <aSBqnPoBrsNB1Ale@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return "PTR_ERR(pca9450->sd_vsel_gpio)" instead of "ret".  The "ret"
variable is success at this point.

Fixes: 3ce6f4f943dd ("regulator: pca9450: Fix control register for LDO5")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/regulator/pca9450-regulator.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index 93154c9c98dd..32780c311ccd 100644
--- a/drivers/regulator/pca9450-regulator.c
+++ b/drivers/regulator/pca9450-regulator.c
@@ -1401,10 +1401,9 @@ static int pca9450_i2c_probe(struct i2c_client *i2c)
 	 * to this signal (if SION bit is set in IOMUX).
 	 */
 	pca9450->sd_vsel_gpio = gpiod_get_optional(&ldo5->dev, "sd-vsel", GPIOD_IN);
-	if (IS_ERR(pca9450->sd_vsel_gpio)) {
-		dev_err(&i2c->dev, "Failed to get SD_VSEL GPIO\n");
-		return ret;
-	}
+	if (IS_ERR(pca9450->sd_vsel_gpio))
+		return dev_err_probe(&i2c->dev, PTR_ERR(pca9450->sd_vsel_gpio),
+				     "Failed to get SD_VSEL GPIO\n");
 
 	pca9450->sd_vsel_fixed_low =
 		of_property_read_bool(ldo5->dev.of_node, "nxp,sd-vsel-fixed-low");
-- 
2.51.0

