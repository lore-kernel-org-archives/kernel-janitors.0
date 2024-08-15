Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BB87DA7D
	for <kernel-janitors@vger.kernel.org>; Thu, 15 Aug 2024 11:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723721111; cv=none; b=s76qAw+nTwApbHDKOSc0GHsCxD1vAGRleabINYNMs+PtVXeb58qowrE7f+6revXsB2Z9fBAUEnl4hO9hIlsrYXBwFiheWJzssW5lPFDox4ghheuY00WIjwohZMaSMRZ7EoARYtQ6/RQ07ZSoie/RKbcMcoXFqVlgZr1GtCuH+2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723721111; c=relaxed/simple;
	bh=lFo5gIFDvq0nCBY9vqftpLu+gTHD6YABYYNyYZUhWPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gFPEVjlzkik5aa4o2PPo8cIFHA9gmvA66Xdy5Zw3UTXV1bQYf3Z23FqdNDOMCW6dRR9/kdc4F1G/jjs22NsK8tng2WlcB5VQX19Sieo7BgT7UgIK1wq9IiPUwEuRrSOuBG4PYpcLLnGwu5xTkkW0H0U9q4Y8vVaAEv3pJ72EvPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UUIfyvYr; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UUIfyvYr"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso1267178a12.1
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Aug 2024 04:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723721108; x=1724325908; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJgccsMLKlvTr7kW7rYfi0K+07lJJOFz1A3IB6P2Qqs=;
        b=UUIfyvYrsE6q+q7OtagMyPLfJcAWaELhx+at2X0k+00LmoCsU4raacO+uj9L6nwtMB
         ENi7JCTaQ5lZahVNxn1bsg1xQeA1JC9czjzys3ZG479YcYQQKiECxYCdhEZLOcILHCTl
         zLq/9aYKJPFCEvRkabPo5K+lWJkh3Ei6uKYnEggBSQWiN02xAFANr8BnyBJj3rrb3/rR
         XBDMKt13ArvR+WrCAyR61kcqUI1YEL/uBp2/AALVTWNjRKbi9shsqHIq/t6P/FzfIinn
         irWfJhlsDV0bG8g1OEnEmnpoefyqjFypyV+WFZh8QkkML4j8o8AYOswEcRhws6t3wdEJ
         tXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723721108; x=1724325908;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJgccsMLKlvTr7kW7rYfi0K+07lJJOFz1A3IB6P2Qqs=;
        b=AfvYTCAKp7I4LPsQFOzhRJYuDv4iHrq7gCrDjeVrSBb8Slyc9NVPegCdfAgBa24814
         MbB2GK8cmkNfz6WL2uXu2YPAvkh0M/KtYMYQTL2Xo7PxnoiEJAKiJk7KzVlplbYHD5b6
         N4ostNOsMwZ/GpXTmtoIK/zZIkAAlFq9NnwD25zuS+Q6kIJT/fDkmBtBHtfDmwO6WNpx
         MWVx7ly2Y8DU2nXS3OZTX/hu5703qbHvboBzES8C/NcVlE86/0OiaUkbee0Pt/puKJoW
         LByEfGAW4mUZj8dkASi0BcDPXRP8UwNG4qYef/zWc72VfOSwMj1g89tyx26mnQhrVXrB
         OYFA==
X-Forwarded-Encrypted: i=1; AJvYcCUVreM9282BQoDgyfY8yfGNDZ8RupQhXn5nX4DP16xhTZuAUW4VE30umlEk63k9BQs+kA7lhQDNJvEJV0myt2BO4Pqb295SEy+t8kFRPZJh
X-Gm-Message-State: AOJu0Yx3sHdFthsO+fG3wYMPDlCJyF/abfXGPcbYzUm407EKps1t/r3a
	hFMiiKzeNLWvaCau6TVkgHldtPCSMWHIBaYfMomk/Ls73a9FTlrRCNIld+qgyNE=
X-Google-Smtp-Source: AGHT+IHwCYaVWrDMM/XxSAgRaGSfa25IQdFx+8Hr+PoYjdMN7joZtfNCMY3zxeI7foru5gpy24rJbQ==
X-Received: by 2002:a05:6402:3227:b0:5be:bd48:e4ca with SMTP id 4fb4d7f45d1cf-5bebd48e74bmr1231063a12.26.1723721107693;
        Thu, 15 Aug 2024 04:25:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbde48fdsm769217a12.28.2024.08.15.04.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 04:25:07 -0700 (PDT)
Date: Thu, 15 Aug 2024 14:25:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Michael Shavit <mshavit@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] iommu/arm-smmu-v3: Fix a NULL vs IS_ERR() check
Message-ID: <9208cd0d-8105-40df-93e9-bdcdf0d55eec@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The arm_smmu_domain_alloc() function returns error pointers on error.  It
doesn't return NULL.  Update the error checking to match.

Fixes: 52acd7d8a413 ("iommu/arm-smmu-v3: Add support for domain_alloc_user fn")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 9bc50bded5af..cf21d7d2e737 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3062,8 +3062,8 @@ arm_smmu_domain_alloc_user(struct device *dev, u32 flags,
 		return ERR_PTR(-EOPNOTSUPP);
 
 	smmu_domain = arm_smmu_domain_alloc();
-	if (!smmu_domain)
-		return ERR_PTR(-ENOMEM);
+	if (IS_ERR(smmu_domain))
+		return ERR_CAST(smmu_domain);
 
 	smmu_domain->domain.type = IOMMU_DOMAIN_UNMANAGED;
 	smmu_domain->domain.ops = arm_smmu_ops.default_domain_ops;
-- 
2.43.0

