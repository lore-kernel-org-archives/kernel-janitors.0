Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F921642B
	for <kernel-janitors@vger.kernel.org>; Thu, 22 Feb 2024 06:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708582472; cv=none; b=OlPRyg67IqKEitBao0l01xB2JVAzD2vSuERF0dpUd+2s6YPQyfRT3PUFf6Vp5Sv5ucjHB5xzdn90cXwj6nL1Nw3aCe7C30M/NOhI+SByJPcWTk72C96SHBxnKcQrYwAvAeTGOwhikJgVFyHealgPsItk/PEHGbZ74tO9iG3bFkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708582472; c=relaxed/simple;
	bh=eronbDz8hniFpG4P8U1NjCuXIc5mT2H0q1+vHe4QvZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p5ft929cQ4mvteij027/Gaz5t8Dzn1jIz/4tfjgGYsLdzZeP4clbiMtscXQ/FA96r7kpT44b2/Uomdw2h1iFyQs7mJBflqA4KfpmLRny3am8D9zgBLqYvObTjrQ4LODkhT4TLnL6Sz9CUEw/FBUQNEoWxpeZQoupoF8kmXFTrIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tqHv6mvb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tqHv6mvb"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-412700a7207so10447325e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Feb 2024 22:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708582469; x=1709187269; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihJpziOlMuDcSvTLuJ/gU0Hae3a368M+b9HMO37f99A=;
        b=tqHv6mvbEQESR6TN0fWmiYp95YTLBbXV0HW/8XpTFbJokG75u9vku9tiZy+qEmaEDn
         m0UnFrKessgtla2iX1TVY8SK7qMJidIjCCqFoXFuyEHy6DvVJHS67Os2QGUmdRwA1+7R
         V8aBXwezYOGqQ/Vhg2Ynf9lTvYqWcuSM5S4TssexsqHBZ6ZbMWm0pgL9T3jjlj1+vWQo
         ZqG7hcZ20xlxcq8shbXZkw/ZT9vhsUgEsu2a/Zs/25/U28F2lAE676BJDi+3kgi2aFtL
         OwJFBy0fWUE80TdxrWsDO9xj7qU6dkorGxglyV7DsoorOZD3Km07LQTgCIIiMPZcmISm
         LjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708582469; x=1709187269;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihJpziOlMuDcSvTLuJ/gU0Hae3a368M+b9HMO37f99A=;
        b=KWGn4IbHVU2PrXsVgcmc1ry7DpYwf917mBqHEDpESVMiXRrSqb3dh4/VGOVnX5C6Jf
         eI44dz0JTglVZg6u43edRmhFYX2ZX3J3tyGiQDsrshitOHtAkKF/TLGJQHgHuvVxJ6mP
         Evfzm9bdBhMoIoTQaYJQrnAcNQp4jNOCBS28YHEeS/c2XuoyVTMsP4HKDBsw0Uk/cIpO
         W9j7LjfZC1V2QiIHs84Xl77bMfOCv/yVglixLniVzYPWI/9CkRJXOoLUexorFgoeLaKm
         0GPw3DT/Dc8aebYCIxEHad19mJvZGJwl5q7K9mudj9ymuVSboeCee2fJUMaz5R2WOncO
         I9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCU+K3EsRA26PSthOMqeFKogZtO6GvcPXquLFvalxJWKLlH5mWXrmNGBQ9oP4WszZwuQSKDhKIT7SPAxomi+R41cfLf/+hBY6jOIcJ7hV7/j
X-Gm-Message-State: AOJu0YzD2TPVbP8N1Q9vs0ripvGsQNfefARF2akmiqeQl0r36+r7ZR5o
	rN9vgMXJ7IagpKLXtjEt8t1kYWRt7X9FH+InO6PxRdAmCKYfwPJScylpooTOGA0=
X-Google-Smtp-Source: AGHT+IGopM8CATzEXKdXm/OXCkYnC4ug5JZs7YcBQ+FJg2FL6Lca7YApWQZuoAl0Xt1vK64K14teSg==
X-Received: by 2002:adf:ea82:0:b0:33d:29d3:1aa2 with SMTP id s2-20020adfea82000000b0033d29d31aa2mr8014703wrm.12.1708582469338;
        Wed, 21 Feb 2024 22:14:29 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id cc18-20020a5d5c12000000b0033d67791dc0sm8215530wrb.43.2024.02.21.22.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 22:14:29 -0800 (PST)
Date: Thu, 22 Feb 2024 09:14:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] iio: adc: ti-ads1298: Fix error code in probe()
Message-ID: <5f393a87-ca8b-4e68-a6f4-a79f75a91ccb@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a copy and paste bug here, it should be "reg_vref" instead of
"reg_avdd".  The "priv->reg_avdd" variable is zero so it ends up
returning success.

Fixes: 00ef7708fa60 ("iio: adc: ti-ads1298: Add driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/iio/adc/ti-ads1298.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ti-ads1298.c b/drivers/iio/adc/ti-ads1298.c
index ed895a30beed..67637f1abdc7 100644
--- a/drivers/iio/adc/ti-ads1298.c
+++ b/drivers/iio/adc/ti-ads1298.c
@@ -657,7 +657,7 @@ static int ads1298_probe(struct spi_device *spi)
 	priv->reg_vref = devm_regulator_get_optional(dev, "vref");
 	if (IS_ERR(priv->reg_vref)) {
 		if (PTR_ERR(priv->reg_vref) != -ENODEV)
-			return dev_err_probe(dev, PTR_ERR(priv->reg_avdd),
+			return dev_err_probe(dev, PTR_ERR(priv->reg_vref),
 					     "Failed to get vref regulator\n");
 
 		priv->reg_vref = NULL;
-- 
2.43.0

