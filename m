Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504302673A5
	for <kernel-janitors@vger.kernel.org>; Mon, 24 Nov 2025 07:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763970969; cv=none; b=YQuOKm4khi5d2ztAonJyeoqB6YmJ+aO8rmVgflrCeYvuetyxnRK+xJnPozqNQxp3gvwjFDC1G24yT+EHqdlF9SKc3JKls13ZDbg+n2brF5KVZCPJzSZMWMB/QDOye5tBa/0Fj1UWJoBHsGPt45uHORYHi8PHCqmUFwPo7DoC3Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763970969; c=relaxed/simple;
	bh=BAKV6mRJkamAvDuhdXunfVVuTbGwv1bU3qmP8zeCm1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ti3pm5oEG/GU9oyBH5QmndfL1tyhgBAIxCQRBtl4r08t+1Ec/UFYYI0kTll09RZKIj1Dt2uT0GwswwezTRef4x8bmiDiesUzf7FgU5bW6AGBS2xqs5eruyVgsVsqgSBNqDhm8UwHKmpZdDc/mcg+8BkROf6sgo2/V2uagSEDwRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wR7nhKof; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wR7nhKof"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso23783845e9.1
        for <kernel-janitors@vger.kernel.org>; Sun, 23 Nov 2025 23:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763970966; x=1764575766; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jevOMx3oLEe1om5TMl1VbYUf8BPerVwJX0XKtmooeDg=;
        b=wR7nhKofia0h77DUmvKWBTI+xq/DPk1OKIyVcWAfZ4Aeil0ORm91MdT5w7XWAFUZeR
         S8Ha7Vv/TLGpz3iL62AcGxIAvcUnxYLNwIJdWUPwgNls2HqhyNCcRxZYkASQUi1u2PQj
         QeQpPGxoal7Hy+BozvdfYwj9fNlhySqiSWFIng4vgsIPtzanwVSPrUkAgLfd1uJH6j05
         WLyBTm+DcLJb2VhxaN085cUh3ITH3SJflRE+HUh1b0D35v1BIwY8MAwI7gJ5BUylg8jN
         HZPbtxh2BmQTsANg7YGH6WgKwyhK7xBhlLJgGsrGpnul0u7qQXAmeWM8yAAntuB+hAoR
         cjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763970966; x=1764575766;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jevOMx3oLEe1om5TMl1VbYUf8BPerVwJX0XKtmooeDg=;
        b=lLAL5lGBXmMw5IpGELd/O9nJI04SC8pVUzn1g1CN3b2Lqydo4a37MlYKVsI+D4yoou
         FlNWVrjRFmj/82H7Nbj1xHknbw5EqbKNRQwVe9vdaal0gZEaDTgBbJIUfwVdUCNiq/Mx
         Upo+JiuyncgGYBnLO1/N3PGFbTcyop+BqMNy1q0lEwpNMBQ71EpFSxKl60IhnHjN/9Yb
         aq5So5Wx61Z5h4VsVPmvGxjj/rqeiJoiWgU787c+vaVsO5hg91aEVxpzDFOPfYWedIXn
         xPcQQVaw9i4qjGf6xfkZi0HlulYuYkgJSFGEO+zkTt3uqCw54aGxRdOU3drH1bSJYSSW
         EFyw==
X-Forwarded-Encrypted: i=1; AJvYcCUdRDftyDpb1mcyq4Cl1mXRnajzSmobAM/G/X25fegJVfh86uQ0ZwVjwMSV5GJhYw9D3CecwdsR3f/JJQQTXUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBrdfwRHg5MiT5EoZ3427JJ42+N9hat2faNvCsrhs3beFqi9jm
	yM4qQ9iq7t/ZqNC3IG+x0yS93tspkMryzE79jba/JF6CqcYVRvw0KR80pWEPFKmfRzP/4pVXNu2
	myg2S
X-Gm-Gg: ASbGncshIaCiw1v28v4xJRLIrgLi2joPCxbckHobrpft7QXlV3H75TUX3iJTLo/VQ87
	uDxLJ+zzFEX5p+rK9psOuqQ0cSEEmT42kezh/D2AY3+69hoH/WnwYX5h0+fgIuJU2vWwftcRpaO
	Huofi7V3N9ILL2k/j41FTn0JCrQ8N/50STKbQ1kOu7hQxaSYSO2CqrYfgUYZSj+ppk31vagV0Ki
	tpacoD2pL/x07G3LuALvDMBrlv45I7oF+sC4x0YRs3SaZV5tbieBNoSk7OpIUK9vkNIhLYAEQPp
	/3LUEDB/38n0UZFlwI6cRlYfReHD7CcDcaxTruEfFuKsQ4pJDhcb28cCyXazc7icQoIuMuQNit7
	+chMpkG4+g1M9AogXEFu23ZTsG9Je2FcGyk5I4l5b700E1O3DMWd7yfPMBonXMoGxe6z53p87tD
	pNJbcJJ86dhZ09TXxr
X-Google-Smtp-Source: AGHT+IGauUJhBlDbnXjFSxEh+PpKEMlvDKN50dHKR7OGhLF8ypS/QohDNva+MjmJzH5ntpRg3haGng==
X-Received: by 2002:a05:600c:1caa:b0:477:8b77:155f with SMTP id 5b1f17b1804b1-477c10d4935mr107988885e9.8.1763970965580;
        Sun, 23 Nov 2025 23:56:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477bf1df334sm179780935e9.3.2025.11.23.23.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 23:56:05 -0800 (PST)
Date: Mon, 24 Nov 2025 10:56:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Cc: Mark Brown <broonie@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next v2] spi: Fix potential uninitialized variable in probe()
Message-ID: <aSQPkfkiJ0w-FJMW@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If the device tree is messed up, then potentially the "protocol" string
could potentially be uninitialized.  The property is supposed to default
to "motorola" so if the of_property_read_string() function returns
-EINVAL then default to "motorola".

Fixes: 059f545832be ("spi: add support for microchip "soft" spi controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Add an error message on failure.
    Default to "motorola".

 drivers/spi/spi-microchip-core-spi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-microchip-core-spi.c b/drivers/spi/spi-microchip-core-spi.c
index b8738190cdcb..16e0885474a0 100644
--- a/drivers/spi/spi-microchip-core-spi.c
+++ b/drivers/spi/spi-microchip-core-spi.c
@@ -295,10 +295,10 @@ static int mchp_corespi_transfer_one(struct spi_controller *host,
 
 static int mchp_corespi_probe(struct platform_device *pdev)
 {
+	const char *protocol = "motorola";
 	struct spi_controller *host;
 	struct mchp_corespi *spi;
 	struct resource *res;
-	const char *protocol;
 	u32 num_cs, mode, frame_size;
 	bool assert_ssel;
 	int ret = 0;
@@ -320,6 +320,8 @@ static int mchp_corespi_probe(struct platform_device *pdev)
 	 */
 	ret = of_property_read_string(pdev->dev.of_node, "microchip,protocol-configuration",
 				      &protocol);
+	if (ret && ret != -EINVAL)
+		return dev_err_probe(&pdev->dev, ret, "Error reading protocol-configuration\n");
 	if (strcmp(protocol, "motorola") != 0)
 		return dev_err_probe(&pdev->dev, -EINVAL,
 				     "CoreSPI: protocol '%s' not supported by this driver\n",
-- 
2.51.0

