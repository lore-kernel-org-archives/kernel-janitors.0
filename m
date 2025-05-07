Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374E4288CBD
	for <kernel-janitors@vger.kernel.org>; Wed,  7 May 2025 13:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625791; cv=none; b=PPYCqHayv/QXx7IFsFIs98MP8JuGlTC9uQAubJTuFcwq2ex0/zZEA5Oep4+g+yyY4Ln3FX45IxUMP42toYsE1jtJyWo+rvEupiriDh6xadaT9lCuhkVj4QO2oxNxTFeNhGQm7UV1Jau//BMPKzeDn+IvN6TaYCyPlfZAM66WwkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625791; c=relaxed/simple;
	bh=w9dJJZAfLFUz4sepGZ4yAHD92WyyzbYRQNOBLcVmWcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8IkEQDpBgU83Lkzuq+4+/aPjvSNSpUqWkG5qYvq/vWpAN+TJHkF1jSoZHFrEfL88DE94h3HJdmICkgN7yuALVHv/Ssg3bmPqGrYNp7W3bzh+EVxrWBWmqF3JXBo5FNIBYWEdF3YVzf01sMNCxTgJm0Jg3oInMrViHkYCAg81xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xMOwG7NA; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xMOwG7NA"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-40356cb3352so652715b6e.1
        for <kernel-janitors@vger.kernel.org>; Wed, 07 May 2025 06:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746625787; x=1747230587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N2E3azbVaCRVDrY4UnTVOScgZIlfU9ExUYdpv0XY9P0=;
        b=xMOwG7NAiSA4M9iwSSzzquNz/WWG7vxM4jBE+hXIPioIrtEFMqxV7FD9O57Pdc6SZO
         gOLxTBFvr/Ficn3HfyB+izDOblNKOtc64bzwzSjlqlXSXMZwe4+UsjZP8THsXj6x5gOs
         vwsyrdnV9IrD/S84OtsH49vuaUeBaEPb5TWiAE7IVVahjO99L/oqd1DYYiamucXtfKal
         enjJyHLZJ9OvnnWkpJE5bD0eg3Po120jv14zqsWw9zlkZfQsm6QCEcqPVxmFQJqY+AL6
         VHXrTkqCpGfsxiKXlHnWMrGUhRw8vv9tIhIuhzn8qO8s99MRV4V1179SvO0llEH1Wx18
         B/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746625787; x=1747230587;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2E3azbVaCRVDrY4UnTVOScgZIlfU9ExUYdpv0XY9P0=;
        b=dD2kHb9T3Xw+RmrU8DP3iIad5LiVclIZFVi+JeG/glT/hIb4T6oYYF7O7MnQpVkQkA
         b9xlPDyjMLRoHk/uLikPfEZshnzs3kjJVR8a30G/RwXgD4OXzGte7XnF5/iLNk7wXUAg
         0ASbL2KN0j4G4OaqlAdGvkmuEA7lSiCDJzXdn1u7+/WNXFDGn4bxzGVAxqGP/0r2O7q2
         a/8VWJ+rg+18/YISjcTZ07NofAVS1FJK4GxyM/bWRJzxffjJB+nlnyWqQcaVNyZqyq1p
         2y3dA/5Nv6Q7yj3CMxmgG62lf+rdm3ZKdCspRriCYz5OnyYoKB74tD7CEmajIvgxAJoe
         DK9w==
X-Gm-Message-State: AOJu0YwvNDdMuVYu0t0MEE3Vh36wdi3PanYhxSW4cXG/836xKiStTtgT
	e2Jm7IAs3MBC7EBU6H5hE2EGOPDtIaBIHR1zzD64w6Gv+ZLQ60PoJ0A1pnv71Y8=
X-Gm-Gg: ASbGnctshh98VLxKm5iKNBDGyDho98ry8PPRealU4OXC9Acr43JePrKzE5qAVUrHugL
	chtvk0yYoTxudg0+y7tHgIPcYzVz5Md7AsQMQBLVnxxYmaCgbzPdgr40NJCfliMNG0Wz6aN2GsV
	tQ5dcCOdVNrXSvnoN9ID540VQaXZNncG6d1vqC/bWmJyplWSjkgIVw6T4oOprDOVwqpjJG6O7sG
	PQMMPMCXXbQoMyHP3MKdzGdNBzIArtnHexVGnHxuqaA3A6FQumLzT1oZqDfKfdQ7QBtUWMUN2hH
	7GbYBHqTsvT8MngDTqB0Z2MaBWv+0lX3SpXn/lUoBXHIvtxjozjyDKQkGJzbFp1HHMxNWZtArv0
	+2po+zts8SDq0VBc=
X-Google-Smtp-Source: AGHT+IEkqfDH15pjFTL4cZA58InYNRqoavGNSUddgSHwMO1Pw7iWYqyvF5hpJ5MLza2jpw+neoIdHg==
X-Received: by 2002:a05:6808:178c:b0:3f6:ab0d:8db1 with SMTP id 5614622812f47-4036ea41ecamr2103982b6e.3.1746625787217;
        Wed, 07 May 2025 06:49:47 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:3356:f6f6:bf76:a32? ([2600:8803:e7e4:1d00:3356:f6f6:bf76:a32])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7fe84a8sm2683429eaf.36.2025.05.07.06.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 06:49:46 -0700 (PDT)
Message-ID: <fbf6c7ef-3680-40ec-8c90-121e6a635b8d@baylibre.com>
Date: Wed, 7 May 2025 08:49:46 -0500
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] iio: admv1013: replace redundant ternary operator
 with just len
To: Colin Ian King <colin.i.king@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250507134502.254736-1-colin.i.king@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250507134502.254736-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/25 8:45 AM, Colin Ian King wrote:
> The variable ret is being assigned a return value and non-zero error
> return paths are taken at all stages. At the end of the function ret
> is always zero, so the ternary operator checking for zero ret is
> redundant and can be replaced with just len instead.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>

