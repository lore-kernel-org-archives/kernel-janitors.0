Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8362256C8A
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 09:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740735409; cv=none; b=TBvaR4FTtTdJjHenfmhNpfQMNXuqtnq5zTReYmF4qGHMknHXJqvg9aWPmrcUfWND3ICbSmXpgt0v7+peiHIXy8Emy6Mb2dcTYH5+xm9ZxtIxIgYTcDu2DU50iY5Ad85Kug6ttR6xT4IuNHTSCZvaDaeQTy7pXd9+wiIsrRRXH2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740735409; c=relaxed/simple;
	bh=7OAvh2FzEJjI/bPOiRm69JhriGa3UZoS0poO7GliqrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F94+7XtDS0Dra2cQcIpvdABi0fd6uWKjulDyMF5jJ/5PUGwoIO/B0opxKc8PLXbhqPMu53OJRisqja5ork/qcyOR5I/FVAgYO7B3BBff0V8FgBsgGHJr/AjlxtA1hP/2OkOlODOl0UXcoglggWhx8L43dp0zZ3PBqSa8BkpbOo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jbx/IKtM; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jbx/IKtM"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so3571719a12.0
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 01:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740735406; x=1741340206; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ai/hJtxYnguTomii4SP20m0cifXXwklqa40fjptgdsQ=;
        b=jbx/IKtMNwFb0YjMoUsqedagbGbpoZEJ+WOfrS3YCsBaxPB/SsBo7W5KgliICxLZ3Y
         2S0HVkBgyMUnhcWh/tciWvTO5BPhU2gSeODj22nnO0BJ+gmmZyBETxEmuNwGtNcEbEMs
         yov/fhSNdYh+fKhh6K9HolZC1D2ij2/JXpTcUWRJm6+ilzSia4ZcgWJYJuTLPCDZIQ8z
         DnFG62suXh5s3vgEpWbXQcVGvIXrGHyr2t5KIMhMpQUHPWNGzf0qrUCKRW75+kNUMOiX
         A0mIlPeRGuArWPQVNFaIO/hiKDRwu3ekH1GJ0rje9384yNFiDciMfnZfZC8VPHEh/MKp
         uFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740735406; x=1741340206;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ai/hJtxYnguTomii4SP20m0cifXXwklqa40fjptgdsQ=;
        b=M2N30dlcteQ8FNfk7gAVZ/0jUIMtwhOsE7Mq3NatUKyDDAob3kZbYjbPeOHr6rjSWs
         /H2XJ82MUzGX3aksEeTwu+LywbRMOMdiQwKH4mk7YjIx9xEBowKnEufTRY5Gc7dpdyAK
         nTM1qdrJco16qUM2u0uTBp3vfZr6uZ890/GLcJVcm2++q/cLc6m7bYXoAnnTFWigWnPS
         Ms210nH+IagBI9QETXH/ptMeYfYXh41vI7C3YtYywzz8JPe5qMwlsS6yudA1yBuhbaQS
         GwdgEMB3OKqkOblBT4J9rRuGdvcyNvb43UV8Q/Xz+9jtDvRAvGjoWvJBq8F1tUPIlyiC
         iAvw==
X-Forwarded-Encrypted: i=1; AJvYcCVBrFCgMamD7brwWTXyh+t9b61adD7/A8QQeenwkw+nxK38Elz1Vinn4UEZikyCdEOt5cuQgpFE3ZV/zJzBTR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJbSTk5Hn+KOj8HACk/2t5A+TO+0kIqaYUI1dFozVuxDh5IXUO
	O1nAXVF4fWvk8baYdMvJXggtY1ewvA7vkMFipEyFGZOQY8O0vixm8wH7sHoGZXg=
X-Gm-Gg: ASbGnctuGK0bD4zvDaskRYMo2jXf1peore3q9xwq+vMyHbZt5O3k8naEOSDRrfoQmhv
	3k6LoAFiiffa6PMS3z6bjgdtS2gP4fKz26zL2vxMp0CHjQhRIflBOBCIdSDT1iOJnrhdQ8YFX/W
	yByyMP4CORXy1kcWOfF/NIOEE9Fyf35W7CWKrWLu5hdr0gNaXU5QwYyPcfuJFYOOIdTBPCRHhGW
	TIGCnjIGFitGHn4YzDMEWLY5XyghWrQkH9tgMZKZn5Pt08xHrTSSarTB3y+EvYNsLeFP5VJWlp3
	AZq/JJxYLO+nu/+Or65fOBBNwyB0yL4=
X-Google-Smtp-Source: AGHT+IGm7vDtQOlmQzD7ukOLgUjBw4xij3s9uP3Fz/LVXmcLAJBxgStvGxHWCueyPd6neqkamka0Xw==
X-Received: by 2002:a05:6402:280a:b0:5e4:d6aa:82ed with SMTP id 4fb4d7f45d1cf-5e4d6aa8563mr2073071a12.12.1740735406137;
        Fri, 28 Feb 2025 01:36:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5e4c3bb7386sm2278113a12.43.2025.02.28.01.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 01:36:45 -0800 (PST)
Date: Fri, 28 Feb 2025 12:36:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] iio: adc: ad4851: Fix signedness bug in
 ad4851_calibrate()
Message-ID: <f5e260e9-d7a8-4dae-b7ea-f1bbb1760e60@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "c" variable is used to store error codes from ad4851_find_opt()
so it has to be signed for the error handling to work.  Change it
to type int.

Fixes: 6250803fe2ec ("iio: adc: ad4851: add ad485x driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Btw, in ad4851_write_raw() there are some checks for negative but
the multiplication could still wrap and turn negative so we might want to
add an upper bounds as well:

    drivers/iio/adc/ad4851.c:826 ad4851_write_raw()
    warn: potential integer overflow from user 'val * st->osr'

 drivers/iio/adc/ad4851.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad4851.c b/drivers/iio/adc/ad4851.c
index 1ad37084355e..98ebc853db79 100644
--- a/drivers/iio/adc/ad4851.c
+++ b/drivers/iio/adc/ad4851.c
@@ -492,11 +492,11 @@ static int ad4851_find_opt(const unsigned long *field, unsigned int start,
 static int ad4851_calibrate(struct iio_dev *indio_dev)
 {
 	struct ad4851_state *st = iio_priv(indio_dev);
-	unsigned int opt_delay, num_lanes, delay, i, s, c;
+	unsigned int opt_delay, num_lanes, delay, i, s;
 	enum iio_backend_interface_type interface_type;
 	DECLARE_BITMAP(pn_status, AD4851_MAX_LANES * AD4851_MAX_IODELAY);
 	bool status;
-	int ret;
+	int c, ret;
 
 	ret = iio_backend_interface_type_get(st->back, &interface_type);
 	if (ret)
-- 
2.47.2

