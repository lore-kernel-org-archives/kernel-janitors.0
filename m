Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEAE1B0435
	for <kernel-janitors@vger.kernel.org>; Thu, 24 Apr 2025 07:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478168; cv=none; b=nas2JFREUd/k4FlT7MARXuVoVod7ibEEFlI0pPJ8MhRhYPTnfpHPe7GRlHH0WV8teyDzdR56EXjtPLmvEe+9XceEy635aV8lM2AKD/At9sCVU1EO7BfYyC1KGEB+SMJW8VERff5pvKz98VnGLckIClwnsz+4VDbWCT2auepRfMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478168; c=relaxed/simple;
	bh=CsVdIY8q46bTxLPbuwJ8cUP2eUiwXdsgC6RMjJcwonY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TI/0HymAjBcUzoOYnIXb5P/Uhy9gTCwarp398k/qXMgASEI+9xSrEFsf/8SBnPZ2SeRzOgiX0/bf/Vgpq8s/TFYRzig6vlyEGtbc1EnRgAHbzWDrXX3gicM4CiH7iaQyWY2FJ6Fo4aEhfgTEGw4NMeB2zQLruLblXgAbE+aTLZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PbFclHgN; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PbFclHgN"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ace3b03c043so104903266b.2
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Apr 2025 00:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745478164; x=1746082964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=atZ0zH+QTHFPwFIGyoJZTZ335IopbqtcRNNIDzNruC4=;
        b=PbFclHgNjB6RXMecnfIP+Z73qquzU3VIwvxcMjTs4FsrIcbOh/LblRF3NUS4LZfc5y
         ZpCZ8iSj72X1+S7rKtKjYOgzEwam5ASSq7FmFQsu6+NEUUwFI3PDrHuua6eXGQ1eENHH
         +gUZzwTVtO4p4o8zLhYjoXOqoCTIZjdwq43dKKMkroVaj5O7OTlYMIiWPClNx9icGA/O
         6M8yEnilRKLdmNngmnbBLtndXiezGTt++7R6Yf9ACl4E41Uq90JqzIU/pNtYPgrLHSUd
         3DH5g+7z9OR2JE8v1AsfAXbLN5xHzWveov22VvaN38zQrDfdX6aZNyzEC6IK+/wLUwPR
         s2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745478164; x=1746082964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atZ0zH+QTHFPwFIGyoJZTZ335IopbqtcRNNIDzNruC4=;
        b=GjlQzI/lKCuF/SLGhI7GpD37b/qnmwB1SFYF/cqkfO4Qn6UDJVag22sAqM48GJSK8T
         K8exop7iuhNqMnfJ0OD6llDXJghFF1R5e6b7Je/h6u/GzMqSooLwuSbpHcB3H+z4oNFu
         83BeEHMqxpG/WX/xluHF/47/CrRMIGgi3eAqficDSf6s/wGQdPorDQiCuadei+MiOCLx
         TIvQGVNLz48EYBHRL6QsK+5irsrdZa796prv2Nup73VvbIUWukV2DmJAryFtgWAEHfVh
         cYalE3uOHcYdSNdNrTcsUHhCE6Kq/r3vVYk+SlbILiP0dH8mCMLsWWtZPPKG4WuBETVI
         WxXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD+GqyVCubPbIKzl3TWRpqn/cNPq08NUq6LJ0/qO2Az4CSs/91NXR7oKyh05/lIFSuLCVjj127F6sfBFabSOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuGjikUF6v9CKfxDWkIZZ1yAkaX05Zrt7s0WyaKVdRdggwNnMO
	b2ZMKqoasFmDINUZjepcYzjCH3ALr1Pp0hVf8pqJenP9bH99kGkJqF1s0y5iN1o=
X-Gm-Gg: ASbGncvSzWTgKyJ6P8ZOXi4E16FwBpXzfBvd+r/IZEJz1NkmgLrZKMkxzbdoNXCb3Fb
	Pa/0EzPQG6crwgOHErylJ3mN2KpqumCR/uY+ijCfzFNECYT3AEx7cB/dO5EWsg/6fw3z6Ar/sSi
	wsaKZ9ono5E51gUh8j8AlN5hoylNs+3RF9I5wVYcgkzfXJ8c72CBaipy7WZE5zr1b/95uVq2eVa
	obto81XusVGx1gzCFRMvnzS/axcLZApBuYgWLMgy/OuD8bOO7rBV4cnyBdEPoayO7+m7y6Aehcc
	GAOxNR1Paz7AVZZlU31tM7dnOHHmUjX/5a3OzA==
X-Google-Smtp-Source: AGHT+IHRRXGrXUDu3+rG3nESpdOVayw7JgdtjaocMACREgykhsz0BZozqMiy2x1NiHc65DNK79egqw==
X-Received: by 2002:a17:907:97c1:b0:ac7:95b5:f5d1 with SMTP id a640c23a62f3a-ace57494ecemr146858866b.42.1745478163982;
        Thu, 24 Apr 2025 00:02:43 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace598f6b97sm57765866b.75.2025.04.24.00.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:02:43 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:02:40 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org, patches@lists.linux.dev,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in
 __qcom_smd_send()
Message-ID: <aAniEGwKKRUieo5G@linaro.org>
References: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
 <aAkhvV0nSbrsef1P@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkhvV0nSbrsef1P@stanley.mountain>

On 25-04-23 20:22:05, Dan Carpenter wrote:
> The "ret" variable isn't initialized if we don't enter the loop.  For
> example,  if "channel->state" is not SMD_CHANNEL_OPENED.
> 
> Fixes: 33e3820dda88 ("rpmsg: smd: Use spinlock in tx path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
