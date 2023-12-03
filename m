Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protocubo.io header.i=@protocubo.io header.b="PFZlmOrf"
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63CC8CF
	for <kernel-janitors@vger.kernel.org>; Sun,  3 Dec 2023 08:37:29 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d0521554ddso12967545ad.2
        for <kernel-janitors@vger.kernel.org>; Sun, 03 Dec 2023 08:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protocubo.io; s=google; t=1701621449; x=1702226249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oN/yJUhMwL79dfAOb7xMA38chypyQ6z1ZfDrW5oW+IQ=;
        b=PFZlmOrfgT+TLnLb7o5o36bU+jR6twG5EQPyq78afl/vpKDbEImtVHF4sqAD+AxbKD
         RMopbk7kCppv7RZZZkLIQNhr1L+gM8ktfIITvdI5fAcfYcjWVp3/O+U78/9nitVruHMK
         lqizRVhTS9pfe3YP0x0AZktCdmNLGtVkkm/xBb6kPXsC5lbQLXQMMwYC1PcvpSq0xNU3
         YLgrPX3aOGymBc4hcp2V8YksnBnQt+juV8wG8kpy+g2GvEIlYQscn1S9lVxxWkaVy74y
         A/5Au4M5vYD2ABVrFVOuMMcLDctL4RUIdgWPON4YLMVf+Hd/4+meaItnuWFpGNb2CrYG
         ybCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701621449; x=1702226249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oN/yJUhMwL79dfAOb7xMA38chypyQ6z1ZfDrW5oW+IQ=;
        b=XusnxwEeySLEpzMiPx7pbZHjusG58n6iRSdqRPhd//nnmc5rZn7amG92rZoWXqW9fY
         XHmqgXG/34kZ7JYdfdHmTXFzYorf99FKC4KIQpbn+iekzR7UdSafjIQ2ETi9L6YmNG5V
         s6hQN9sA7EdKxjrZ1VuRjjjQVHSwel1jlkOryo7pFb5+NIHaF5NVbhDhAPq57uDJlfIg
         9eb0F7SLtjiONSfmzqMRLc/K6fNlmuuOu1RHvWqVaA3JCncEMD8iomCvuM7DV/uXkKYe
         8tDq5Y2zrPTDSEdPfDaJbB/SPl7e8q33MR3fnSQATDxENRTjUzmFeYDWKvw25c+TyE4T
         9EQQ==
X-Gm-Message-State: AOJu0YycvnlRROCx5m+CC/UCMv/RbMRC08TztJBm345OiBzlGcEMI4Du
	Tq4LybJEVH5eoL4baabWi7impg==
X-Google-Smtp-Source: AGHT+IFWA+NXItEk15KRrI3cEY2/hp7KUfcLGuLlC8iP184T/bplNut7AjkaNMhp6lc3+Czi7SkTIw==
X-Received: by 2002:a17:903:110e:b0:1cf:51f9:197b with SMTP id n14-20020a170903110e00b001cf51f9197bmr1361054plh.23.1701621448844;
        Sun, 03 Dec 2023 08:37:28 -0800 (PST)
Received: from calvin.localdomain ([2804:14d:5c5e:6991::1000])
        by smtp.gmail.com with ESMTPSA id q32-20020a17090a17a300b002860a7acca1sm6998750pja.10.2023.12.03.08.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 08:37:28 -0800 (PST)
Date: Sun, 3 Dec 2023 13:37:24 -0300
From: Jonas Malaco <jonas@protocubo.io>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Aleksa Savic <savicaleksa83@gmail.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: nzxt: Fix some error handling path in
 kraken2_probe()
Message-ID: <jhsc6llznv6ba5j73azramykyqfzvoxq7ynv3xxxef4svgs7yh@ccdtwinfvmdn>
References: <a768e69851a07a1f4e29f270f4e2559063f07343.1701617030.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a768e69851a07a1f4e29f270f4e2559063f07343.1701617030.git.christophe.jaillet@wanadoo.fr>

On Sun, Dec 03, 2023 at 04:24:05PM +0100, Christophe JAILLET wrote:
> There is no point in calling hid_hw_stop() if hid_hw_start() has failed.
> There is no point in calling hid_hw_close() if hid_hw_open() has failed.
> 
> Update the error handling path accordingly.
> 
> Fixes: 82e3430dfa8c ("hwmon: add driver for NZXT Kraken X42/X52/X62/X72")
> Reported-by: Aleksa Savic <savicaleksa83@gmail.com>
> Closes: https://lore.kernel.org/all/121470f0-6c1f-418a-844c-7ec2e8a54b8e@gmail.com/
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Closes added to please checkpatch, not sure if relevant here.
> ---
>  drivers/hwmon/nzxt-kraken2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/nzxt-kraken2.c b/drivers/hwmon/nzxt-kraken2.c
> index 428c77b5fce5..7caf387eb144 100644
> --- a/drivers/hwmon/nzxt-kraken2.c
> +++ b/drivers/hwmon/nzxt-kraken2.c
> @@ -161,13 +161,13 @@ static int kraken2_probe(struct hid_device *hdev,
>  	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
>  	if (ret) {
>  		hid_err(hdev, "hid hw start failed with %d\n", ret);
> -		goto fail_and_stop;
> +		return ret;
>  	}
>  
>  	ret = hid_hw_open(hdev);
>  	if (ret) {
>  		hid_err(hdev, "hid hw open failed with %d\n", ret);
> -		goto fail_and_close;
> +		goto fail_and_stop;
>  	}
>  
>  	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "kraken2",
> -- 
> 2.34.1
> 

That was a silly mistake from me. Thanks for finding and fixing it.

Reviewed-by: Jonas Malaco <jonas@protocubo.io>
