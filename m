Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5561EF0B2
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Apr 2025 16:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302383; cv=none; b=ZkwFI1yAQODLsjegyrMxEYlx7tS8scHeW7mSw9Kt9j9kmNzNCvphlx7+WSLFC7tIhgYiAk0RGfNCxTtyBo4lxogD+arKm9QGgG7QgcwUKYp6XyBTgQXIScB1/vSeetmNkygzq3UKAoeClWwch8v0I9m+tlH+CLYgNbONaEMuUr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302383; c=relaxed/simple;
	bh=uahR4xkljdW6YAEH4HqJNn8IYJmLvcayuCU2q8UueVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eo4ueFv9zsHQh8hJn5j3HgciF+lK6T1/4UiSZxXqsuZJXX1A8ZPPTf9a5MnpE24LDCDRoTWw0GF2M0LN1Bjxl+nI1l+Iz3EdTPhdEP/1dnz6ROb8Mmm5VwzV8IsCj7WQHblvTzkdBpg1G/Tyz9LL6D6DJ/CmcybaF3gbVlgWOTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l9sSImZE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l9sSImZE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394a823036so10473915e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Apr 2025 09:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744302380; x=1744907180; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y9ckJ5dfd0gLEO4J9dWqs05uCPbUjSjr2AMEvPSWIg4=;
        b=l9sSImZE0eZRKee+ZfzwBqfW4Tq+KbG0zohtpgkkS7v6ndsheUuHJcxggaoqeIEdfT
         sZWTbAQvdbqieo+2jOXwnJdDuG+Ya2IAz2foFfvpDLS+nCin0Jy3aZdlLwxgThxJ0YLS
         TkQJ0UCcT4mvRz5bAr5YhqmNY6XgRm01tZLBmZJVbuntE74z2MWSxsgRbA6SZYw8xFHc
         X+riralRPQycB3srXYL+3uEh6/+zf7i8KU24ALwZx6VIhXy7Kdy3hmnapZlS0ZpvJy5M
         3WWXFsdO38dzYlGIr4svKU6e+0lru94G3M2pNCtxbohG9nVza3NNA5JuyY2Jz+wmU6hk
         j4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302380; x=1744907180;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9ckJ5dfd0gLEO4J9dWqs05uCPbUjSjr2AMEvPSWIg4=;
        b=hUMgD2YUQIfLjsm0BODvNmuhd4cMN6GJ0pMbM3sQVb3h8+NPaYIjSf8C8tmLXOn3Hh
         mhisqj5F7X4eXiw0iGEC0DGB/UTJtxzMf35XuIL1+KprGjdoqqKBM0C2NQzZ1D7KPvRr
         22vHJcmb843S8ik9BKeuQu0k9jnZSREH6ETvjL/3SPQRLswGyul7u6SmfXdtvySfs7qf
         hq6iI1GkDLzVsZeGef4d8hDeutvwngeDUouZyaowFQTtApKfD4LHN66yrb164Gzcp6JK
         Xprh9tyIC/KT7zbo9exyqJmFWJbkRehoWO39iIaUMNFIQkj2XFWx2TQKEY89xmwlsohw
         9RAA==
X-Forwarded-Encrypted: i=1; AJvYcCVYA/UkbNxshp82qzGWuSCyUJ/XSWoh8j6r4/Q0hw1nRI2iblXQalqIyBxekg9delqngdNWuHQeWIFy+P9Ky0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjIJl80Ectipo4gxo1h1aO4N2Ae68g9SCtt2gUlrfMm3KSClyv
	EbFFMFuDxErG69nHHTQitDWmMvua0bH4PlHvlxbNAR2NmGRFM+/uhxEczK70Jik=
X-Gm-Gg: ASbGncuwmBrBMgKoIHT6L92deMHR88PtuNzcCFIdLMrRHKiGJ/5y4UHE47ch/LQlDaQ
	6/VKhbg64Q+m05KN6O9pf234kouV574P/hrZVplnXComeZE+NPlX3qJ0YrEdxHd+d4NC0a+Pg9L
	uvJTDtQrJvehdGBrmEfaXbUpvS8wJMstXZdtLkMYowLJ12VGRW9KpAFw/dhhg5vmZMSd6Kskhb+
	GW2A/ncF2FsTpOttI0fx/TPYmDmmenntlgmbIYSCq4J1kGNMxRm9KfgtVKqgWID8js+5q7fu+w5
	Qc0supP8JHFetikNU2Qmmnnd6oY/jFuCEoX4HjJGsVu2Z9CGQ6ZjuEvX
X-Google-Smtp-Source: AGHT+IE1nYH0HBU/WHO1w0aQZJhBOQ2ARrY9ROHGDPijYcKFnQf4Jd5ojzOvEeX3hT9ouKniOfxAnQ==
X-Received: by 2002:a05:600c:190c:b0:439:9e13:2dd7 with SMTP id 5b1f17b1804b1-43f2d798f17mr40725835e9.2.1744302379796;
        Thu, 10 Apr 2025 09:26:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d89389ed6sm5196989f8f.41.2025.04.10.09.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:26:19 -0700 (PDT)
Date: Thu, 10 Apr 2025 19:26:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Balamurugan S <quic_bselvara@quicinc.com>,
	P Praneesh <quic_ppranees@quicinc.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: ath12k: Fix a couple NULL vs IS_ERR() bugs
Message-ID: <937abc74-9648-4c05-a2c3-8db408b3ed9e@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_memremap() function returns error pointers on error and the
ioremap() function returns NULL on error.  The error checking here got
those flipped around.

Fixes: c01d5cc9b9fe ("wifi: ath12k: Power up userPD")
Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index a9d9943a73f4..636dfe237a79 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -360,10 +360,10 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 	mem_phys = rmem->base;
 	mem_size = rmem->size;
 	mem_region = devm_memremap(dev, mem_phys, mem_size, MEMREMAP_WC);
-	if (!mem_region) {
+	if (IS_ERR(mem_region)) {
 		ath12k_err(ab, "unable to map memory region: %pa+%pa\n",
 			   &rmem->base, &rmem->size);
-		return -ENOMEM;
+		return PTR_ERR(mem_region);
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "%s/%s/%s%d%s", ATH12K_FW_DIR,
@@ -929,7 +929,7 @@ static int ath12k_ahb_resource_init(struct ath12k_base *ab)
 		 * for accessing them.
 		 */
 		ab->mem_ce = ioremap(ce_remap->base, ce_remap->size);
-		if (IS_ERR(ab->mem_ce)) {
+		if (!ab->mem_ce) {
 			dev_err(&pdev->dev, "ce ioremap error\n");
 			ret = -ENOMEM;
 			goto err_mem_unmap;
-- 
2.47.2

