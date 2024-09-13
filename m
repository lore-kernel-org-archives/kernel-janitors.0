Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BEA18054
	for <kernel-janitors@vger.kernel.org>; Fri, 13 Sep 2024 14:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726238103; cv=none; b=kHcaFtTFBgrFr2mybNTYUFp4ohsSKii7VBcZdkP+k2s2vPvxNM3rKl+sgCyWKwxLL9O3kumcmSErtyzBeCfcowjyKCvnAyV53yJA+f9UqaG34fbUHILozPI+7tH6AUhHzcgAYly2TDvjzSLu1gtDV+8YbpMH46fHzx/BfCePN+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726238103; c=relaxed/simple;
	bh=3ELOloAX6onr0kSBIqXF0Gy4XUjDOYml68qqMcjO/Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l2ZCM/JikPGCHIjkZJY9Scu2aCvAWN/8OKTFs/fX54IOqqAEj2Lxeht2VDujXy3dI0AScMpHkJAwvELcW74cDpF0r/L8LTWYcWdV0q20QSP2W2k7k9Lb5eg4b+DbHFILAr9/Dw0SGEvqjeBppGBe971ECf7AUUcxny8LeBJAu3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tKYhLYR3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tKYhLYR3"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53658f30749so2591471e87.3
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Sep 2024 07:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726238099; x=1726842899; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOZr+XBM5WUt/TfPaFfV5hj8BjCZLS7DmNzXffMIGd4=;
        b=tKYhLYR3mQ+/XuW8uk/ZCfFtCe2FGj5ADWQqw92fsgttVhh7MJ/M16465IDfYENOT4
         WcX2CH5MV5W5nDoQEslcTivn+HjqfnmgvjCU9EKZ6tzGrUvTdLzOVOTCba5xzDbrmTZD
         2k4q2rguiW3iJ/kWjnE0s8XsdggWCny+eCO6ExH4CN3H97BuXrEtiU5U/uzAUlnRvJkF
         /gYxsuyqHPB/MK5y3MmqA9djB8OvBeK0LovTbVjWSgLoobRqopRKXQdei/iwFAU/6M2m
         ECBcgp1/bGWqugDgWDk/6zxsE4Gr6dFDFW4Ut5fwGRXwJ/36xYvM2Wm1nqQnCz9h/kPv
         PcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726238099; x=1726842899;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NOZr+XBM5WUt/TfPaFfV5hj8BjCZLS7DmNzXffMIGd4=;
        b=nGhDoBprgOydGd6ZzTG25M3rsxTgqmPvBODkErQJ1pIh81Vq1mGhLUK0sTszqEcaG0
         RMdYwq6guKiRcvrp15Q79gj/uASuyYkUFS/Mln8hF3z/mRbeHjqMHxThbjZQ3G3uSvul
         Fq5VpOQ03oEe9wNl5L5wdsGfML9H1OmFTZznZ4l/9LJ7sveQXlHzMa+muOB6S1mM+RWg
         TEC6xS+L2XEeI2FvmYATIuZ655MWDPpbYLMceuYLVsm3/tVjK4OUoztOSoysrxzSb5AH
         VY1IZWaBflOSNGYb+gi3esjtnQlBI5vBO7frzLhioLsL3pY2PIU303YqBXbAO8W9PoB7
         X3kw==
X-Forwarded-Encrypted: i=1; AJvYcCXv2ngxFOV6heXW28JlF11B0/Gm4tsW7iZTANMhoBAk161Fo0qvzruoWzXJAjJMpGmnAvyAkiGW+/Eaw5bWbTg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8AcRDXnoLuVHD9fp3aO3+Y4Aep5/o+JxBpnr9zQU4eez028AT
	P13BWVKtbaU/NAMpgmX+dRCNgBaho7vWfauj4tACoRnTVi1MZDxU4Vnp12c+4zs=
X-Google-Smtp-Source: AGHT+IHjq2mTTdTFTKK8BFKScueI01WIN6K5Za4D/dlGAyZ5cP1Y+EQegQPXkmLZH/xNBLTD7hORWw==
X-Received: by 2002:a05:6512:1289:b0:533:e4d:3374 with SMTP id 2adb3069b0e04-53678ff4b06mr4059065e87.57.1726238099288;
        Fri, 13 Sep 2024 07:34:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd466dcsm7692145a12.24.2024.09.13.07.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 07:34:58 -0700 (PDT)
Date: Fri, 13 Sep 2024 17:34:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/tegra: Fix NULL vs IS_ERR() check in probe()
Message-ID: <ba31cf3a-af3d-4ff1-87a8-f05aaf8c780b@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The iommu_paging_domain_alloc() function doesn't  return NULL pointers,
it returns error pointers.  Update the check to match.

Fixes: 45c690aea8ee ("drm/tegra: Use iommu_paging_domain_alloc()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/tegra/drm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index c9eb329665ec..34d22ba210b0 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1153,8 +1153,8 @@ static int host1x_drm_probe(struct host1x_device *dev)
 
 	if (host1x_drm_wants_iommu(dev) && device_iommu_mapped(dma_dev)) {
 		tegra->domain = iommu_paging_domain_alloc(dma_dev);
-		if (!tegra->domain) {
-			err = -ENOMEM;
+		if (IS_ERR(tegra->domain)) {
+			err = PTR_ERR(tegra->domain);
 			goto free;
 		}
 
-- 
2.45.2

