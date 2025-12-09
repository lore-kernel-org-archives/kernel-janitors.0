Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC852FD69D
	for <kernel-janitors@vger.kernel.org>; Tue,  9 Dec 2025 14:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765291061; cv=none; b=a1zQ6GNQ6EnLkYQmp93Y53WbxjJynUqwkKJ9v9lI3bI6qGUtxx5n8YrYnX+M/YdmY+8tGCORXJB/hP12x5PUV9XmWIbw3MF0nathM5m5bZEi2ZA0eTWbSbHIdxulY3U84VMsZlLl9dPJGD4l9eAi5kylpgtSjs+Kokx30wSjTGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765291061; c=relaxed/simple;
	bh=FvGNQ93BnOKGTFRoXunqjFw6C8IGuEm1oHOP9fxSZhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTdHw+RC9k+nT/HEemUjQ9KpjpA0LY07yWxfHCQTIXbgDc043iimYPukx7QsHKd0NxarZxLpTpqjQjPkquHzPKFfh20jgO9GO1t/wy//DDPEDAiRC5LhYN869s+ye4vR4jy8xUNW68gev4VuQIgIUEt+X2qCMgcxslVlh7r0gKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XiuIXCJ9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XiuIXCJ9"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47774d3536dso54546255e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 09 Dec 2025 06:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765291058; x=1765895858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BldK9Vs6IjF0wInmk5nYkJAUfe1JnCd6MJmegFzUQbI=;
        b=XiuIXCJ9uQIAHXsulJPn5dMYLMBrLA9x0SkPX5PIWafEH2bwFEYWUEv8zfmmTlB9sd
         9LFpJG83cAdZ8dR5B2H262CEdo/iwSBxcVcpTefrqK3wnRZsj/B3PobqJcFli3GNDj1y
         ZeK9YgG+UvBRtRjRloqnNfKWKLgWR1u/xRu7uDYlPyy/WRTaU+ubs7VZNlvs7rQcjVQu
         FV/A+2CiubG2adfC49GthtEkeiQk9UD3If5gAN2ub5OfkmDDaz8c3GdznP+ysZZqXQzK
         wbaZd0iPhODZ6IpPnFq8HF8RXyom4PnbSGH9wuooG9KMKNvcJ5940y57lGm3Jy9e0D9P
         hzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765291058; x=1765895858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BldK9Vs6IjF0wInmk5nYkJAUfe1JnCd6MJmegFzUQbI=;
        b=ptLY8YD0dNWh61aZcsr/cQxhC5rMyYWkzft+c6OIpRz87+OEvgbHd0GHYGpbL4fN14
         9O4BGLzXx+kKeVsTnPW2iBaVUrDAbmu31Iu/orrEtdG609a0hyzEdtiTz4Gzf4gLIg3z
         fDqFK3uPQg2IuRmRWq8znFKUA/ECCeWhRD8s7J5gpeuCvC8EUqzXCBRBUcilzmsr1qjS
         DQNNdvSQFRPipBS4LLG6IyJGlvrVCRUV329ycJsVwkRlvKmDa6EaCnbd5amISnkIEQdM
         NXO5pRGPYc0nD3jfTYFFQDbVpMlCj/0U5CHBwD2Kj4sb3Swm2RuMwrK43pXmaZ2lKhR9
         uzhw==
X-Forwarded-Encrypted: i=1; AJvYcCXoM4qrZdBGF0dFhZurcSMgZ1JWwffgIfcpRbpa2rlxpOODafGYkF8vWr0Lr3VC5pNhtdaKW5VeXcp/Cdm+cCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBja+TfveS92egpH50ys5e4/ECO1yviapnpchlimbpAXFqwJ/R
	954dpJSQnJbYANBVPXvTK1lkBnJvDKtMBNsc4puDQUY9SKeuEQ6rFiy54Ogbh4ogSTU=
X-Gm-Gg: ASbGncuMPl7irF08GiF9Qsn+hyO8Lh9g60HVdtmK5weF2b270zXofijDsUbexMenPz6
	etvDlyJLbxVH3dLFEcQpxzjv65plTNDbU2artzj2xrGsQ71n/36xyjKQjCnYBD1VrTPCdzM5rAG
	mwIZUbBDDBnWZPZoyR+lxyojyoWeSLf9ehrEtAmbvlxDKVnhlZ33SZK5yfBk45318w8pfEXpjk7
	dlv+YyG07K9/DPDzAOUanTESznJ5Jep0FiCpcZbwXpascmSgai82zYXm2ePuPuqsjN2Z+Bik/qi
	5TMV/3sqZmlUxOdNluD/z0+JgrjsmWopAvnRUzz1fWgxSbbag4VO2zLsg7YUrKKOg62sVXcdYCH
	SlysVFDAWHg2T6agmqobWS5teZ/OrsPfH2NdIOCkIziSNymuCya5LUY8qcj9BR8jpEJgR+UqzGM
	VVL5nbGnidJ8nwcScS
X-Google-Smtp-Source: AGHT+IGgI4wHvC+9WKvHMH7aD7uf0OW61Hf4TKPveUTQeZQVMn9uixyJZ3HP6SThVBqnKYajIH9pQQ==
X-Received: by 2002:a05:600c:6d54:b0:477:991c:a17c with SMTP id 5b1f17b1804b1-47a7f9190e1mr15368165e9.6.1765291057926;
        Tue, 09 Dec 2025 06:37:37 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d367dfbsm21472605e9.2.2025.12.09.06.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 06:37:37 -0800 (PST)
Date: Tue, 9 Dec 2025 17:37:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Borislav Petkov <bp@alien8.de>, "Luck, Tony" <tony.luck@intel.com>,
	Aristeu Rozanski <arozansk@redhat.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] EDAC: fix a limit calculation in calculate_dimm_size()
Message-ID: <aTg0Lsj_3bMrsrt9@stanley.mountain>
References: <aTK9mKTphPwuR7qb@stanley.mountain>
 <CY8PR11MB713404B614F5D046E94DE2A289A7A@CY8PR11MB7134.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY8PR11MB713404B614F5D046E94DE2A289A7A@CY8PR11MB7134.namprd11.prod.outlook.com>

Thanks for the review.  All good points.  I have resent the patch.

regards,
dan carpenter

