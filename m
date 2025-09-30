Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4B6260569
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 12:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759235160; cv=none; b=BzptV25dezxfvW5nOzSN7zXUMSZTLuEB7AgMoJPkTtLuMHvfH+KIKcQb5eC2xGf4EkQGJVGgqZrGt1hd5M7pEXPCWnfeUWthftlPwrMF6yRUPnyuqZz3xN1CGMYV4xdKSm41YXH71vX6ChHycPTURwMygF7/TpB+E994L8kJ3mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759235160; c=relaxed/simple;
	bh=yDrAqvbEaiFHI18jN+gtlF8I9zQtJDkqQPohZZEUvSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rC5/CzsIrzs2ilUpgCc7xaSiXWaiKbDgRPGFjRLktVmYanGYvVUXHAhaaoEOu25vDv6TvX+hCvAa9gVycazOZF6BcRNDyXkGgXGE6/qcngLFGVeE8JSwg4lcv3vdWJzjuENtvpEMQuQ/Q44WApET4gIGLzOgDzY3BYPj1ocsnv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oyO8/tl9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oyO8/tl9"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e42fa08e4so34269995e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 05:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759235156; x=1759839956; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GvPVBBH5vGqV3kuJKhWbZIWETLbBu5VFdtdFk49yg78=;
        b=oyO8/tl9vKUkgVEgBUNW+Bl9TTUl6tpOiXKGqrK8/e1QqNs8OAT8BlhbcoHRXQLkOk
         u/nrOxjg0QjX8aLWLXqv61Ppo9udbQ3mRXLmLtazlFONsj4JmY2PuKLZ+KEKb1ZdQdKi
         NdBdbQ9NDYyIZvIppeDZ2SPouOhekSI78MbNAVwTXQebfW7h3s5p7owcQjkkqE5paJ5D
         yozW2tsUggrHrdteCE8QWMcCHYJ+tJOuOgHvilaCGjcwlPtQ7Aq6xMxKPxOVU9nJF4nd
         gU/8NfUBmWFshNNgGIu2Np20v8kCTeT4cJoRVTk3JORvYmZgn6aoq31mO2AkDlw5BWaI
         ci7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235156; x=1759839956;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GvPVBBH5vGqV3kuJKhWbZIWETLbBu5VFdtdFk49yg78=;
        b=FYJ+DeYQoUsgHhnyTNimXtyWABMTdqGKBElIRi7TrYfuzwieAq69zqk7R7HKkdnf1w
         6iFqgjMVqGiej/e0XUUtQYgdCl2D3wEdim94d6pw7rqnJ+Ue83NkdSiz5eo100JfS0a4
         sPa/3mDnEWBpqkcKuhPPLsQ+OwXHxuSbc/0KjlEi5loGS8uJoxKqP1/t/WppVYGe6SN3
         xfpvp0qSV373yzCrnyNzXFvvADAUShAEkjxYtO+EIS+BbPa/KXchXKcMd6Zx03pBW7Jg
         yNpgsRrCphT8CgJOMd3g3Ax7gf/2dHrTvZXbbVzHRhcmBBPUiCU86/3kPRrssWG9kLvG
         PLkg==
X-Forwarded-Encrypted: i=1; AJvYcCVnAfk0wSM3ZtEBIM6rK1eMJOWrCazBbmKGZFC6JgXu5fwMjkRf/iJByDR4kYtp/PAVm4EhZ/bifqeLeHg4eOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSKorGe10NeaRGnnp1E+3ubA80TtKKkP9I7s465czucdzAzQ0S
	boN1fin8XFT8u7xqEw6q7AEq0vCnrohnvTZ2KteWMAOwB31eMOlxCUBU38rQyyamA60DUac4JgY
	5jw3X
X-Gm-Gg: ASbGncuTcTX5CXwTv8yONq/dLaZkH5y35bC5741NSFABVvEItrkgHk0zr5CLpZnxLny
	5jZOqqb074lfRA+SbmZtTyv4jUp3kjXYl/CeLfBi0OndVIoQE7VZ9rA67/46wk95zk4GXOzu1OQ
	Ifl5dP/hAybVPpJQB0p6bfKkkjsjxAX3qjkXMIQx79Tgkps91fXUJWzurCIAsW/NgqE+y7RDtlQ
	L1epwF3iB4RJcjewXVBo5cENxnjzYshEv2LG961jdDV0qcx6O9wRtP15Bd9KvvlYTM1cTKS1ARR
	KneQjQWstsOyMROhuJZNuJna1HDqTjwal0GEmreQta4Pp7si3iLlvLjbl11+LZTrrWeyezKircY
	OlqCxYLGfv567ccYZIaulDZDKaWqHRKU6IRs4SnrozQg2plrUwsGiZ1wMYYPCgbA=
X-Google-Smtp-Source: AGHT+IHCMMkMmxX3p2DLBXTZhpA/m4X3bu/Jppin+k2ZScUSiWq4++pq+g8zHiUCjWlwdc3Xc6EA7w==
X-Received: by 2002:a05:600c:4512:b0:45f:28d2:bd38 with SMTP id 5b1f17b1804b1-46e329f9b5amr223551295e9.18.1759235156187;
        Tue, 30 Sep 2025 05:25:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e56f3dab0sm54160645e9.1.2025.09.30.05.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:25:55 -0700 (PDT)
Date: Tue, 30 Sep 2025 15:25:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Guixin Liu <kanie@linux.alibaba.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] iommufd: Fix error code in iommu_device_register_bus()
Message-ID: <aNvMULgt6s7-3ceR@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This error path accidentally returns success.  Return
PTR_ERR(iommu->fwnode) instead.

Fixes: 885add2e6be6 ("iommufd: Register iommufd mock devices with fwspec")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/iommu/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index ddf398d8bcf9..59244c744eab 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -330,7 +330,7 @@ int iommu_device_register_bus(struct iommu_device *iommu,
 	iommu->fwnode = fwnode_create_software_node(NULL, NULL);
 	if (IS_ERR(iommu->fwnode)) {
 		bus_unregister_notifier(bus, nb);
-		return err;
+		return PTR_ERR(iommu->fwnode);
 	}
 
 	spin_lock(&iommu_device_lock);
-- 
2.51.0

