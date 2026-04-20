Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F228617A31C
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Apr 2026 14:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776696326; cv=none; b=gfrJOefhghlK7Po6O/QEUYAyXBZktX3TtPTRvFPuEPMVfq5Khfv/gZdnV+7z2B+18AA6MvQ0/pgxDPLQj7BaNoF+yF3tX763O9Rx88WZnq5WN5b1h0xe7vtyzh98banPaIHBzjgii1tCc2ciRUZZcx/eI3cYwe9thX3ocaSQ04s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776696326; c=relaxed/simple;
	bh=jVp9imU1y2hDWsmrFbbTkijqgrd0oNXyCziCRGllZeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fb7VnJPhcY1SGFEXFW0JToWFO5BDx96ptjf1Tq6j+wsxMTdwE6+pWKxCvdpw2FxxIt/2uV3dBllnQppvKD+ktcpqKNaJ6cGDAE/I1s6MdwZknZE2uZ9u9PQfVCFGt4QNrta/Igm3VT/a2SZw48UWfoRWzslepHYLlTm5yv1fV78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGaQc/q1; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGaQc/q1"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso29186815e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Apr 2026 07:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776696323; x=1777301123; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k4sZp6047436CCDN4+oxjNC6GHcP7WIKSjUd3ENZYSw=;
        b=JGaQc/q1CfvWwQ2xOTCdOuQYEcVU1y0VbQKMoWrnzcgnU7F2dPXMcN8Vg267uQJGiV
         bGVFhBbFnj1BXRI28fpqXSQg8b2ouSrnzHCJVV/uV8GxQ52SkaBp4tj+6t59qy61JYzc
         b81mXNLbC/5aUmbfnIfu9QOnYno6F6l/du69dmfvrCVIn+vu5U7UIulWJCBJmrZ2avv8
         FE6f+zVR9kl/4EeVcd1guOAEl9zK/QMV6+kIzPwt1mWcBZCZnrbRmWdpZash+uXvo0ZL
         QnvCgzi8sK0ZNEaJ8/ASjj2i+X1w24wg/7ZFt5pusxkslet8YpnGbxVAsgUPYnkTZtsx
         HBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776696323; x=1777301123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k4sZp6047436CCDN4+oxjNC6GHcP7WIKSjUd3ENZYSw=;
        b=BVa1pXgIy4d9aPzG/2aUBEOcMpnYXzjd9RDrta7mjXUp0kqSLrZQhunlLEIFNHb8I1
         hi+oYWHmjlohXD1qAxeSsk4syUKcc2V9rmxsQ7rSRPzVWFJIaGC174Z6VcxkvLeK54ZA
         xUMAZ8VFboNbBYFGdiIElHYMwNuQpj9B9IomQMQnZvOvi98dqTH9FnszjirJwGFXNxjp
         w2DAI0am+rpuJCbqWFFDolVMHroZQyzB39n4+0pOQsw3m4dVopsPM4pTJOosJl5JO9J5
         87JvCzez6AZPeLZm6KeOZQzARTHdGloE7yyUnuRsjOeHttFWpFQOa1SBABWU9lQkwlZO
         pv4A==
X-Gm-Message-State: AOJu0YwSpyv8vYQk/W/hew75SEOj3f/fiSWOdrwy37HAwXmhEcMCsLeH
	IxeZGTZBLvjwbXTkegynCZs+lAFw0Em2HotvEFww5OglhC9mKjMgHazOIxiZx2tn
X-Gm-Gg: AeBDiev3FgG529wCda2ns5B4mKbFguhX/4Mihm+FxSQBbyU2V4lGhY86aEfmwoDBY2O
	vfe61Z26R8PeFT8t21++1hyQNLgbcOuD+EhuDU2dYrVbztC8dGalHxIVYG7pc7+NtlPDiZb4/SV
	iSST8MMezBobTTECPI1fgDd7DbKrGLa6YW7h3C/D0XreAgqHOaXCjTymPkHfMXDqCPr+2/fLW4W
	Hef9fXJF/6ltSa76F24PeUa5QP3akpvBXe61X5QGlzBM3mylULMJp9WH1haRExYuHY35LoV03k2
	dSzm15HPHBQWRduaOesiKvyLHLXnjTvUT+UUZWtpKsImd0jKy4Tr1mW0a3RZu/Yl66MBcHXcz/i
	nsosQ5IncgQlQr6b0zxcKvIeI4M0NlJThNk6raRWznX7Kxk70AthWDJQnMl6bdFF0SVUpUKhYCt
	t3Hwqg8LGwfwRGstQQKH4hbPuJz58o+Q==
