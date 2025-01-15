Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7B24C6C
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Jan 2025 05:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736918793; cv=none; b=kHHUUI16tkJaQ6ZBtNwe9QGC31fpviGSvH3CtoFvCGwlMLqpF7NG8s/6ev5/aE+Nt70VKZLneSHYvHz3/KrrHz8e6807c1C/Cv9De0bw+oRfQCcWysJJ/7Z0wa6/UO8hIoHYuhk/5pm4cqFHR83Hs8IiMx5Pfv9ubCUJlDu0ChM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736918793; c=relaxed/simple;
	bh=TJj4V68/oUvu4lGIMKGgm1DTMhGAomZC8D8xYI38ntI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcRRu3Nam0C9Ja6eROAOf3lffVvYm0DZb9SLtIncAAhRkFb6Jt7CgljLmz7f0JcPPhoVVjCKiFLVzrfEmTu8FJ+xKkK98bt+YiVxhoJMtxibPkXtXMT8p2lfa4yny5+FWc0P+pkq2VwBc1l1BtyHNUqZ2z/6rNDLTMWb8YKBTeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JHMyEk2t; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JHMyEk2t"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385de9f789cso4420088f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jan 2025 21:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736918790; x=1737523590; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=twOTIQDMLptOniW9D3Ykrpwm4OwT+cQLeuqDgqx/bd8=;
        b=JHMyEk2tDLUBSiVsL8DGBrgq8RdyuurXd9hl/RAbnXkOygPE3Xce70RiCtKI5yz83e
         BmGL8OG4bYFQcrdpUNiRfTnNllyT3S09I1HuxQ628dv0mbuGUSRspIQFZ03fpwhskkw3
         vOWHL/8w40AD2vYcuAhtvPqpcYa5CVkqlp+9nmoMD1LwuB/fMmnAFW70j0NAMrC0+Zwj
         LaH2wCxf6Dp5l2XDZcNZoKrx6K6VHEOhHjejhPChvcc2/xx0F3RS+GseWEHTzMOaSKZK
         ZCWtlt9UlKdyH/Izl4HXb+z34vhb3gT1wxtU9bH/TZaK/KFDt8LXdjI968C6YEPcnLRr
         /M4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736918790; x=1737523590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=twOTIQDMLptOniW9D3Ykrpwm4OwT+cQLeuqDgqx/bd8=;
        b=eVdhcUTdmJ8Uha8ktr6B7r9gr7Q8dLe/kEhQERwx8ox8/Gyhnl2ge+7uCPIb6IPN5S
         lxnqbiimXF9D/US1U2uE5NH/4s21wnvaTm1ky2s57D25XbBnQCKMxa5FAVKHpvo1xJ/e
         zdS/dl7bbVF/Xx925Gg/kkvdt5OagSuvv1j7bxKNeLGWp0yIunepJjmo6NAKCXkdvHRf
         s6uQh1MKRZG6Vs5fsKH6x8f61OSE6E2ZUBKYy6oaaXH4909s3BxLZ8gaIZBj0ZLqZ+qq
         Wx/BJbwfBWF7E5ovpkgL03yDf6X1wPFUJyWK2wS68kmtpbTqCJLUPQKqBsmFZRFYlmIx
         tCAw==
X-Forwarded-Encrypted: i=1; AJvYcCXo/F3jvfaqlvCFxGKynEBue6j/GxejdKHhqhX6JNtw+uMXuyydShmm+JXKEr9iJFtpHhogHQceRVWoid2Qz0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNX71zprAJt+oTS4YWQA1XWKcw+Woz4cV/xQsQ5ru3oqTd6E8e
	4Pg8Gc6KJiw4Lah8dTQWkGLbkxXjzXoB2PgTcpmEgDa6PonOVKq4aPdEdH2WsRU=
