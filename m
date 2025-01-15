Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5465C20CCDB
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Jan 2025 06:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736923981; cv=none; b=nuhUAcJZYoYdFysLfDuxBv3q2MF0IHrdnJ+bFYMCZuYj4mfmfLs3Au9IzPYO/JebvPP8X+49Tg+zs9aqSQKOlaB312/FoK1r2CeJxFvjclSgpXjxDqs5pvk20lZ5+L1GK7QAn0pmW0PO4qFT097zZe4aCCrail/YmLJPcg5zYm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736923981; c=relaxed/simple;
	bh=79AOjzcSmvn1KXMWF7UxMCpdAsnp+D3NfbR+NPlMBHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QYFlSmM5HGuxvvDG5CbAX6dHgalGO+nc8pTmoGEUuuvXO2vplSkHuR09cC4xMYcIm35guR91issLj5tWDG5Xch31GWVXIO5F0XeUrr1Q9z59vs2UPjy6aCWwyz1U2MRFmFbhK/ZykZRS+8CTL3ryN12T1eVakAIxVlG1m1J6k0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WDj0iENJ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WDj0iENJ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso10608749a12.0
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jan 2025 22:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736923977; x=1737528777; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W6bWf/tRxO2NkxvH7Hh/kmozinexYUxPVUzSd/dk6ko=;
        b=WDj0iENJIlJbaz1V8SG3XPzSeYeR6lxFDU6XJV2n4IuPmYnd3CI3v0E0WS086LGmsY
         dfJDNWcu7NcAubh+pFviEKFbzSeCJwFRRhPZRQCesztcGtAljIIaSG1Gvg35gZT7H6st
         kj6fPeG+W24dZQCMfFyYZt6ZckHFr2S7lmYZr6Tg7NTcb49QYhtM92cjjJy5xDW7Yqvy
         aT6edbLFcc+CLwL3kwNp5Srpgwn1pQnXKkvmIHKZWaDl6CMnN63YUb7tjHZFJVfnDlSe
         bSeePRCCb5S9VDN/swUKyp9ZSJCYzdRBUBb7VWcjkqevwq/za5+sld146GXtJhM9hS8J
         Exig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736923977; x=1737528777;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W6bWf/tRxO2NkxvH7Hh/kmozinexYUxPVUzSd/dk6ko=;
        b=t3qh7Liev9qoo+lv0udeOchjWxSGjgPbcVcdi4H6KU40Lc9GcpP/xsEXi/DeQCa+s8
         PF7JnQ5aw0jv1ndCvsnGIF/+Cr4igDncjjB0q+jS+viF+/+b9lGqwLzabG903XuCjXpC
         7aMq1rbjUU66wc4gC6/CWb4qTaajxS3uIsWHUPzyFcIxX9w6ukW4/rkc6N/+l8eucXkJ
         b6oS0AcKVgQHQMWRwRel5y8MFH8a77u0dPRJ3T/7VyREqEAyTAahB9x0gg1Yt8CrGfRl
         OCrl8X7Ttkrfl0BbGcJ3JDcLsE1kdtATfGZ4jE4wJn+7cEdnH72F6IUocF2tVsKaNhkD
         2Uqw==
X-Forwarded-Encrypted: i=1; AJvYcCVbYq+rmYgg4cuFaLT/7eOrnuPq1+Pku9nKFRqtcRgCiaA15w9L8l06oj0U7xSd+VOcbNCdWOhfc9gRg7OBfpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfhFxvcHo9+cJFlvn7r7In7gho4O9nmpAyyRuFX1eAcHJE0XSd
	1thx3ZfkiHQf7zVtmunm44ruhCokKzhp+sOiIcWsgsEdEq8Na0Dw/GqsnqtFw5Q=
X-Gm-Gg: ASbGnctbWQL7L3CyWzHsJBNJx8+VXtxkj+wjVgoAvUJaJ/TNF1c4JzaZWBUJgYX/RIO
	tH2/eoRyo6A23rizq35A1uCM57yKx1PCMOjovKcYuao8czlukOmcxbv90sOa5H8QA/fBAtB34/m
	4KCB9jmEh3HcZRnv3PavOKx3Gs3G8CVmXHBuEMHoCnLLK0x+uIHeFsfMqztfsrgWSKZLdKuu/d3
	pq568IU5jD7PMLyUKaeIt3fkWDxfIsXGcQgsuwLkxqO7EopJCRwBg5bfRoNzg==
X-Google-Smtp-Source: AGHT+IGjJatczNH0yw605WtpAu9naajkVinTdTUHVkZjtvdCrzX/ldBhEFr9TVzUdaTAIFmmbt2l1A==
X-Received: by 2002:a17:907:3e9f:b0:aae:bd4c:22c0 with SMTP id a640c23a62f3a-ab2ab70aeccmr2468597866b.19.1736923977532;
        Tue, 14 Jan 2025 22:52:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b1ccasm716907266b.158.2025.01.14.22.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 22:52:57 -0800 (PST)
Date: Wed, 15 Jan 2025 09:52:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] firmware: qcom: scm: Fix error code in probe()
Message-ID: <a0845467-4f83-4070-ab1e-ff7e6764609f@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Set the error code if devm_qcom_tzmem_pool_new() fails.  Don't return
success.

Fixes: 1e76b546e6fc ("firmware: qcom: scm: Cleanup global '__scm' on probe failures")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f0569bb9411f..fc4d67e4c4a6 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2301,8 +2301,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
 
 	__scm->mempool = devm_qcom_tzmem_pool_new(__scm->dev, &pool_config);
 	if (IS_ERR(__scm->mempool)) {
-		dev_err_probe(__scm->dev, PTR_ERR(__scm->mempool),
-			      "Failed to create the SCM memory pool\n");
+		ret = dev_err_probe(__scm->dev, PTR_ERR(__scm->mempool),
+				    "Failed to create the SCM memory pool\n");
 		goto err;
 	}
 
-- 
2.45.2

