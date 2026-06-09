Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC723E95B1
	for <kernel-janitors@vger.kernel.org>; Tue,  9 Jun 2026 08:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992558; cv=none; b=IDKlppcVP7RulDOxZ03QWyq+vB1cmXnyNeXL+xGHtXBnIrdyhujlhnma8h4WBN+BC17i32k5HFvA1yCF+YNvLmZQn7k1RgiKUJcVcMoupiLS8fR9F/Z2Jt1GX06+VJtNwcFqF8DkQVg88NPq0j0oB2PiujliPCKMk8PF/GxFxhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992558; c=relaxed/simple;
	bh=vi+VOT8rSuprhEiLqbw4rh2nm8VodjS4a3hs2w+jxc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVYgmEfQ6tvKo6ase5zqV4nFliIkM84tSjTNRoFHEj4Xtz5hateDcTSaeh6bmg6bisJX3yI/w45CD44t6tY2/58ZwUS8XMFllW7I6tlCHFUNF4foPgxveNby8Q1KaJDDuKMg2ybyzJoN1/lio8hZ+dmEVpi1daqYy+XEBWgqcv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbCGkngm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbCGkngm"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-460166910e6so2653471f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 09 Jun 2026 01:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780992555; x=1781597355; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mNDXjDnKJx4rH6WjQAFNVVztRW9DfM4vW7rViQVW+to=;
        b=IbCGkngmJ8VJkTa0Ah5r2izsEYEoQB2VUylIXKcEj3PBMF9Ou9EOk3rCrRc5tcGf6K
         KSWx8Q4+IcZ0PHPQsMiHUUfyeepuRB6E8+xg9BdcindFHUPDSm0kaB3juOsF5F4ppD/Z
         HGaqsv7nM5pkermJ54UlwsDhEFFRog3QoHkuifRFH2S+45LL4aR8SuzOFPOoCV4O7KF9
         MZHSs98EcO7X6NB4c2h5Q6nS3wh3dD2PXXZa2Qi6zJA6nBtShVu+D5MMkYndNGHfZpNr
         eSdMQqTMLyZAoo2bkdiEHV6LT1p1XgWV0SPuUiouroj1j23eqQ6eFbN8+PFuzn4aaTtj
         aZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992555; x=1781597355;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mNDXjDnKJx4rH6WjQAFNVVztRW9DfM4vW7rViQVW+to=;
        b=TpVLo9ggoAVBjQ9B/PS4iUGZjlwKlU++V+m9oE9KB3TLVbKHzq7pBI+JJMv0vk4TMd
         iTUi7af422uuwlBZ63xcJn3jVlK+hgZfS3wllQGEatHc37pjZir9fA7YR1+eFRwvFiY1
         kYK35tLuU/rbMvXj0MVBPBtUqwgl2K3m5UBxn9e00zmgNcweZbF+z7vTTRKVxW/6xzGC
         Oqh3hKJJI7xGKO7nJXtQwp+ME6ZZ0Wv1TTNr+1PSPDCY1iTW1vdFnSa3CWy0R5CoLuae
         4+apEoaTvrz0pXav3awf4NV/xaUlUKDgzZEokb4Kg2euglFBJGta9SelY6g54nl9HMj/
         Pb6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9EYLsUNo0mMGfrHVg0pDsi4FVet5WsJiSkXlQS1IqfMcRI40e3gn/S7d6DCGWMtSPlrehQ4/JB3fSlzUFA2aE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr6DKAIf4RwPjT+nslFsNuk+RcUymVaDTyxXkN0OJg1ZYzIF8Z
	2Xi6YtECw32qNCVj5+2dvbAVSTt+op5svkM6bPtPh2Zx2dh7gFhDYD5Z
X-Gm-Gg: Acq92OF5T7t+mu3fzQ7e3KSjyvoGdtjpvA6TFuQH/piqqNn8L7FWfriqECvG+5++WNl
	7d4RfunTjJfekx/THIEhSrmr5RTn6mkNMIahWxdb1I8E6KCyjZ9pJQDsrunjoA2EfnyvPWHfYkn
	rtJsyDlTw+az71//eMpfxNMuDGthB8TWda2urPSHk8gARQaLyJiGZ5j3RlrWYnlBExWcwIn5eqw
	qde1cBR6kkg5Nq1udNrMzJ91hNWGCdM1/2kXT+dNCgW59CSLN9RMw1XB7fudyHZkA3DplVMCZbq
	ZMLi5hGEb1sF/Dm1pEe1jC3pwJDJa6CiEnaqXSXO0Lq3udr+jkgMk2RSzR2+qoqQtaptUH4vOqJ
	T7/4i2GFUFFbLdvNCSC46bIRTinLMZPgieYM3n48m4oVVa3p3qkObPQSRCQDeWYJWlMQaBI6w45
	dpAUJrIF86PvHnFC9W4ePV7AIvdg==
