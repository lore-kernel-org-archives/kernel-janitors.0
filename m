Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67E51A2620
	for <kernel-janitors@vger.kernel.org>; Thu, 12 Sep 2024 14:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726151664; cv=none; b=VSLA2A+ZDnQ2HFg2uKWzDUZHsOEBeOdtVvqk8bgOxOrt5gB8nU0lvo3EMN1yUa9T2/Vbi0xvLWHHIE4YsA1G30d1hHyfrerFPzLqBTgAFyQ+VwiLNJCZwdRyt9gq4uSzKDtVimVA1FN+oN+g5FFX4EY4VWWOdXR9u3ajqYB/lyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726151664; c=relaxed/simple;
	bh=DJE0DRhRrZx0poW9FyD9I9S+fR0Mtw1PPBG6E2yQo80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJ/Aa835a2gQaD7LfPG+iOiFkx1/aSoW9m5cK0kjXjOKQhbLRl59pqgFUeGlrF+ej06q1PhQJFmH2tCS3kZhIpHOWh9hpOvBuAJdogtbea4sfSHQzko0PoP6KkJ9Ellki7hfHgEVxQxEmr/r+PwvP+wCdyfgs3ugVTZaJLeMGh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G2ZjJpoP; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G2ZjJpoP"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8d4979b843so143474566b.3
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Sep 2024 07:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726151660; x=1726756460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C0EX2HgjxVqPKhpgg8LeyGWrmDZwY+66ETGwtRW0sa0=;
        b=G2ZjJpoPppCbyN8g0vJ0FfDBrT17EsgQwimGq1VKzeO9ZjGIIqcbjdFFdVAciZ75x+
         4F4lKxDVRAb27hRFLWZ5pPhnPQPKLEqANP4+hhbtZ485OszbquwUMvIg1gtfOIElN4lH
         ILfXi4gq4pmDRlQ2QEMZRM8qgubMoCkQdb0PCeDfXmtzseWY/XY4kXW9hUI3eOAReY/F
         XNnMTjflX2A9X9g6cx+um7WLkgLUt/jz1r1IDzMVlTqAAZNZXXaUQpP74+Nd8hQgDQCN
         iZ2O7ZsXbClDAY2FdxmNqL1JBL4by2hBGfQTbny7qmivyAf4xNDHDLSkqh3/PA5FTMH5
         p8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726151660; x=1726756460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0EX2HgjxVqPKhpgg8LeyGWrmDZwY+66ETGwtRW0sa0=;
        b=kKs0xA7GV+xcU/26pRjDDVzLn+pDvurxJSjKSAyvypC0SR9B6kUBAhQSyzmHOx2UtT
         0YbWt+7DV9hXgdBu2+HkeUgndgWmpeIeXw80VCRzyw7Q48b8ITNM+5vyMs7oXbE+VbJI
         rYqF+3qtVdRofK9ReprvO+ezLz3Wor1PH9mb7vvstJTblIy/K4RuAlrzoZRx9+KvnM0o
         M2D2lRppzyMn1Ww1sF9zUK5ArH2OoS5rWCntAuhy0yfubKEDIQxeXhkx2aHRIkjJo5Ig
         Z6iqqM7BKK8CbheKals8Ai5Eg94S8t7IxX4l1au9Ylyo9FfB3JRhQidXymT1VPI5bFJR
         TG+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXODT4tQfrWetCh/f4xN9UEJk7uN5yBuwXgWpQKqHcVKhnthcbhhLTkS8JOF6iy42SSRzLsO0excCT7JlRlLSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpShuRpH0TTFa3NQnBBJjcMf4T60Zo+Miba8U43M67VhNYIKKE
	23cxyuVawqy+iuVKfEKN769ght/CBjlabhyYGhAHVT8bipjnaP9kPV4Ip45o5LLTDHyQZxECEnC
	u
X-Google-Smtp-Source: AGHT+IEZpHU5GPSEYNt4f6RP6dOCgWy9SFNFI4vKccv9wXlXdQJTjacS5RvK88el5ye4+T2LAQ4vRQ==
X-Received: by 2002:a17:907:961e:b0:a8d:4f8e:f64d with SMTP id a640c23a62f3a-a902966826dmr288121066b.54.1726151659983;
        Thu, 12 Sep 2024 07:34:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ceed73sm759096666b.174.2024.09.12.07.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 07:34:19 -0700 (PDT)
