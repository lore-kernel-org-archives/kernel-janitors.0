Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B691358391
	for <kernel-janitors@vger.kernel.org>; Tue, 28 Apr 2026 14:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777388361; cv=none; b=lZSm6JRXaVM3tvgzVcvPdckIgJqcEfNLbcsGIRrTXEfA0AvNc7DU6pZSK0yDQIIdHrsYBCRZcTq1XbSzfxs0SMjQ2lyEF1C76HBvxN3SxKOif4vE76ytSiuvYh5MQW+X2SeNL9mQQSGMJAxop9n3/Or14WbChgXEKxxR7UPs68g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777388361; c=relaxed/simple;
	bh=UV21fsPH20R53rAOsbw+qETeN4GT0nuFihwLnir8SOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzApyWncNGf2CRKy4Cd0jyvj8bILTONE6CRJ0AJYfF+RNEMP/ZiS++n2qlOyqGfiBpJssJgEc++f7QyUSsAHUKQ61scPqno6k0StgC1WpMgFaOaQbTcvJRyKIbYtp0HfFppYtpX9502OdjA4vVnVGcGrUO8vMJyd67NIBsAb1mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jmvabrfy; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jmvabrfy"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891cd41959so98614595e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Apr 2026 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777388359; x=1777993159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xjifj32lQV5b+bLCm2NY5OLnoNmHIUz/l7KlvEd3nhA=;
        b=JmvabrfydeY370EwDnYVlGcOJ6OjYbIAThlMZsEp5EexFWcP5LMVdgrVyryGOTGq5C
         9gdq1nWLyyx+2rVOWAPnqo0467TLz/AglqLpMmQYHvro6Pn0XE8kD07ptjgc1R9uEh3C
         EK2iiKj/js1jylung9L9a91StRKqgWT1dCU38JAvDR8+qGDN2TF3qFYLu2sB5DAEQ9bs
         IUk6leB4vG4Dn+pGJdDTN/S9KOfYpHp34dluDOo6hl+CH7f6XvUTPnYrHwM0EQ2OvLo1
         KyAjxl8XwYRfEI7WN3I22DDfH4Xa7IC6dFKNSzYzYxgN8PofJmOVykqA1PsONe2Ex2Ia
         wDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777388359; x=1777993159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xjifj32lQV5b+bLCm2NY5OLnoNmHIUz/l7KlvEd3nhA=;
        b=mD84MiiQjkLC4CYiJdx5W6oOkO8WlOQrlbe0QBv6WyK1F9Y6x1qEAKZ4Ozm+kEOTqH
         FF0tjRiw+TvxFRh/IyjmTAQQwTrKuJ7hxP4xB1EquXAuC/dtgdf04VzK9imkbs1lXFfV
         0Uhc1OMz2HGfAwkmY7FaxZ75CvPl2a4IU+Jlf/TMXe4wN4UE9JJOcgvnDhv7xXXRmZla
         m0sdMsIPbZRg48czZAzMZHP45dEE/LehUI6+b+G9uoT1i0o6WlFs304vpKTH772/3PDv
         7LozNvv9DyKdevUueEEiTDTzXWT/UuuB1bB7TyQh0m850GbMYtJBEKXj6poWPyrMilC4
         ttvA==
X-Forwarded-Encrypted: i=1; AFNElJ8MZ1pV0m+cCE+w6VPomwin+HGdtcncXj27SF3H1LAzX5gozdSEkvGQSI6a0hvPoND1iiOrGlWgAc5yozipGtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPG14hCDT4nJnppjY4tbj0nuY3HsS0L+B8q7aMS1TeBvbbgWHZ
	LH6PLjWXu7cKqDkaD/WIb/lmmVR3tsuZneHJF5Sm2Y1GUAC/2AYE8w/2
X-Gm-Gg: AeBDievyHw/ip8HBZ2wWcgdKM3lHOtyv8F5rfTZ66U+cK08ZN1gyW5mW35ltbFpLimB
	v36+azYi/+DGmGgqTuBHldR5ZXrYZvylYVFqC5oAGUJy/XvZUUHpvxBxGlAZjbiw17HevrNCnjN
	Q/Z22zl4W0EZBS6DjmUORE0p4oDi/KxFIKgd6h97UoYnEUH1tyj+4fKqB6bNgkzS5TPMxCVvmk6
	FdxOMF9UdYW4Y7yyNljX20ARXsK0HZnn9U6dDJmq6AvpchH4qZ5zTYYEwSh1mfYUWzf0IFQiuGQ
	LXAB5x2C3DISnAN0x2IpH8m1JakrmGZ9lCBXMHHYziNcZtaUzcekIyMVv0naEXj308Go/Q7PpgD
	ypwey0wsN6kC9tcdEAAiaBo+QdSEURVfWEElGOg5bBc76boCvZVlmlt3vT3oquSleVpZ9bukSM5
	Pd9z4ov6PkEgvrtq0hyq/5FrjE6RXZcQ==
X-Received: by 2002:a05:600c:a315:b0:488:9e54:94c0 with SMTP id 5b1f17b1804b1-48a77adc73dmr39426575e9.8.1777388358658;
        Tue, 28 Apr 2026 07:59:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a775ea85bsm31476575e9.6.2026.04.28.07.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:59:17 -0700 (PDT)
Date: Tue, 28 Apr 2026 17:59:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Jakub Raczynski <j.raczynski@samsung.com>, netdev@vger.kernel.org,
	kuba@kernel.org, intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3 net-next] net/intel: Replace manual array size
 calculation with ARRAY_SIZE
Message-ID: <afDLQUjaQ4Zs_9D_@stanley.mountain>
References: <CGME20260428103757eucas1p132f3f1123fae21d596a51cbdce72c931@eucas1p1.samsung.com>
 <20260428103653.3539239-1-j.raczynski@samsung.com>
 <ef61b770-ebf4-406a-90a0-8a49aba02aee@intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef61b770-ebf4-406a-90a0-8a49aba02aee@intel.com>

On Tue, Apr 28, 2026 at 04:06:48PM +0200, Przemek Kitszel wrote:
> On 4/28/26 12:36, Jakub Raczynski wrote:
> > There are still places in the code where manual calculation of array size
> > exist, but it is good to enforce usage of single macro through the whole
> > code as it makes code bit more readable.
> > While at it, beautify condition surrounding it by reversing check and remove
> > unnecessary casting.
> > 
> > Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
> > Reviewed-by: Dan Carpenter <error27@gmail.com>
> 
> thank you,
> Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> 
> (next time use "iwl-next" in the title, no need to repost just for that)
> 

These prefixes are a headache.  It seems like no big deal if you only
work on one subsystem, but if you're dealing with tree wide code then
we're dealing with 418 trees.

These days I have a script for net and net-next because they are a
high volume list and the original prefix subsystem.  But otherwise
it just automatically puts [PATCH next] if it's in linux-next or
[PATCH] if it's in Linus's tree.

These are all automatic on my end, right?  So it would be totally
possible to automate in the recieving side instead.

Although in this case, my script would net-next in the subject because
I had no idea that Intel was managing their own ethernet drivers...  It
used to be that wireless had their own tree and everything else went
through net.  So it's just seems like a in impossible task to keep track
of it all even if you are not a newbie.  :/

regards,
dan carpenter

