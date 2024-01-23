Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465C7524AB
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Jan 2024 07:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705995528; cv=none; b=X7pT5n6xBY7DodYOVw87b37pMfwxMy8Fy3NB3fytSJs/4X8vJ7SgaXt9tB/+ZB+WuqtR0D4uy+kYjSJObp3CnsjUzv/Sjpyft3asDyrRefuefAZhgkJAQYJSYYtIDk9TKM20uqkkRsgM10MNBo8igbWoRUpr8hBM0yIwdh6MnR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705995528; c=relaxed/simple;
	bh=owfshLc2LGPZAA9/8wFtBBZyNyp2uwDVREAV32FmYEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dhx/khwIPjsFaPJcRbnh51lGGWJ8bUXti1vYbyuVUyR8jyiNsJtaP0l2GcNNSHhLRUHA4Ma5mP/VQ1Rh8jugNEczXFkAzHyZvA7i3sT5JyaIfYK7SwuH2CzOo0H7VNnx+OLAOOu5pIQWZMBwqdBz2APWSX62Uy28aSyI15vq3+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IJbvyLwb; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IJbvyLwb"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33931b38b65so1958985f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 22 Jan 2024 23:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705995525; x=1706600325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yETxiGG3CveSvMqCA4PglMWiCajZsQqRtEiheWi+x/Q=;
        b=IJbvyLwbmVn98GyTvo1X+xX79AE7S0Pia0h/VXfKRMA2r/i9K3fTr53k7rCvjkQPf2
         m8gE7fYAd9azIBWxuJRRePRFRtatR27gBQ5lL72kBBBm3a3dwYpI0D47eoRlPFAXoVGk
         5jcsJYBZ3Gj44rfnGNrYrx/cid2Nb+vhcL531mUhmvsBqckDBKp/3ppSZZosWels8CXw
         IpnkZpYTl00qGnLYlh0ko2wSod9WPNgsQ1YihhmF/WNrxVD4c62CCjNgI1gO5HMPcG9U
         mjKL4ayETDGdzj53c/aXTFoGRJf4unC6PG/T9DQy37wNJhIFGqtTvopCF3ULsmhMwS8M
         R1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705995525; x=1706600325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yETxiGG3CveSvMqCA4PglMWiCajZsQqRtEiheWi+x/Q=;
        b=PnD5v+ElCIeN0cELT1JAuOC/d56OVjUPUgf1HCe4+BEEixVuO9/NdtWMNkd+s26xXt
         ksD4Wd6GNEsFp03UEH+IhA+YQ4zaVjHHi1znJlKIt67J1TWHTS4pJZmdhIZp0kREu3PY
         /x29Kdu4fYqP7p/Lgi6TV9xFOeadbAlBzP0cwQvDhLDX0qz1oneqaNL/ewxN5LOgXvlS
         jxAB7oZuuKjPlF6MboCkmrPGWmgEEuHTLXQOgAoH5+Cbp9z1xbvdF1wzYJY0Bmgww3lj
         sZoiv1zQkw3ks+hLVdnr2YGIVmh+Jh0igw+0KTvosX0dCbzpNYXuILGQT+wY7mgr5ptj
         Or/A==
X-Gm-Message-State: AOJu0Yxa/cQJkJGkR6pdyk5NQADmktstjN30N7ulYd20KiefQyQCMzlv
	X0LYESKoQv6EGXgw7t4wZ3out3yKKAQFg8Kn3zZg5nSVW1xMuKe8wwI5Cg1OKCw=
X-Google-Smtp-Source: AGHT+IEYd35MOW7sUO6WnjHIiHJYGzUljxDUCiR4Ck+ZRIreA3QvtDPNOG4m6ojWM4vS49RBrPxWhA==
X-Received: by 2002:a5d:6882:0:b0:336:768d:1b90 with SMTP id h2-20020a5d6882000000b00336768d1b90mr1758406wru.168.1705995525330;
        Mon, 22 Jan 2024 23:38:45 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id t8-20020adff048000000b003366c058509sm7565004wro.23.2024.01.22.23.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 23:38:44 -0800 (PST)
