Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11C4B661
	for <kernel-janitors@vger.kernel.org>; Sat,  2 Mar 2024 09:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709370849; cv=none; b=JuT1exhhs9UDSmad4vNBLN8yam6aDTpxTcUb+soNb9yR05WNF6bUBsU0Z7lYLZCatapmp/MwDiW0WdvaGLTVAP6FGNUmB6SnZv8B/g3xbw583cYJk1RvXwy4ghcD+RRvj4S5eghNtGW9fHDqPCIXGk2CR4BD9SmMNw7wg33+svw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709370849; c=relaxed/simple;
	bh=AQCHu6wjC1Mc61DwzXSbpHVMgu3N08Sag4neGTjHap8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbS3jV4ASL7a/aTNLIk58+bwsMz2dwbKuW5gKrejUUcvDz9WiLWQoeqcl+PGxx7TyLlfIO/5BoMgaiwSoVZYQdHod0FIKCP7WtR4Ox37+ZOwH9Fs6ubilq2oedHMqEeTmlthrHIPteEjgC3iZnkYeWdDVZFTqwxBnTuHoC37G7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TyzyDhVy; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TyzyDhVy"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3fb8b0b7acso419769666b.2
        for <kernel-janitors@vger.kernel.org>; Sat, 02 Mar 2024 01:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709370844; x=1709975644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DFSpcwT4Hy2bJfwJLXbvIJSYRBInQpfC3lHF7abplN0=;
        b=TyzyDhVykPJyXTVESsrhxoch0+bBcNML8ayZyTOIlmiUJlvLSNocu76IrF//dhYNHT
         D5ZKcSshJIkRd0VtR5WG8ul12ginmdsDbM0xkmj7pBbqhMcbtNGLtFxSswUIjK+brm04
         C/zBMUxlBeSPPK7oLOBc6oNtgHdBRjFmC3fafPeIWJlA568cufqfyt5y+hEL/k0w6QMM
         nqDortpPlKMM2sJJDyxwfRKn0ijAcD262kURRZ9A9tLr5/OXXApD1l18rfbGsCMywS5V
         wnICBIC3EEl5lBhsuHJEIOpmbaEhgkptCal5r10karvwzZwtFejLy++qS+Dd3TC5LDIm
         4UDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709370844; x=1709975644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFSpcwT4Hy2bJfwJLXbvIJSYRBInQpfC3lHF7abplN0=;
        b=R9R2Ty7SwsWxtSJuHEGEyX++w8sBWrXLCBKM8T7IZMl9DRc0nKCC9TMfFmhtVp83Ug
         xnbks4Sc432kPk7c6wkVoTVY4jVW/LmOOO0cn7JjxwwFg9qJvzJFM6N54vaYudmE4BE7
         xizUro10GlO7EPjybZWpXSMrew3d2aoH5oOsMRWPKDQr0uVttOy/KHtZsccshkq96n/9
         A0VQR28YAl8ZKlfC+R0r6eTXE2I1yu+3z2BndGO3r77B0UaUp7mTapoePSBTNKsJ6QKY
         Bp4l2TgSFFdNybRDCSuQdQ6uGjCkc2XodpZP9D9JuBfpiVr37R4Gf5xOQMWttRl9QoCA
         TLXA==
X-Forwarded-Encrypted: i=1; AJvYcCXXy0y72LclsfTgLWPf7zqG39XbAZHH7Smw56TDZwwpz/gsSrURccpRuc0kL9kFRt8Pu+2oFtrEPqG/tSnaf6CzbThDKw211GVPgfUVJNOe
X-Gm-Message-State: AOJu0Yyh1qLAlC/fZFcp8sQe2Ibpqjewhx0LmqKQPkIYJTcdy3l4E2SW
	ADKQ+hreJo7GUBbxs4PyPDgm5zx7Dqf0IESJPPjDxwMjhNjAtaK8+FQgN5Kpcjg=
