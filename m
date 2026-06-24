Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF972E22BD
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Jun 2026 13:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306958; cv=none; b=ELrFN/JdbW5OqdVYvIm0Ej4lCSPYYIrm9KeuPcL7Ek5IkthvaI3Lp80iuFA+0HPTWmu0d1jxkeotabwW4/FxzfjhyJqoCGfvGsszuNiAjdXiRNmZ6FXEfcydmicFRYNkvcMoz5yJxk4j+Dg+7haNpstkwKrjn8NLCoGYAiNYIeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306958; c=relaxed/simple;
	bh=/nqB0qbAotm7Tm2k6JejyL6c3R4u9JfzmCNWpnZVIno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plBr04Tv4pJF5kL9a7lIi3g4TVFlNx8m/TLZ1CA0nD+MBMHZ3INii/U1jcAqBydRsNGaYz8/l3awMk8wHDV36rsNSc0/LMG+Lik16OStcXGjEACwjh94X/9UnSLinvZxsnZj4yl71naRBMx+2k47Ox1TdMDhyfuqaenlgxfuyF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igRDAHUg; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igRDAHUg"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-697edb1bf6eso1491537a12.1
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Jun 2026 06:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782306955; x=1782911755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N8zJXNAOj3TRSQqWHWqJVCbZ12C/VejTSJ/Qsl8Vpsg=;
        b=igRDAHUgYdSsbcEZaRHz/lszr/FDay4uqMsa+lrZw+BpH70CMnhrsFjJ20IvybXwK2
         nwc1aNEtF2fgYZW7ceZVoXHntd6zGfI1h0WKeQvLR/HnpPMBllofsxRsTBI5k9Ealo29
         hLEmYabCcInS3qngcMuPK9QtJsqYT0tx4NSIT7CKgcEoAJeUmPUemxTsvj6SVNemg9DU
         vlgvJ9jfhz/aPgOP7sWK41/z+7Yu23/xG67LA5qht6Gd9ZJoIgwQGM0wlWsZpKoIuXsN
         swQTyeJoOuKrGp3+HbjaIRlwM4K+9DnzR+yjmbNWm197GfMCcqFYJk+nKnyxOzKUujxi
         tCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782306955; x=1782911755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8zJXNAOj3TRSQqWHWqJVCbZ12C/VejTSJ/Qsl8Vpsg=;
        b=pMdAt1td/I4fR/iC51YWfiOrmQEuVCxYDhaDd5CHo828/nUEU4oC+JYfz97dvR7xn8
         zkWceIQRTZaetm8cseokeMULXbwb7XodXVsyeZ9N+KK9+IhGxqgti3QTH/V+UyBtn9qY
         jhE55XsN3i5b/maoCmxnssasZL1SpuTx+BaYgwy1oh1C6HocCrAJjV6wpuEFLjuxC4nE
         MzoXlid6Xe38V9F4oWicqPLVPRRUnD59tMjoQVINN8Es7IY054cT6pVTwImQNDRXWRCX
         vdfg/bgU8dA5TAPT8s7JrKkf6bXkevHt+AYpeIgqtcCbJ3VDl1/rr//Ul8ncJwOZ5Ac8
         qjjw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/g2sZ3AXZJ9fPqBovjGU2RqK/b+usApx5PnwZghtjGEY5XYIhsSQd+D83/9J3MIoCY9y3o08e3yrlKW9MoTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/J+Db7ezALzJCYKXzaTtEV0nx7/cNUDAjOmhL9i5Fo8bygKes
	Z3gk4WRoMY50wfhoM1ImZdc0C3XwpzKfnZ8T0q9sUGTqDt/vJ7SESTLn
