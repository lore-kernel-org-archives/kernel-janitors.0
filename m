Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA4714884C
	for <kernel-janitors@vger.kernel.org>; Wed,  7 May 2025 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622749; cv=none; b=l3MWjrNgkKa3DiAflPoi83+4qe1D6SnwM/z7jxwnNwUHegE7Y9Jeo6rrytCekQGtRDm1nGUPE+58SdOBuohRX1sZUqxovJp1izUZkwdVQDOSaBt476i7KxlBBVcabsopxqQUIzK0bwBJjJ3hG0ZIzjd4VS627Y98Sj/2OmP5fnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622749; c=relaxed/simple;
	bh=MVqxawyNb96iRVnkoxL8y3RC6hJHYCWJTgkVT9g5/ls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PUROiaHvTfxjGJ3rR1q5px76xtp8gLmVXeUZud//DW01LeaGD4oN3If34uwRu9j3kNHdQV1ZbIosrK5yEL6lDupP9W+oK3U/WbiAh9OGsgqOaYiX3iWlkuh6I7l0vZdLv6S/vjOuGJMWql4C+smwe6HGDFwVJJz2VWqIUzI96+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F/P9/eWq; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F/P9/eWq"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so8293976f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 07 May 2025 05:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746622744; x=1747227544; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0RRD/vFTkmGzJVJl187rnmFHQjXKt5IA4r05/FngQfU=;
        b=F/P9/eWqDprlJgJbYRtNzW5nJFIzW1YVr47IENsJpa+JTqm+VmOvfEZu0q65nbrVZF
         IaeRhfljXIUCH5ytd6qkK1ng8BkFIiFF/YmX8Y7nVsn2dPfyIKDi7/kWl/sFxEDUgeja
         OrmwPkdvug+MPNo58Gd9oAY4ew+rPDbB1z7kamk+Jw8SOEzr9tv//6hYNOG/lKrvDJ02
         qzxfUMP8e4pd+MaNHhlNr03gtAm6o42bPx/fA9dKtmknbQd3I1aTmRDkNQI6fBgTqiUS
         MNYz44dVOOVKF/TIICUMOR2dEFRZCxl8huWBnNSZuwPB1uFyUmAzrMYUIYehLLfDMt2+
         bILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746622744; x=1747227544;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0RRD/vFTkmGzJVJl187rnmFHQjXKt5IA4r05/FngQfU=;
        b=DPXPdTQVkXAqpNu0ih7kaWItAPrP3YiffzfQW5SHCT3ows4tD6PuHEk3TSTG1zjKhD
         BSFB5JQ3PED7fgbVglGTnvNaQkBKEVjP7f0k7IV62RBJdDkPmKkdvtbF9ORVpb7YoXef
         np5Sry7E9evXvfSSGy4y4+CeEC9VOxCBUa3JFee93+B+prNlOP5fjYL5yauaJSwJ7Vrw
         Nj+uE52TKo6qRzqgyKAVu5z3aTVHDhxJCKbIS2eLPbjIYy4g1rhn4EvkuakkVmZBk6Jm
         52QW180ECrn5dUvg0gka2naRBWoYCYANvn2Sq7LjtBN958P4s+j+1CxwhMbJpWQA8S5i
         dt1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUx3Tjw43HYF8bsQ0Ns9iK7NmKKY94LV2/UKl0vMZR692qGFJovW/xvuwHHDO6fugoRI/RTmyz1FKyVAg7p6Dg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPd7brtIn/J/+e+bVe+v+/oU3EK9ZfY7eNarXg7vS1Eg+BMsf5
	0FCrFQ0PPuEo99Ryl4jDjSKyTxnC0T1vvn0N3lasT+yoQaDY4MumiLRW6OlBxWQ=
X-Gm-Gg: ASbGnctbTDh6Zcv4C8By+SzYVEVg6YTpfDGTFmhV5wK48Bz7P+eIFSnQm+9tokxC2O1
	xgqfMuGsVm9ZA//1SoBwRkgswBSzUnkn9Fyk0Kc1ZbGYajJCg/b0LLKq1wT+c2KlSQfCHG/brl7
	0TCeiw4osTSccz++6MF0Kt58eIwSH/grb20M2e/sY4YHykNErSYCwur3MD/j5gMHOTS+OY4qs5o
	C9vcsOoPtdyZ/oa+5xWrzLi1u9GgQqVTvgPn/BP+H5mjIqU+ObZvnBdw0wOKd1Z3L7WiwbLnnts
	gPlqz3R/J5hI2yAv+yrfZtw3bBsFBFPmoJa//cT1OVxBmQ==
X-Google-Smtp-Source: AGHT+IGsSMuTAgYqI4wtcBoKdXPHDvWaWYH8enx/xlGJpO0gLwyPuArBF8AKXQOe6SYKQMsl8Q0xsA==
X-Received: by 2002:a5d:5988:0:b0:39c:13f5:dba0 with SMTP id ffacd0b85a97d-3a0b49a7f45mr2596695f8f.13.1746622744205;
        Wed, 07 May 2025 05:59:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b501a197sm2545233f8f.76.2025.05.07.05.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:59:03 -0700 (PDT)
Date: Wed, 7 May 2025 15:59:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gyeyoung Baek <gye976@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] iio: chemical: mhz19b: Fix error code in probe()
Message-ID: <aBtZFLFlr0slcYSi@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM if devm_iio_device_alloc() fails.  Don't return success.

Fixes: b43278d66e99 ("iio: chemical: Add support for Winsen MHZ19B CO2 sensor")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/iio/chemical/mhz19b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/chemical/mhz19b.c b/drivers/iio/chemical/mhz19b.c
index c0052ba3ac6c..3c64154918b1 100644
--- a/drivers/iio/chemical/mhz19b.c
+++ b/drivers/iio/chemical/mhz19b.c
@@ -276,7 +276,7 @@ static int mhz19b_probe(struct serdev_device *serdev)
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
 	if (!indio_dev)
-		return ret;
+		return -ENOMEM;
 	serdev_device_set_drvdata(serdev, indio_dev);
 
 	st = iio_priv(indio_dev);
-- 
2.47.2

