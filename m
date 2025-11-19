Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD0D2EF65B
	for <kernel-janitors@vger.kernel.org>; Wed, 19 Nov 2025 08:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763539802; cv=none; b=JJKAu+llr5u14ANMNUPpR76GlKsyHhjLqKpD3Xm7z/5A5ZyW8GTQsSUnf72neC6AxAz5Gr7b2tw5mKepOtaDnUDSLU71bFBSGyBOQg44/91nKORwVwRk3cFvCpiG6HeYoazH/k4aeomCzp/Rd8HQwbw+fuNg8OfWmu25oJZQNcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763539802; c=relaxed/simple;
	bh=Yut0WA+8SDFNziooZRQDH571zlB6+TkPVIIMdys54mA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QKlBTmDwETk734b+t3yqGz0kC2eUkQEZfdQm3DcmD+MmoDr7JW9vzUSmid+Tr5G5wHVfKBhuxMHgqlrCao/pZF6qkcWGjs98BXl40TFeJyyM4RB9MMsj1CVRuudhUQrWq3Gql7izdMBr4r1/jrKd1n0eAeVNWG+K5BYXpa5cS2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qwie+VBY; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qwie+VBY"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-429c82bf86bso3761950f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Nov 2025 00:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763539798; x=1764144598; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FiIFVMX2MR+XXmvXnG9d1/8nmYiayzPl3ENasC1cOTY=;
        b=qwie+VBYVnit58cr33wDwSb0UtHxPpvJua6ZfibbsqhWxHley4kl++LlnXRnzXmHAW
         SScx65XfAydUfNQAGf+R1oH851gLQx88h/qyRRaKtKl42P2OOphSkuKTgH8kxoGCrSpo
         C0taVxK9D22K1WYTyBpe/affBidYcBzWP0KXLX7vfq/v++lBBpkuz0JVpCgWCxTC5sxs
         QRKNagCXUWBcUKZDnr1jbYFCwdm0W9rmMiKFYWFu+693iLYehmw+vtN/7hdqntAPn+h8
         QOT7QKfY7QY2N0H/Srp+vUOMW02PyFeq23KKYrsxdTLle8XGQSVuuHz7RSgWf6dxQWJ7
         Wtig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763539798; x=1764144598;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiIFVMX2MR+XXmvXnG9d1/8nmYiayzPl3ENasC1cOTY=;
        b=iqK5Y5OX7YVTDeblbqxnAmIMacfhNE3dQ7A1iz6UVY5mfswMeSE/4pOPqXFDUyptyj
         sBK1SSwwapKTKe9FRvGMaEhDBXtBgsjqLdLIM//Oe8y4sFk2sdUFB6KAcxS+PM4QbozW
         btdHD11egwShmpT6RQwgx+rJL0ZtyugNbIiC9AjeBpKoXCZBQ+Sc7AqyTBDlZdIba750
         2LKKw626Rowte9QS36gF+2Q3PJ31NEXToAbVnUZqOceDtZkt2LhkXLnvKWwpTg7g6B12
         F4M19YRAYx4li5k+ncoRawV87uAlIPcPW+DLEuvjH79g6ESpnAQIESf2/As5qkW1l8GQ
         H4Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUP38tkWQxQ9/RDiSD8ut7vwDqd9Ab9vFGKYuV5G+rTL9DSJ61Cwj/9QJ2nXF5VTpxz2DPruoDfN2+YCh10XRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdhTi2ocC94KL3KFhSCgoGi4TFRm0kcIRfsE4tw36GYxids5Fh
	AtS2I9DYviYdwMwpGFhalwKBzLwvJQO3z9ONZn3yFqYHn6wQUj0NLaUtS8B1oUQbuHU=
X-Gm-Gg: ASbGncvoS3JKvWrXACGhr4VrMvjLDBSS//4i3PKNZG0mHjbNZctgtC3UMAeMew3Pprq
	+PTV2/yrQgnrw2TA/Sjd62uuJbxZ5lYkA2WFKxpz5Jx9CdqyGr7aK2SivD89AGnIb+1uJfNQqUj
	QjUpQDa1TLqW2se1k8Uxb+hKrMaC8U7kC8yV7AzV202vcahSCftw90OWhCK0eBWCgYCyGorWSQm
	wlEJFgrCkOCMJ2PXVFBD+NZHlxFueFa6tdPnyZT4aVJS7J1urP52aQyPwNijqNosYlHd+QRKVbr
	aIulnA3U9Feowm08i+YAYFkaorxGSpm/baFVlkoTB14OiL4hKkSEh/nmGNkAy1uAaMLIugwII1w
	GRfshz08GseD9oRj6xSMQNoOY95dkIkzzy11uMrJ0fEY4crPdg5k8ebZ8pLK8SyL3vWi9I+KMQi
	8XjjlqgEhDCNeaurYaLSSBsMPP7Yo=
X-Google-Smtp-Source: AGHT+IE1q82L18y3VRPhHfEId7f170t/V5fSl9Cnt7w8NWmAat0eSm35Q1/LPz22OoVfb8I/7QAR9w==
X-Received: by 2002:a05:6000:4383:b0:42b:3c8d:1932 with SMTP id ffacd0b85a97d-42b59345301mr16798960f8f.23.1763539798470;
        Wed, 19 Nov 2025 00:09:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42b53f0b60csm35501317f8f.22.2025.11.19.00.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:09:58 -0800 (PST)
Date: Wed, 19 Nov 2025 11:09:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: rockchip: rkcif: fix off by one bugs
Message-ID: <aR17UkYsfAxCZ4fe@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Change these comparisons from > vs >= to avoid accessing one element
beyond the end of the arrays.

Fixes: 1f2353f5a1af ("media: rockchip: rkcif: add support for rk3568 vicap mipi capture")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../media/platform/rockchip/rkcif/rkcif-capture-mipi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 1b81bcc067ef..a933df682acc 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -489,8 +489,8 @@ static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
 
 	block = interface->index - RKCIF_MIPI_BASE;
 
-	if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
-	    WARN_ON_ONCE(index > RKCIF_MIPI_REGISTER_MAX))
+	if (WARN_ON_ONCE(block >= RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
+	    WARN_ON_ONCE(index >= RKCIF_MIPI_REGISTER_MAX))
 		return RKCIF_REGISTER_NOTSUPPORTED;
 
 	offset = rkcif->match_data->mipi->blocks[block].offset;
@@ -510,9 +510,9 @@ static inline unsigned int rkcif_mipi_id_get_reg(struct rkcif_stream *stream,
 	block = stream->interface->index - RKCIF_MIPI_BASE;
 	id = stream->id;
 
-	if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
-	    WARN_ON_ONCE(id > RKCIF_ID_MAX) ||
-	    WARN_ON_ONCE(index > RKCIF_MIPI_ID_REGISTER_MAX))
+	if (WARN_ON_ONCE(block >= RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
+	    WARN_ON_ONCE(id >= RKCIF_ID_MAX) ||
+	    WARN_ON_ONCE(index >= RKCIF_MIPI_ID_REGISTER_MAX))
 		return RKCIF_REGISTER_NOTSUPPORTED;
 
 	offset = rkcif->match_data->mipi->blocks[block].offset;
-- 
2.51.0

