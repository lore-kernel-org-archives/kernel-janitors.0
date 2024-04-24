Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C06A1E480
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 11:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713958973; cv=none; b=nhoZsfDYdebBySH6MZb6cY4CU9QIa+jCYhW+sORX5Rxl/RIfK25XS94dL0pgsw1bCNSUzEm28ATGnTSngTVWV4kHyF8Yrajnw5aQzkgkeJDQ3gTtx1aernJBxlWxuVK2FRVm6aN5vyAefb0611F4+1z1PggCBq83q4qESfsJ0Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713958973; c=relaxed/simple;
	bh=LjqvDUtZmVAzGUJviYvub5dECgtHavs/7iS97QqYmoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bImhTGGiOzwpdBqaP3ZQI+kFTsVDaaH+sO20KNY/03gSV6PN6GFpZQ8FAjJ9YKaWRoZjJJRSbBsnZ/luaHuCcYhNneK1To6qAhcTkEcgNLbFnNrCxtC1lMb5wv2yucDx/0XYpkewGAdZ7nqNMnZ3G9PwVzUCmAizh/UMrnCCFfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BH/bbbvm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BH/bbbvm"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41b1ed3ffd4so1247295e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 04:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713958971; x=1714563771; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/p5xEC+QNfkoqFIrbne/L0mxnmolg90yRpPIRqFDoaY=;
        b=BH/bbbvmTAI8em0b7wb4kx6H49tMUbxF53WuSTE82vaViPZ7iKMsi2Rgm+dkyJMC3i
         Ndp1NrIanoY+W/jOd1bBOC9kxd5nXUXnyyeS08rZq5GNg6k52P6vaw+IQzXvFkW4LqMu
         jb/hTBOOF58DSGBYPcVBKgTkHl51NcLPPXCqk1Bj5UVX5HQDRmAUJ0tuc3BKmdUPrnWV
         arJS4EJdF/6NbuMFm0PEGOyeRkE7H59VRE9frmD0EHE468Keelg7lCy3kRwhvekpJUTM
         9/6Nzq14NOU7dahX3g1QZvdXkH+lwBmu7NyrHOGOfE7xozvEobba0Ok11AlwcUOZtGJF
         QKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713958971; x=1714563771;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/p5xEC+QNfkoqFIrbne/L0mxnmolg90yRpPIRqFDoaY=;
        b=NvQCBN1IEZQgbHg/juM6Iby4DV8oWwVAomgB3ruMc1TDC4kTXZlGvxHLywx583S0Fg
         5A27KJQyVTF9frXMzjMwfGMz22I2mIMxwi8Dba1Je55SKU4+NA0dZNdJlk6n+gO5x4c3
         WuJzbWABKBUEvVPhSxyKFgb35Dflg2Sfh6HcWalMQTt2xZoA1GC+dSIE0AAXOPrXxam3
         RmijvTlC7YOLMe//McCH9nHHsdAWn1XrNoUKcUCFA8EXY/c06VB9TV6qovOGrbdYsGPn
         rDhaIMIixgrLEsiJvnEfwvx6cNjggSCmPNx8YN0MW0DBsE9jaQUeSsMAG1FcmN82FUvg
         Su/A==
X-Forwarded-Encrypted: i=1; AJvYcCUbNdo8HxKccSP65F2ut0/gkndZOeBjg1oX8I8fi8NCqPNe2QJJtR+49Rg9GJ5jFgGHObm6UABO91DYAUSk0DljQktPPlN/EfnaY42Vkqfk
X-Gm-Message-State: AOJu0Yw9rebvR1GKtKMPufNwXTED+klYban66tBxydvPPPQ09IOcbDeA
	4eG09YdzCaYt9qjwNChl3HgCBgvqA1SgID6EcRlpw6BdWI8M8Vo2bMrcmGDOUoU=
X-Google-Smtp-Source: AGHT+IEuDDTDOp6nrVspCs313QlQ+BLrwhk8yHmVsdozM7Mct2igZhyLOPAei4HREOaQFZD/RxCk/w==
X-Received: by 2002:a05:600c:468d:b0:418:f307:4b82 with SMTP id p13-20020a05600c468d00b00418f3074b82mr1649916wmo.39.1713958970614;
        Wed, 24 Apr 2024 04:42:50 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id o3-20020a05600c4fc300b00418f7605249sm21455887wmq.24.2024.04.24.04.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 04:42:50 -0700 (PDT)
Date: Wed, 24 Apr 2024 14:42:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] spmi: pmic-arb: Fix of_irq_get_byname() error checking
Message-ID: <53c31752-c8a2-4098-837e-2f84f03c8748@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There are two bugs in this code:
1)  The "irq" variable needs to be signed for the error handling to
    work.
2) The of_irq_get_byname() also returns zero on error so change the
   comparison from < 0 to <= 0.

Fixes: 932282f154ac ("spmi: pmic-arb: Register controller for bus instead of arbiter")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spmi/spmi-pmic-arb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 0a17ff02c827..791cdc160c51 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -1672,7 +1672,7 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
 	void __iomem *intr;
 	void __iomem *cnfg;
 	int index, ret;
-	u32 irq;
+	int irq;
 
 	ctrl = devm_spmi_controller_alloc(dev, sizeof(*bus));
 	if (IS_ERR(ctrl))
@@ -1721,8 +1721,8 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
 		return PTR_ERR(intr);
 
 	irq = of_irq_get_byname(node, "periph_irq");
-	if (irq < 0)
-		return irq;
+	if (irq <= 0)
+		return irq ?: -ENXIO;
 
 	bus->pmic_arb = pmic_arb;
 	bus->intr = intr;
-- 
2.43.0

