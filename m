Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A57314B6D
	for <kernel-janitors@vger.kernel.org>; Thu, 27 Nov 2025 07:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764227649; cv=none; b=f9nXG5QhjfWHowHCPY6mMw6r5VlNH3u/G2Kfp3ulC4g8euSHP/uOVxGh6b6Ofed2V3JHKstzaKPr8BHKkHMjD8aVbUnyhSWh9v9SKcYEQ2ssw0LCrPx6O/HkUXpJ+dT0sJ5QqKOgXRNfGU9t2tvKlKSSjJg3OT3LRaCwPWExkVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764227649; c=relaxed/simple;
	bh=LegWMLbCeHe5PZm0Ub4p2iXUO58hksEwiYKg1a+m090=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ns3yTgh88zjhSGVsTCbEEJP6gFvyeb9dHN77DnU7WKPozD+Jf1JiGRRndmFr8JNXXnvIXKQ4i/mey1JGiEDUQCPxK5C1RdtON46cI1oxxeM2GpenixNX6n4in6RpYP0Ard+vSZ75GrZD+qToQB0hStRmwFRPrFi2bypYx4UrQlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nQicIoEB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nQicIoEB"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477a219db05so2214145e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Nov 2025 23:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764227645; x=1764832445; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2dVF2KlYm35Amf2a5Gnk993yXcXd/prgPbjpDZiGmKM=;
        b=nQicIoEB6FreAn/bOXDbiTdCZz1KywcxZuyYTTbHKC+UJ3wSKnVZADyYxqvK0pE8Vm
         aYKq2h8JLOwZwdyiJwkK4Xi+F6dPCiLzKD7RuyoNBiLGINqQXfYEDgZ+AspDr7xgVj75
         IPLrOMYXtINLikflVBFBlIJFDyYhQxY3Cr2Fhbl1bO7cB4IFwUCFFYglCs5MvUGDCIIe
         wwVsDplbugUYE1O35l3EEwNqiG2VGo4YmkDWAzpMU0e+OCQ/afNBQSvP45n6DFJ0u0Fw
         0I68oTTeNPkBemuZs6YipWXjTHoMBEeXKHsxLr/E0pHsKA9pAUuNB7PgOOzCeDdt88CH
         ndLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764227645; x=1764832445;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dVF2KlYm35Amf2a5Gnk993yXcXd/prgPbjpDZiGmKM=;
        b=fG+O33b4Oww/an/aJf90WB42xm2Q3FozR/p0WMy0ns9glKdGLUmzssvH4N8gW0rFoM
         CBPtAedhywyZz2xyJ+R2LScvlNCUOmKng+FSJJ5aCTP8TvXK+ZJZcxD52NMJwZbYmhAb
         LLYGMtwfj+jQTiIHeViiEnrWNLRqdTtIaj1BzAEPhAiwD4v9qnm2PXa+9e3eX78h6bH1
         RWSvxuXi8lBGcqXr6Lma24IidvSdQLz49thkNUEzew2auUZONdiRwk+T5W+ADabFICU8
         PGCJ+PyFmrou1QjXUeYjA+K6Z0tlNYk2pvVgAHmrRPbbjE8zJcP5fVddNKPOooz821dX
         uQaw==
X-Forwarded-Encrypted: i=1; AJvYcCVotjRXFqPTtlsF5lYxARJ5B3YSGBAmu3mWIHIB/7jMi/U3AXbvbBvNHM7JLA3rJ19Si2/nvsiF3vd/MNmU4Xg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaCT7bDer6EEYoalbhCFQbx2CpAKXPB852RE1LRizaLpDTTVUe
	LEEWesH9cZUvj1/+ddc0Yb7S6lOwAoLKtNV8j9SQf/j0//vINRvmzrb154ucKK3FMvg=
X-Gm-Gg: ASbGncsM1ghL3iRDbfQv/Mjgdph6tEMbvvBsEFzu4tmqV5Kuu0ic9AfB5bq14rfa1qc
	LtHfNGweWDv+qamDMqC6yxeMPSys+khBimhJpiik53ZnoSWyJmGzc2hGF+DtUCxFLfDd5kunfhK
	pOuv2sA8VuClfXMTrwX7Br5wn8awSUNVshinQxDfwTUEs6ti0maSzyxOQYTCy4ApuyKiidFAdoc
	cHuWkAdLMH7cD2129saWtWRfgUVkOqt4fJyOlVpLbtHoO7ffvmrGNihwaMKKfuMERjikZKEsfs1
	AvcKfXfWVFQjT6AFZBkJYDnFBWv2BwML+hmwlIxxq8IU/oUouwosbcfV0DR16tOmFFZImOQqjSX
	HPpEeCzWrSXIRQtv0Cv1dKQ+hrIa07TM9xc7pQcP5GmhBZsm16KqlywJFPokGqZdUODvDwvv4+D
	zndfoNeGM/X4ATu4QB
X-Google-Smtp-Source: AGHT+IHh2yafLn0h6WCQ3rAqHrBsqui/zuUk1dGdvyyNWo27ENOUkyCq/IzM8raGe5NR4RM82hlgnQ==
X-Received: by 2002:a05:600c:1f94:b0:471:1765:839c with SMTP id 5b1f17b1804b1-477c1117949mr172473655e9.20.1764227645302;
        Wed, 26 Nov 2025 23:14:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479110b6da9sm17043815e9.0.2025.11.26.23.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 23:14:04 -0800 (PST)
Date: Thu, 27 Nov 2025 10:14:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] remoteproc: imx_dsp_rproc: Fix NULL vs IS_ERR() bug in
 imx_dsp_rproc_add_carveout()
Message-ID: <aSf6OerBbPcxBUVt@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_ioremap_resource_wc() function never returns NULL, it returns
error pointers.  Update the error checking to match.

Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/imx_dsp_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index be83b5f20f15..5130a35214c9 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -710,9 +710,9 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
 			return -EINVAL;
 
 		cpu_addr = devm_ioremap_resource_wc(dev, &res);
-		if (!cpu_addr) {
+		if (IS_ERR(cpu_addr)) {
 			dev_err(dev, "failed to map memory %pR\n", &res);
-			return -ENOMEM;
+			return PTR_ERR(cpu_addr);
 		}
 
 		/* Register memory region */
-- 
2.51.0

