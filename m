Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3A92E7BBA
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 04:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764303127; cv=none; b=UvYzxWYwOxCYRN/OWrSgZvo9II4n55vBDsjDL/b+zLI9pUraAFzkEPxZdNOLIGqCk/tnRqD+gXNexkxI85FNA2k0JSKULECdZo/5Ne/pcdMzIC6mCtTqhlWRtDyECinQKPFQuZQuLMvA+1MeAAUO5fT0RbrPurg51Wc9oAxfmLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764303127; c=relaxed/simple;
	bh=1OkvqsnuHvvKMtxEdIDU0jBVTCmEE/rE0VnSDZkSX60=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LbDQwpDxB/s3SUV42mcoTsFUJ/KPgNwVCo9eEc5vK04YrDSev3BYkpZvzP6LVCmOpijkUo1qo3TgcS7V9BMk67i9WlUx/GcKHh6wnAl8l6VkHf2Knw6ebkNjntq/UpDJsarMl5iPckl7f3X39mx67kr4QdozAhzMmE/ibvfftIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOa1UOKH; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOa1UOKH"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-299e43c1adbso2363405ad.3
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Nov 2025 20:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764303125; x=1764907925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zh2ZhVb3HKdajlhfDvy/KK05hekc0IF7Em5Uv94QADo=;
        b=QOa1UOKHPGiUKjc4S+1v0vplO0gDx9obBRuscQvMvZLRxkVBhCyrl8nar8Pjg0erM4
         Cf0Z/s0ueUpG8/YeLrnfmAEZXEvRFk3W8VLlBd9sg8fq5PzCFogX/hn9vg5gi9rJo9f+
         IgwpB/4gRKIa2C5Pa2IcWGS7/WJNgruTpZts/fgDZ+b472UNiL31HOBH6m5Mrnmbv12y
         ZyrKxiwCO1pcf5QAUSQTbNgunWCFJOJ0+a5U/jaAQD+IrctIJRtX2FibW1ddekSkakBb
         UqH3xGajciTfqdSdb61mz+InNI6P5zNwF82l/AFnhbuzZejKOURtUbTkuL9Ffo71pKXn
         L62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764303125; x=1764907925;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zh2ZhVb3HKdajlhfDvy/KK05hekc0IF7Em5Uv94QADo=;
        b=ObSFR/m5cQIj1tCdTaNi4Hg1hQws1GkBYzCbVNamK06pmVZv41sxtplTC6NxetNeo/
         y6/dNiOJ9SAZ996MgNKLh1kcXTc2yiaRZFwyAUKYpgI3/DaC3xs+xd7t7x7F0ilURuq1
         ON8cW3/iLdtyzu6Y45ncEyIA/ObRbuFn4HgIsE3yWSJ12vW83IPewSHs5UGKBINK5TUh
         iFIXK2DeAgZT9m/HNzhlsdCbbuIYCvZMVjJWYiWzqjSyVzQ0beMB/n5Rgspb+qfhg2YT
         hf1UZXjfitpThYmhIhXXmMPWe97GSBxLDsrZgjwfLnzzlH/fAwy/yfL8+S0iZsuWuhdF
         AnHg==
X-Forwarded-Encrypted: i=1; AJvYcCVgGC2CfxZFp5B4dRFckDZ8UkdHwMLbXBw1s6IPjfVbDO9iweZcyWQvNj5qO/3eGnerIrpkAAPqFcIAPFLxsYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzgG1A7MOSmOwQn7rIFsufubNANhiMV+VZvo0y5QGJy+yJOrxJ
	ISLks6R1mrO0SazEc1CSHQd8NLpPGrNnpYPrteNvdoGMYz8K/lvf+SlZ
X-Gm-Gg: ASbGnctgHO1uFr2p9zUNdsRUftXxvAUMVPFN6PvW7+E+mBeqfUocauh+dfyoMxsGXRc
	UPmcgIPPV6CCLAEQodJx7W+AxuJQ3cU4RYVZgsfp/mV6DHp8qOx3qifu9BbJ3303cSo+d8kryLD
	l6nVUXwoFvrMCtVnXPj71ixhplir1RBvHPifZvxSXtkf+H99ZOEuHZnq+09iLYqUWUpnEuFgejE
	681Kbt9ZwrIE8amQoJjcumSXBQiXtq0zsMj4aHRb5m7QdmsBDbGQm7hdL5U+y6BiciVdI7SYmK9
	z6m1I/AQsX3quF7Px96sU7yZC9j7/8hOtp2KhRkcKlhhXwNm3fdYJdyo35nk8TJwO4rzlNDyHn4
	Pox5/5ngoGgQYvqm4aGSAkv8G7MDO6DaTTbDBftoqN621YAdNueuui9nkSXRA8tApQAYppamcW4
	XoV9cS/WIEXUSDYc7P2Z5zTWqg
X-Google-Smtp-Source: AGHT+IGz6a7BqLZK9rwwKjC8VIcpixC76pih5ajsSv8w8cggc9y//rlM6htS2MH52W2TF9bXc/KI2g==
X-Received: by 2002:a17:903:1b05:b0:295:70b1:edd6 with SMTP id d9443c01a7336-29b6beae519mr177542275ad.3.1764303125334;
        Thu, 27 Nov 2025 20:12:05 -0800 (PST)
Received: from [192.168.1.13] ([45.144.167.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce478762sm30721415ad.45.2025.11.27.20.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 20:12:05 -0800 (PST)
Message-ID: <4c96af12-cf44-4028-b3c4-4ce9314c4733@gmail.com>
Date: Fri, 28 Nov 2025 12:11:59 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sun Yangkai <sunk67188@gmail.com>
Subject: Re: [PATCH next] btrfs: tests: Fix double free in remove_extent_ref()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <aSf6UHCbZrgZCQ1L@stanley.mountain>
Content-Language: en-US
In-Reply-To: <aSf6UHCbZrgZCQ1L@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks. My bad.

在 2025/11/27 15:14, Dan Carpenter 写道:
> We converted this code to use auto free cleanup.h magic but one old
> school free was accidentally left behind which leads to a double free
> bug.
> 
> Fixes: a320476ca8a3 ("btrfs: tests: do trivial BTRFS_PATH_AUTO_FREE conversions")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  fs/btrfs/tests/qgroup-tests.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/btrfs/tests/qgroup-tests.c b/fs/btrfs/tests/qgroup-tests.c
> index 05cfda8af422..e9124605974b 100644
> --- a/fs/btrfs/tests/qgroup-tests.c
> +++ b/fs/btrfs/tests/qgroup-tests.c
> @@ -187,7 +187,6 @@ static int remove_extent_ref(struct btrfs_root *root, u64 bytenr,
>  	ret = btrfs_search_slot(&trans, root, &key, path, -1, 1);
>  	if (ret) {
>  		test_err("couldn't find backref %d", ret);
> -		btrfs_free_path(path);
>  		return ret;
>  	}
>  	btrfs_del_item(&trans, root, path);


