Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C522E6D39
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585993; cv=none; b=XhbhtpzNpFwK8raDLKDKH6udRxHTunJDGBgHR+0LBD3jkFDZ9d6tMS6UAS2aBTnp8kT70PGzNvvmweZArvQwhFjz87cKRUnCc7KWo55wqX6nWUssm8ejnBTFJK3tXa9fYqvcTppy+A3Fe0F7IeaWZpdeAnaJH0UFD48jN9GZwgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585993; c=relaxed/simple;
	bh=WsPqDkkR0w0NChv6i3skLUOm50mr+MhFYwPfQ2zF7hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWLPseW0MQCB8XooeEB+Q1f6ZVOXZk7VkAMwQSXe7I73Hofe7HiEscnNcG15XwAjBe6cxw0wTPfJeeb4bdAgEf4g7KitgoMagOw00/VPllaKc8joG4uMqCQNms7FTvOHOfW5le9piSzUMexdRQBqb37uKijvqUENxmw8ftL6yao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MhoH53pH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MhoH53pH"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso3428088f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 06:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752585990; x=1753190790; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VvPKW23vcGHWbJZ7ulKit+LygcP46v08cpOClJit2gQ=;
        b=MhoH53pHIJrJbX8BlEjunSGwZ+hzVoWJCZZqS67xlw8v0Ohe9+eLWEV71ASxlWTKTi
         XgmwTPzgqoFNyAyDhogL5gkWp1k0M9GmpNlAveztgqsG75TBh1pnGo4XkzfDIEO5bpAZ
         zPfVNNWHA1Ax9OEjCmocRKbGiOuvVfo/jTlDjM4GjMIMeX8mzyZwIGZfdjKC1q6VpLOi
         5wUhuQfuYUgrmno0ZCA7UbBv4TLoq8sXO7JGALeeZcb7HswAy9LV6wtJYtaIv83tq5F7
         o3yBJlameDJZ7BKzJT3Tm3PiKaf2xGg2sVDOb3aCIg9F6xtkKxHRnkb5wSO7wud5wjX+
         n3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585990; x=1753190790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvPKW23vcGHWbJZ7ulKit+LygcP46v08cpOClJit2gQ=;
        b=B2MTOmxGQkkijK9TvZpn8UIdz5NGf1anb1//UiHqCots+3ci3PFqBMYVXk9drewhR8
         i7aSi7rP/hn6co5do+reFh+84i0rwrMl/SvjxQ/mzwoRH1VkfljPYyc4BUyIP82Q6lUc
         md6UiPymWHmt58kD4mIb9/IJB/Avlm7HavrCEJl0nYOTPav8EBSfByQGMF+Gmkz94F6U
         szvkyRFVB3LaWZYB7PPHxLPLJO0+uf0pgcRVYbsAl7uQ950/klUiO/2nAb0thrOIEH/d
         YtdH+MJ5bzNi2QYiNxo2gUhvRgEt6VELrlJpxzfllsoZBv9dTzXDjDgv6r5bs2CU0a45
         gBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe6CDkzOJctGSYkq+H1X6Wa4vEmdUULtoNPUwi4On6nKnOq0QaCLGE9tE95oxQJMu4UnE+Y2cmOBbThDKlrP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLeQAOQxC7EXzxTJkE+9zh3rNqVS+4MFYCnMcuQUcm1Jp344QR
	/MTlFCMECqvHGhXlXK0HpztcL0JsVEcBrc/hIL6HVvXL5TqcVMyhc5ZOiMS+jZnNf3g=
X-Gm-Gg: ASbGncvSOMA8DafOlb4aAgUenDS3PfhniR3woa5nnL6MeGpXo/H7vgNjpXDmiMoj5GM
	FDe08u25LIqwKHnL4eTgjoxmo2zGFU/N9RC2rgZTNE2SlQP+60tuJpU1sh+TUEoc5+hCNnUv3DI
	GXPUxC2sgvlhKV+Pt2FgYrpGBPgcWy+BWPDF5wR7zbSIBZ72GC/YZgPkV8HSsT4qWZNYwbXOs46
	2RfqK7/Jgt4QM7eLprBxr8bpADTXLa4xfOgcG8QoqivBysH9tHmdZ9feSZV3I/3cWiDlZpIJ3zQ
	QfQoL+p8ZA+hJStcb7DVrwnlhcMng9ESxtyqpnj7i1uziocnqpgdBfQMrn91Kcrjqsf4qGiDV+I
	BaYh0eZwbFU7qbdPOJDeLHs/XpEInKbCKlRbMoaCRCkKkaerRYtgdnzjaCKR5
X-Google-Smtp-Source: AGHT+IE407KS8uKPTJWroRm8IILV/e+TMXBeoa0EGQKc6WbP+vL8QbjAW05nEN1glpgEAbE4/IV9fQ==
X-Received: by 2002:a5d:6f01:0:b0:3b6:463:d85d with SMTP id ffacd0b85a97d-3b60463d8eemr6451671f8f.11.1752585989943;
        Tue, 15 Jul 2025 06:26:29 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d872sm15337925f8f.60.2025.07.15.06.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:26:29 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:26:27 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-pm@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] thermal: Constify struct thermal_zone_device_ops
Message-ID: <aHZXAw08359qCBz2@mai.linaro.org>
References: <5bba3bf0139e2418b306a0f9a2f1f81ef49e88a6.1748165978.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bba3bf0139e2418b306a0f9a2f1f81ef49e88a6.1748165978.git.christophe.jaillet@wanadoo.fr>

On Sun, May 25, 2025 at 11:40:04AM +0200, Christophe JAILLET wrote:
> 'struct thermal_zone_device_ops' are not modified in these drivers.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   28116	   5168	    128	  33412	   8284	drivers/thermal/armada_thermal.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   28244	   5040	    128	  33412	   8284	drivers/thermal/armada_thermal.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
