Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18D6158D63
	for <kernel-janitors@vger.kernel.org>; Thu,  8 Aug 2024 19:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723145307; cv=none; b=aexcmbM69xAO4WH7cZ72/dSpbahxpFt9ClLCS0J85BRmXS6IHO1AJalrLXySckwvIYgGouQPR17bx1SV9ZwDR4RJOls4NG6QFaARn+mnQYrARjIzlbRe9cxnbyewfsCJ5G6ETsUl8rABePyKd4cfOAQ62fT2vfS+8NBieyB/QgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723145307; c=relaxed/simple;
	bh=NQU0Rv98JrX81/A1nEguAxQLbRP4/UsWjsfJGNGtA8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fKpnxaUTKk2JnsnYihlVlqJd1OI40LthF0MTBVHH6BIGUgFiKCSLe0rqLijqfE4PN+xpr/z1JcJfuyG3uN+6xAi/wtQ6nt1mEz62iHUdp3UEtaAEskQXZpcRU6nAwl4PH+K5Wh+cXBnDYx2+Gic1ZOpYr1dISWN9KLnXQEd2/DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CwACziWO; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CwACziWO"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-530ae4ef29dso2349369e87.3
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Aug 2024 12:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723145302; x=1723750102; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RmvNOlcZTqNimmDZ7x4m8PDONx3OgfdzukD/3f4hZ5w=;
        b=CwACziWOUTapdybnWrNogumsTX1V6OsrMKw78PQKu7KngUTQdcGc92gQio8YL67A1M
         /HJjnhRLN1MRe7e1ohM36s7AcMjIBI3ZqL07pQNJPnGGDRENikpY3Z4uJOAgYXvlAk6B
         LAFZMHdVCX3bAU6dOclgAQoaiK3LOGspzNDk5zcTHMAdomI/ZGBYlrHbMeCxcHqnAKbI
         vdLx6kqVCRc2teoLFnwg+89kOlgAbU8+MGSmlsljYAv+M/273NY0rbI2AcoYV2GFbaas
         RfDjumOQaUR+VfGrD6N9iQpEYq7tCn3N1M2MzTvAkOt5jEKzkzLUS74A8EstsOenSUcn
         2Fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723145302; x=1723750102;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RmvNOlcZTqNimmDZ7x4m8PDONx3OgfdzukD/3f4hZ5w=;
        b=X2rK+1UiZCuObsMOqOVhD2vidl1h0VnM5AoZRdPw8AHihZ4M3WdpwPColr4L9R3xJF
         Qbx+ELhGZ43OSHK3iTXrYwh0muKoRQsPfXIMn7PNuH78mHOOLk7kLSsAKOOLIrBqzCfc
         fnElc+3051qP2Davzs9SOs4MWaSVD+e810pUU2SOO+KDH5BgvfuLxYJsmebUiKSQsxiY
         ai5j5mj4Ywm3+CPK8Ztk4h2E0/f8ae/+iOBQ15VLQSp1ivYfNjaC3NezkFZEmYASKSGb
         96ISOa84YsIDtBV77bHl9kDDLMT4kd8cqNOMiOR7LnjFS5tRPSbbPR057QggO7S4iatZ
         aTJw==
X-Forwarded-Encrypted: i=1; AJvYcCXLdAnvSLZIzLTJyXOQVQiEHrGQcKHkkPb1xNQdp2K03g3epCFK3GXZTnOSdzN8yEhu9bQ62vXVyCqcVz8eRGuYOQrRasA//wjB7pKnikCF
X-Gm-Message-State: AOJu0YwJGYe4mgTDh3xxbm1J/ikxh0gfCIa8b/OVQFHx6N52DJZm5vvC
	IIvsflSib/aEQ/TZcbErK3QUxtMQuaKldyDRYGccis1zwujAoSogqFz8+6bmjSM=
X-Google-Smtp-Source: AGHT+IHtLnvvzJHxqOQEnHLayXZTmudxUv+Krktv9ZXkQDMBM8SbtIwTknWYYCVUWgTw7Owo1+ANLg==
X-Received: by 2002:a05:6512:280e:b0:52c:dd25:9ac6 with SMTP id 2adb3069b0e04-530e583df3dmr2798111e87.29.1723145301524;
        Thu, 08 Aug 2024 12:28:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bcaf7esm786912266b.12.2024.08.08.12.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 12:28:21 -0700 (PDT)
Date: Thu, 8 Aug 2024 22:28:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matteo Martelli <matteomartelli3@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] iio: adc: pac1921: add missing error return in probe()
Message-ID: <1fa4ab12-0939-477d-bc92-306fd32e4fd9@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This error path was intended to return, and not just print an error.  The
current code will lead to an error pointer dereference.

Fixes: 371f778b83cd ("iio: adc: add support for pac1921")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/iio/adc/pac1921.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/pac1921.c b/drivers/iio/adc/pac1921.c
index d04c6685d780..8200a47bdf21 100644
--- a/drivers/iio/adc/pac1921.c
+++ b/drivers/iio/adc/pac1921.c
@@ -1168,8 +1168,8 @@ static int pac1921_probe(struct i2c_client *client)
 
 	priv->regmap = devm_regmap_init_i2c(client, &pac1921_regmap_config);
 	if (IS_ERR(priv->regmap))
-		dev_err_probe(dev, (int)PTR_ERR(priv->regmap),
-			      "Cannot initialize register map\n");
+		return dev_err_probe(dev, (int)PTR_ERR(priv->regmap),
+				     "Cannot initialize register map\n");
 
 	devm_mutex_init(dev, &priv->lock);
 
-- 
2.43.0

