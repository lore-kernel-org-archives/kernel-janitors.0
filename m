Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EA712B75
	for <kernel-janitors@vger.kernel.org>; Sun, 17 Mar 2024 09:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710666759; cv=none; b=ifVlmRBFXE4KxDs2BnOf4KgUzaTE80+0qz6a9B6hXqIpNQWU6RIRZMnxepo0FfjC9kfH+pwP5/7PJlRF7MBgeWuA7s3Jo5hYRffIpPefvZ1pPo8/A8JRo2CCeYompoYij3AqhP1MsrzV28ZyNqAr8PomReB5d60nUQmndGO0qKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710666759; c=relaxed/simple;
	bh=gW1BKZYam9GmzvdvhlaE/4hVpgwic/fqzhasYGaUkbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LxBdBVtjM1gf0CwceEblyonoKeEOtxj9zit55uayPgC++nqYlv76lxMmD9S6tasUUax+M2T3T5r9VlKpdAzjXlt515hdI8VqVJDRYFPvt9SVjkLzzW1HRWgVB3uTRDrU5HREMgq1Jwb01+WgoVfLEZ5lIZUl1Aa7tStoTDmJN48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfKVWEfw; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfKVWEfw"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-413f1853bf3so22221085e9.0
        for <kernel-janitors@vger.kernel.org>; Sun, 17 Mar 2024 02:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710666756; x=1711271556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r8DXNTLTpxs7VJ/LpF9IwriPAVeo4mJMWqHjNBxBWZ8=;
        b=WfKVWEfwrLDoYNXAq3Ivc66+f7dHIg653jMUB0I5UC/7Pv99lE4587XD4r8O7njYiK
         FM5O8rmnvk5fgEsqhuK7UMRR23v9uSSa7UfhpFe3NqYpSlPjHYNB4hvASF8UkyIjMNXR
         Jzk1Obt8lq4zahuJa7vv0sruVItYtmvKpi1IY3j3Iga5X5ek2pqCzXB0+k2c3d1qyaKf
         fRLx3vfTAFZNQ+c999CMSNqr2dtUxzPZ26E9cSizDBIDR/DxEhIipxYXZtkOA1GYb70J
         iQWA5aAcBjOJ2yGMRIWb4GQ+Xlum++A2Rx6G4+76nwZ+ykPqA+YJIsRIAI1/zmubjUWv
         +VrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710666756; x=1711271556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r8DXNTLTpxs7VJ/LpF9IwriPAVeo4mJMWqHjNBxBWZ8=;
        b=VF6vosVKOOjm0+MFFdsC/Ac3h9hyfFDgLvMF+b+j5WYDimlohVd8eYqm6yibeiZki0
         T5zDc0vXGywgUaB2gkKxNhs0ymK2NL7Ris2iMdUtLP8fgOLrNlLpujnbNudu0X4swQup
         DE464VxvHVae0eOtGIrXVSHbbQ3mKcgeYJNaMp9t6wyvTnlidMWU/2t0MRWOof6KzgGQ
         eRRyXH/1p1zRZlc5kn8gu+HUBLvvYrLA3/PcYualSDIdTF1+eR8GMcSvWgxCDpZDqaaQ
         9q0m4GA4xRI0yWLuejs6ZzR0zRe1RINKCalye6+hQE6CkJrsax2WzIgA9g3XF8F6CUGC
         dONg==
X-Gm-Message-State: AOJu0YyUriTKL9eFNTsgzPLxAZCrc8qg0RwhSsQ/iSqOxpPL7ByFkjUH
	H99iV8x6bEaahVjgwBxGSzk8T96gyrDCpcbeJTq/UuYnTC4XnmWxC9E6PPYs
X-Google-Smtp-Source: AGHT+IH6uNgv+b+6FJg2zNyPUVKkECG15iy3w+uHR9OxLFiO8mH2WT6SRE7cCaECaDXUGamsj4yXgw==
X-Received: by 2002:a05:600c:3f90:b0:413:fff2:a7d1 with SMTP id fs16-20020a05600c3f9000b00413fff2a7d1mr4766499wmb.29.1710666756057;
        Sun, 17 Mar 2024 02:12:36 -0700 (PDT)
Received: from [172.27.52.77] ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id p36-20020a05600c1da400b0041401ebb6bdsm7271084wms.38.2024.03.17.02.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Mar 2024 02:12:35 -0700 (PDT)
Message-ID: <f09666c8-e604-41f6-958b-4cc55c73faf9@gmail.com>
Date: Sun, 17 Mar 2024 11:12:33 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] net/mlx5: SD, Implement devcom communication and
 primary election
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: kernel-janitors@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>
References: <84c44ab9-46de-4380-9e24-c0841ed3db52@moroto.mountain>
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <84c44ab9-46de-4380-9e24-c0841ed3db52@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/03/2024 17:19, Dan Carpenter wrote:
> Hello Tariq Toukan,
> 
> Commit d3d057666090 ("net/mlx5: SD, Implement devcom communication
> and primary election") from Feb 14, 2024 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/net/ethernet/mellanox/mlx5/core/lib/sd.c:221 sd_register()
> 	error: 'devcom' dereferencing possible ERR_PTR()
> 
> drivers/net/ethernet/mellanox/mlx5/core/lib/sd.c
>      206 static int sd_register(struct mlx5_core_dev *dev)
>      207 {
>      208         struct mlx5_devcom_comp_dev *devcom, *pos;
>      209         struct mlx5_core_dev *peer, *primary;
>      210         struct mlx5_sd *sd, *primary_sd;
>      211         int err, i;
>      212
>      213         sd = mlx5_get_sd(dev);
>      214         devcom = mlx5_devcom_register_component(dev->priv.devc, MLX5_DEVCOM_SD_GROUP,
>      215                                                 sd->group_id, NULL, dev);
>      216         if (!devcom)
> 
> The mlx5_devcom_register_component() function returns a mix of error
> pointers and NULL.  It's not done really done correctly...  Here is an
> explanation of how that normally works:
> 
> https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/
> 
> mlx5_devcom_register_component() is not optional so it should only
> return error pointers.
> 
>      217                 return -ENOMEM;
>      218
>      219         sd->devcom = devcom;
>      220
> --> 221         if (mlx5_devcom_comp_get_size(devcom) != sd->host_buses)
>                                                ^^^^^^
> Dead.
> 
>      222                 return 0;
> 
> regards,
> dan carpenter

Hi Dan,

Thanks for your report!
I prepared a fix and will submit it soon.

Regards,
Tariq
