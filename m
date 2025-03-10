Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FEB229B0B
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 10:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741603934; cv=none; b=HUWCV4UaZWKcwSdwEMEecsU5a5TxCUBMLYcfe5WGk2ytux40eNnq3XT5wR9h2mzEwmY4aOTbrCMZpFag7Nn/0gveKyaP8pZPMQHtjk3XQhAmJI1ka3C9dEyYx7AdJMSV9LKfgeVg3e+oK2Nzbo9pwJoBOpJw6wKuhJaoU4Jj6fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741603934; c=relaxed/simple;
	bh=vVKnwODUdAiwe/gid9w0DRJv5TpgZa3pSP8IVebCvGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fqtSyXzL0cp0nlOAfD5ooDmOSxXRe+tXiWj7PFE9BqORrIfidaj+JIS/ID8tcoijiKUMbpNSoLyIwDSoDWtxnUvbVzybZqpkyu6kfmlj77wF7L+yypmHZLSpC6BYoEoA5n7Hnf3nZMRv+bcpVdjyTJyMSQwAXCoYsgQ/WLiCVbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QhNEV+Ds; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QhNEV+Ds"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso42607745e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 03:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741603931; x=1742208731; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T60o6gi3usu2ntppRywUa3E8NpwOZr/s4pv7rr3CEFs=;
        b=QhNEV+DsQHmMFF/3V3N/rzgReacxeQcne8aEUk2tC7Vas5wbteFmTJWVIIfrPdSN5f
         TWcvtXZaHO8jm9WeefqnmRybkZOkTs2gRfhfMJpoIXDB0bQiO8kGnbJMXGSK2RNQKe9D
         XnG6PtuUl5c8a87o0PF7REyKQY1LBHCm+B0DmDED6kwpu7pNBgHO9CU540QBGHa/Ga9R
         N5i5f9pyZZrvJT/WOH0dOp48s2L2Ermc5yM8SXVzikbQrJKg/MZLvKSKq+stou4J5kDO
         LXz46UB8l/egDb2ug+8B3ylcNRNkLqdrkkzXDCsI7XugvvYXUwWx4mmQtpr7tgXUJvfU
         qUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603931; x=1742208731;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T60o6gi3usu2ntppRywUa3E8NpwOZr/s4pv7rr3CEFs=;
        b=RyFnhD3BlOTUat+oTlYvrdiolPz6rbB1CaUmmmJxyvPNYC374D59c2xTQ0MbVmZTeK
         ASBTAGO9WYT2/SkpLKQMMjQREVVoS76wZ+vldiV4k/YHhehiii285s2zB+73fx0cQv+3
         VPLYMOaiBXnFB75PLPbsCPjT/h1hqUcFb0iK5zDZn1KYqBAzWgd7euM/tudBb4wT5Mkg
         qocwwkRUuvF0Dc7MMgz04xItEcHSQbn66FtCy6c/31ltMB/HVgtJlm0xC2DQagV09kLk
         oo/1ympb+GsybvbCLVi4JX6bx1q8O+oaXG1TahJvl4IInOoaGsZ1/Va50Vmuw1oHyy8t
         Kh7w==
X-Forwarded-Encrypted: i=1; AJvYcCVAA3wjkdokJZA0Ac9EQcw9HaSs0kbvwrhh14OAdmXUBzQxC3IntTLWHCGBbvia7KgtQQDOh/QHXtnTDCVyfPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIrzzC8kkqpQHIDkQ/b0cTcBjoPuYPAtQe1u5RVdCLnYQTuMt5
	qNnc/fKja0vfVP+AClreYDjnoq6EKqv3I5gXLZqWWCQfFpEY4pAMHrMZXovBZQg=
X-Gm-Gg: ASbGncvof0AXdapUW7wpsA5DBDXa32ZqDjVR+bkRtfIAlTFcy/Ea0mY6XfS104bv2oh
	Rh3q+f40NuhKTLY8WClhQlOe1MF3xuVeOY7NCemhEQzyMc90pig/gV+GWvKoTa5SIo824zFTtzo
	V81mN9xSJIwDMZTvjWGEfrFwicN3l/WHz3/2mfC2RkKXCnfDTs6QPiFeZEAEy6Et59nyQV6sXvM
	yrulFG6ItGP0mPDfEHtZj9KNCgHZWG7QaNQylARwBgvDy5ji+ORXykw4ft5nSbhvdzzNakmEkfM
	/2oNN7QtEk/NaXLzxQPh/tVAr8U/5PNjw717KeV2mGYrx/iWSw==
X-Google-Smtp-Source: AGHT+IG9NsSyCGpPSYGknbpw3bJVRYQjo38717W7yKTXqETR+ruZNlHceeFZwXiH5qt7jRD0fRgUGg==
X-Received: by 2002:adf:cb01:0:b0:38f:3245:21fc with SMTP id ffacd0b85a97d-39132db1fdamr8297936f8f.50.1741603931088;
        Mon, 10 Mar 2025 03:52:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c0e2bacsm14468396f8f.78.2025.03.10.03.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:52:10 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:52:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] pinctrl: amd: isp411: Fix IS_ERR() vs NULL check in
 probe()
Message-ID: <617f4c77-7837-4e24-9f4d-620ecfedf924@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The platform_get_resource() returns NULL on error.  It doesn't
return error pointers.  Fix the error checking to match.

Fixes: e97435ab09f3 ("pinctrl: amd: isp411: Add amdisp GPIO pinctrl")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-amdisp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amdisp.c b/drivers/pinctrl/pinctrl-amdisp.c
index ce21ed84b929..9256ed67bb20 100644
--- a/drivers/pinctrl/pinctrl-amdisp.c
+++ b/drivers/pinctrl/pinctrl-amdisp.c
@@ -183,8 +183,8 @@ static int amdisp_pinctrl_probe(struct platform_device *pdev)
 	pdev->dev.init_name = DRV_NAME;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (IS_ERR(res))
-		return PTR_ERR(res);
+	if (!res)
+		return -EINVAL;
 
 	pctrl->gpiobase = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(pctrl->gpiobase))
-- 
2.47.2