X-Google-Smtp-Source: AGHT+IFw0H9KYLYbJ+iK2SiQXFZ3sKDi47m5yY6mq2kN5tKP5jX67KeShfXodKkF3G4h5YBsmaugIw==
X-Received: by 2002:a17:906:80cc:b0:a40:2998:567c with SMTP id a12-20020a17090680cc00b00a402998567cmr3019889ejx.41.1709370843819;
        Sat, 02 Mar 2024 01:14:03 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id c13-20020a056000104d00b0033dfa7ecd33sm5901777wrx.61.2024.03.02.01.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 01:14:03 -0800 (PST)
Date: Sat, 2 Mar 2024 12:13:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Markus Elfring <Markus.Elfring@web.de>, linux-media@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: ds90ub960: Delete duplicate source code in
 ub960_parse_dt_rxports()
Message-ID: <8ece4c88-dbc7-4327-ac2a-0a097fc990d0@moroto.mountain>
References: <79fa4854-976d-4aad-86ac-c156b0c4937e@web.de>
 <ZeGV_siWFkfqSEgZ@kekkonen.localdomain>
 <db1d7227-f9a4-42fa-89ba-b484e1260e0b@ideasonboard.com>
 <ZeGZsRtH6YLx2FiM@kekkonen.localdomain>
 <ZeISEYXTaiyA-b4K@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZeISEYXTaiyA-b4K@smile.fi.intel.com>

On Fri, Mar 01, 2024 at 07:36:17PM +0200, Andy Shevchenko wrote:
> On Fri, Mar 01, 2024 at 09:02:41AM +0000, Sakari Ailus wrote:
> > On Fri, Mar 01, 2024 at 10:49:19AM +0200, Tomi Valkeinen wrote:
> > > On 01/03/2024 10:46, Sakari Ailus wrote:
> > > > On Fri, Mar 01, 2024 at 08:46:25AM +0100, Markus Elfring wrote:
> > > > > From: Markus Elfring <elfring@users.sourceforge.net>
> > > > > Date: Fri, 1 Mar 2024 08:23:24 +0100
> > > > > 
> > > > > Avoid the specification of a duplicate fwnode_handle_put() call
> > > > > in this function implementation.
> > > > > 
> > > > > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > > > > ---
> > > > >   drivers/media/i2c/ds90ub960.c | 5 +----
> > > > >   1 file changed, 1 insertion(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> > > > > index ffe5f25f8647..eb708ed7b56e 100644
> > > > > --- a/drivers/media/i2c/ds90ub960.c
> > > > > +++ b/drivers/media/i2c/ds90ub960.c
> > > > > @@ -3486,10 +3486,7 @@ static int ub960_parse_dt_rxports(struct ub960_data *priv)
> > > > >   		}
> > > > >   	}
> > > > > 
> > > > > -	fwnode_handle_put(links_fwnode);
> > > > > -
> > > > > -	return 0;
> > > > > -
> > > > > +	ret = 0;
> > > > 
> > > > I think it'd be nicer to initialise ret as zero, then you can just drop the
> > > > assignment above.
> 
> I think tearing apart the assignment and its actual user is not good.
> 
> > > I don't like successful execution entering error paths. That's why there's
> > > the return 0.
> > 
> > It could be called a common cleanup path as what you really want to do here
> > is to put the fwnode handle, independently of whether there was an error.
> > I think the current code is of course fine, too.
> > 
> > Soon you can do
> > 
> > 	struct fwnode_handle *links_fwnode __free(fwnode_handle);
> > 
> > and forget about putting it (but you must need putting it).
> 
> Let's wait for the Jonathan's patches to land (v6.9-rc1 I hope) and then
> we may modify drivers if needed.

The __free(fwnode_handle) stuff has already been merged.

We could do some additional work to make a _scoped() macro for
fwnode_handles but here it's function wide so we already have what we
need.

regards,
dan carpenter


