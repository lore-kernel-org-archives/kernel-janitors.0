Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEB214F9FD
	for <kernel-janitors@vger.kernel.org>; Wed,  4 Sep 2024 08:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725436971; cv=none; b=Rc+up2IUQQRSDhgYFkGTL56uSXnAhkkDKEoBaWBlsl4HPp0uKC5oNJUhRBrZtNNNiANiUzNY8DOSxtYhDUTPNCduWG3dPmaXeQod0mvVx93O+5HjTAmuLcLm1E5i6tlXeQB5nXToiM0nwsdchguK+PCLgfjYoysIqKEo44I4RMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725436971; c=relaxed/simple;
	bh=dDcdKq7ppSYN4Yv4rxqWl4NK1gtCIBnTvMkiH0xJG6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X0e4TuvT0CQF04ZmWHaGMgv/LZ4uZEfcsz2+j1JwO2SkkxE9t1UM6NFsodENmQI1ppWq8VmMDZHOwZga86iTFNIXXjIfhFqunsWigGizAP7IORzfGl319o8sYkuFmQoR8Mi1qd0dfC+3gPOTJJMuU+RNg3m5j/gcUiGuIE+EDa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g0AVtAK1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g0AVtAK1"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso69787095e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 04 Sep 2024 01:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725436967; x=1726041767; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dbsiPwHzdU7yQfw0bVfDw6SqwSWkWnRdJycvBly0WUw=;
        b=g0AVtAK1iEnn/iWInE2LZounTfgvg9QgLlTJuXSKcm26scsd5c8wi9KrrKt5KrMYR+
         4fnRw1ho9tHknXL9GxqneyaRhymcKXOMFraZdfhylBXFglJyfBA7MOarnj3UnE2B/13d
         GaR36EVG7o6WKB/wK0F0EAMT1Pxh0DB++qoeHwvo83/l8Yy08yJcAir5OoZ1kDoIm1wW
         PVH1iKMPJfbm0h5VlQINaQATRYm626DILTgOiV6JVNtEvVmPupqvOfqKOIeRUNqTzNj7
         5xwP44BwZEy97mB783w60rzohzAz6l6MhZTamW8vpxSyDo5xqSAftQinyI05hcDuDg4d
         ztpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725436967; x=1726041767;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dbsiPwHzdU7yQfw0bVfDw6SqwSWkWnRdJycvBly0WUw=;
        b=TlAdtdya3/uDK8ULBZea1cUfPT705X6b00mTqRjck+boKuHqnJk9dJ0pRBX/VBcrjQ
         b5ErUd5QC0VBt6UoRY/JASTQk/WGylIgevsjMbGgLNik8U+QBKw3FNDwtTHJwt2+XLPu
         23oRMZb4KngHRwL4hWnvzXRyBGQL27Qafrr+iBB2Nqu9PLNqtunbFvGE6ErXZ4IlbzDh
         J+OBMEz+0nkkl4VbAQZ+2iwE8ZQyB5kRVvNBmRySg9p56vR/G0Y+IuLYHQyNUVU6HHJT
         8/Vy3AKOdEPe1YBu8uD5oE0Vxhzl2bnA4aP3ZrT/AK/grjzgBslmyzviwhASYynyPV2H
         rLQg==
X-Forwarded-Encrypted: i=1; AJvYcCWxWofVKZrXIlXEror5mT+2QQNFnxg86LQMFGusFmy87K0z616JiwZZbxicYJZi95tbOzRtGuAt6rJQSPH4KuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYiksMcdGMznlopC/Z8TxXpFYAmIE0EYsyyJtiF5QHx5+G4zi2
	A+aBSBKeuZITlmWWmV2T4trjUsb7uIiSOPybP+TTtPt9+t/2CSPZfChY0nueeUs=
X-Google-Smtp-Source: AGHT+IGyDGx5cm2clgCM+58D1DQI6ScWGOORu/UwO/wHkk24NWcrYuEi0RVx30LWqkM6S3wJfZbhMA==
X-Received: by 2002:a05:600c:4512:b0:426:5e8e:aa48 with SMTP id 5b1f17b1804b1-42bb01c1ff9mr187146885e9.22.1725436967102;
        Wed, 04 Sep 2024 01:02:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374b9859486sm12993928f8f.111.2024.09.04.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:02:46 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:02:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nate Watterson <nwatterson@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] iommu/tegra241-cmdqv: Fix ioremap() error handling in
 probe()
Message-ID: <5a6c1e9a-0724-41b1-86d4-36335d3768ea@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The ioremap() function doesn't return error pointers, it returns NULL
on error so update the error handling.  Also just return directly
instead of calling iounmap() on the NULL pointer.  Calling
iounmap(NULL) doesn't cause a problem on ARM but on other architectures
it can trigger a warning so it'a bad habbit.

Fixes: 918eb5c856f6 ("iommu/arm-smmu-v3: Add in-kernel support for NVIDIA Tegra241 (Grace) CMDQV")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index 03fd13c21dcc..240b54192177 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -772,9 +772,9 @@ __tegra241_cmdqv_probe(struct arm_smmu_device *smmu, struct resource *res,
 	static_assert(offsetof(struct tegra241_cmdqv, smmu) == 0);
 
 	base = ioremap(res->start, resource_size(res));
-	if (IS_ERR(base)) {
-		dev_err(smmu->dev, "failed to ioremap: %ld\n", PTR_ERR(base));
-		goto iounmap;
+	if (!base) {
+		dev_err(smmu->dev, "failed to ioremap\n");
+		return NULL;
 	}
 
 	regval = readl(base + TEGRA241_CMDQV_CONFIG);
-- 
2.45.2