X-Gm-Gg: ASbGnctqOMzQU8HYTC4Z5lwQ0CixCrPu7gTKFIPTxF+UOTnoky29WvM3tlAauJ1V2Ou
	cbryK72OPu/bp5UlFJr/QU0pFZihfhUmTgOmnOKPqi5ceWdRv9UzXyxgSr9rPnE1ifQXkG/Bdth
	E5dU5cHoYnFNi9B97k797yO8AoyVo0fqjQpJ4/QhZKsQ65BF78sHlgFFvL0zOkD/ZPjeyo8zs6c
	Gw1U1iLaNtDkhw+RLTtKwdjdnWcUpTtQKBMK4e2EK+3Fz5rV8Ey3ktS1/6f4g==
X-Google-Smtp-Source: AGHT+IH/vkacqNHuK2cXqcYAJ4HjIn/EgzODQtFuqUdC6bKz6TFDA/FAL5xJNa9BMmv2Q180MP7m/Q==
X-Received: by 2002:a05:6000:1fac:b0:38a:3732:4462 with SMTP id ffacd0b85a97d-38a87317160mr27724590f8f.48.1736918789865;
        Tue, 14 Jan 2025 21:26:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c4f85sm10004785e9.18.2025.01.14.21.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 21:26:29 -0800 (PST)
Date: Wed, 15 Jan 2025 08:26:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <sfrench@samba.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH RESEND] ksmbd: fix integer overflows on 32 bit systems
Message-ID: <20f85837-68b7-404f-9284-73597feb142e@stanley.mountain>
References: <b00cd043-7e52-4462-8bb7-b067095bd5fd@stanley.mountain>
 <CAKYAXd95gAZ4h1TJtFg2bKakSLQcR2294+mZ1tJY5zb2V-rhaA@mail.gmail.com>
 <2fb3efb4-a889-4b49-8100-51147d9ae426@stanley.mountain>
 <CAKYAXd_a=u0KKGSAe7yZy+jhtQb5Mq2ZTX=WirL7mhr3QOkTtw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKYAXd_a=u0KKGSAe7yZy+jhtQb5Mq2ZTX=WirL7mhr3QOkTtw@mail.gmail.com>

On Wed, Jan 15, 2025 at 09:20:54AM +0900, Namjae Jeon wrote:
> On Tue, Jan 14, 2025 at 7:18 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Tue, Jan 14, 2025 at 04:53:18PM +0900, Namjae Jeon wrote:
> > > On Mon, Jan 13, 2025 at 3:17 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > > >
> > > > On 32bit systems the addition operations in ipc_msg_alloc() can
> > > > potentially overflow leading to memory corruption.  Fix this using
> > > > size_add() which will ensure that the invalid allocations do not succeed.
> > > You previously said that memcpy overrun does not occur due to memory
> > > allocation failure with SIZE_MAX.
> > >
> > > Would it be better to handle integer overflows as an error before
> > > memory allocation?
> >
> > I mean we could do something like the below patch but I'd prefer to fix
> > it this way.
> >
> > > And static checkers don't detect memcpy overrun by considering memory
> > > allocation failure?
> >
> > How the struct_size()/array_size() kernel hardenning works is that if
> > you pass in a too large value instead of wrapping to a small value, the
> > math results in SIZE_MAX so the allocation will fail.  We already handle
> > allocation failures correctly so it's fine.
> >
> > The problem in this code is that on 32 bit systems if you chose a "sz"
> > value which is (unsigned int)-4 then the kvzalloc() allocation will
> > succeed but the buffer will be 4 bytes smaller than intended and the
> > "msg->sz = sz;" assignment will corrupt memory.
> >
> > Anyway, here is how the patch could look like with bounds checking instead
> > of size_add().  We could fancy it up a bit, but I don't like fancy math.
> Okay, There was a macro for max ipc payload size, So I have changed
> INT_MAX to KSMBD_IPC_MAX_PAYLOAD.

Nice.  I didn't know.  Thanks!

regards,
dan carpenter

