Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EB61D63D1
	for <kernel-janitors@vger.kernel.org>; Fri, 15 Nov 2024 19:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731698999; cv=none; b=EBROvrGzRUWflYVcykBmeoFpkf9oyeEAzSuLTa5IpL9pAbABcBF97oIwSM74aj2dBuCAVdF/KJ2B4f15jvwZbGeb4q5Uwa7lYQnwI+PWR5OIFO9qvUt2yn37N+kUnXjc17ao9v3+uxQXqx1qNRC7lafFo4FlCwklv8fxCgvy+W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731698999; c=relaxed/simple;
	bh=1XEUtNvHfg77z1g9UMh9UlUWx/tdrIc8gqmOJJbuZng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpxGjTyKbbijwp8Zv1d6jWJj27Ba3EA1FZ+s88S6HYU8fNjkBPDy7pCB+NS5h7tLBkCbClwBEzT8RhxwCwPH/nDw38bzajWhcJr3dFUs8uV4tcf8lAdPv83oRVSgT5kLgZO0Y4us64SOIR0YvT69CGRzTv8LBefhXXNLltFWKiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lIhIc/KC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lIhIc/KC"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43158625112so19254175e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Nov 2024 11:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731698996; x=1732303796; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GhfIN+LkULB+WZf5fU16xjb/0U+SgdFkvvrswJbNuZE=;
        b=lIhIc/KCL41sC8FSnei7bZKiCkrY1UWV58TjqjwDbD2gKUmy+cW1zHOyJBVG3xT0q9
         Icfo5E7THYogf3bNGlztqqYNDC1VIvO4REopB4ROLktgzHoxigmc4YoikVkCk6FmX9ac
         mkb5WEBp8mW+JYxjdIJKw8TI26YcadCrAZwsNAYSGL/Y8S0Llp86PEVcy03+xv7vsHcR
         IS7XwK3HJQOsAffpUbnRXVCY1Imvm9lveBnej6IINMJ6mD7rsf/OJq24+kRTxGYzEBUe
         Mv0fLB0ECwwNvLXwSiRhLvpv0BQiP21YAzH9SogWnf8gPZSpaZNl/ki7KeBWEUnRiouL
         u6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731698996; x=1732303796;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GhfIN+LkULB+WZf5fU16xjb/0U+SgdFkvvrswJbNuZE=;
        b=iLYkzaMhx1i14Po5IfzpGiAW1E1eeGWz5PmjjGbRN6IpZSDEJGJUFiqVhpTPWKycYQ
         y9LWNjnv/1dWsa69GilQO3dnR5yumCV8lmcwAd9aafWmQo5njBwggYUfvCzTeL4v8Re+
         8MPmCu7x/qNGfiSxp/H/u9IActX7pOk5War1QPtAZH2Fct4Fkryw3LNnB55DxGFKEm39
         dF6uViL6yNXleV2nAvQ/JNQntDrjsmmIvrwVgZU/70GkUBZ2dCvxjFzJbvsq+pGoa04e
         MTH1d3emkkAE2wzsSb0RSGYuhgnPedjtfLD39rdQk6oZqFphskIHww4B8iqJEXjK/0PH
         Y6Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXnS9Ue5pEBiPXunkUFJJl0WWS4d+WqQtKKBPQLGB3PLAqC/pMfSGGPyAIGsc2eKe10UE+ejBXIxf5A5hGfv5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU/yGTdOlXgCndabb5bSRRdLnhVEmvanFaPLD/01ARemcYxgUK
	bsQIoF7f4rtAt3yg737QSinoiyM2vCgiUc0MA4xaqlE5Z0Q7E/1qHwDJQFIdwKU=
X-Google-Smtp-Source: AGHT+IFgDEsfELXvXpNZVepQwwAa4PnvGopmuOtuOA/DhVT4j0RCdFmy14xA8QRUdvZzCjPcHhp82Q==
X-Received: by 2002:a5d:584f:0:b0:381:e771:dc98 with SMTP id ffacd0b85a97d-38225a10a03mr2749825f8f.33.1731698996088;
        Fri, 15 Nov 2024 11:29:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ae3128bsm5050408f8f.102.2024.11.15.11.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 11:29:55 -0800 (PST)
Date: Fri, 15 Nov 2024 22:29:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrei Vagin <avagin@google.com>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Oscar Salvador <osalvador@suse.de>,
	Andrii Nakryiko <andrii@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>, Peter Xu <peterx@redhat.com>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] fs/proc/task_mmu: prevent integer overflow in
 pagemap_scan_get_args()
Message-ID: <1b18cec7-3d58-4cdc-b653-fb5790d04879@stanley.mountain>
References: <39d41335-dd4d-48ed-8a7f-402c57d8ea84@stanley.mountain>
 <CAEWA0a5vMq4vGRj4FVQXUR2unN-xAmsFt5ymi4SL+H0yfNpdfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEWA0a5vMq4vGRj4FVQXUR2unN-xAmsFt5ymi4SL+H0yfNpdfw@mail.gmail.com>

On Fri, Nov 15, 2024 at 10:49:44AM -0800, Andrei Vagin wrote:
> On Thu, Nov 14, 2024 at 12:59 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The "arg->vec_len" variable is a u64 that comes from the user at the
> > start of the function.  The "arg->vec_len * sizeof(struct page_region))"
> > multiplication can lead to integer wrapping.  Use size_mul() to avoid
> > that.
> >
> > Also the size_add/mul() functions work on unsigned long so for 32bit
> > systems we need to ensure that "arg->vec_len" fits in an unsigned long.
> >
> > Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Acked-by: Andrei Vagin <avagin@google.com>
> 
> > ---
> >  fs/proc/task_mmu.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > index f57ea9b308bb..38a5a3e9cba2 100644
> > --- a/fs/proc/task_mmu.c
> > +++ b/fs/proc/task_mmu.c
> > @@ -2665,8 +2665,10 @@ static int pagemap_scan_get_args(struct pm_scan_arg *arg,
> >                 return -EFAULT;
> >         if (!arg->vec && arg->vec_len)
> >                 return -EINVAL;
> > +       if (UINT_MAX == SIZE_MAX && arg->vec_len > SIZE_MAX)
> 
> nit: arg->vec_len > SIZE_MAX / sizeof(struct page_region)

I don't like open coding integer overflow checks now that we have size_add().
Historically, we've done a poor job writing them correctly.

Probably the right thing is to add the > SIZE_MAX check to size_add/mul().

#define size_add(a, b) ({							\
	typeof(a) __a = (a);							\
	typeof(b) __b = (b);							\
	unsigned long __res;							\
	if (__a >= SIZE_MAX || __b >= SIZE_MAX)					\
		__res = ULONG_MAX;						\
	else									\
		__res = __size_add(__a, __b);					\
	__res;									\
})

But I think you'd trigger compiler warnings if a or b were a u32 so probably
we'd need to use a _Generic() or something.

regards,
dan carpenter