X-Received: by 2002:adf:e848:0:b0:460:cfc:eb24 with SMTP id ffacd0b85a97d-460304fec2bmr24364856f8f.22.1780992554596;
        Tue, 09 Jun 2026 01:09:14 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d69sm108188629f8f.29.2026.06.09.01.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:09:14 -0700 (PDT)
Date: Tue, 9 Jun 2026 09:10:14 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Dan Carpenter <error27@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	Nuno Sa <nuno.sa@analog.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iio: backend: fix uninitialized data in debugfs
Message-ID: <aifJtgLkM2m3KciV@nsa>
References: <aiEtIGOFhF8AfUCT@stanley.mountain>
 <aiExQzpIOwPgwd3-@ashevche-desk.local>
 <aiE3N6zErq2WcCvS@ashevche-desk.local>
 <aiFVuvVtaWbjfVzA@stanley.mountain>
 <aiFWg6vC2cVbONTK@stanley.mountain>
 <aiGRzFrSU6QUL4R2@ashevche-desk.local>
 <aiJo1kjN3_XDUdBc@stanley.mountain>
 <aiKIoqR0IQBZ-1ZD@ashevche-desk.local>
 <da949cdf51727f74d1f0f5b3e8248d5dc34e2219.camel@gmail.com>
 <20260608165138.16b88dbc@linuxescape>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260608165138.16b88dbc@linuxescape>

On Mon, Jun 08, 2026 at 04:51:38PM -0500, Maxwell Doose wrote:
> On Mon, 08 Jun 2026 21:31:14 +0100
> Nuno Sá <noname.nuno@gmail.com> wrote:
> 
> > On Fri, 2026-06-05 at 11:28 +0300, Andy Shevchenko wrote:
> > > On Fri, Jun 05, 2026 at 09:12:38AM +0300, Dan Carpenter wrote:  
> > > > On Thu, Jun 04, 2026 at 05:55:08PM +0300, Andy Shevchenko wrote:  
> > > > > On Thu, Jun 04, 2026 at 01:42:11PM +0300, Dan Carpenter wrote:  
> > > > > > On Thu, Jun 04, 2026 at 01:38:50PM +0300, Dan Carpenter wrote:  
> > > > > > >    168          ret = sscanf(buf, "%i %i", &back->cached_reg_addr, &val);
> > > > > > >                              ^^^
> > > > > > > Uninitialized variable.  
> > > > > > 
> > > > > > s/variable/data/.  
> > > > > 
> > > > > With what I asked in the previous reply and what you explained there
> > > > > (thanks, btw!) I still think your patches are not fully correct. They
> > > > > will require to atomically write all or nothing. If we want support
> > > > > partial writes we need to go with that differently (reset ppos when
> > > > > we got enough or more than enough data).  
> > > > 
> > > > Requiring writes to syfs and debugfs be atomic is pretty normal and
> > > > works well in practice.  These are very small writes.  
> > > 
> > > Perhaps. In any case your patch will break existing partial writes, right?
> > > I'm still considering that resetting ppos is the right thing to do. Just
> > > need to find where the best place is to do that.  
> > 
> > I think anyone doing partial writes on a debugfs interface like this one is very
> > unlikely but it is a fair point, yes. But can't we be more relaxed on debugfs? No
> > userspace app should be relying on debugfs in order to work (though I know that
> > actually happens).
> > 
> > Anyways, this is one of those interesting edge cases and easy enough to get wrong. I
> > guess we should either:
> > 
> > 1. Improve simple_write_to_buffer() docs;
> > 2. Or come up with a new simple_write_once_to_buffer() helper?
> >
> 
> When you say "simple_write_once_to_buffer()" do you mean a wrapper
> around simple_write_to_buffer() that also checks if *ppos is 0 and
> returns -EINVAL if *ppos isn't 0? If so I can start writing that
> function. Though I guess we probably want to ask Jonathan about it
> first since obviously he'll have his own opinions.

Yeah basically not allowing partial writes. Partial writes are also very
tricky to handle in terms of concurrency (assuming userspace can do
whatever they want). But I would not rush into writing the helper
without understanding how people feel about it (at least the ones in
this thread). Might not be super beneficial.

- Nuno Sá

> 
> -- 
> best regards,
> max