X-Received: by 2002:a05:6000:2f83:b0:43b:9903:2ba3 with SMTP id ffacd0b85a97d-43fe3e0c681mr21382824f8f.33.1776696322453;
        Mon, 20 Apr 2026 07:45:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a7b4sm27804095f8f.22.2026.04.20.07.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 07:45:21 -0700 (PDT)
Date: Mon, 20 Apr 2026 17:45:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Josua Mayer <josua@solid-run.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	Peter Rosin <peda@axentia.se>, "kees@kernel.org" <kees@kernel.org>,
	"thorsten.blum@linux.dev" <thorsten.blum@linux.dev>,
	"ulfh@kernel.org" <ulfh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [bug report] mux: Add helper functions for getting optional and
 selected mux-state
Message-ID: <aeY7_meA7Qe0q8ld@stanley.mountain>
References: <adjNEl0C8OgEjMI7@stanley.mountain>
 <f76494f0-e44e-49de-bee1-84399307f3f0@solid-run.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f76494f0-e44e-49de-bee1-84399307f3f0@solid-run.com>

On Sun, Apr 19, 2026 at 10:16:30AM +0000, Josua Mayer wrote:
> Hi Dan,
> 
> Am 10.04.26 um 12:12 schrieb Dan Carpenter:
> > Hello Josua Mayer,
> >
> > Commit 993bcaf32c49 ("mux: Add helper functions for getting optional
> > and selected mux-state") from Feb 26, 2026 (linux-next), leads to the
> > following Smatch static checker warning:
> >
> > 	drivers/mux/core.c:640 mux_control_get()
> > 	warn: 'mux' is an error pointer or valid
> >
> > drivers/mux/core.c
> >     630  * mux_control_get() - Get the mux-control for a device.
> >     631  * @dev: The device that needs a mux-control.
> >     632  * @mux_name: The name identifying the mux-control.
> >     633  *
> >     634  * Return: A pointer to the mux-control, or an ERR_PTR with a negative errno.
> >     635  */
> >     636 struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
> >     637 {
> >     638         struct mux_control *mux = mux_get(dev, mux_name, NULL, false);
> >
> > mux_get() can only return NULL if optional is true.
> 
> Yes, that is the intended contract. This means function can be simplified:
> 
> /**
>  * mux_control_get() - Get the mux-control for a device.
>  * @dev: The device that needs a mux-control.
>  * @mux_name: The name identifying the mux-control.
>  *
>  * Return: A pointer to the mux-control, or an ERR_PTR with a negative errno.
>  */
> struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
> {
>     return mux_get(dev, mux_name, NULL, false);
> }
> EXPORT_SYMBOL_GPL(mux_control_get);
> 
> Is it okay to trust such transitive contracts and not check for NULL
> in an exported generic helper function?
> 

Yes.  If you don't pass "optional" then you don't need to check for
NULL.  If it's buggy, just fix it.  Predicting and working around future
bugs is never going to work.

> >
> >     639 
> > --> 640         if (!mux)
> >
> > this should be if (IS_ERR(mux)) {
> >
> >     641                 return ERR_PTR(-ENOENT);
> No, ENOENT is only the fix for unexpected NULL return,
> which must not be propagated to the caller.
> 
> Other errors should be returned to the caller unchanged.
> 

I wrote a blog explaining how mixed NULL and error pointers work.
https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

There are some subsystems where they use a "special" error pointer
like -ENOENT to mean "not found" instead of returning NULL but
inevitably someone is going to return -ENOENT for something else.

regards,
dan carpenter
