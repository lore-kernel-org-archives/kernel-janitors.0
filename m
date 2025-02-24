Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D67C1F3D45
	for <kernel-janitors@vger.kernel.org>; Mon, 24 Feb 2025 19:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740425217; cv=none; b=gqVTBGElf+QigN8skHqU4EBIC/8wzMGXv4gDFBCe+PEXPIPFFaaIrQyiWU9/XtYtErENaTAwFvUf4XjfUQLUiQgBbKz+Xi6qk7xD5X1mZGFJyykqPut9KpHhVhRrd38EPjaeMVjuvu5o2RNSXemxKQbxZke7iv4WD1B02LoPJmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740425217; c=relaxed/simple;
	bh=RjsVDHq5onMdcNO8yu6bUCK3Q733x4J7UZ4pmLrG/ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uamH3KY7Fj2BTTem/bt5op9L69MIB/mLO9RGUoiMAtOMa2SSRzFFTgqBpQB6gF5nwFYK7SKMcnhWdzpmkKK7K8JL6SDbhVGBhqGIDtcofsd5L+/qQ8/Y6EAAOomeM54SBw1AydAEzf5GuFz6UpTe/ZtUkq8YKK1BL7X545bS6HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QvUMFj91; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QvUMFj91"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dee1626093so10530748a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Feb 2025 11:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740425214; x=1741030014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RpG14FyHciUCJeJWu7dlaHcQcwmbGCSP29+dFb0PBnE=;
        b=QvUMFj916w/3zQN75r97CA2nQQ6oiRtk5JJG2rHygf2jiEmc/+uPq3cnVUngEcF0GU
         Nd/O62RWxUKRqIJKnnpgrWNvWetGMs1l+AkvENWsHW9DvDtMhrp6ucQq2fbiMhJ2FH2Q
         1Q1dlesVGQoNGLJ9iGdsg0cs8lucp6FZvjpKJJvSiSJcGsssjIF71L1/BZ5muRJl9/G9
         nT/7IV2/wmrjnyjg3t9FAwzn61V+8hC9FTv2IdiG+1QseWIrEphjnK/llvHGaEbzA0xk
         sGihqEfBmm97AQ9nK66zWBGOhnR9xLUOe7l9Gt4/GN5Z0u69cOrSkqAsw2YmZsCApya2
         j34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740425214; x=1741030014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpG14FyHciUCJeJWu7dlaHcQcwmbGCSP29+dFb0PBnE=;
        b=w2vC2J4f2+sxd+S9gjGs3CuJofjHbBotvs4kmAladSOwCT0/jxL6ErOF1/a27WqqdX
         wBnocLYaJJ5V83hQ/9CFbgI+aS+AHq7ira53hWx+nDf8ybBr4vNj8y0S9A2lEwe6owkT
         ruptFhQY44CdM335ho7xOlGS4+3QlzY3zIatuGZWFO5iWkneaX5ts3pv8LqwxV55erE3
         WdJlSkOR0mVp20fSnAEjhXV525gaEPfSGbNc5Sce3ExZDH2ke4E3xzrNwP5g32/1i8g3
         5YTv5FIZfPq5/MxLzPx+mMUcKTg3G+Fo8c5ucsFmWtc4aJPoDAPn+KYrjnjQYqNKXkfW
         tPBw==
X-Forwarded-Encrypted: i=1; AJvYcCXHr3xqK88Z4wcJD44mSMEDQTqTDWY2pUVoSWSSVYjvAG5gXBZZZlTo1E117M/nqTyAsEFpHHwpdj6FAx82axI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBSEc2B97x1BfQi7fKeyJnfkJbGBYpGc8D6JUSxcMfoSeUdnWy
	Ycwr6gb2kLvHiMez55/+LxTN7f3Ni0xcwYWeWbv2Uhd0biVqsdC56QwG6lkbdDg=
