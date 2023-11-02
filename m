Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0618D6FA5
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 07:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QLAMrg5a"
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A23E111
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 00:52:44 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9d465d1c86bso90810966b.3
        for <kernel-janitors@vger.kernel.org>; Thu, 02 Nov 2023 00:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698911562; x=1699516362; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3hLFviShdiRz0LWrvjD0/NiNeyz2Hw1WeffZlM9qtA=;
        b=QLAMrg5ahUYfKyaXPcXeoAJqV4UcCJcptCCVDGdZNvoCRNPP21uOuc/nFV9dkxW52m
         tXtsAoeTLu2ti2RqL0xprqzCEcBiZLjWaOcHaTIW8GQSQUt1TDF2+01MXIkZAZx1bZ+V
         Mj+yM92R0sIjS6A38KoWkztO0rxbatE8ypu+Ll9p8zPcW0Qyq1exP5AG6ZXVtt8j2wth
         tq91B24kLBiChz+JoY6IUUj9AHgTO3nnUnf4n2wzqRwIJQ4k66sKDNYbtwH+kCZ7ZhWr
         h0zIGsoS35yIFfHHAP/p3lOxjHG7yVFbM7kIbmNFEmxfseYO51InO0WNIY2dV1JMbjmc
         cW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698911562; x=1699516362;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3hLFviShdiRz0LWrvjD0/NiNeyz2Hw1WeffZlM9qtA=;
        b=IwnhvkSl7RG0JMdAhDy7rWy/H4xQjUAP53ia7e6vN/kaFENoy97Ye0JE9/d589oBIE
         UNjnRK46/cyqNQZo0M0BXLRE5rTHBzKVNF5d3gqnvtIHt0EREF8hped6yC+dYmkgwMps
         sh2m72hbMKW4Fb2tSHSlGpb61/oZ6eA4boQPOlzM1l8GMlk+KRrz76OjecWWs7l5kCJH
         +G0zqNgeT3tYxqBUHN9EDa/7jI1C/mfUPLr3kvyXR5qBTQRCb6YBgcHfVJm+Ig6L7uaQ
         Lfxj1o59zGrZ0669FazYjpUiEOi1sZkg5Xf4t+/XtYbS5WBw9OKKsJ8BoEjDzS/18DvY
         Iv0Q==
X-Gm-Message-State: AOJu0YzfS5qkXVPIcK4+4SiZhW2AqVqhMCbjRFtMSCEwTXKURgcE2SeJ
	xs7iUpexsO+Kupf/TUVJWrkFmQ==
X-Google-Smtp-Source: AGHT+IE+zTYMpPC3/du1pIEMVlc98f5u2A177kNIdZdJFJ1+S097g5Bgd6lOcqyK8tu9QSQBWpqk7A==
X-Received: by 2002:a17:906:eece:b0:9d3:f436:6806 with SMTP id wu14-20020a170906eece00b009d3f4366806mr3176651ejb.47.1698911562416;
        Thu, 02 Nov 2023 00:52:42 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id mj14-20020a170906af8e00b009930308425csm799836ejb.31.2023.11.02.00.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 00:52:42 -0700 (PDT)
Date: Thu, 2 Nov 2023 10:52:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] coresight-tpdm: clean up sanity checks in dsb_mode_store()
Message-ID: <1a53b166-798c-4eca-9389-674fb896cbcc@kili.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The (val < 0) check can't be true because "val" is an unsigned long.
Fortunately, that check is not required because the MODE_MASK check works.
Ideally, we would return the error from kstrtoul().  Let's clean this
up a little bit.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index b25284e06395..8c2fd4318ac9 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -457,9 +457,12 @@ static ssize_t dsb_mode_store(struct device *dev,
 {
 	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	unsigned long val;
+	int ret;
 
-	if ((kstrtoul(buf, 0, &val)) || (val < 0) ||
-			(val & ~TPDM_DSB_MODE_MASK))
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+	if (val & ~TPDM_DSB_MODE_MASK)
 		return -EINVAL;
 
 	spin_lock(&drvdata->spinlock);
-- 
2.39.2

