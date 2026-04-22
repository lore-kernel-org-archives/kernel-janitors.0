Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A133ED127
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Apr 2026 13:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776864192; cv=none; b=mligxHMYZ01QuTf8MY7aMI50vLkgp5H4kqv/3/WPRxnLtACyijeywES8G0IFp22v0GilXPK1O6s5Zq3lTADq7dIptVtK8dwGa3eX6wjs5Xrm4yZl3SpETLdXhryHQG60GuQ45Rk3fUXxzS8SymNhaRVdJWTMlWz7FQO9XGAkELg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776864192; c=relaxed/simple;
	bh=TLOu7d6PEufyhJW1gftp1KKhfOJsLSxahWuKn4GauW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPwVyhP3j5ioLNfOd54bimwdE/k6T3AmrEBiEuB6Tlv5uqPW3vAXK4T4vfzq3Pt9qWG9OYGx+mbXSQAB7ghkbk38jtyvP59fnRn/9H8fXyj4DVM7BFOD2Tw/Mw9ZGlZpVmu879OEyImS7Hjcc+gPsPa6wPlr1yQDqic1mlsoPlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSMG9wHq; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSMG9wHq"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79a535e7c00so62371667b3.3
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Apr 2026 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776864185; x=1777468985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E3NmYgdWW12B1Wn2igviOU+gqNcSGYOouIwQpeCD82o=;
        b=gSMG9wHqpaajv86pcXf8hHiwqy4X+Aq2CmAh1pbJgV1j0qsn2pdPgMcGMiHSturq+X
         d+dZP8YZ++Pg3I4KIsYybc/X0XwN2mVDXW6bgkAk2tj0GcfQPng4pQOImIXeCdF+bKck
         j9QAUGh3Gvx5Y1Jzl2bhogszMpXD9JfyV5dXOuQzYNjYVNyJF0daXf6As3jJazyCI9nf
         eUGk0+7033XARzzpmX5bBgyw4qCQTam2a6NVT0ECjrB3rh61zeDZos5vX8EV3TolRoVN
         eCzd4s7xs+2NQ5Ih9uM9i+ULRPpROOyIRyTuYbbSxdvWmILaNIc4QS1YRrGZi7CJR+a3
         vGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776864185; x=1777468985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3NmYgdWW12B1Wn2igviOU+gqNcSGYOouIwQpeCD82o=;
        b=EFfKv8V8H6RLh52IC/OeRzaZ4J0bjM1kGQ04UnBj+KSDenJIKP+cjJ8kZPSVmbdYDn
         rcQoN/yM0tgW923lXJaJV/SuyCz2xbW/ybC8lMSVPzJa6vCjK0j7huLzAj+WRBFy0Dv6
         dNB4ahFEbg6kuWRu7chGtHLuyXMgRMeBC1etYLS4YGafFIMYroOE9MOdJUf6wOq6fjFa
         XZWLccDqj/P3Mo2MMLs4LhRyMlstL9baJy3rZmQpqHBxTMm4corCDq1Edd60rs4f2Kmi
         ueiD0uUqiCVGtnvuH7y1hjf6qCy92yW6ZvLpX2fg+Kx/4TuFir40taM+Mvkld/blTXZN
         MsMA==
X-Forwarded-Encrypted: i=1; AFNElJ+OLrT2k5yoCWsi8A1wx2qt3l4NKZ3v94M0zP9m6rOHwI+Ak6nR+s7PbHdhYD9oKgvYBM9sVE0Gxm3T/wZSAlw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3PDtukNBvNuJmrxQfSy95a8cYY46sAJoLf/VyKuRvYsz+TWsw
	K1Z75ljjgaRthTdbF29DfumVgp1Q4Y6VdSvBElhvicxfs1zjV8AmTldw
