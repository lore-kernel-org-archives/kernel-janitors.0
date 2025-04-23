Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C645289359
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 08:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396641; cv=none; b=Ba/pYK4SiDAznmXcSqjI9APK8rkg36kglu3JnjBLBLm8YkCrTb9erPL0PBn6wiO4QTM4/NDuh4BnlUE0IQhYVDIggojeQgOsU78kvBZwE5diaesfXJQfpyOjmzpFTsXvYY4/TqSboNkDnKa/iDfxC5GV01xb7BrlUWddka9ZqAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396641; c=relaxed/simple;
	bh=9AoM/AIPb3N4elSC5sH2DHMkFgmxak1AJlaKm7usVmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AjEJODZClq0+Paxldg5KtAFXp+uoW0XfhYVeSSUWA0FbhFVIuEm9dWwOoyxw4f1SSECC0M2qi1yE+gffZu9OfIZG+0aGUvbvnMsSu6gh4dTdIP9kQQPIpv57vuKJJosyRp1J1yWCMm5i1CZ/NOaK/8Kx9H8SbY45HscAwRtIXf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j4NijQWT; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j4NijQWT"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso29233745e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 01:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745396638; x=1746001438; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y01SW2UsKHrmSkBJiFRdXdGr5Bt5eDkwEO8sgbkacPw=;
        b=j4NijQWT3Gg1tDJocMoFEem4SPvLpQNMi3fnLglvwIhwRm06Ip/qae0ZxWvzzh55Gh
         EhYRxQzZj90KqHQ4+Ae07w+kCu0BAZEj4+VdXZg35PXNGRzV3miI6t6OIRWnbU+bQkJR
         ABNtMCpXYSdB6g1bEQdzWBJTbSXW0Q+xtlxCSDaegFVTC+d6rN6N3xopJEBu25/7tveI
         UMfl4ksJpz5FTbqR9+UfCqTlGh4Oey1A8XHo5/EwBCV3XJ8gLgYwvS0mRs6OfWJUZJei
         TdfG8elIZnZswCnnVM0OCBXUrxPZCwnLHWHFO8qdoJ+Oe0CqXcMi8tYdW8luSz5OLmSK
         vhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396638; x=1746001438;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y01SW2UsKHrmSkBJiFRdXdGr5Bt5eDkwEO8sgbkacPw=;
        b=oXd6U7V/XTloO4sWQwlVTd5nOqDQdzv/NjpVwRsnoSpJepE7JrLeA82K1vB2eQY+0t
         DQAsfQjKuaUf3tJZQD/PAf3JKCdRwc0uh1maApSBNQeDfCKAdkFyYC0CLFDUOShYLwX1
         Mjny8+NHZhb8Q11S4N9/vXZZQLAJ6fYpQVWRVLcwR7Mj6UcKUKIeccOkQg25KDqT1pJN
         iwNONXRDrU2pmBLjyFsTQ76gzFwixsXpuvZVSFEGo69A/fIQKWjlA0kxyoaTioUGM0rT
         1nEVOw1aMS3DgUjnJRh05kT4eazU/3LbdNYfzeDiGrCL6hlb+KnyeJBR/IHSWOQJKpyU
         +E0A==
X-Forwarded-Encrypted: i=1; AJvYcCVaZZUP3bV6OSFgzCKeQcwrRngwv/uZDQb31uQ1saK8zQVLLEuqmhCj5YEPh5yae/O1vjF47c4gpgIzomqpuFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDWoxW93Dq5CwopKWD3NSq1ghPW/XrO3yxQc38pGjaK2oA7oEA
	pwH7/wGK1HmApd35bBDz0JKxQRsziKUKTqkU9wLjCpLJncAP+4WqWQG9SSRXckw=
X-Gm-Gg: ASbGnctfYLd25jOXMlYKJUVHd/VLZV6OygfRqaVC03iTXRO6rD5rluMP13FBsr3S6aZ
	siyCOrEP9Hgs3n7nn1FiknghtH2PmglU6JFkyQw+Ku/O7BDcn9zex3GAaJQ6MI6t3+8igWeZO/E
	lXMFV2zkEwnCKKqlPYUDwZ3BizhWYwuZa8aegGCgQdEszm3weFU0X1iZYvOtA6TjCJbAH8L3xFP
	ywudsDx1IzpDRCRQ+oxirIA7gRVz3LG/VRrflwyqnfV/yLkPMpy7Jl1fCpYmoZew/sei6CgX0NJ
	4I341Q69xYc/kirpaG49fTBHxcNY4TdOGZTBGMRtnsDcFbcfQHUgtH2u
X-Google-Smtp-Source: AGHT+IECPr27/stUCSI1PWk+UsjbUIKYWkA1fnIwKTwVRmawMohMG5diVeFjOVyCEZb5VbXMG1aMDA==
X-Received: by 2002:a05:600c:4e52:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-4408efbaebemr33514505e9.26.1745396637683;
        Wed, 23 Apr 2025 01:23:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092b0a52asm17463555e9.0.2025.04.23.01.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:23:57 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:23:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] usb: dwc3: qcom: Fix error handling in probe
Message-ID: <aAijmfAph0FlTqg6@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There are two issues:
1) Return -EINVAL if platform_get_resource() fails.  Don't return
   success.
2) The devm_ioremap() function doesn't return error pointers, it returns
   NULL.  Update the check.

Fixes: 1881a32fe14d ("usb: dwc3: qcom: Transition to flattened model")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index d512002e1e88..b63fcaf823aa 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -740,15 +740,17 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	}
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r)
+	if (!r) {
+		ret = -EINVAL;
 		goto clk_disable;
+	}
 	res = *r;
 	res.end = res.start + SDM845_QSCRATCH_BASE_OFFSET;
 
 	qcom->qscratch_base = devm_ioremap(dev, res.end, SDM845_QSCRATCH_SIZE);
-	if (IS_ERR(qcom->qscratch_base)) {
-		dev_err(dev, "failed to map qscratch region: %pe\n", qcom->qscratch_base);
-		ret = PTR_ERR(qcom->qscratch_base);
+	if (!qcom->qscratch_base) {
+		dev_err(dev, "failed to map qscratch region\n");
+		ret = -ENOMEM;
 		goto clk_disable;
 	}
 
-- 
2.47.2