X-Gm-Gg: ASbGncsN9eRw7ZZBOmQorpx6T01WRnqhP1/4Ce56mS4VVAP+AqbNCXI3SUW+igw/Pcz
	eneHmc/BVkE5Zk47wofTu2HgJU97Lk8URQfCBUwWi54ZilNyGG1GqMk30CX+OTAdVacPyWBy5r6
	nGr1KdokYsUmvAn6rnyu7LfqqxDVPrNiU0xtxRIhMYCPSpCQLDiXI6RNer9aLmFp4S9a9ZbmKwJ
	pebHayjXQqrA9WCuXuxsrnuI6brnp2E0ZRaQ16GCOWpHV+RpqX7gcJ37jJtcXdo5n7XF4RIRrfS
	KIcGLtL2yUIAgojIAQCnr0jWIsFHoC0=
X-Google-Smtp-Source: AGHT+IEkKWuUL7F5MtASBjfUP3GAc3+5X8K8oDEv6bNFiTlpvxETEam5AUBsm70isUAlIpvpz/BZvA==
X-Received: by 2002:a17:907:9989:b0:abb:daa7:f769 with SMTP id a640c23a62f3a-abbed5b21b4mr1841919766b.0.1740425213760;
        Mon, 24 Feb 2025 11:26:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abed1cd4c23sm11026266b.11.2025.02.24.11.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 11:26:53 -0800 (PST)
Date: Mon, 24 Feb 2025 22:26:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jim Qu <Jim.Qu@amd.com>, Lukas Wunner <lukas@wunner.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Takashi Iwai <tiwai@suse.de>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] vgaswitcheroo: Fix error checking in
 vga_switcheroo_register_audio_client()
Message-ID: <8e161bf8-70f6-4557-8fa8-81d4bbfab91f@stanley.mountain>
References: <ae24cd32-1e78-4656-b983-051ed22d86b9@stanley.mountain>
 <87eczn7adi.fsf@intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eczn7adi.fsf@intel.com>

On Mon, Feb 24, 2025 at 03:14:33PM +0200, Jani Nikula wrote:
> On Wed, 19 Feb 2025, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > The "id" variable is an enum and in this context it's treated as an
> > unsigned int so the error handling can never trigger.  The
> > ->get_client_id() functions do not currently return any errors but
> > I imagine that if they did, then the intention was to return
> > VGA_SWITCHEROO_UNKNOWN_ID on error.  Let's check for both negatives
> > and UNKNOWN_ID so we'll catch it either way.
> >
> > Reported-by: Su Hui <suhui@nfschina.com>
> > Closes: https://lore.kernel.org/all/20231026021056.850680-1-suhui@nfschina.com/
> > Fixes: 4aaf448fa975 ("vga_switcheroo: set audio client id according to bound GPU id")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/vga/vga_switcheroo.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
> > index 18f2c92beff8..216fb208eb31 100644
> > --- a/drivers/gpu/vga/vga_switcheroo.c
> > +++ b/drivers/gpu/vga/vga_switcheroo.c
> > @@ -375,7 +375,7 @@ int vga_switcheroo_register_audio_client(struct pci_dev *pdev,
> >  	mutex_lock(&vgasr_mutex);
> >  	if (vgasr_priv.active) {
> >  		id = vgasr_priv.handler->get_client_id(vga_dev);
> > -		if (id < 0) {
> > +		if ((int)id < 0 || id == VGA_SWITCHEROO_UNKNOWN_ID) {
> 
> Maybe we want to do something else here... see [1].
> 
> BR,
> Jani.
> 
> 
> [1] https://lore.kernel.org/r/CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com
> 

I feel like my patch is good enough...  I guess the concern here is that
GCC could change enums to something else.  I don't think that's likely as
it would break a lot of code.  The other option, which is a good option,
is to change the function signature for vgasr_priv.handler->get_client_id()
so that we do:

	ret = vgasr_priv.handler->get_client_id(vga_dev, &id);
	if (ret)
		return;

That's better code, honestly.  But I can't find motivation enough to do
the work.

regards,
dan carpenter

