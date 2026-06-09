Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006E837206F
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jun 2026 07:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075342; cv=none; b=PmhseJSjhx5hU/OZuTUFalM7pNkkIuCjfyS4n9hWUqYKcuOm78MXlUialOAqfTdIYyfHHhj+00XwSGn50jaDTPMvXABa0Lp0exoqKJxFbAVYYQsiUhSSBMFjewy93Moj6xk/CGLX9sgKpjZXwEcVPGbHHiukgiZDBvMhV/JxqKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075342; c=relaxed/simple;
	bh=4QaEaRpHh5ob/pH1ZPfGUqviHLTt9W6IoZliqWkOIDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKOa9aJA1rvR7lDHQYuGZR9paJ+rAklEOH8kUDwkQKHVj1IDvKqT1+AkxZ3TaVsO5GL2P6X3m4yybEajEJ2YDy7//b73iRv0bIhWlIPkguTlcxvgTR24FdNlaWgDa1K9wWGR1EI91IVKZ3XMzPhAtk+u0DQYIuEEzOf4iB0sPto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9f5l8BF; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9f5l8BF"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9156ceb55ffso554740885a.0
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jun 2026 00:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781075340; x=1781680140; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YJRNM1QqidReowMfIbP+H7r4w0/cgZrB3E4XBHg5YIo=;
        b=X9f5l8BF31uXJkQL+uHdEeCELUOez6OuXO0fJbgR4YNoRnkYtIO5ou/iJrURZnhx3Z
         x1PEsMM6ZnrWmT84b1huW/FskmObjsCycvjO2k7toXaVTNQVJqz5e5eODNUVc9djtYUw
         H8kUgvgCg8a5ScsnB5yraP+amdoyfAzNtG3YYrZsWCZ/P43FFTrFgVLgfSC426Ovau56
         HrCeL7x+KqGVabBbpWmtPZ7nSFms2ofj5l86U9DKZmOVtzgtLXH7y3gvH0F5wToVuOHV
         SPvotJRK5DLfq0hnxQ5FUeXwJUx23foHFN+CAZnPJ5D2rIsvrHXveLTsqA8LNXQyPYb/
         ZmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075340; x=1781680140;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YJRNM1QqidReowMfIbP+H7r4w0/cgZrB3E4XBHg5YIo=;
        b=GYVARNK4QvYAFd/IThMGL1txddz2XyjMGW5uPF+BTXo6WmJMZbDvJennVoQtBfPYP6
         WaJFtN7V6oL2+wuutgdJkLD+oLysoRqTPLcvGlcjT0tK7WDE7Cer+2/4Rer62Pzf93Lg
         wHNrOZ+0xXNhZOliOuQ5BeJQsFz+sXhlrnatblREYLcXM28pfK2VMjKw8ItzBuS1blvZ
         zN6tb3juBBtO72xuIFTkAVJ/+5SCVQNCUpRkX8DxEXWYEVtC+NviwBPk2IxtvkhdQ7V5
         rcfoBumkmspMieAK7AUnBm8cRQy846pP434g3xWCABKLd5bxslEchvR+S0rXBIRCt/Lw
         PP3g==
X-Forwarded-Encrypted: i=1; AFNElJ9nBjIWBGyuQcaJw/GdvLGehbAzkiPQbdz0GCjYny5C5IleR8ul+l31FdgZB75XnD4c7a8qoufZ1LnQhKRwObA=@vger.kernel.org
X-Gm-Message-State: AOJu0YznlxfQGTQ3JzGRuPjccS8Gp3eAfO4q2bkqwYJb+Bq9uGG4k82+
	2+BPns/CpUC9uq2ZXvvox7CeMkcJUHVpZa3coHAZbzikqQowpHRG1Ux9eQMuBKrB
