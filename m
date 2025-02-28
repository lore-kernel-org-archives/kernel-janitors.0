Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9B725A2C5
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 09:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740735350; cv=none; b=u0CxXgQDS8bFQgQ2NkERoWSNxFvb167l6hc0O1lF6tWluthesdli8SPcpl3l0GxY6ARQoiAAWgV56EkvCkSKKqG8CZGdv/P0KPmhNcb2fP6YtVZ0hyadXG3M7bZ8AVPhjcHSusJ6FcBHRbWMitnHjhyMdq7kv5gh3qKypq0NPYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740735350; c=relaxed/simple;
	bh=5wwhbu7yvxb8Pu+sWhd2Bfw0yE+/Lbj4gK2wMJKPvhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YSDY5xFxeBIJGejjEF2TI3XNTekCpEk+oncMTrmtyOMnoXxXrDpKRXuQHlEtr4GnYJaq2bOD/0vaKn1i4m6ENQpl3oQ1BiTnZV4XHrL9/dhRqms9Xe0wZBPmG9q+s6zpMnyG+qF5jaHVgE2MhryMRoNKWv2EubS5YyVC5wQrbrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S2nTcNqb; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S2nTcNqb"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaedd529ba1so208652266b.1
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 01:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740735345; x=1741340145; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EAD6FYOZHQiIZ5qOdMszeXmFSAsXwpOb7J/vlvlF0S8=;
        b=S2nTcNqbD08AgxKWtjNavPRZncz9w+yhc3VXgTadPiS8aT++vZnTP4tb2PZhFSnrtZ
         rDOk6gXPxctH/P9ZS1C50GLw8m39VJtozc8ifmQLUW1goyKWkmYhPpMAn4eW6rZBHgfW
         LYqUybHkCSkyL4M9GHWbDp/NNZM3whGS3V5ZSw/qgxpJDqF/UU9y43aQDblTZqG3CXcG
         FvTAL5/qYiUf9Xh6u2zgyBx5H4uu46ZHQpeV7ilf98Kg3EQpbYoUOK0ikOkZziqbc/ok
         Nc1pbzhr0YMQRoRmMCgdP7vc0RbbypR4LLDOIc7ho9SLFqG+Yk2ZNT8e3ONtXdNOTIX3
         AGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740735345; x=1741340145;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EAD6FYOZHQiIZ5qOdMszeXmFSAsXwpOb7J/vlvlF0S8=;
        b=KusWOUY3ZCfVhc3DHkFf0BWIeA57hYeJfbzkYnTiHKvD4VwXPKZ3HR4Vp8snwPoUgv
         whtp7OyZg+9aPZapEF4DQ2/wwDxU6YIwFIkrp1hw040cUvaZWNTCHPNOhYjyQ1MoX5sM
         9Vpzz8t8MqPOFUCbjP9yA/jLJkypLV5pH75Q7eqhdkVQOlau6TBz1efwrmwbOFvsDzj8
         aU2kM+N5uj6m1nGZfbQPvkfPaqbBL4lzg67NhUagxZQlEsmDBxyxZKCYUUHJu1QlcBXE
         fpaw+vTptj5h4dTJ9MgjC4ecG7f+IUptqLiCeaefLKrf6oLL9MdEzWAaC0ShcTAqKHcA
         fVjg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ1ozHWGs4d6S00RFGpshzZ7MlkdIqyJ4QM1uOVmpPqkITThtsrRxZz6KXmMPYD/89Cud0Px8h3lGZODdVr1A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx39SUk5FzGJIdStoaP1johVs0But/OwV457YMsF1JifqEPlp5N
	nM/XoL2H0ti7S2Duq/KrNLnce7N+67+/D7lYd/yDOZ6q1fP6ufwGAOTcvlCXtRE=
X-Gm-Gg: ASbGncuLNGeTd0GgB3IPnfHWQjrmGYKweD/Ir6M6RVwOQbFnTD84a83UbHeW/FWTDZD
	JDj7lKGyJQgRUU4yrYeF1+rR+nK8TMoTxWzkNXUQpWywy52jO/Tao4y6zHXF8+janZXHHONZ5ED
	OAPABOSI064eLbHhfFqCIDSSk6zFqFzX3LKb4+CFujZx0r+xI5HhLXWBaeg+8dSij4uhiYVZ9OW
	UFGNbwvZMfpv6C5BSTZy2MpQL/kj6kqJOW14WTgolnnjMve9prUQMhPDXRmUh1FdQdxk9+MHDb1
	GVHS+D4OWGuZHEsou0g6VPnnjBtqqOu+8Tt+RuNIevdLgKHG/w==
X-Google-Smtp-Source: AGHT+IGnFx7Ob6v6SoU+/gvpn5S5yHkLF9q6yTrtLPmDhB8HE6n8VTxo2kQ9zk5VwAQD4u4VOZdwTg==
X-Received: by 2002:a05:6402:50d0:b0:5e0:818a:5f4d with SMTP id 4fb4d7f45d1cf-5e4d6b628aamr6127584a12.28.1740735345024;
        Fri, 28 Feb 2025 01:35:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf42c16af2sm1976966b.116.2025.02.28.01.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 01:35:44 -0800 (PST)
Date: Fri, 28 Feb 2025 12:35:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Esteban Blanc <eblanc@baylibre.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] iio: adc: ad4030: fix error pointer dereference in
 probe()
Message-ID: <cc67cee7-9c65-46d2-aae3-f860fc3cc461@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The intention here was obviously to return an error if devm_regmap_init()
fails, but the return statement was accidentally left out.  This leads to
an error pointer dereference when we call:

	ret = ad4030_detect_chip_info(st);

Add the return statement.

Fixes: ec25cf6f1ee3 ("iio: adc: ad4030: add support for ad4632-16 and ad4632-24")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
There is a second Smatch warning which we may want to fix as well:

    drivers/iio/adc/ad4030.c:397 ad4030_get_chan_scale()
    error: 'scan_type' dereferencing possible ERR_PTR()

There's not error checking on iio_get_current_scan_type().

 drivers/iio/adc/ad4030.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad4030.c b/drivers/iio/adc/ad4030.c
index ab5497c8ea1e..b7caf7e89710 100644
--- a/drivers/iio/adc/ad4030.c
+++ b/drivers/iio/adc/ad4030.c
@@ -1014,8 +1014,8 @@ static int ad4030_probe(struct spi_device *spi)
 	st->regmap = devm_regmap_init(dev, &ad4030_regmap_bus, st,
 				      &ad4030_regmap_config);
 	if (IS_ERR(st->regmap))
-		dev_err_probe(dev, PTR_ERR(st->regmap),
-			      "Failed to initialize regmap\n");
+		return dev_err_probe(dev, PTR_ERR(st->regmap),
+				     "Failed to initialize regmap\n");
 
 	st->chip = spi_get_device_match_data(spi);
 	if (!st->chip)
-- 
2.47.2

