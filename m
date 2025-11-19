Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F192E0901
	for <kernel-janitors@vger.kernel.org>; Wed, 19 Nov 2025 17:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763572417; cv=none; b=FU0VK8WJqRz/YslSKzexyUcl2YelUeRBYrxonlhMkCmf5zBdJgVMdYnuN+Lxonko5+h4O3KX70NocxWry0EYVoJ/RWYuHNWOSQr4vOGmCoBKt/zBI1U6wFVwfaobfnAnSNaw5kpJg1et2wVeaP6vfTQx/gZBTkISRQO80/J1yO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763572417; c=relaxed/simple;
	bh=xsooH6y8NKa6xW7ZhKkSuEnIqZND+wVpEwXj3cRihtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTsdS8c8OcHvSIG/MpzAeB2a7wTCostV30u797pXrhAjsLUzgzf3lcZEls8RmYxM8Ib9obRnVp1NUYtjCI4j3aB+dVRtoad4wsmVDcP6lZQlnItG4US3zQFUg06eMVvI+TllwkDNwsQaRTyzE0AB3oURPhW8fnPvBK8MpHAcFBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sZbxol95; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sZbxol95"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso33850945e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Nov 2025 09:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763572412; x=1764177212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2vhmhQ6Om+Pbwbn3RAZfO5ZRyCOOKsXFMN4D6avcC+M=;
        b=sZbxol95izRnIdqG6q0bFri8Y8QurHvdXELw58VABkUfu4q+W0r5HCZRBvtdRhTbkx
         GKs5Ax1ifBmOfuHacJCQssoon21dD7m7CBSnGhxhlZAzNdoxC7RH5fA+P7fHOYFb7Ohd
         XS3sBoOZ0tj+lE/lF1E9O4gOa0rU+mAA0FHGedMCSVx50WrBfykTOp52RzqxwUnrp0+h
         dIBdviXChYrYNUg9woA24I4SbgQKhnP2szb1pbVDaRjR07BSzqIAP/k5UxH+LWcHiZZe
         3XWbG8fBtoQMi91+7HCem6hNsrwSjtAmnpK/asyBrDGJ5t0hGa1VGSMNNpBQhc6nMdgr
         WJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763572412; x=1764177212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vhmhQ6Om+Pbwbn3RAZfO5ZRyCOOKsXFMN4D6avcC+M=;
        b=flRJ/b8XOITHyaPV9+ut06DTIuUdkJ84tOiPQQpYJYc2XTaiNKfxxvERoMOHrxqbxa
         UoJv+n/y+r2p02djmwJtUmrgU7fvKC0f7fcPXgRYeuvwBlGxjHyCohVjQhkKHtLhJOT5
         hPZViQFok/8Z5VARibsokdl5e9oTSZN2AnVOXt48wH5et5t0dYWih3w6h+zy5InvR/rb
         HuQi2RQGAJpI8/aw7x5u4+wU3HWfOhFLXnJpc+OG5xiNxpfeuAzE7imXc6LyOkV213eT
         5vgshZuXsf2f0oZorOSxIrfRFbBBFHDEgKaK5ZaM08AwKOZonDZIC5xP49dU+LQE9g/F
         SBwg==
X-Forwarded-Encrypted: i=1; AJvYcCXwsLDGkAhD4fZl7I43JBU+tfmoAY4CXi/hW+0TWwyr9hMyb6m+FUN6dD1oyD/gUHCoZa1hJjOIxvQO9x0dkzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKmwRLkr7g2NfItrAbVfs5y+cJN1G/iFG9JnPraK3XzEIb89it
	/ohannaueNxTzl5zjrGrPa3tnh9g2nlQHk4lEaw6lyV5M9LUtO8c8ROGitilOo1fppE=
X-Gm-Gg: ASbGncukVix+w+UlFjO3Ef1VkU37cU3jl58auufk2kkfOP8t6GqsuOKd9dpA3/rVzTu
	Vwp4c8idTlF/tuCZLfBOhcWQlE6fqDFoiMXtUyi2+q5Mq77eRDtpzi4spfkt127UfUhfGsgt/WY
	A9kyKXQrDoXm15lteIhUIA72mn/yOSZaOnCoQM7ps0/PzYtnxGuw7vA8wLl1BjbX6NtLFnrC9dq
	2Pqn28L/gfvrCIcYdbywr8zlmPorUaQaKSC8LWHjHp5e1lyY2rr2UdR2MKA2STfWchFcnvkgZi0
	VaUlyYgKF4SOGr80QnrFPesC7LZ9Km6AjmWiahLFG/1mo7BtXJanCTEUM2oHwm7YWMKD4XoFMMC
	S5ZHAkUlMsdZrVg/TtR+XZ0sFNbvfZqjRIhGVSKRwj5wJSGVKYe6jc5yjzGVtXG0YwqG23KNLC9
	bI6UrHoxumeh/SveMc+IoO6+urmRc=
X-Google-Smtp-Source: AGHT+IH4OATo6lVvjNQJLgOC+refWkXUUq/dSK8LEPdFqw3Sf5cp0g+sJKtr1ngfEOnJg54Edk+hnA==
X-Received: by 2002:a05:600c:1986:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-4778fea7037mr190606645e9.27.1763572412224;
        Wed, 19 Nov 2025 09:13:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477b82d8251sm1082725e9.6.2025.11.19.09.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 09:13:31 -0800 (PST)
Date: Wed, 19 Nov 2025 20:13:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] unwind: Fix signedness bug in unwind_deferred_request()
Message-ID: <aR36uKfrD-kgqclK@stanley.mountain>
References: <aR17gxtrzOJnVNFq@stanley.mountain>
 <20251119092418.7daaec1d@batman.local.home>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119092418.7daaec1d@batman.local.home>

On Wed, Nov 19, 2025 at 09:24:58AM -0500, Steven Rostedt wrote:
> On Wed, 19 Nov 2025 11:10:43 +0300
> Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > The "bit" value comes from "work->bit".  It is set to -1 if we cancel
> > the work in unwind_deferred_cancel().  It needs to be signed because
> > we check for negative values.  Change the type from unsigned long to int.
> > 
> > Fixes: 357eda2d7450 ("unwind deferred: Use SRCU unwind_deferred_task_work()")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  kernel/unwind/deferred.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/kernel/unwind/deferred.c b/kernel/unwind/deferred.c
> > index a88fb481c4a3..8dc11e0d9374 100644
> > --- a/kernel/unwind/deferred.c
> > +++ b/kernel/unwind/deferred.c
> > @@ -232,8 +232,7 @@ int unwind_deferred_request(struct unwind_work *work, u64 *cookie)
> >  	struct unwind_task_info *info = &current->unwind_info;
> >  	int twa_mode = TWA_RESUME;
> >  	unsigned long old, bits;
> > -	unsigned long bit;
> > -	int ret;
> > +	int bit, ret;
> 
> I'm fine with the change to bit, but please do not put them on the same
> row. I only do that when the values are related. bit and ret are *not*
> related.

Sure, I've sent a v2.

regards,
dan carpenter