X-Gm-Gg: Acq92OG/oVAZOAlyZLeV+xiSE+Sg2Obpj6JIjAYFEATbvFREI8BqW5bgZadmmmpKIkw
	yAA4OLAJJnRgckdT7voX8Uzvzqup28uP+qyglvqmBIxjTSnLabDZgkH9ueGzVEcPhXGBaZHzm79
	1Cg7+3gpYgh4vZ98DWrm02XYEodPOag1pr8YhOA/+aAMlfYfDNq8rMAoSCWGWRc4s9sGZagenXU
	gqzl43K4v070qodoauU8Xi5xhO4aTnuu+/HulVtLZ6DikZ9aiPF77x1jwSRbfUFy97SiZUvHIHQ
	YotnQGaSS88kRyIL1oqYWzjwxej6F7zmKOAI+UeN+AolTp4ua8KPoc23j/AoJsvABqmLNGkXmXK
	scl0LYE02XII23ukZbAQKqV59sFhrkPsuMtBfLUD+4G13csWdNEKuT78ITuA+Ti6HofmOvKP3Wc
	mNaReDEWO3xsb4n8OqW+j+/jJUTI4=
X-Received: by 2002:a05:620a:468f:b0:915:9fba:8795 with SMTP id af79cd13be357-915e822c8c9mr960670485a.1.1781075340029;
        Wed, 10 Jun 2026 00:09:00 -0700 (PDT)
Received: from localhost ([149.40.50.222])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a21f871sm2377796085a.12.2026.06.10.00.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:08:59 -0700 (PDT)
Date: Tue, 9 Jun 2026 09:21:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>, Nuno Sa <nuno.sa@analog.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iio: backend: fix uninitialized data in debugfs
Message-ID: <aiew0c3_wvw_ZKjs@stanley.mountain>
References: <aiEpmqKwFuIMRfdl@ashevche-desk.local>
 <aiEtIGOFhF8AfUCT@stanley.mountain>
 <aiExQzpIOwPgwd3-@ashevche-desk.local>
 <aiE3N6zErq2WcCvS@ashevche-desk.local>
 <aiFVuvVtaWbjfVzA@stanley.mountain>
 <aiFWg6vC2cVbONTK@stanley.mountain>
 <aiGRzFrSU6QUL4R2@ashevche-desk.local>
 <aiJo1kjN3_XDUdBc@stanley.mountain>
 <aiKIoqR0IQBZ-1ZD@ashevche-desk.local>
 <da949cdf51727f74d1f0f5b3e8248d5dc34e2219.camel@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da949cdf51727f74d1f0f5b3e8248d5dc34e2219.camel@gmail.com>

On Mon, Jun 08, 2026 at 09:31:14PM +0100, Nuno Sá wrote:
> On Fri, 2026-06-05 at 11:28 +0300, Andy Shevchenko wrote:
> > On Fri, Jun 05, 2026 at 09:12:38AM +0300, Dan Carpenter wrote:
> > > On Thu, Jun 04, 2026 at 05:55:08PM +0300, Andy Shevchenko wrote:
> > > > On Thu, Jun 04, 2026 at 01:42:11PM +0300, Dan Carpenter wrote:
> > > > > On Thu, Jun 04, 2026 at 01:38:50PM +0300, Dan Carpenter wrote:
> > > > > >    168          ret = sscanf(buf, "%i %i", &back->cached_reg_addr, &val);
> > > > > >                              ^^^
> > > > > > Uninitialized variable.
> > > > > 
> > > > > s/variable/data/.
> > > > 
> > > > With what I asked in the previous reply and what you explained there
> > > > (thanks, btw!) I still think your patches are not fully correct. They
> > > > will require to atomically write all or nothing. If we want support
> > > > partial writes we need to go with that differently (reset ppos when
> > > > we got enough or more than enough data).
> > > 
> > > Requiring writes to syfs and debugfs be atomic is pretty normal and
> > > works well in practice.  These are very small writes.
> > 
> > Perhaps. In any case your patch will break existing partial writes, right?
> > I'm still considering that resetting ppos is the right thing to do. Just
> > need to find where the best place is to do that.
> 
> I think anyone doing partial writes on a debugfs interface like this one is very
> unlikely but it is a fair point, yes. But can't we be more relaxed on debugfs? No
> userspace app should be relying on debugfs in order to work (though I know that
> actually happens).
> 
> Anyways, this is one of those interesting edge cases and easy enough to get wrong. I
> guess we should either:
> 
> 1. Improve simple_write_to_buffer() docs;
> 2. Or come up with a new simple_write_once_to_buffer() helper?

The right function is copy_from_user().  The point of
simple_write_to_buffer() is to support partial writes and in many
cases that just doesn't make sense.

regards,
dan carpenter

