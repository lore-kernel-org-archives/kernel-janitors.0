Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B28115098A
	for <kernel-janitors@vger.kernel.org>; Mon, 12 Aug 2024 06:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723444992; cv=none; b=ufaAVKR2rmtyDoeya3j8txsRo6BaJC+EnE3tetOgIJqbK0YziynjWtp/fu5u2W9o64RQeRpaHyyTuY3S9yxSwjdv+3LRx/f2cxgtE11tDN7qp5ubTEsgsjEJKfdgqSHKJoZRjSBubC/mHweyw7T9aPMQilj+RkHaR+Zts0aLohU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723444992; c=relaxed/simple;
	bh=Ajb6lg4vAB0c9I6RQA7b777Zw8d7gs5j3f5fTYHkSrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lftUOuVTk/NeXZbFRm7q/2/6/uMIRtRgxbCUs6r7U8jC9BY98ESreupG7AaNHHRa44ZCWmTPOlt6v2N+iX5dqC3nvyAtLvEo61p+9FegrP6ktpet6yO0KZBae1Zh1etENCDL2rH8h0raUghh+LGldE0drCpbNjYjJHqnFFPz+RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lTPqjGl/; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lTPqjGl/"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5bd13ea7604so1983563a12.1
        for <kernel-janitors@vger.kernel.org>; Sun, 11 Aug 2024 23:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723444990; x=1724049790; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1N4wK86NjIrRtEeCb9nnImTO29M6AM8fXsAaSjX4L8M=;
        b=lTPqjGl/k+avwftKHDfKHxpksJEVPGBy3YfnmPoAOoK0W1oIK986CADOiGX9349kSc
         MvsRiY9UZz0b3M4MFqb5u/osa9C5GJho2onlC35gc8Ppr+bUNreyY4qgJZ6wPghtMbPY
         m6VrdHn9prUg5udZmqoW7/4Wx0SAA4jgUmtNnA+488Kkjct9+x6aRkr6sJbKw8ZWpfvZ
         lZyl3JlLOhuL+AbwtSuECkpp6H1qDQHlcvzzDZgPmMUD3Tn6TsrLS+teuTI36hbef+1v
         Dx7T4rp+IpfE9M7m5hBmYTjD6ryhzPr9oYGhpge7gvidneSCp9RzmfaanKyXQk9aTJXC
         v45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723444990; x=1724049790;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1N4wK86NjIrRtEeCb9nnImTO29M6AM8fXsAaSjX4L8M=;
        b=eQzmakAXNdNMRnO/Bc4HsB17nWckaSm9v34FLFWq/ail1i1feozlDmoPGobtlrX2Be
         PtT7vU7nPZ9lmhOWL5V+Mkh4UaBEhlEhvC98hUq3cyWAR4jgAxbQHn+3xpcD1BFEG5S6
         gH/JoYRBWMUWZDJUZag50ANu1ubIHXRn2dx3MHU5UKN0laHAM1Jh9mVOdSzsDpKwfuSw
         ES6G/iCTvi+wSeWvISDn1Y24MphWAH+yl0hHFU5/xtiHligEHttGnm2UxB05tZadrXjP
         2rF7pDBkGE1kPXLBwgRe/WVoXt1IuBg/6RGzzEDdPerVf+ozJ0f9SifvHlEBJmbfm6fx
         XEfw==
X-Forwarded-Encrypted: i=1; AJvYcCXVHG0m9mNBJASx3PUSu34PsxtaqdvVM2/u9CCsjVdsdUK9LqFfx3LpuQqG4sd0gKqb76Bdov90EQ7WJzpzVpC8o4f6kOx6K8/IRfoTyxWR
X-Gm-Message-State: AOJu0YyfW9LuJw0YWcpONSxtGshjTONEylgV0eWUbfBCF4nwrHTKJ79+
	gOmifYbuKShZRefZtakintsJVPpCI5kluSLvvDw/tkvx9Nbtd4OdXGoX1W8Pui0=
X-Google-Smtp-Source: AGHT+IFUwjEdJZ99b2PzVNgvGD4YZjVQ/89Mt4+D8vDZSCukf8v7q9Ul6n+RpRh7M3G9Um5gXeRLag==
X-Received: by 2002:a05:6402:5413:b0:5a1:b9c0:7758 with SMTP id 4fb4d7f45d1cf-5bd0a64afe9mr5516868a12.33.1723444989466;
        Sun, 11 Aug 2024 23:43:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd191a20bcsm1869121a12.34.2024.08.11.23.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 23:43:09 -0700 (PDT)
Date: Mon, 12 Aug 2024 09:43:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yasin Lee <yasin.lee.x@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Nuno Sa <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] iio: proximity: hx9023s: Fix error code in
 hx9023s_property_get()
Message-ID: <49b5a9bc-e5ca-43a7-a665-313eb06fbe27@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If we're returning because "reg >= HX9023S_CH_NUM" then set the error code
to -ENIVAL instead of success.

Fixes: 60df548277b7 ("iio: proximity: Add driver support for TYHX's HX9023S capacitive proximity sensor")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/iio/proximity/hx9023s.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/hx9023s.c b/drivers/iio/proximity/hx9023s.c
index fe14a62a1342..8b9f84400e00 100644
--- a/drivers/iio/proximity/hx9023s.c
+++ b/drivers/iio/proximity/hx9023s.c
@@ -598,7 +598,8 @@ static int hx9023s_property_get(struct hx9023s_data *data)
 	device_for_each_child_node_scoped(dev, child) {
 		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret || reg >= HX9023S_CH_NUM)
-			return dev_err_probe(dev, ret, "Failed to read reg\n");
+			return dev_err_probe(dev, ret < 0 ? ret : -EINVAL,
+					     "Failed to read reg\n");
 		__set_bit(reg, &data->chan_in_use);
 
 		ret = fwnode_property_read_u32(child, "single-channel", &temp);
-- 
2.43.0