X-Gm-Gg: AeBDieu6Hqbgo8ib6E79kHiF+iEx7f6kepmO/DOUnsM8R72V1YHNgiUiGzE2aJC8X0h
	klUfx8zBbf96futV5XoHqz1++ouDL8q+7jOrqlashzwZBbs8EWlyiV2qdWRl7w7Bp9mnCiUGvxK
	6RomL68LETKCqClSvdlSX3FYbXcNXC0JpE2vEmnkVmQ4U4uXeiKc859xk6txrIVdFmWn1RlJ1cJ
	c8UR9m/LHU/oY6oVxPAS3p7gozqIZAaMYOrOQa1ln+kAQogeYfvTd4b3EejGXKGoVd00SJGnEke
	cS1byF6gSxBlp3DmFcwHIOM1nVgA2p0nImuotcDbkFOqohLIaStWpz5Ag2jmmpMnHAfr+efEScJ
	5iMNTASIBBqw6vDKn9K7CO8RaZsxi0K65l8kNhyjZdQdJDjvQCBnay8bmBIJbWd8tuYO1+6kfuj
	4GoKRwp9iA2CGNjTcZNU9TZUma64UGGY/DGot3rE0=
X-Received: by 2002:a05:690c:6212:b0:79a:b46c:e60a with SMTP id 00721157ae682-7b9ecffd233mr228838177b3.44.1776864184950;
        Wed, 22 Apr 2026 06:23:04 -0700 (PDT)
Received: from localhost ([172.216.252.13])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee89abd7sm67523687b3.1.2026.04.22.06.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 06:23:04 -0700 (PDT)
Date: Wed, 22 Apr 2026 16:22:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org, przemyslaw.kitszel@intel.com,
	anthony.l.nguyen@intel.com, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] net/intel: Replace manual array size calculation with
 ARRAY_SIZE
Message-ID: <aejLsqoXKBHwWTbL@stanley.mountain>
References: <CGME20260421114034eucas1p1d746ffe32b49aeb57f10e729d1331124@eucas1p1.samsung.com>
 <20260421114029.2689961-1-j.raczynski@samsung.com>
 <aeeFh1zQqhVysvxI@stanley.mountain>
 <aeiHkejLjhRKyj/u@AMDC4622.eu.corp.samsungelectronics.net>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeiHkejLjhRKyj/u@AMDC4622.eu.corp.samsungelectronics.net>

On Wed, Apr 22, 2026 at 10:32:17AM +0200, Jakub Raczynski wrote:
> On Tue, Apr 21, 2026 at 05:11:19PM +0300, Dan Carpenter wrote:
> > On Tue, Apr 21, 2026 at 01:40:29PM +0200, Jakub Raczynski wrote:
> > >  
> > > -	if (!((u32)aq_rc < (sizeof(aq_to_posix) / sizeof((aq_to_posix)[0]))))
> > > +	if (!((u32)aq_rc < ARRAY_SIZE(aq_to_posix)))
> > 
> > This still isn't beautiful.  There are so many parens.  The !(foo < size)
> > formulation is weird.  The cast is unnnecessary.  Better to write it as:
> > 
> > 	if (aq_rc >= ARRAY_SIZE(aq_to_posix))
> > 		return -ERANGE;
> > 
> > >  		return -ERANGE;
> > >  
> > >  	return aq_to_posix[aq_rc];
> > 
> > regards,
> > dan carpenter
> >
> 
> Alright, will beautify it and resend soon.
> 
> I can see potential original intention of not comparing unsigned from sizeof
> with int, maybe that was original compiler configuration to include that
> warning.

Yeah.  I know.  I wrote a blog about this...

https://staticthinking.wordpress.com/2023/07/25/wsign-compare-is-garbage/

Check this out:

$ git grep '(int)' | grep ARRAY_SIZE | wc -l
53

It's as if we want array underflows.

> But at this variable range it is irrelevant and it is probably most disabled
> warning ever.

With the unnecessary cast I had to review to ensure that aq_rc is not
unsigned long type.  There is a real downside to this kind of rule.

regards,
dan carpenter

