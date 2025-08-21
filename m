Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2830B13A41F
	for <kernel-janitors@vger.kernel.org>; Thu, 21 Aug 2025 12:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755779554; cv=none; b=NdcMzMgJ6PYMkI/VriJxdGXSAmzzpAWC4dA/umNZ42rEKo+j9GhhbkciRETg/1vV1via4+t8pswc+Y39W5Kp07Qr3/LtDkKpULvRRSUDGATgwx3eh0bcpojrROTQWVSp8CZV4NGtfz1rRKZJcQB8zdxa4Sgp5bbXq8RCtY7Sx2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755779554; c=relaxed/simple;
	bh=i4ivNoJA/XYa4j8URBoVuQOwoj5jbAtHTh2CVRUNL98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Txb7O+kTmTIYNdOiRjEJfFOC2XkHyWEo2eJaVw5C5MqdExDuWmML7pVtqqCvABk/MUiAsy4st3/GOZJ35LhUzR7Nh1Vqgu0zGu+drk1sGTv14xb3lDws3ueULriIboFnX+8fGkgcUh5adFapk+R4TM3fzennX3+NuAOuBawSIK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qSFNqRVz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qSFNqRVz"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1b00e4a1so8276375e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 21 Aug 2025 05:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755779550; x=1756384350; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3YxbukuAzSacGXrM6lqlSlHSwuWfZD3gHN6r3X8UJRE=;
        b=qSFNqRVzxpYKMyE1QC6KxqSoQWvVw0pW04O36qfvu+Fv9AMM6y2I7o+EtEeroIKx5f
         xn06yIk8ngZsSvaBbsEOFW4Ni4gVFrB7W0ev7J9CMdVKuWhNM1idSkFw2Ulpqjlyvvg6
         lh9pAYC/CrukmwOamp4fbJUfPILgHsXPK9xYuVaQtXlN+09nzZcazkaPdt0e63RxHNiv
         n3XmaGswzWoV/Dzp5zLdrjFmOmHvZVRKQdI1wC/RUL2LGpPHNTAb+gYDl8vGBeEFend3
         lDu0UIiWhVOvURAxEtwdN/QgO2UOP7uuW0Ddz0M3kzHuYoFvjNfLn8KPb9+qpLk5lR2p
         jmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755779550; x=1756384350;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3YxbukuAzSacGXrM6lqlSlHSwuWfZD3gHN6r3X8UJRE=;
        b=FbQZdfPDn8xlO0wVl6X8qvlFHC4YKFbtqw4jc+FtmbUws+3BCTlUOJxDMs7NSwPADU
         a9pLnj//GuVIhB1zr6Vqz1vRxyFbHj3XQQ5qFaVx5bLt9Yqxk8jntm/msclz+ZJ+q1CO
         8IHX7812IgfLIPtN8oxPEJy8I9gDXwPNAkbzuVTpJOidSjXODxN1bpQPslFv8+JJmc0K
         Uev92uHCitjTy4p1UvxCq6G+zurCARrdhuI4GhZ75/n5tZlTqokzOERZ6CYhjCHxJAj/
         GDOVClqvb7P5Dw/+URCwTGeoE/oahkDhriFRP+enO3+PhqfcT43gkM277YT9p5cofT2E
         tL5g==
X-Forwarded-Encrypted: i=1; AJvYcCUD1QNura1z562WJ9KoDp675Eupu5I303J0/gVtx8DIdA6inU/qSSoB/RaucjUfo/rlTLH4NMhb4rYYjlBrhbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YywjG8aD7JNElqBus23YRsg8atx94HI8o9zbpqAQ+i8gXLyQibD
	WQQqY28EkmTGrUzZnSr5ts5lr+5WopsSwzvKAxW0gf9jYIboHAhZMbzQBOoEg94xASpLL6Cm1aZ
	Qz/Zu
X-Gm-Gg: ASbGnctWlWb5Fu3ASnD6sXWOaoGeBXG8ym+KepSMNUyRywVHAYDXJK/yLE16EknX4xo
	RFlayYKVKmCqUdAn0Q22QLXLqkt9kq1ljaHVL60Xv1GOZt3vMAj6E8GviQcbozMX4vXovoHqTjt
	XiWWmTcjgUyuC79VNLeAaBGw0v7tk8qUg1PpANP4sxGy2tUohXA/xejcWty5n3LN+VQax8CxmaM
	OdL4Wxdy8BAtJaex+LrKGkcXDE9ukCA0rCEmVZ1NyGhy0PYdPOL784n/fdPYBvB1HFlxvKSymVS
	H8l9l48FToXKJfcxDbL4dDpdiCfYoy8P8CaeCxUb/w3fQJsDZwrrjyxSqRL0c+W+SSeJ0ZqOYgT
	XdcL5FvDhACM9uCDU/4Pe5vfKowRHHkynq4l9Ng==
X-Google-Smtp-Source: AGHT+IF4re4JMKqmwW7eC8Vyez+RBY3Ot24DyU7VwP7W6aNkCpKu4qpBngC8551+g/vQCfP2k/8E9w==
X-Received: by 2002:a05:600c:458d:b0:459:e200:67e0 with SMTP id 5b1f17b1804b1-45b4d7dcc58mr19978705e9.10.1755779549700;
        Thu, 21 Aug 2025 05:32:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4dc255f9sm29273285e9.21.2025.08.21.05.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 05:32:29 -0700 (PDT)
Date: Thu, 21 Aug 2025 15:32:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rex Chen <rex.chen_1@nxp.com>, Huacai Chen <chenhuacai@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mmc: mmc_spi: remove unnecessary check in
 mmc_spi_setup_data_message()
Message-ID: <aKcR2ea747xkw_it@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

An earlier commit changed the outer if statement from
"if (multiple || write) {" to "if (write) {" so now we know that "write"
is true and no longer need to check.  Delete the unnecessary check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mmc/host/mmc_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmc_spi.c b/drivers/mmc/host/mmc_spi.c
index 95a32ff29ee1..42936e248c55 100644
--- a/drivers/mmc/host/mmc_spi.c
+++ b/drivers/mmc/host/mmc_spi.c
@@ -566,7 +566,7 @@ mmc_spi_setup_data_message(struct mmc_spi_host *host, bool multiple, bool write)
 	if (write) {
 		t = &host->early_status;
 		memset(t, 0, sizeof(*t));
-		t->len = write ? sizeof(scratch->status) : 1;
+		t->len = sizeof(scratch->status);
 		t->tx_buf = host->ones;
 		t->rx_buf = scratch->status;
 		t->cs_change = 1;
-- 
2.47.2

