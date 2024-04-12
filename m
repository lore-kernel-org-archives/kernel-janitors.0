Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8461F4F5ED
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Apr 2024 08:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712910345; cv=none; b=Ed+ZCwXQD2s3RQyMXEzMkqLw5rtMDCjKE6eKcLlRHLCwJXuhU7KwORE2tti8VvvaAOJYzbuIYa+YftY9qSr2vNqmOKmIMXFCrkUg30UfXYCwNnXKHqo97Iwpr/wV/m56dRScaPBMJBm254urvuf11rzvzEiTIs+25ow0oJU7XI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712910345; c=relaxed/simple;
	bh=XlNSyD7mVXNmtkUW+UZj34vv2u6JqsZlZ8WpD7Idp+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uKAE0OSZ5uTlFEOI6FElRvvQO6MJkwdvUgLczYMfwsh9P/ATDp8AGnZeyvNmQORktK0jWWMh612+gGjVftzp3v6IJsf4743gNfGnM/8SYVAn43ieC/2sSCkr3dO9PT6Oin4rl/XJgLFhmCG+7PhavRFwfFU+nI6A25Su7dY4Nlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GHZoX7m9; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GHZoX7m9"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a51b008b3aeso70192466b.3
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Apr 2024 01:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712910342; x=1713515142; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zBk3IkdFTVmum+vYtVeAJMby59eq87hfD5TBghPTWMM=;
        b=GHZoX7m9fPR0H/px2kkA3i7foDx0yb/n831EdrbErogXZwunVRFPVcbUlIxXqGBB3c
         059a+swXHiPvYxN+BDYx+vl1aAJ/vyRVfhZAUn1IAzKJjNLOTyyDf3WLEeyu4VbRFnaJ
         o/LX5eF68ZfsPxG4yNJBSMsNcyBfo7hNqVYmQafTygAjC4YQR2smt55u3bGC8oKg7Y7U
         TEiEO+eChhCkgOJx3QD5BUjDKDIf7+63Pl94K8FP02Ad/msqXocor5/x/OovoFWwjm1H
         qQ0WJ6rLJqz39Fae+O/qm04PPpsmxQxdYQ5wjHINDVIjmksuYeY1fk1y1/y9yWlo7Ejg
         J0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712910342; x=1713515142;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBk3IkdFTVmum+vYtVeAJMby59eq87hfD5TBghPTWMM=;
        b=R9Dqseq2kojhrTl7dTU6PqL6mwdeNLGF+lSQUyg4k0iR9z+usmhUcGZokYmPVMh1gL
         GmcF0TYyKnwm5FdXNo6qPB9s6SAkH4QWW904vptpPvyKLNCMa2MuAEGcjkvqK62Kt6w4
         9Ai6Si48Rf0U8lnzNQt4MrLsAeJXu3Zia7P1tTkdsmTNcyTRWb7FpZjN7MZJ3cywK38x
         kblKUVZXtNyNJkkMHShlWlgDEZxvKTqLBP33tR+zbAk+oWcSicd6pEmIR6mVh7XkzJbi
         y+MyG/m+VpOfeCAxtYzB5cVKAItOIPtlhhQYLoETXOTN7Zta193sdnNjg+AYFnVINP8n
         0f8A==
X-Forwarded-Encrypted: i=1; AJvYcCUSHnh42CgN80tSoVPeOOOYk6SBjJb95/eY5BCommQn+k31Vun0D1kIpo8KU3lUNKncs+eGRQgi9whPnGDbxrOivc8KHkTPtXr1YjUnFiqT
X-Gm-Message-State: AOJu0Yzt/g9xF0M+ijIpCAbKQ2fPIbSKayqvo7vhz4RM8J2eI33QImX+
	1mVqfEDxGte8135m5mKSeGL0b8hJ+Qh6+JSlXaWy73bJkVNaMpHD0jN4taBmOzTh4PQFdiFD+8g
	s
X-Google-Smtp-Source: AGHT+IE00wDPrRr8eIax00TpINor2PbGdsjSZ8kU77JYzzDd3jq7whb6zK+VFuCJsGHEYumc624Pkw==
X-Received: by 2002:a17:906:4f06:b0:a51:e351:9ad4 with SMTP id t6-20020a1709064f0600b00a51e3519ad4mr1518672eju.9.1712910341629;
        Fri, 12 Apr 2024 01:25:41 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id go36-20020a1709070da400b00a51fea47897sm1546872ejc.214.2024.04.12.01.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 01:25:41 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:25:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] bus: stm32_firewall: fix off by one in
 stm32_firewall_get_firewall()
Message-ID: <17dce071-21ef-49f5-be45-f93bbf3642ec@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "nb_firewall" variable is the number of elements in the firewall[]
array, which is allocated in stm32_firewall_populate_bus().  So change
this > comparison to >= to prevent an out of bound access.

Fixes: 5c9668cfc6d7 ("firewall: introduce stm32_firewall framework")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/bus/stm32_firewall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index decb79449047..2fc9761dadec 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -53,7 +53,7 @@ int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *f
 			return err;
 		}
 
-		if (j > nb_firewall) {
+		if (j >= nb_firewall) {
 			pr_err("Too many firewall controllers");
 			of_node_put(provider);
 			return -EINVAL;
-- 
2.43.0

