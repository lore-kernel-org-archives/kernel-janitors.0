Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B0F366053
	for <kernel-janitors@vger.kernel.org>; Sat, 31 Jan 2026 19:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769887288; cv=none; b=mnjLI6kWciskIq6vtra45kyRQKNXdwLG8RglPJRGDdpFQjiRnbjnV36KI3njcs6FDGK55lc/Vu7TcjF9OsUVpqEM5mb5er4SoNYYxjSeyqn0XpCBBxFslbKnLKGpbV1/dUJ+j0r3fyj5mxkiDTUYjC6MfOjnQBFKsrlEdyGftZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769887288; c=relaxed/simple;
	bh=twjPrjnXgWq9BihAJShadALT5mdKLYOhW7LJw/KQQdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VG0g22fM9HXi32CCpmpd8YYmj545mAnf7Btxpq9fYZnhBdZr6iAi1NCE2siKpK/CibR+EqwAq2ZS7NweJ78QXe7BM77Lpm4X8nn050g6i/M22I18G5bAH7fZMUClWi4gSYXtgeVYn8cep4H5y+qJVHc/UYmgxnUavxXLF751Njg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Fg+kbTJI; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Fg+kbTJI"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d18f80b5c2so2775162a34.3
        for <kernel-janitors@vger.kernel.org>; Sat, 31 Jan 2026 11:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769887285; x=1770492085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mg351UXmtMA/dk9xyDkawr0wqd4z8SkQhGWvqh3DLjE=;
        b=Fg+kbTJIWRhY6a0ETUNCakF38HWBeKfFPa2FTmbYmqoQUrPVrampgZniEbzttaGpEn
         UdzXG/ic8eDt+RAwlXm2WtqfcSDzhg+2JARv7x54ysdyOTmEMjrtSiCzWy5eUOP5UKCr
         3Unp4O77hg0bkc+EbFbTXH4muW0L3Xnvkg+ztW6nN5SdjohXw8oF7dBmBTkEObbcJ1ep
         oBchdxdcPPa95HpuIuvxiaPJhRvwueDi4a0sunGqESZnxLkt/SKYuSDx0ZpziAv9VrPI
         x25X33Sr1SnsH4YCNkxRhkpg2jA+eCjNJPH8yBXFcXTTkSQsH84zUG74zTbsVuYWpKbN
         BFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769887285; x=1770492085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mg351UXmtMA/dk9xyDkawr0wqd4z8SkQhGWvqh3DLjE=;
        b=TeuCjiRFgCyVqz20NKDATrTKnljh3oTEd2f3RTTq0nUi3Itmd4rJU9++dl5531pk1q
         J2YOWo7dgJggpBIiyVOABSGiSpDJjslW3/msvS6NZ1mZyNv8USTfYBlZtR6NSjUbudBm
         Is0ewOf78fXUMSVp7bvR1eGqP85L2EuNcQnhHXF7Ju3juWEdUu/mmvXKZt4TzZSoIqCy
         Zxzufo14XDpZ4adhZEAtdzHmPdHKY2hfwPq967nHgAJb2a4hvQmt8GZ31n2HnqYTU/vM
         Mf5K4oW37lrjm5+DQzgZHXhtcxJupPtmH9xOn3zgGEioTRktVxhe/Nl6gUykSkPh0jS/
         VD+A==
X-Gm-Message-State: AOJu0YyMkEtZVgy7evd5v09LK5eEL1BTZsMZE0XSjcCs8gEgygo5C6OC
	7yFXViusehf4cDbqe/UvOdjJvA2lcKNosthVjGjoffHoHkHVe++J73m1M+0qd6kJfbU=
X-Gm-Gg: AZuq6aIAtQVxvD91WaS2eCX8SJMQwJDaIo2/Sjpo/ix49NPY0EdKz5+oraH105w4Mu5
	nc16Ts8aQe+QKVq304G7xCOQafvlm/ZLLX1Rbp+PyqU5zFUnHhCtt9NSeg9u+d7YQ2uFzqYDI1l
	zKh8uA3lHNQDfzEpr2HIkEewvfHmh25u/fcKSv6Lz5LA6a0/Dk/QUaYmevKbgxjAO3r3gzlw86t
	JFacO+vOX8sqfsoGjW6+VnE3C35ritrhD2BySUBl3NrDTEy+gl4Mxep/ZqRyEIaMqyz4xr1NWio
	RGB9HrCA1seBroVp6zar9zZebsEbnS9ZOwsq83U1tn1UwSMZUCk5j4HEqz247XcaGWygo7QDPRb
	ECxxn+fmDNLPovqIezxF7RbO6L8PmjBv2bF0KowvyGMIuzQSSAZ4AIw5APgko70ZnfJqNX6u7zj
	gDZ2KtRpcb6SA9mHSEIrWmmzF1/qGgrviOnSlfOFxOJti1LjfcLLInbTTqkgLE
X-Received: by 2002:a05:6830:82eb:b0:7c7:4f2:e15d with SMTP id 46e09a7af769-7d1a52d199cmr4698200a34.16.1769887284722;
        Sat, 31 Jan 2026 11:21:24 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:c7ef:51f2:4f7a:6cd7? ([2600:8803:e7e4:500:c7ef:51f2:4f7a:6cd7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d18c69e63esm7677530a34.11.2026.01.31.11.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 11:21:24 -0800 (PST)
Message-ID: <298d1c61-e6c9-4aa8-8f94-82f218ac37b5@baylibre.com>
Date: Sat, 31 Jan 2026 13:21:23 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next 2/4] iio: sca3000: switch IRQ handling to devm
 helpers
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Andrew Ijano <andrew.ijano@gmail.com>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20260130214323.236389-1-harshit.m.mogalapalli@oracle.com>
 <20260130214323.236389-3-harshit.m.mogalapalli@oracle.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260130214323.236389-3-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/30/26 3:43 PM, Harshit Mogalapalli wrote:
> Convert the threaded IRQ registration to devm_request_threaded_irq() so
> that the probe and remove paths can drop manual freeing of irqs.
> 
> No functionality change.
> 


...

> @@ -1484,23 +1483,17 @@ static int sca3000_probe(struct spi_device *spi)
>  	}
>  	ret = sca3000_clean_setup(st);
>  	if (ret)
> -		goto error_free_irq;
> +		return ret;
>  
>  	ret = sca3000_print_rev(indio_dev);
>  	if (ret)
> -		goto error_free_irq;
> +		return ret;
>  
>  	ret = iio_device_register(indio_dev);
>  	if (ret)
> -		goto error_free_irq;
> +		return ret;
>  
>  	return 0;
This can `return iio_device_register();` directly now.
