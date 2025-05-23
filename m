Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D95221DA0
	for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 16:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016421; cv=none; b=o6Ca1+Y5AfO5qAhvM91AkxpofM+Lo2ehVRGQUgYEfkUDor3IY5IfRti+FCYNYH8hLXkZbVsi4n1cwSc2w5tp1758UlB+VkVOIYTKNPaBm/r1cIo5I1eRIPK0Vqbjt8c3OtTVM/74Ub51UearCHyDjcCkMPZFC4EyjfttPOxzCeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016421; c=relaxed/simple;
	bh=WA5dqhze8NRn8+fhKp+DCFUWDEMVFNX6jxw+Hwyiv9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DqHoGWYQA//Rk6gkjXNtIPMGaKj9amfLJtR8cVJgb0ljWL/o2/+ANd5HPffxx66i0w3xBnFw6gm4JhuFrhopB1MWyxVgFPZ2FwIWIKgnnR2hIP8Lai+dtgJrhimqeWTCfCxutiY5MViDfWyqc2bOWwUuvz3s5XBfR3Ug35jgihI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZzB1YIv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZzB1YIv"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a36c2d3104so50716f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016418; x=1748621218; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVA1Wq02RwkJ8tKlxk+KwgWL1KTqqPjG9SMiOazJCzY=;
        b=yZzB1YIvtdng6TWNstVm/zzhkQlF30/ijeSBTsOSwyCFqFGCOVaihTq5ysFVckeqz1
         eCCp4Am1G6X92cHKXcpRCjf+wDlXzIP3X2KJrv6+Y0/Fvfj7AuMT+RROKVmpGTYr1Uoc
         EwLRgjERzNdw4SuxsU45LwHTvzcJ2QPXLTSXEQQwabmixLew23PxlgSNOTmKPEMefK12
         h56LlV+b5LkkZfePCgINh3hnlSunv5+JqDK2Dc/Fkj8BRl5SLJHHmQlsrXQ1Nex9AgBz
         5lZg/2U1BWygkcGAsuqLMYN9wx7LcGyO+Yu95lJ/KiZaVEOgJPBkw/VS/PICikh/Dybu
         MeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016418; x=1748621218;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qVA1Wq02RwkJ8tKlxk+KwgWL1KTqqPjG9SMiOazJCzY=;
        b=YF+RG77WK+nOr/hAf6EXL1qilrQLO0Ro0TSQ2BhqpuHXuP4hjhD72ePjo1fQgFSv+B
         z9p8GssVjcO+sRkXLixHK3IqUC7Br2smChD3xuGmTA7X1zDlh6OXAUkDwO4rW1C5eUE9
         wlDTodU1DABsoDTKbh4FMDlccHxbj8Di7imLgaJGveRPy/vaxPj4I0tSYnm5x25RPpWs
         +FZBR05w3qLp5mk6eaBVM+o79vBU2GOBG5o+A1RWc/rCv5yjYQ0SKMCQCsBDKxmltgd1
         iCLwhq0ryGPHzF3/OvsIz+vdbrPg/6dG7aNngLwzhGkOemYwkFLjLXu0eYQBvEnTspP8
         4vEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8pZgzGa7BllmrLJHHn67ybCS3H8ehrLCdFQYDNVnp9HGQSEUIQJ/H3umLDS1a9Xk07lK51VJFq1N9zbDREtI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1xPpzJ+6gZF8G5+ZJEXB//oPifmykQ2HObRxgOFmUOVprAa5a
	6pvVGCsSxSSe4NjNWw9hHpeVTpBGJmAZtBHXOiasf1J8nJ6F8m3PZWdIuEnXOEemgZA=
X-Gm-Gg: ASbGncuQ4AuyK51DHM8S1X9oEVktD7R0ZPotaBfY3Q49nTTOzkWcewBN/qIgp4Hn/Nb
	IfYhyUgV3O4ihEzBZBSuGr9HNXiQhti5SuWdYqnuuDpH4yedYyVcmrCcCgxc6x+KI3wCxDsqRNF
	cIs7J1spB3WBomwDqlu8B0ltKsNARbMbRVdWUZsyjaDmLmykJcMwlneN8UBqY82Z3G/qf/wQxMU
	6D1veHUHTiXJXWM9dmwFpWFR7qZGExXPiyG+TPXPWOqxcx+NfIrVwOkhF5rZgWZVFPe1poq4RM8
	WD8Hdp3oQOIOhwSJ/aY1YASh7ExM1w2MdjBv/Law//6SZPZxSOArrjmT86xW7fdddlA=
X-Google-Smtp-Source: AGHT+IF56UQSCz5q5QoQKyBHSndYLKMFyKvT78EcNJOHgSCsSRrkaKawUqXQh0qLd3vhveIRpS1mOQ==
X-Received: by 2002:a05:6000:2011:b0:3a3:6f1a:b8f9 with SMTP id ffacd0b85a97d-3a36f1aba52mr19442998f8f.15.1748016417661;
        Fri, 23 May 2025 09:06:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca5a8cfsm27334537f8f.37.2025.05.23.09.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:06:57 -0700 (PDT)
Date: Fri, 23 May 2025 19:06:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] dmaengine: mediatek: Re-enable IRQs in mtk_cqdma_tx_status()
Message-ID: <aDCdHh-G2ShU6uid@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code calls spin_lock_irqsave() twice but obviously we can't store
two sets of flags in the same "flags" variable.  The result is that we
never re-enable IRQs in mtk_cqdma_tx_status().

Fixes: 157ae5ffd76a ("dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/dma/mediatek/mtk-cqdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 47c8adfdc155..9f0c41ca7770 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -449,9 +449,9 @@ static enum dma_status mtk_cqdma_tx_status(struct dma_chan *c,
 		return ret;
 
 	spin_lock_irqsave(&cvc->pc->lock, flags);
-	spin_lock_irqsave(&cvc->vc.lock, flags);
+	spin_lock(&cvc->vc.lock);
 	vd = mtk_cqdma_find_active_desc(c, cookie);
-	spin_unlock_irqrestore(&cvc->vc.lock, flags);
+	spin_unlock(&cvc->vc.lock);
 	spin_unlock_irqrestore(&cvc->pc->lock, flags);
 
 	if (vd) {
-- 
2.47.2