Date: Thu, 12 Sep 2024 17:34:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: prevent some integer overflow issues
Message-ID: <e364e109-5dac-4a24-b179-af0ee5659990@stanley.mountain>
References: <0f03d569-9804-4617-a806-f0e5c32399fb@stanley.mountain>
 <87v7z1yyok.wl-tiwai@suse.de>
 <20c99f50-948e-4076-ba28-9640c3cd982d@stanley.mountain>
 <72907305-eddc-4fb4-9c74-7e1d2750f4b9@stanley.mountain>
 <87r09pynn5.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r09pynn5.wl-tiwai@suse.de>

On Thu, Sep 12, 2024 at 04:03:58PM +0200, Takashi Iwai wrote:
> On Thu, 12 Sep 2024 14:44:30 +0200,
> Dan Carpenter wrote:
> > 
> > On Thu, Sep 12, 2024 at 02:29:58PM +0300, Dan Carpenter wrote:
> > > On Thu, Sep 12, 2024 at 12:05:31PM +0200, Takashi Iwai wrote:
> > > > On Thu, 12 Sep 2024 10:51:14 +0200,
> > > > Dan Carpenter wrote:
> > > > > 
> > > > > I believe the this bug affects 64bit systems as well, but analyzing this
> > > > > code is easier if we assume that we're on a 32bit system.  The problem is
> > > > > in snd_ctl_elem_add() where we do:
> > > > > 
> > > > > sound/core/control.c
> > > > >   1669          private_size = value_sizes[info->type] * info->count;
> > > > >   1670          alloc_size = compute_user_elem_size(private_size, count);
> > > > >                                                                   ^^^^^
> > > > > count is info->owner.  It's a non-zero u32 that comes from the user via
> > > > > snd_ctl_elem_add_user().  So the math in compute_user_elem_size() could
> > > > > have an integer overflow resulting in a smaller than expected size.
> > > > 
> > > > So this should also use the overflow macro, too, in addition to your
> > > > changes?  Something like:
> > > > 
> > > > --- a/sound/core/control.c
> > > > +++ b/sound/core/control.c
> > > > @@ -1618,7 +1618,7 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
> > > >  	struct snd_kcontrol *kctl;
> > > >  	unsigned int count;
> > > >  	unsigned int access;
> > > > -	long private_size;
> > > > +	size_t private_size;
> > > >  	size_t alloc_size;
> > > >  	struct user_element *ue;
> > > >  	unsigned int offset;
> > > > @@ -1666,7 +1666,7 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
> > > >  	/* user-space control doesn't allow zero-size data */
> > > >  	if (info->count < 1)
> > > >  		return -EINVAL;
> > > > -	private_size = value_sizes[info->type] * info->count;
> > > > +	private_size = array_size(value_sizes[info->type], info->count);
> > > >  	alloc_size = compute_user_elem_size(private_size, count);
> > > >  
> > > >  	guard(rwsem_write)(&card->controls_rwsem);
> > > > 
> > > 
> > > I've reviewed this some more and those changes are harmless but unnecessary.
> > > info->count is checked in snd_ctl_check_elem_info().
> > > 
> > 
> > I also considered if I should fix this bug by adding checks to
> > snd_ctl_check_elem_info() but I don't think that's the right approach.  I
> > couldn't see how it would work at least.
> 
> OK, so it doesn't seem affected in the end.
> The input values have been checked, and they can't overflow.
> 

Ugh...  I need to send a v2.

The bug is real on 32bit systems, but reviewing it more, I don't think it affects
64bit systems.  And I made a mistake.  We do need to change the types in
check_user_elem_overflow() but the negative values were intentional in
replace_user_tlv().

	if (check_user_elem_overflow(ue->card, (ssize_t)(size - ue->tlv_data_size)))

The size variable is the new size and the ue->tlv_data_size is the previous
size.  So making the buffer smaller is fine but going over the user limit is
not.  So I need to re-write this as:

	if (size > ue->tlv_data_size &&
            check_user_elem_overflow(ue->card, size - ue->tlv_data_size))
		return -ENOMEM;

regards,
dan carpenter