X-Gm-Gg: AfdE7cnZdNxcwWgqxayozGKtVjne6gSsVXfCKvS8CmVC4s5q2361z/HC12necLz5L/3
	CH3ElyJ0C445vKnupmjTBZSZSd7kCkpOEJf34YDB+GNvZLGPiBnHcaVnJglSqj/tSI19azbl42D
	LvIwzfeSB1hfUnFIqr/zsphKzn7Shki/ZFcUQPkFyL1kbE5ZB93EgcKgVM0JqIn7lIugNJkwi/V
	QgLZY8UneH5mzlYHT4SifRj7fO4m9ra60bt54YGw+p6xUW85lpjSmv7hoB5cOTOHiqmqD4QcQ7z
	WkNE/aAZF7vy12UODTjW/cTOm4rOdJj6Io0FFn3NWse2EX8+iCjtviqVo1gnXvG0C/Gi4RjmfSv
	rWlG4C9qHmPsnM1OdeteMSoC10FnDlGEJW5rEVDKL31R+5c0cIUYN+0kNzHCFWTbDXZwsqg+WSX
	8BHbAW/D4K
X-Received: by 2002:a05:6402:4591:b0:697:decc:7f9a with SMTP id 4fb4d7f45d1cf-697f387a521mr1657893a12.9.1782306954280;
        Wed, 24 Jun 2026 06:15:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3ade18esm1152759a12.7.2026.06.24.06.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:15:53 -0700 (PDT)
Date: Wed, 24 Jun 2026 16:15:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] thermal/drivers/rcar: fix error checking in probe()
Message-ID: <ajvYhfo-Y-zQ4Nuo@stanley.mountain>
References: <ajvVfSusxZfjNxVN@stanley.mountain>
 <CAMuHMdUpnXGUHRNrT856RkBtsrO_So+0sxJ47cG0OihoChB+1A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUpnXGUHRNrT856RkBtsrO_So+0sxJ47cG0OihoChB+1A@mail.gmail.com>

On Wed, Jun 24, 2026 at 03:12:47PM +0200, Geert Uytterhoeven wrote:
> Hi Dan,
> 
> On Wed, 24 Jun 2026 at 15:03, Dan Carpenter <error27@gmail.com> wrote:
> > This code accidentally calls thermal_zone_device_enable() before checking
> > whether thermal_zone_device_register_with_trips() failed.  Move the call
> > until later to avoid an error pointer dereference of "priv->zone".
> >
> > The driver works differently depending on if we are using OF thermal or
> > not.  We use thermal_add_hwmon_sysfs() if we are using OF thermal and
> > call thermal_zone_device_enable() if not.
> >
> > Moving the thermal_zone_device_enable() call is a bit cleaner as well.
> > The original code used a three step process to cleanup:
> > 1. Call thermal_zone_device_unregister() to cleanup.
> > 2. Set priv->zone to an error pointer to preserve the error code.
> > 3. Set priv->zone to NULL to avoid a second call to
> >    thermal_zone_device_unregister() in the rcar_thermal_remove()
> >    function.
> >
> > Now we can just do a direct goto error_unregister and rcar_thermal_remove()
> > handles the cleanup properly.
> >
> > Fixes: bbcf90c0646a ("thermal: Explicitly enable non-changing thermal zone devices")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> > v2: Use the correct fixes tag and re-write the check in a cleaner way.
> 
> Thanks for the update!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > --- a/drivers/thermal/renesas/rcar_thermal.c
> > +++ b/drivers/thermal/renesas/rcar_thermal.c
> 
> > @@ -510,6 +504,10 @@ static int rcar_thermal_probe(struct platform_device *pdev)
> >                         ret = thermal_add_hwmon_sysfs(priv->zone);
> >                         if (ret)
> >                                 goto error_unregister;
> > +               } else {
> > +                       ret = thermal_zone_device_enable(priv->zone);
> > +                       if (ret)
> > +                               goto error_unregister;
> 
> This error path is the same in the other branch, so it could be shared
> after the if/else block.
> 

Even better.  :)  v3 coming up.

regards,
dan carpenter

