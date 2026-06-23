Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC2C3CCFA8
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Jun 2026 08:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782203142; cv=none; b=Zeti5fkhNG6Ao74qAjfBwYqB+vGQpIQ4DuUzg8lpADnDS/MGnKJ57G5jVA8HRtrfHjby1grslGdEoITxB53/fQCB8mjqnFIvEiQWPFz5T6POsieddZHSF0Xo4lhOMM3Mx+z+aA+mlcy3PSC2wy5+1zS2HWGDBpPsHTcXF1rZldE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782203142; c=relaxed/simple;
	bh=w+Yprz6gPnfCTWQzn+iEeqPdcFQuLBp5WN2JtzjdD/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fa/Re0RpWIJx9AnjzJoHbDe5DrH6ZyQmONotJTfv+wiEKRTxc3l9Nwy8vhTW4ySRASie4ui6dSR7gsrARr+4d51XV9k3i7DNSlHE2pRic74QVlzOD01lQs7dkXibRdAIn0B2uGjNsdjtwJxA/N20RiwtH8EgZsn9HSIbLsDzLbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8cRKsvA; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8cRKsvA"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso594541a12.0
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Jun 2026 01:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782203140; x=1782807940; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rw8divJl7O5oozJv0YeAP+7zE7WJWMFNfq7nx+wH3uY=;
        b=c8cRKsvANRvkkaRL0jysJl+axY6ku9bN01GdKhJvOSn98BMR87uCDpETuAFNZOI9Qb
         koCR9D/TKOpolSKvtV2ZKO65YRyg+mxVCpKqbBmud+pICgzaAv9G/JKW+4vc5idf1yrA
         lx7VZCh2L87V4eWI5muUcRSN9GBXqeN3eqPq1TCb05kklOHAYI+sDSTHLTyCt4K1EUb/
         Kd16LPxYAmPlhQ7NLD+02ad5YSmfGD8u4x9J5Aq7ynk7sjkvelVZQxrxV5iRcNH2Z8qH
         vj9zdK3/1Ctakv78d4QH5m2URmzvqyMYNN3Jx+M0UmY+ti/N6Z0Bw/hWsSxAJDKFE39Q
         RQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782203140; x=1782807940;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rw8divJl7O5oozJv0YeAP+7zE7WJWMFNfq7nx+wH3uY=;
        b=i1fh7Z4stH7DvmnHq32F73AU7izlt/09ado96xn0TIEd8mvtMQn+CrqSmmkr+fbyaY
         uX50ZsXK9BavE8ZiPsIPytKDh97fqYzqlOxLutgYvgeEBbv5vVWlGpzO5fyn4j30HpV6
         6erwG0HSeWobep/obQi1gz7vVrUxmdRgtnCuPlAJKKEmcPA4C8/yonsRRxpJCTp6NGXe
         liXf4B+U4HTeeaRqHVB/Kt4BQaUrJ43p7Ebdj0YV8huhmrh/9z76msf/QZwZE82FTFUv
         kpIUcgoGv35j0angGxIGb1Q8vhAFNQCg9KtiPp0KhfAdOSygat8yipCqUPJJMEHcpP5f
         gEAA==
X-Forwarded-Encrypted: i=1; AFNElJ9d/nfRrJ9V/pHsU4Jt9A6lbewpL/i1SzUvn7xfQHFMpsJ7YV9oi4cL/jumBwehBVBVVZ9G/37yzm3URYgtSUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxosGk/a4woYTNvhi1stDrVR8Bgg/2zAx9USdygxYOojVbM2NEC
	1j63JLgkz0SwKnHvrxIXw56S+Ho9FLixp+6bsXKSuumxaFnW6IRETEPE
X-Gm-Gg: AfdE7cmikWnTaLnJdK++oSndKBKOyb/MV2uIRfGiADnj+05++CwXKGgkwY32OnxXNSh
	94JG5rmDwpvAG2PbQIqQyh/FAcOc4EunDshJEjum00O9FOgz64mvJ+/rxcXMnB1DosQUgDNDBZM
	GY2KFev86WoJ+doTDoIIJ0fjB+DLfFoMzRlGXcK9xMN/wvXnNTaObmGTJpjE4euhvQXSuOb/wiJ
	q9gGRSiCw7McJ95e5LWkIfX5i5DIZeRDORjFdAKZQzDx7pFNOvQil/VdHKF4MuXeEHmxKcarIWh
	QJJh3J+fyTxyg/AtezdJ0z3+KfJhlXvsRcOJAwRBQ/6PEYPRihrSpnh6ckmTEBxOMUazPuiMMFG
	G8UtWNXZB+yvKcar1iAfB47P4ChsJiqTpIluEKhk8WKbP+cQNAitNhw5NLTTIehxdvEp/a9GvHK
	iCJABvMLQa
X-Received: by 2002:aa7:d70f:0:b0:68f:9fd9:435a with SMTP id 4fb4d7f45d1cf-697d46111f2mr945051a12.17.1782203139356;
        Tue, 23 Jun 2026 01:25:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b84f362sm4117742a12.10.2026.06.23.01.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 01:25:38 -0700 (PDT)
Date: Tue, 23 Jun 2026 11:25:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] thermal/drivers/rcar: add error checking in probe()
Message-ID: <ajpC__grEvoB9TCa@stanley.mountain>
References: <ajo6iQ3VWvcxedA9@stanley.mountain>
 <20260623081822.GB3937090@ragnatech.se>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260623081822.GB3937090@ragnatech.se>

On Tue, Jun 23, 2026 at 10:18:22AM +0200, Niklas Söderlund wrote:
> Hi Dan,
> 
> Thanks for your work.
> 
> On 2026-06-23 10:49:29 +0300, Dan Carpenter wrote:
> > The thermal_zone_device_register_with_trips() can fail for a number of
> > reasons, including allocation failures.  Check for error pointers to
> > avoid an error pointer dereference.
> > 
> > Fixes: 9d617949d490 ("thermal/drivers/renesas: Group all renesas thermal drivers together")
> 
> I don't think this is correct as this commits just moves the file.
> 
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> >  drivers/thermal/renesas/rcar_thermal.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
> > index 6e5dcac5d47a..71f836fbc698 100644
> > --- a/drivers/thermal/renesas/rcar_thermal.c
> > +++ b/drivers/thermal/renesas/rcar_thermal.c
> > @@ -492,6 +492,11 @@ static int rcar_thermal_probe(struct platform_device *pdev)
> >  				"rcar_thermal", trips, ARRAY_SIZE(trips), priv,
> >  						&rcar_thermal_zone_ops, NULL, 0,
> >  						idle);
> > +			if (IS_ERR(priv->zone)) {
> > +				ret = PTR_ERR(priv->zone);
> > +				priv->zone = NULL;
> > +				goto error_unregister;
> > +			}
> 
> While this indeed is an issue that should be fixed I don't think this is 
> the correct fix. Below the if .. else .. block where this is added there 
> already is a check for IS_ERR(priv->zone). That however does not guard 
> against the usage of priv->zone for thermal_zone_device_enable().
> 
> We should only call thermal_zone_device_enable() if we are on a system 
> that uses OF (gated by chip->use_of_thermal) which is the reason for the 
> if .. else .. block in the first place.

Uh, what?  Other way around.  Only when use_of_thermal is false.
This function is weirdly confusing...  Also the rcar_thermal_remove()
function already calls thermal_zone_device_unregister().  I'll send a
v2 later.

regards,
dan carpenter

