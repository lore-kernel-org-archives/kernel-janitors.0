Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0512BF3DB
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 23:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752620462; cv=none; b=lhWTSqRVjIULhRv6cEbX1Io1w89yQ9vo4ROt+3ikxhS9o9DUc7QfNEKmk/5KsgpYFK+5AKPRSEKCO8npwH0r14t4OrqykvtAI+w9Txu4XVoAvBJOSQN+ZNLF4zT9EczJzGGwOxOrnm+oyU70OjPx07xdU/RY0eDV2VMK567KtzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752620462; c=relaxed/simple;
	bh=M6ZlHU6FLX2CA9QPMHjn/+MEhADmPo6CNAXX8jHSGfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FOaws/aM8aQP6UCrMbritJ1a8H765aD+ejQynJk8b4xMzY1+By7YhNeUs1o5HFosKLwth/wOwRr8YVcMgCiGN30TKSPEPVxFs/4clh33bWtZk/YmZBBMPXG5gZUTqtlliya2LNLOO8kdfJPRz17nkLqWK/XpwwdYkjW1wyQoNt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hSxU2Ubu; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hSxU2Ubu"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-73e55e829fdso963074a34.2
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 16:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620460; x=1753225260; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HjmjRwrY70wx2CHWgUgdB7zU+MT5vMpT8bTQPJScVgc=;
        b=hSxU2Ubu52wQfGMq/dXtCFEhU2rK+OssajI/TEODBmZYw1q5ezDslKFkrsaXzH30Mh
         mGmFsQOxKlZ/B4u5RNJgSk0Sp5IqZ65MyojZqWXssuGMzfXJx7ksx+k3JHLw8Duy63XO
         4+UoKOr2jIAhWQApbRE0SIRkanK7bSs4m3tad9ISd/K5cUmY8/43hwZQwy7Vx49I/Uvm
         /DKN32a+XNl+xsT/ueUcu8Uq89UYGkJGtLwoDRXJJ7EiJoWxCZEcjZg9UOpXlfFskMAZ
         XZS93TB7WgbOyWHidqz9rnVys44AIq254J+WIY4MjDmTT/JNAjGFsXR7YsjDGUzk42rT
         cNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620460; x=1753225260;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HjmjRwrY70wx2CHWgUgdB7zU+MT5vMpT8bTQPJScVgc=;
        b=W9s+e49YDK9vShqJ8s2lo4+4tY46qqs5+4b86cEcPGA5Qp+tGY0Ymyr9tSoC4DGiR6
         uJOSATHv4C6T6WUoBUa4SG0SVKe7nlqX5FdG1udzIfTc84utTf39A6QNAxYPMkjDY83a
         frXc3Z9M2tyIPc1WwTMYcYhqThSNz/kkIigE+cm+cLRFbOU/TJVlC0Wi0P0GWbyVlcTl
         k1t6XbXQJG6ZEb/NcEP3hMfyf3SO/5V+PdbuYWZu4xZoHOmAcUYKv4GUXpwBHJevLkez
         V7vR2hofkGSkDeAijvBcDwMuFxnTa69l1bbHVirTQOBA1MlNcHm4CE7xJ+yL5Ujw7Lx2
         RBig==
X-Forwarded-Encrypted: i=1; AJvYcCXDfV/noI44joL/tfIUJo3CSNbZuZfFax56zHMTdTJcOmRxJjlNMsgG3poBlD8D9C6TXov/0d+iEETvkTWMlFc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0MMobAaYUmBEzNBQwLK1feQQWq05ropInwc1c2IVOHoZbXjlX
	m/KLqWFaoCES3K9QO6qllVoEXoR5f5Q9fgDJ1/wJ91/MRUXpRPgUw75RNf+IWPOtOao=
X-Gm-Gg: ASbGnctsnh5qMBtOq2qn45G0T9WxUEgNWbebQSkpI5VuWa2I4i4F4y4P3k1C8rDZwfI
	utD3JKwHD1cac30785alEZEZFGcmUSotiOvpfnJaEx0ABqlCV07CfI6X+wR03QF3f7lKH3PxC6H
	KaAA2KWEeCwV/NoCGSFtl2SeTSnCxHsooQfQLTQ43atF+pykjoU7+247rTJNMNywwdUhSIWmemk
	mqnAcHWlp2CVg4F+UV8I/Rf40/gc9usIBuF1Rn8QR+6P0ENYd5L8/pKKpj/Kaiey5YgLivHFG2u
	m9TAkYp5julr/4DNjpMFYS8QbGjULp0pmzQKIjXI8j8AoHcjzyMtkc8B/CJeBRX50poW691hiyr
	LPqEtxuVTgmjhEs2TzN4ahMgzRdju
X-Google-Smtp-Source: AGHT+IFzTAUh/H2WsdNWY9R0rFIJq9Rr261iK4dEmF89rYSxkR/WcE1QAJcgUum3s7/cBaN7xF2qow==
X-Received: by 2002:a05:6830:720e:b0:73c:e30d:c273 with SMTP id 46e09a7af769-73e65f2d943mr315168a34.0.1752620460253;
        Tue, 15 Jul 2025 16:01:00 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73e54ff7384sm1012741a34.35.2025.07.15.16.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 16:00:59 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:00:58 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] mmc: loongson2: Fix error code in
 loongson2_mmc_resource_request()
Message-ID: <847bf395-6d62-49c9-a39d-8e82c5b17bf7@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a cut and paste bug so we accidentally return the wrong
variable.  It should be "ret" instead of PTR_ERR(host->clk).

Fixes: 2115772014bd ("mmc: loongson2: Add Loongson-2K SD/SDIO controller driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mmc/host/loongson2-mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/loongson2-mmc.c b/drivers/mmc/host/loongson2-mmc.c
index ba6bb8fd5535..63d01d2cd978 100644
--- a/drivers/mmc/host/loongson2-mmc.c
+++ b/drivers/mmc/host/loongson2-mmc.c
@@ -887,7 +887,7 @@ static int loongson2_mmc_resource_request(struct platform_device *pdev,
 	if (host->clk) {
 		ret = devm_clk_rate_exclusive_get(dev, host->clk);
 		if (ret)
-			return PTR_ERR(host->clk);
+			return ret;
 
 		host->current_clk = clk_get_rate(host->clk);
 	} else {
-- 
2.47.2

