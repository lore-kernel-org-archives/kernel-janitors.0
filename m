Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC0C3128D4
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 11:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761130947; cv=none; b=gtJ0MPRRMIE4JMlJRs0a5dE5XHcpHkmw3yEexZcP1DafyDU1zYpjUn5VsPzFZm8AkRJzdeeO4KdnSsqXs6GSIcwTNPOtQVrBcaefQ3BuKeZBkd2zHq+OiVLAoz4CyCAAN+ORp1QLf5NAMyhkakGi776Tf1wmWPRIhtPNFVFKywA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761130947; c=relaxed/simple;
	bh=U6QL/+JJidHtZRcPOVlNbuzyRSsR+FDJqN50LjHQQA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ECGU1YpN8t4v1fQtjkZJu0iYznZ4LhAoXFSR4BeJOpq4Xn6dDv5ATdU1yPhvP3c/q1S3kUQakr9qKbk7S1mApDFIW1tG5a+/FDWepbmK+lvx+bjJKGBy2d91TjTqRPAWjVkV/bxcJljpOVdEr1cUB9almDgLbEfQKZJ/Lly/HhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I0UpFBcm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I0UpFBcm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4711b95226dso55992815e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 04:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761130944; x=1761735744; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vr6iKNjWerf9nOZB9LbbHl2ovGZqdFL4pZFz4dDFkR4=;
        b=I0UpFBcm6UnH98+cDRl7QpFxdB76mz4rMfoUgTjFVvtPgoXeLYMGzWKw+3VYhZChR0
         DPDvBaaz4LSe0KqX5pfQnfFU+dqxi73jjsU2FwjjPcR3RIrXkxv+El5j2aZgytjK16ti
         rliI4lzjmPy40U2nMid12v47jozRuIspYA8K7iiGMALMKk9mV+Clnf5lcpqLmh67+zF2
         tmQMYcPMsGvw2nfmqwTQULA1tk6/VIG9L8XJ1MjFUHCtab3J4K1KowdQuCXegjmxG8R2
         OtWp1mdFaUAQFRNwXSBONuLhWmWxBRRy7IzIoYUpy1tIFDqsTLwAcnpoyHpLNrW88W4N
         k6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761130944; x=1761735744;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vr6iKNjWerf9nOZB9LbbHl2ovGZqdFL4pZFz4dDFkR4=;
        b=Le9saNZ7nl/8p1B/PVfwhsgIz8g0SDi3bU9zkoMMb1G0KtGaSKRO475G6S6AzVcBDG
         Fx7pLiqvOcmaFRfcD4hgu/MFEBIpAiBRGEt8qPYwiDmKyAfpYvj4FXh71Pxoh7Qooz3v
         KSBAjTD0FwXDccbl/XY2GddCY7Uj/b/b9sqnpi2rpTt2W59nvivicAfOuoB+v2rZkQFt
         jp6Ycmzwp7g2PFAARKHbhNRPrURfbB7QVicDdDw91OCpxH36QaGd08Z/Pg2E2HCsO5mg
         q132Ctol8xQx4dBtMWA62XSblJ17g3HHSjZT3ZAgM3uPsLQA9OIq8bFwsk5aRIOskf+H
         G9ag==
X-Forwarded-Encrypted: i=1; AJvYcCVSNaQnGK9EyUWa0oKgVWJfehCPoEwaSzxhyfMGLuTw4ylv3cnmpK1Rprt5qMwp/lw112DMHITTDouqi0kKfG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOGTrYOGxMPe22ckUrP7bctK0GpCPYF2b2ejuKznfLtqH8avFk
	YwaSlNXV+pocgP5QD6QZriKiMpnCxVCvqcLnk8XbJSU7ti8Z5He4Z/NCcX7GMBYQzNZoVZyxSDz
	tNMl+
X-Gm-Gg: ASbGncu3uxkgCzkx2c3HU9Pwu3elLN+Ov71hY/h2M3aCGH17s5OpA+IAANWqtQmVHbP
	4Xkn73w+IVC1xXMhZKS1hdHHHlGE4BEJ335vttsKELL13f2kUz6Kglbp4UTmcvFnlw7v1kDuSe2
	24jGiD5hijqpMYc9pO9VokWb2cWt6T1442akyshgG2EN8bxuK+GzVxGWTxZ8w+UdIIMNyYbIsYR
	xBFeZWakGdAspW3qSuNQsEsXjy9kuJo485eqoysNlXQqkcV4PA6U485v2efYkYXIBjkSXKlewkQ
	9iBjgj8RrNHWso9tS+lBBK+zEiSkdwsy+tz48Ib8gofS9AUu8HeTbaCdWUjGD1Upyei2WACfkMR
	YrnGMtWlK6FczbkEpvHfMAgcM6kwSfWMeh55tbEE8hM5b1U/DppgtugAza6MtKQTjXrihiF5atl
	+b9TxWGw==
X-Google-Smtp-Source: AGHT+IH25nwlFz4tq4G1fC0j/+8ilfgBKiuMxxceSNPKsvkrvfcWUC6/1PbTIDPovElQDzNqkYF4Ag==
X-Received: by 2002:a05:600c:540c:b0:471:12be:743 with SMTP id 5b1f17b1804b1-471178a3f93mr153198455e9.15.1761130943947;
        Wed, 22 Oct 2025 04:02:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c427c3casm38651185e9.4.2025.10.22.04.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:02:23 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:02:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Remi Buisson <remi.buisson@tdk.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] iio: imu: inv_icm45600: Add a missing return statement
 in probe()
Message-ID: <aPi5vEp75jH0imQc@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The intention here was clearly to return -ENODEV but the return statement
was missing.  It would result in an off by one read in i3c_chip_info[] on
the next line.  Add the return statement.

Fixes: 1bef24e9007e ("iio: imu: inv_icm45600: add I3C driver for inv_icm45600 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/iio/imu/inv_icm45600/inv_icm45600_i3c.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/imu/inv_icm45600/inv_icm45600_i3c.c b/drivers/iio/imu/inv_icm45600/inv_icm45600_i3c.c
index b5df06b97d44..9247eae9b3e2 100644
--- a/drivers/iio/imu/inv_icm45600/inv_icm45600_i3c.c
+++ b/drivers/iio/imu/inv_icm45600/inv_icm45600_i3c.c
@@ -57,7 +57,8 @@ static int inv_icm45600_i3c_probe(struct i3c_device *i3cdev)
 	}
 
 	if (chip == nb_chip)
-		dev_err_probe(&i3cdev->dev, -ENODEV, "Failed to match part id %d\n", whoami);
+		return dev_err_probe(&i3cdev->dev, -ENODEV,
+				     "Failed to match part id %d\n", whoami);
 
 	return inv_icm45600_core_probe(regmap, i3c_chip_info[chip], false, NULL);
 }
-- 
2.51.0

