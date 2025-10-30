Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38006223311
	for <kernel-janitors@vger.kernel.org>; Thu, 30 Oct 2025 13:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761832065; cv=none; b=oXV1Yak4mWSRJK7hyNjBVY2E0hnZ3IZSnSveV1oBHLagBibDW5tvPEfcAiCset248BNdrFW5hECG0vKz8qqS9x5g/CCLVlDE3B3H1KsDRl2nJo6HWlxeSiF+f71aggvn4z3mBMvYG0UGKaMc47a5sKs2wSaKTYu3E1e3yQSUf6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761832065; c=relaxed/simple;
	bh=AY+CDBY4PLxI7P+PpNy9Oj0nzr+S8UXCYjUpKPKUffI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fiuur5yAMLGtP6l/qdkiT84lhnJYaA89B+WSs53VdvKIH0X030d3z3i36hkZzI4DgiMKI7gnhqgo3rKL8i/cztTUJKTQ4gA2kVWbQrodVPXOKLf4GgrFZul3KG+HkXbH2kvZU5VhHQACUYXNvZ3d54MUHsk9tBIk8xOLxvKHtFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l+ukieSB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l+ukieSB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-475dc6029b6so12242335e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 30 Oct 2025 06:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761832061; x=1762436861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N5oy551G97AvWTlfPjNACgXvTrySxuVW8nynKmQcNfI=;
        b=l+ukieSBM7ZgAi1PKTt1uya7Yz4sv/bVf/s7tVDAIJt9vbc3o9JefAyUE5jPz6wnCP
         kjryk2BjJSRb6xw3e3B8c1WAXgrJDWxTrFvQTcyHQ7MbTiITPhgcEXrmzQZRN09h92qI
         vd1ex7+US8C+He3/sH/TLwY3JDdv0dOgG6oMT5WFBRDd4dpHhtP9AfYNqmUEf6cu4J7R
         gMd7ceagQ9BRMY2Lg5/0ijL/J78gbWdScoCGEZ2Gw/4/HKMqEii2JzO2juquTgnDJqdl
         qd6NW1Rjh8YE0a5INsH1XowZ7H9yt1fb2n9iJhhdwGmNWQjyw/yqL48O07nhyG5/mgXR
         1pyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761832061; x=1762436861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5oy551G97AvWTlfPjNACgXvTrySxuVW8nynKmQcNfI=;
        b=drHVdgEfqx20NAarj1Xh/R5WhyuJOk3cWtrKTKEkuJZ0ckJloTI/A2guCRz34UZNBV
         rv7ov1btdTNkCswHWxOol0QWu5oGZeP/vx0AQi5gLH/IMVk3BtwFQC2KIHAQ8pbU2byb
         2hYpRgMwZ5pt5wUypZ/ItF37R4t93qSnf0lV8n1s8RFaEg63xwu+CpLybnaeBr21Agbc
         Pyim/YutimpN46zm/3oPKrhQsx/ltU1fLDq7wG1lyTrgmqQNf3XgQGVwAbCWthNbD4WV
         b0TgNndU4up1LLaVKqdzWNKtVQ45GRZ0HwYZNxZFuuBI/OQ4Yi+Wk3/R/1E/X0/PJv5E
         kitg==
X-Forwarded-Encrypted: i=1; AJvYcCWAp0MAcLcneUeMYUB1HwRO9J57i7A/VY+hNdV59YNIsGzCjz6I0YaSWy2zjrssZPjoJFmTtfTKlEyjeLt0hIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaFBjTyp7nKAeQ2GJM+YPhtOR2HqqdRzEUQBDjzpbR3vp+hdC/
	vdtfT6gOxLyckeDIU1JDgGBi8t5PQDB0d8fYiBzdFnm4Tm9dytlQvLoDuKAyS9I6svQ=
X-Gm-Gg: ASbGncuxVqzJ9ZZweiWmfyIBuWUwJxBppjYzr+Rjo3Q1wOWma3q0hEMTadZh8JdAgOP
	eAYVPn2JAi8YTdAurteRfgVSwDh3mrVjdCxVJSVRXtBbDuANlwZIZulerCDHyyvkgTX32Ztg1S3
	wcN3u37hwpJsON+ls3s9DCitJUKgC3zfXQdTJnWjg8D+Bctnc7uIHDSfSdSzE65lLw72z3XCXOH
	AyX6kKcw58QfbKDO2HK4el0Wnb9rQZYU06p3k0+0muinlTVQB2eN5U7pxZgg8+740vjZVmfHB4B
	UzFVUWYF0SbUhsjxs0pmjlFHTod4Xt9z4Xm8x6UhRTQaUIIjTKPj6zCjnSpKM9r7NLQN10+GT3P
	9daknM32lnQTa43pk7EoJBaZQHwNONGH2OBBAuPq5u7cZ0HohqyiqsGog1vSEAQiJpRWMJI8xxU
	L2P1pp+v7OAaMqE7NG
X-Google-Smtp-Source: AGHT+IEGjvIHlQGkUBC+PGpTEGexGfWmAsl85uVWhUANnlfdtG1SHkJVwVUXptzoK6kB191rqoImUw==
X-Received: by 2002:a05:600c:608b:b0:475:de12:d3b2 with SMTP id 5b1f17b1804b1-4771e1f1dc2mr67237905e9.36.1761832061262;
        Thu, 30 Oct 2025 06:47:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4772fabe202sm690685e9.0.2025.10.30.06.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 06:47:40 -0700 (PDT)
Date: Thu, 30 Oct 2025 16:47:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Markus Elfring <Markus.Elfring@web.de>, cocci@inria.fr,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [cocci] [RFC] Increasing usage of direct pointer assignments
 from memcpy() calls with SmPL?
Message-ID: <aQNsecHJSO2U68Fc@stanley.mountain>
References: <ddc8654a-9505-451f-87ad-075bfa646381@web.de>
 <e54a6e57-6bde-f489-f06f-fed9537688df@inria.fr>
 <60f881dc-979d-486b-95be-6b31e85d4041@web.de>
 <aa99eded-be51-af3b-414-7c3bbaddea4a@inria.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa99eded-be51-af3b-414-7c3bbaddea4a@inria.fr>

On Thu, Oct 30, 2025 at 01:31:49PM +0100, Julia Lawall wrote:
> 
> 
> On Thu, 30 Oct 2025, Markus Elfring wrote:
> > @@ -2600,8 +2600,8 @@ static int __init init_hyp_mode(void)
> >                         goto out_err;
> >                 }
> >
> > +               memcpy(page_address(page), CHOOSE_NVHE_SYM(__per_cpu_start), nvhe_percpu_size());
> >                 page_addr = page_address(page);
> > -               memcpy(page_addr, CHOOSE_NVHE_SYM(__per_cpu_start), nvhe_percpu_size());
> >                 kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu] = (unsigned long)page_addr;
> >         }
> 
> Not sure what is the point of all this.  Try:
> 
> - target = object; memcpy(target, source, size);
> + target = memcpy(target, source, size);

No one will thank you for making these changes...  :(  Please don't do
it.

regards,
dan carpenter

