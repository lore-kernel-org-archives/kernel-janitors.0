Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EAC46444
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Sep 2024 07:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727682699; cv=none; b=D2CWpIgZIGoRVVWQaF3XdIRriKPFLzmaFiFLDi+JL8gTNgErrp4GrJAJKxTG0Bi8FQkm5QlTZ/MvPYgfv7pcpLdvIR5ZgEvHTFmucPAZlaDVX65DGQMPIMeWaasLz0fTYsuEMU7MnkVvLOyDTPiMdnqThZErjsoEFlxVBCYSNmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727682699; c=relaxed/simple;
	bh=TNlfPXvCSXrywBW07xjSEhEu5J7xV2EvmCrnlOk0vB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uWO4h3RHy+kQgdS1VUMAIE/hVmHhIhm/KKkW/j/WBrL+j/e+r41rDdEE3s1EGTscWQ6Okc5MTu1H2gGM6wgjzzrD24S6iMd1+T2cXmxzCFSVkSA0ju9+TbMxF7i/if8qRzeeRzZ/rUbkTbzif4RMlSWRFMupf2Km4l73TK5L5bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eFmBFKnx; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eFmBFKnx"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c5bca59416so4821907a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Sep 2024 00:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727682696; x=1728287496; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0HtLOXTTjIcKqonfJsLlHp//JVeIA49rEwOK0SKZI6w=;
        b=eFmBFKnxICtKJC2VYAdq7exIs/1DDP41NTsN/129lo5VKOwP/x8ctl/0STdnuGArTP
         E1hTKB6Zmacmiu53nF/y9PcMB96adApXn+XPHyRCdmXJC/8V55QbQScXBOuTp9ELPFnh
         4xPt31tDrFxxsJn7Vprf77YLBFKUg1ZWG/sJHYX0jU7cwi5C2TkSyBy2pY7mUM9JD6CL
         +V2YRA9iBH5nOziUncLJgOUvzzjDH4auLMFGTht8oIbULt8m7TF28U+7ehOAgAxN6tIE
         sXUJ1x0/autbyOdjmxrcUxqghEouKdUYzq+L7pvuy8Nggu0C59oEAF2GfrTho5YVATB9
         lVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727682696; x=1728287496;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0HtLOXTTjIcKqonfJsLlHp//JVeIA49rEwOK0SKZI6w=;
        b=Tzp9T2XHDQN1nZdCaRtr+M65iW2zVE6t2004JoS4QX5Q9k88smgdPi5t8fyvH3WDCA
         NXSX32uXImriJV89tl/ywrwADSxMTy3+ngw4R7/tvXUIKu0h7e25vrnUF76JTjqQOCs4
         G8z6RoYripAXA4CQ+6VYyZMJr+9XGufSuQGlMpI1vskmeLRLUAcoN2H/Bd5OEueN0Umq
         rwA2ReFr/8tLw5e9js1hKyf56XzjsjSURovcOGvT+9MaEjdgIcYZM7eHH6Ab4ywRrqys
         fkZvRQrkPKjsnlH+d4Ru+vcscQSB27Ify3P8vJepicYGLiFGtEF8/KzffV1pQj8poBlp
         cKPA==
X-Forwarded-Encrypted: i=1; AJvYcCXFRlyuLPn4ERswD5gN55bNQvaFMJcX1mVlz2z2JooPQBHGbnu/4qCMpkPhgXiK/PS42P7oK1xlMOc+kWKP8+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwukE1Ut0BRD63ENI2hKl+qDHoUxgiro8pohPOtuS4v19F2+trK
	FbGfD+YQTnLGrHzVlm+MB+Yy7/bMPUF1CgpmcQXii6t42crZVvFroK+1tNT2/mU=
X-Google-Smtp-Source: AGHT+IHNGEtodHztnoGGjOwFV0dQ3UkYN7qzkRnQryDHhNT5sSIM9HlQ0MdjV9+ul5NE0K8elqMvOw==
X-Received: by 2002:a05:6402:2406:b0:5c2:112f:aa77 with SMTP id 4fb4d7f45d1cf-5c8826085ecmr9855869a12.31.1727682696042;
        Mon, 30 Sep 2024 00:51:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c882405ce6sm4127857a12.13.2024.09.30.00.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 00:51:35 -0700 (PDT)
Date: Mon, 30 Sep 2024 10:51:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sagar Dharia <sdharia@codeaurora.org>,
	Evan Green <evgreen@chromium.org>,
	Andy Gross <andy.gross@linaro.org>,
	Girish Mahadevan <girishm@codeaurora.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] soc: qcom: geni-se: fix array underflow in
 geni_se_clk_tbl_get()
Message-ID: <8cd12678-f44a-4b16-a579-c8f11175ee8c@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This loop is supposed to break if the frequency returned from
clk_round_rate() is the same as on the previous iteration.  However,
that check doesn't make sense on the first iteration through the loop.
It leads to reading before the start of these->clk_perf_tbl[] array.

Fixes: eddac5af0654 ("soc: qcom: Add GENI based QUP Wrapper driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 2e8f24d5da80..4cb959106efa 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -585,7 +585,8 @@ int geni_se_clk_tbl_get(struct geni_se *se, unsigned long **tbl)
 
 	for (i = 0; i < MAX_CLK_PERF_LEVEL; i++) {
 		freq = clk_round_rate(se->clk, freq + 1);
-		if (freq <= 0 || freq == se->clk_perf_tbl[i - 1])
+		if (freq <= 0 ||
+		    (i > 0 && freq == se->clk_perf_tbl[i - 1]))
 			break;
 		se->clk_perf_tbl[i] = freq;
 	}
-- 
2.45.2

