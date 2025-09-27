Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05D32BE041
	for <kernel-janitors@vger.kernel.org>; Sat, 27 Sep 2025 12:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758976001; cv=none; b=gXCURLKBq3ak1u8hq8BQzCR7JqkrXgS1He3CzBk6pV36sq51XzQfU7/Tlz9VIyYkLXVpsPLPUFH9ROkAcuIU+MGCmZoxAX5uAaQk4lzkcYe2BDlm37F01AFKoNZten0aQAnC2779UENxHo5Ll4lgxPL1F4fdUgXo3jZ27KGwTlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758976001; c=relaxed/simple;
	bh=rEfNw/hjnn2toGEkd2B+EFMnUNcZZBiV2AONtSPpb+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q74XzC/5NK565C0A4NsWr1FrXF/XEP4rsfVydgz1QJohH0m0tmy8s0LBJIsyslRIUVVSDQhow0MrrAhs6iG1MuUFz548wrO2GmvCBXjv5RMvFLU8P0QkI5+HDkF4YEV55NDHj+0rfyFDqRh0S7Nq2+SEhM2b4izbLzXD3ATOu9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mGu+TwSL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mGu+TwSL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso16226745e9.3
        for <kernel-janitors@vger.kernel.org>; Sat, 27 Sep 2025 05:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758975998; x=1759580798; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SBLrdqiq83IjriqT+j/rod7j6tvQbgPiriXKTGAmd18=;
        b=mGu+TwSLQzam783tObyDcH2rLIFuVGYxNVre9MwoFMsGm0AhR2pZsgD95vGQM2KNwu
         dApDvVTuvreP1qHmXeHzNJTCapqbjEStu9D5k4cBt73HU1+c8COExHZ8dbYVwMpdTEEO
         1K+ZUqFXi9XFq5pBpdkRNPqKpZSvw17B66Qn41yT9M99sUpxsb+GeTiHyE/GQ3F78TmN
         k69Hxq6JsVnpYJHfKkH7NOJaS8KWBUIQJUBfOYQG/2jA5uEQUknDUFtkN7f+t8etLAUD
         YRTm3Mc4F5nph/YwuA0bTRYs7O7tXbUV8b0kk3FuJd4x1XaEjp3Q+k/5XIrzJxfu0qoW
         smSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758975998; x=1759580798;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SBLrdqiq83IjriqT+j/rod7j6tvQbgPiriXKTGAmd18=;
        b=wcOwTST59L0/6ug7t0UHt4IwONkWZR3kgbl4BwC8XtKfQfsJmQvO1+lQ+YLew3+6+c
         wVnrZ04PZHtEnfRO+FlKIBRKJtpjRMOoa5omv+sbcgQpL+YZ0RImpkp49pa0rSJzRhz7
         XG2R2NbdrIx62mmtINsUR6rk4RWmwaKNJFMoTNZcFRLtpm3Kdg9u3c3KTy2pExKIwEYu
         2RTN4yU8aW6/k6eTRug1DgGS7EeKfNDLGhDBNdhTtmy9LMJuvZPZ9zQSx05FuUsk6v0U
         VFZ1MFcgTboCPyYQCgDstWDA9ZcGlzmhxSULoGi5VPenhYYuE9Y9H7Yusg91k2ynv/4o
         cgpw==
X-Forwarded-Encrypted: i=1; AJvYcCVFfBM+uZu7+LFZqxxwczk+ryl7ApDc5eABu1Emhw/anLiZQxe2yWfW4FYX9+BGMTCmevGTc8qbkd5KEapf1xo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxapkVmBLd9mER5+/qVj6iVsLM0LitdMzD1CAm4h4G/0ODOFkG1
	dBYOT85Z1dUSwq6Ec+ePcWi0mH5iLcbaMdWy+8gxUXWLqlYN/InuD45ucQuou3XdrTs=
X-Gm-Gg: ASbGncuaoGeohJZW8yiu97ITf5HyqWeXBi1gFoQSyWwH66l5GcTCzdSR8vjv6GEhLB2
	TbpWKu86vzV3KloGJk+TihwH7Zrsw6dhTvXKYMr9JNdNKeBhWpPi9G9seg+gdSjCfYV8HLc/gRN
	m7Dl5NUapM+z35ozksoknQtlQk1dSvke6GXYz7CI291irgDFkFmP6g2EvcXo/Bpv57jZwOI1vFP
	IC649IosBH/h+v6vz17OgU+ignI45Z9/A3FFMTpqVkHnZ54PAqnbSWh0YUIW3oLfjs692H3a2VJ
	cxzS7oNCekPABuTWFYWaD4hpP9swu5tie+KQnhz8oxJSn18FHLe4gT2NVKjbrruzrkAiAm7EChX
	lsOXuxuY9OGtsJRLt83jDsquqTVD+
X-Google-Smtp-Source: AGHT+IHAvRpOQmkSxSm6b3328/ZthZojPK7yroebvNA9zjeMtFoBw69S2yXMKcVzb6TG7S93dUplFw==
X-Received: by 2002:a05:600c:c172:b0:46e:37af:f90e with SMTP id 5b1f17b1804b1-46e37affcc8mr86360625e9.6.1758975997952;
        Sat, 27 Sep 2025 05:26:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e33b9e8aesm109617595e9.4.2025.09.27.05.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 05:26:37 -0700 (PDT)
Date: Sat, 27 Sep 2025 15:26:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] EDAC/versalnet: Fix off by one in handle_error()
Message-ID: <aNfX-qj_KpCrnCUy@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The priv->mci[] array has NUM_CONTROLLERS so this > comparison needs to
be >= to prevent an out of bounds access.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/edac/versalnet_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 7c5db8bf0595..1ded4c3f0213 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -433,7 +433,7 @@ static void handle_error(struct mc_priv  *priv, struct ecc_status *stat,
 	phys_addr_t pfn;
 	int err;
 
-	if (WARN_ON_ONCE(ctl_num > NUM_CONTROLLERS))
+	if (WARN_ON_ONCE(ctl_num >= NUM_CONTROLLERS))
 		return;
 
 	mci = priv->mci[ctl_num];
-- 
2.51.0

