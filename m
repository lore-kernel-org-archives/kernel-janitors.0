Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C8317165E
	for <kernel-janitors@vger.kernel.org>; Fri, 10 May 2024 15:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715355775; cv=none; b=j+ung4xQa6Oz/8BhI90hLHIaImOyMyVCNEGlxDIZiLiGZjsWQXRo0xbGwfN1nhSkpX67Wjco+fEqf0+v0kUXbjwy0jygj4YCqzlxs7ViNML0keCb0zV9iG5HTIym06qP4Gu+mw1EnB827da8fgMuITRum8UNqpiICwiJknBSJ7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715355775; c=relaxed/simple;
	bh=h2tc+97CygyL1h403nfPfEVVm9uKiWnPtJxLm2rKHPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G12YJOvBy5eXbMFABgPYQCkLTK90KLSYbHP9dr01pxiTdyOpU2nI/4pu3PnQotsdYpga2b3YWONCBOrpTjTs5411XcCrjTBKidhPSk3YGkVBPL6e4i57WfAJ5HHBBfD6HL2E6sPwthDxcdkYbtWfMLPbtRqKRN8WA/svRPbwICs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QE2cuNad; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QE2cuNad"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a59cdd185b9so582075166b.1
        for <kernel-janitors@vger.kernel.org>; Fri, 10 May 2024 08:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715355772; x=1715960572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2SvsmHCpODoy89CrS+vfoFWJWpXjhvL02T0hTQzQxWk=;
        b=QE2cuNadznm9ufxvbQe5b8sAulpvexyuEijQbXuC7bqFXEu+t5BzVurh1GpJbtYiRa
         TZuB3dgwbDigaehqcF6Lt8s9VPAgtQJ0XsyeGta7gVnDq3RrUGibV48LSYE1pcaaAxDl
         82OFkQbmDF5dusEskK1PkDm9XmEfrsrGYhn7kaVhahXVda9KhtVleJOFRrjKB1a7m12F
         ePrAEGg4RK49mYnZdTUqAUmIkVUlXWvOQVs+vzlmC3ackChekbW0BKe/Y2Kg8q8LAq/V
         AUYCSF3QW0OsORCs7OOhf2fvqOKiBYNyA2OeQqB+b81IiQwD3NMtpAsaQRpGzT+zgALJ
         xv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715355772; x=1715960572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SvsmHCpODoy89CrS+vfoFWJWpXjhvL02T0hTQzQxWk=;
        b=CR/1L7IOKvQ/kEAufpUQ888h6I5GFvqfY6HnqEgk/D8xXGeF5xV4sJ4ZmYzaJ2MCSz
         0XLG7NwS56PIvIz+sWADwuEmNAU2dGc7ruTAKTLhzRn3pR0Yz1esx1v0QZoDisrasqLM
         o1PyEH5OrzCRWDEd4mF/bpjDQdbHM0mg4S1kMl1D5VYdmTumToA3L7hk54zXOFVAWDOI
         ZmZW4kBJJCYvgjNbYzhIQtL5VOwwxiCkuNpo3Qx4owHcfNrcGx0qqM9HcE1AxrrPbk7r
         VibCA6bNQaKq8DYUA8ICrf3UQwO9cMEjgCFCvz4aF/8lof2uMshkmPSksujW3NWxFTwu
         1P8g==
X-Forwarded-Encrypted: i=1; AJvYcCWxzbY3AZ/XSzOZv2k/BCEx/H/DloHWehErPXGRa64XYo4u8PnfMOMHI2szcDcDQFaMiKG199t1ki67OaXTaOjWwuhbgdDK/c+yw4RAkjP2
X-Gm-Message-State: AOJu0Yw+WGd7S7AV+9Rce61zKnJ+nRM3jnsbWnF4KGDGTvhYC0t5ZUx8
	PnmomAKoXXahYqpy1yI863UJpF029YD/jM7YXfs737ZbFfJ+C77h1ivhcX9gye4=
X-Google-Smtp-Source: AGHT+IE128sGWCua5PnlKWT8gkfSLSSJatboGn/jLfCHVOewATdtBObDqFW8BKzYL80nUP5q9JSC3g==
X-Received: by 2002:a17:906:6890:b0:a59:c8e4:e195 with SMTP id a640c23a62f3a-a5a115f3dddmr483170766b.14.1715355771630;
        Fri, 10 May 2024 08:42:51 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b17a06sm193619766b.219.2024.05.10.08.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 08:42:51 -0700 (PDT)
Date: Fri, 10 May 2024 18:42:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: ipu-bridge: fix error code in ipu_bridge_init()
Message-ID: <57a0dfae-cf1b-4c98-bc54-e70e722adf99@moroto.mountain>
References: <71dad56e-0e2f-48ba-90bc-75096112a1ba@moroto.mountain>
 <Zj46vpwTbfde4YX2@smile.fi.intel.com>
 <4ade89f8-cbd3-4dbf-81fb-0e9a4269dc0f@moroto.mountain>
 <Zj4_BBsUYuAeiOpr@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zj4_BBsUYuAeiOpr@smile.fi.intel.com>

On Fri, May 10, 2024 at 06:36:36PM +0300, Andy Shevchenko wrote:
> On Fri, May 10, 2024 at 06:27:30PM +0300, Dan Carpenter wrote:
> > On Fri, May 10, 2024 at 06:18:22PM +0300, Andy Shevchenko wrote:
> > > On Fri, May 10, 2024 at 06:10:37PM +0300, Dan Carpenter wrote:
> > > > Return -EINVAL if "bridge->n_sensors == 0".  Don't return success.
> 
> ...
> 
> > > >  	ret = ipu_bridge_connect_sensors(bridge);
> > > > -	if (ret || bridge->n_sensors == 0)
> > > > +	if (ret || bridge->n_sensors == 0) {
> > > > +		ret = ret ?: -EINVAL;
> > > >  		goto err_unregister_ipu;
> > > > +	}
> > > 
> > > I would split:
> > > 
> > > 	ret = ipu_bridge_connect_sensors(bridge);
> > > 	if (ret)
> > > 		goto err_unregister_ipu;
> > > 
> > > 	if (bridge->n_sensors == 0) {
> > > 		ret = -EINVAL;
> > > 		goto err_unregister_ipu;
> > > 	}
> > 
> > It's always hard to know which way to go on these...  I wrote it that
> > way in my first draft.  It's my prefered way as well but not everyone
> > agrees.  I'll resend.
> 
> Is the generated assembly the same?

Yeah, it does.

regards,
dan carpenter


