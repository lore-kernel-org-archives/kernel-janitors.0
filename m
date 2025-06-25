Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610764204E
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 18:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750875366; cv=none; b=syGXKs6RWCOgr1T8ERqp97A5ojR50O53cO1cBg9IGSL1wiV1HWvLyGiVIMsx7nRPB0w5WrrgsT57nr/0EaZdFvNuZsMxbYphXenDOQZO9MMS3RAMzIbVRlbcrHKlBfIZPjnyTOmO56NodCdRr4+Tsji1FUwcMReO5mXp3U4wey8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750875366; c=relaxed/simple;
	bh=ZSQflvI+dx87BWX5Pgy2pUuHWdmrEEUEEodE17ummQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwxEHESlQMXiqEQjDUYcNWYthFcXJRxx6N/PJiru/pkxfKki9iQnfbOW58nfarRf02WIpQqZYz1NiQq8LRiAvmXNlhjPF0LrZS2pCW6Gs403WvF2t9QHxRHtSd/TA7pcHRd8Ou+K8TLVy1fuVIoDOD7fDO1tSGZAlJBYOp6NGCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DPPcSper; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DPPcSper"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6060a70ba80so113602eaf.2
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 11:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750875364; x=1751480164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ds43cq5VKAjGEF+paeGIlgb/AFk3oLXyjpiFzhP73Y=;
        b=DPPcSpercp4r/aOl5y9k16f8NU5xJO+DSdNQ851mDfEMcEQ6Xqx0Bs9F3eA3iOAefa
         62Kjm054hOuQO3WGNEU3ycgIVylV494sv/Nm/vL5M42dqzEnqEyHpmFSir/krBI2GzyN
         0huQ1IPtIPvzcg68p1uYRZRGPkhuH7aeX29vm9xvwl4htyAGs8GWdnnUHJGyxo9NtQ6D
         uCJo9rDUq39KwZ7uUbmX3MQ+ARbBIgjrFXSUzaK5aOhKRmY1rLAwPSYucRqz9J7c8dcq
         dEMNDHV+Iwd9YKkfu7RVRDtfb6dKG3KxYsEmnpWrFUqqODfzh2EsE+OwBZLG/Q9i4LFw
         F1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750875364; x=1751480164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ds43cq5VKAjGEF+paeGIlgb/AFk3oLXyjpiFzhP73Y=;
        b=Ca3RAc30SeAOy4dCJk5OdVcOJsfYdNbs+IDpMXatQvvJxZXoujsktTzdjgJ74rgh3X
         SZLDBXnaAhSyxUyCFey/zD2fLRJQmObLkyszqHE+Nqnizf6UcloexF7kLowJWpeSwXWj
         lVDfNHqnxAB1f/ZEqw7I90GwTnMR/mNi8xOP26ylrY/zvw+fOL8OLduclFnWg7olECpV
         ad2Q8kOyk+zSo7GN2dr3qY9Kr/CjHuRLpbD/mDvSZQHVi6IxQFlX9773Nq91DTqPbAi2
         DMtP5S4rdkqCbjdufFITmT2FmvrKN54mI3v/q8hjnavH+6e70DcPqfTAE1I1bD4Gdy/H
         NwSg==
X-Forwarded-Encrypted: i=1; AJvYcCUEnSXv8jC3Wy6C31J3JqwVGSS2WSgJh/ICK48IcjtNviYwekyUtSPfvLZH+cWGnyWbEC7Lj2mrRVVbPkjeYcE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm218tG20zAjeLrYH4aXPnw3beU9be2EWqb1uI7N0ypaEvDOrg
	t5juHP0JNCkRSTqUWsbdlL0pPdtqs291VpM5pqykc0E1lDnKEaBxWBfxIWRm+qs4YIU=
X-Gm-Gg: ASbGncvkRwMZPybiD3dRjoSobYf6LlOp0fE2b76uTNTUeWIVeXRn+ze+EZRtchFnRz5
	ajpgzP+pOi7nOb4AY6bnTVSJxmQ0BEHdYMM+oTkQaEMwTcivIreQvo3jsuP/U/xKRUsO84aoz8R
	RldsPinAwwFHxhu8NYsYZ1wantHEvUG8Pqll4HspDpruoMaYFDL2VU6kvMS2oD8x8i63d/u4Tlt
	0Hfvx9Hh1b1QkIHdRuSsngMjs/tPuiMXoEz8pENlRevG6wvExnVOtP/a0JEFuWjGDpwDtia8NPR
	u3+8LIVqID5IzdXA3cigfDYiLcykPYUNqR3hiZMnS/0l6wdrK2NrCSLe5ANjjn8Olzc=
X-Google-Smtp-Source: AGHT+IGF3ONiUBg2GiFgTNyAb79DvhkSUQXKM5ohgb+SGOD3VQHjY/8ghJi/h7Q6a9PKmKmPwyOewg==
X-Received: by 2002:a05:6820:1527:b0:611:a527:226a with SMTP id 006d021491bc7-611a5272cf5mr1890255eaf.5.1750875364473;
        Wed, 25 Jun 2025 11:16:04 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6115b6c80adsm1637262eaf.12.2025.06.25.11.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:16:04 -0700 (PDT)
Date: Wed, 25 Jun 2025 21:16:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "yanjun.zhu" <yanjun.zhu@linux.dev>
Cc: Zhu Yanjun <zyjzyj2000@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Daisuke Matsuda <dskmtsd@gmail.com>, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] RDMA/rxe: Fix a couple IS_ERR() vs NULL bugs
Message-ID: <d4adeb54-e218-430e-b156-e0220005404f@suswa.mountain>
References: <685c1430.050a0220.18b0ef.da83@mx.google.com>
 <d72af2c1-2faf-46db-b212-0b800040c311@linux.dev>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d72af2c1-2faf-46db-b212-0b800040c311@linux.dev>

On Wed, Jun 25, 2025 at 11:03:49AM -0700, yanjun.zhu wrote:
> On 6/25/25 8:22 AM, Dan Carpenter wrote:
> > The lookup_mr() function returns NULL on error.  It never returns error
> > pointers.
> 
> Yes, I agree with you. However, this commit is intended to fix an issue in
> the rdma-next tree. The corresponding repository is:
> https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git.
> 
> Therefore, the subject should be: [PATCH rdma-next]
> 

Yeah...  I moved to a different machine and copied an older version
of my patching scripts.  Normally, my scripts would put [PATCH next] in
the subject.

regards,
dan carpenter

