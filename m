Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A017C1B0F19
	for <kernel-janitors@vger.kernel.org>; Fri,  1 Aug 2025 17:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754068941; cv=none; b=Xkff6ve/nolKzoVIrfCJgHInXnol8VafVdtcQNCeb5+C/LNEfr0G7awsHy3zATT4XOIzlJ72Dfpo/GNg8CajLJ2N1PJNuGReKxmhO6G8JSYqKb0joU97hIqJLU6rWdw3Nkf9u2/PIv8IGDr47HuZpDoWCT8bgmgxkhuOnFuAJaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754068941; c=relaxed/simple;
	bh=F4U3zLqHM8NpqW1pxXipEfzZi7+0Ycu/7mQRmHJXjNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mn3zjYL6Vz6IjAxIidX8hwlCzmD98DpFzU9/o2WAmZVK7X5hH+bium9aWat/HucBM7rcEdG2xT39p7vYcuyVGneJ1wMxzYbbmogP9p+UPtVgRl7m+ZEzgLL/BxZAy0pPf9o0qLtA/YEFnjBoheQunaM2EkFKGWOmWWI/X+LTtHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h1LrvfmU; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h1LrvfmU"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso13131435e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 01 Aug 2025 10:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754068937; x=1754673737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3M/PDNKda01rnV3OeJ4NocScrvK7XCljjn5Nn7NUvKM=;
        b=h1LrvfmUw0OzSRB7ak5Wyus2nhqdj3beFoANdHEK0uZycmnGOVSVVJXNMmqaqU22bl
         DFmjBQo5Bc8Q+8YBEuNao6NHaG8eVvLHUTZe8HpuZfUZCzL1Z4PAjumZ5BmvDX3p1hQA
         DPNIzrMHpeeFslE9ri0bFdkM5kSZf90Xpdi8RZmyFyP6l/1oj4h6SQf123y4XHAOnm3D
         LdB2v0AXA/6z0d5MQtxWjACaG+Pt8W5QamRAe0kVfCoBjajHXnTk2HGShraEqlHk+G1k
         sPB7aQ5Im3BxE3IxypSDj+LQi/bKdCc+C07por9MFdL85QUe2zclk33INcvYiGoFCAjw
         EoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754068937; x=1754673737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3M/PDNKda01rnV3OeJ4NocScrvK7XCljjn5Nn7NUvKM=;
        b=PEQQOqpEwuwJFhwl7Qd+8zomQucOvyzFG3aEwFfP6PzfUYcqdEKlpqLfeeEdsNVWDw
         Wqrpb70jDx5/id1YPkZ5egyqKeVsDn/aD2gEXLbv8E3IM4Z1p+eRK9ugt5IOP7e4OmrR
         VF52Db/TGXovVj7SMSbpSCi3oW9ROCCH8Thi+mtjWEiPf30/3HHWOy6vd0fGv0aP41PI
         7CbIKKfQSUX7hf8al+a/Al24UARGmqczCcx71VZLDsYjFNHqYXUHrotdjYUrVm0sVwnO
         iHsoNS16N8J2yUNBjdDwHpC/sC97HVbkKVKHGH0JcWCjqs003pbglGZCqYM/bwahzIHT
         YsmA==
X-Gm-Message-State: AOJu0YyrDFGwVwuuAIYgtXa3NRQD1acfGw/wJH7qT86jBa3uRPkpCJNJ
	2mh9EeCt5Fsp7QaDEngDOkMA/0Z4fw4qHd537QBSDCBpY214H+ms2Fsdy7tz4rSJV/0=
X-Gm-Gg: ASbGnctZfjR91lMfoD8Un81hLmMbPsQvJo3j1Mg+BnpKAeUNuEoq7JXSU+YzEpXjM+D
	7j33feuKHUf2o+PHmgxGrdlzTbMuz8WlJ6kCkFVTbgm9N2ipJfrR1UlD95qoUFb/9iobT4zOJxq
	7hAmx9gfKCCEmFWdPlpOhldd5rrwYCQbXSfLQBD3dDoJnIQyRiX1iHskc9jWO79qySM/privhcG
	sl+azBzpsELQ2kptiFovaNbsnziiAjDyEWWG+SfFYx2OEY/AhQyo1T7oQWuDdoZFazXjrlHvIaB
	Eqf08ciaMnCrqntw8xrmB4dCc0xbFyKpH3lxNLCaxADotTulYxS21IV5I2BGNBDJJ7vZ/dTEROu
	LQWEK9x11M38/ctryhxueYvjvKj9Q9A+bwIM7kACMqvecF2grivvI+45PNUzsAA==
X-Google-Smtp-Source: AGHT+IEr7UdyBNz9mF08fNxf3R1Ysej2mqN5c0NMeUJedJILvrCdFfPD3tDpMYty7zL96HPHkqBLJQ==
X-Received: by 2002:a05:600c:1554:b0:456:1611:cea5 with SMTP id 5b1f17b1804b1-458b6b58472mr716105e9.18.1754068936946;
        Fri, 01 Aug 2025 10:22:16 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c453ab0sm6681912f8f.44.2025.08.01.10.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 10:22:16 -0700 (PDT)
Message-ID: <d29b1e05-f783-44ed-a2e3-585a191ec426@linaro.org>
Date: Fri, 1 Aug 2025 19:22:15 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] thermal: tegra: Fix dereference of pointer tz
 before it is null checked
To: Colin Ian King <colin.i.king@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250730135441.2078022-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250730135441.2078022-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/07/2025 15:54, Colin Ian King wrote:
> Currently pointer tz is dereferenced before it is being null checked
> leading to a potential null pointer deferernce issue. Fix this by
> only defererencing it once it has been null checked.

Actually the callback should assume tz is never NULL because the caller 
does:

	ret = tz->ops.set_trip_temp(tz, trip, temp);

So removing the NULL pointer check is safe here.


> Fixes: 6fc2e1a5f98f ("thermal/drivers/tegra: Switch to new of API")
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/thermal/tegra/soctherm.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
> index 53a5c649f4b1..53fa6099b67f 100644
> --- a/drivers/thermal/tegra/soctherm.c
> +++ b/drivers/thermal/tegra/soctherm.c
> @@ -585,14 +585,19 @@ static int tsensor_group_thermtrip_get(struct tegra_soctherm *ts, int id)
>   static int tegra_thermctl_set_trip_temp(struct thermal_zone_device *tz,
>   					const struct thermal_trip *trip, int temp)
>   {
> -	struct tegra_thermctl_zone *zone = thermal_zone_device_priv(tz);
> -	struct tegra_soctherm *ts = zone->ts;
> -	const struct tegra_tsensor_group *sg = zone->sg;
> -	struct device *dev = zone->dev;
> +	struct tegra_thermctl_zone *zone;
> +	struct tegra_soctherm *ts;
> +	const struct tegra_tsensor_group *sg;
> +	struct device *dev;
>   
>   	if (!tz)
>   		return -EINVAL;
>   
> +	zone = thermal_zone_device_priv(tz);
> +	ts = zone->ts;
> +	sg = zone->sg;
> +	dev = zone->dev;
> +
>   	if (trip->type == THERMAL_TRIP_CRITICAL) {
>   		/*
>   		 * If thermtrips property is set in DT,


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