Date: Tue, 23 Jan 2024 10:38:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: Colin Ian King <colin.i.king@gmail.com>, nouveau@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH][next] drm/nouveau/fifo/gk104: remove redundant variable
 ret
Message-ID: <55f0983a-300e-40bb-9142-6f4683914402@moroto.mountain>
References: <20240116111609.2258675-1-colin.i.king@gmail.com>
 <aafe669f-b322-4f22-a48e-564e3eb3447f@moroto.mountain>
 <bdc7e401-a676-4040-9138-8dc5cf35bd05@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdc7e401-a676-4040-9138-8dc5cf35bd05@redhat.com>

On Tue, Jan 23, 2024 at 12:04:23AM +0100, Danilo Krummrich wrote:
> On 1/16/24 13:31, Dan Carpenter wrote:
> > On Tue, Jan 16, 2024 at 11:16:09AM +0000, Colin Ian King wrote:
> > > The variable ret is being assigned a value but it isn't being
> > > read afterwards. The assignment is redundant and so ret can be
> > > removed.
> > > 
> > > Cleans up clang scan build warning:
> > > warning: Although the value stored to 'ret' is used in the enclosing
> > > expression, the value is never actually read from 'ret'
> > > [deadcode.DeadStores]
> > > 
> > > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > > ---
> > >   drivers/gpu/drm/nouveau/nvif/fifo.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/nvif/fifo.c b/drivers/gpu/drm/nouveau/nvif/fifo.c
> > > index a463289962b2..e96de14ce87e 100644
> > > --- a/drivers/gpu/drm/nouveau/nvif/fifo.c
> > > +++ b/drivers/gpu/drm/nouveau/nvif/fifo.c
> > > @@ -73,9 +73,9 @@ u64
> > >   nvif_fifo_runlist(struct nvif_device *device, u64 engine)
> > >   {
> > >   	u64 runm = 0;
> > > -	int ret, i;
> > > +	int i;
> > > -	if ((ret = nvif_fifo_runlists(device)))
> > > +	if (nvif_fifo_runlists(device))
> > >   		return runm;
> > 
> > Could we return a literal zero here?  Otherwise, I'm surprised this
> > doesn't trigger a static checker warning.
> 
> Why do you think so? Conditionally, runm is used later on as well. I don't
> think the checker should complain about keeping the value single source.
> 
> If you agree, want to offer your RB?

If you look at v6.7 then probably 300 patches were from static
analysis.  The syzbot gets credit for 63 bugs and those bugs are more
important because those are real life bugs.  But static analysis is a
huge in terms of just quantity.

One of the most common bugs that static checkers complain about is
missing error codes.  It's a super common bug.  Returning success
instead of failure almost always results in NULL dereference or a use
after free or some kind of crash.  Fortunately, error paths seldom
affect real life users.

My published Smatch checks only complain about:

	if (ret)
		return ret;

	if (failure)
		return ret;

I have a different check that I haven't published but I wish that I
could which looks like:

	if (!ret)
		return ret;

Here is a bug that check found recently.
https://lore.kernel.org/all/9c81251b-bc87-4ca3-bb86-843dc85e5145@moroto.mountain/

I have a different unpublished check for every time ret is zero and we
do:
	return ret;

But I only review those warnings for specific code.  Perhaps, I could
make a warning for:

	if (failure)
		return ret;

I'm sure I tried this in the past and it had more false positives than
when we have an "if (ret) return ret;" like in the first example, but I
can't remember.  I could experiment with that a bit...

To me, if "return ret;" and "return 0;" are the same, then "return 0;"
is obviously more clear and looks more intentional.  When I was looking
at the code here, I had to consider the context.  Especially when the
patch was dealing with the "ret" variable it seemed suspicous.  But
"return 0;" is unamibuous.

I don't have a problem with this patch, it's correct.  But I really do
think that "return 0;" is clearer than "return ret;"

regards,
dan carpenter

