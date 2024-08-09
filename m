Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159D813FFC
	for <kernel-janitors@vger.kernel.org>; Fri,  9 Aug 2024 14:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723214924; cv=none; b=cSelEpLjhQuGd4/TufFMqN5iDGkJu+SZrtkHW09sTlCZ0Z1u7Vh2J6eK2iDuNlj0gTGO+3tqYAAWH+zsNnof7MoJ8q+6R2i5Y+7rClr6/WmHlTAiULqDU7Hn1VZOzeWjALXyjywsWdBw1gKHekpCItq2VUTFiVp0qmaDfsRwmMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723214924; c=relaxed/simple;
	bh=4I5b2H9NUEiAhmrSpLhpqMq35zTGGlKoTm2KVgYDd8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8b/D4P1c7DSOFfEMjVT1Yz0ubv/E4Bf6z2tFYX29fzOTmRwdEtyKRKc+EVqAsLjL7JlAcli2qo63+Yys78UHcgn8uZqa8Hld/aQZsv+OOzYLiq5x7oC6BKjHL7P70wd0th6mTVm+w7PBqSM0W8AJSFJsOCX/qm2mYlbQeWR3Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xGRZ2EY8; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xGRZ2EY8"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7ab63a388bso90766166b.1
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Aug 2024 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723214919; x=1723819719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tFtgPj7cDJPPMnEzJqYuz4oTx2v5U6jmL1KNLX38x4Q=;
        b=xGRZ2EY84cWKdcwGaBmL4Do9kjrLYeq3e3nNsKqv4TFpGAiy+K8u4RCVWzlD170hOy
         KFZh6VFfBBfqLNNSYoSPswFKt+ieVqPLhOOCXc3IevlUD/ervn+hVOKrTfNZOpkwoq9p
         tyWTQuMovkhxYlOaciC31JlXsFz65Q1H6GCKHfidhiCPE7RGG5zOqKNwtxXgckquJ7W5
         IcbTF02mI0Wx+JEsVaFfWhQ7iYnq36eh+s1g7c3xSX+c1BCODJS/2q2drZCmJeSCadxo
         cRsWAmc4xJXi/jsJ7KQy0Z4UGi22ja0luL2nCzQlA36PwaK9ZOslp3gYy34U2a4j89Lx
         o3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723214919; x=1723819719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFtgPj7cDJPPMnEzJqYuz4oTx2v5U6jmL1KNLX38x4Q=;
        b=lCgBxlolAUFWuY4DmKQuOBRcs9TShmH+daN7ziD7kYqlDAjlGOK41MNjSXNj5FFJeI
         EiCBEzkcMvwqi4nE3UZKCKEXlcw0HVdxJ64Iqn57/uMfu6yuSguvIEauP6RZt1CUr1fw
         9efvpF9AaECvyctB8vlRYoOA3Xwcfdb9xJciqmqpo9ix7S/u+EkMj8MJn34tVJmu3MNZ
         d1bLV169oPCUaut4GbXwoD8+KFv0IzT4mf+Ee6ffIrwY7uix1ho/zQPxLPwpor4kRaPf
         JwaqAG4ry3Rj+nWyVmNeMMW3D4e8+IxcJhcJQdrDyvgshai8SFfh11pUA8wmy/b3zv4J
         q8ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrxwiRVz6iNV9Hwp6V3gI1Sx3JurQGFYsKTu63X0XxX6s+8rr7MAgTE/bmF8bhZNC9Hut2R1yyz08t4Xgls1yABlQXTCPVZnNXJr+yAqO1
X-Gm-Message-State: AOJu0YxWNkaVwNLl1Ky3nuWzAoz0PuW2PaSif2/bRYrI87UgziG2u9Dw
	4f9pbNWaUTQNaKyW+k35CrpU2UeNC87JsnktQxdl8cMb81riJxucS4l7tD5jYno=
X-Google-Smtp-Source: AGHT+IFBY2Fa09LrgoQHpcmAJetlamh86kOIIRg78Yt85HeAsUAmRa90xiVBDSWmTBmcEOH2cLKoNw==
X-Received: by 2002:a05:6402:510e:b0:5a1:b6d8:b561 with SMTP id 4fb4d7f45d1cf-5bd0a535c1emr1850330a12.9.1723214919081;
        Fri, 09 Aug 2024 07:48:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2e5c8edsm1596620a12.81.2024.08.09.07.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 07:48:38 -0700 (PDT)
Date: Fri, 9 Aug 2024 17:48:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev: omapfb: panel-sony-acx565akm: Simplify
 show_cabc_available_modes()
Message-ID: <eb7fc428-3987-4858-b24a-d5c127077acb@stanley.mountain>
References: <91fc9049558a4865d441930c8f4732461f478eca.1723110340.git.christophe.jaillet@wanadoo.fr>
 <aa43c1f8-05bc-4edd-b7ba-474953f28f5c@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa43c1f8-05bc-4edd-b7ba-474953f28f5c@stanley.mountain>

On Fri, Aug 09, 2024 at 05:42:32PM +0300, Dan Carpenter wrote:
> On Thu, Aug 08, 2024 at 11:46:11AM +0200, Christophe JAILLET wrote:
> > Use sysfs_emit_at() instead of snprintf() + custom logic.
> > Using sysfs_emit_at() is much more simple.
> > 
> > Also, sysfs_emit() is already used in this function, so using
> > sysfs_emit_at() is more consistent.
> > 
> > Also simplify the logic:
> >   - always add a space after an entry
> >   - change the last space into a '\n'
> > 
> > Finally it is easy to see that, given the size of cabc_modes, PAGE_SIZE
> > can not be reached.
> > So better keep everything simple (and correct).
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >  .../omap2/omapfb/displays/panel-sony-acx565akm.c  | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> > index 71d2e015960c..fc975615d5c9 100644
> > --- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> > +++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> > @@ -466,19 +466,20 @@ static ssize_t show_cabc_available_modes(struct device *dev,
> >  		char *buf)
> >  {
> >  	struct panel_drv_data *ddata = dev_get_drvdata(dev);
> > -	int len;
> > +	int len = 0;
> >  	int i;
> >  
> >  	if (!ddata->has_cabc)
> >  		return sysfs_emit(buf, "%s\n", cabc_modes[0]);
> >  
> > -	for (i = 0, len = 0;
> > -	     len < PAGE_SIZE && i < ARRAY_SIZE(cabc_modes); i++)
> > -		len += snprintf(&buf[len], PAGE_SIZE - len, "%s%s%s",
> > -			i ? " " : "", cabc_modes[i],
> > -			i == ARRAY_SIZE(cabc_modes) - 1 ? "\n" : "");
> > +	for (i = 0; i < ARRAY_SIZE(cabc_modes); i++)
> > +		len += sysfs_emit_at(buf, len, "%s ", cabc_modes[i]);
> > +
> > +	/* Remove the trailing space */
> > +	if (len)
> > +		buf[len - 1] = '\n';
> 
> I'm uncomfortable with this line.  It assumes we don't overflow PAGE_SIZE where
> the original code was careful about checking.  Probably easiest to do what the
> original code did and say:
> 
> 	for (i = 0; i < ARRAY_SIZE(cabc_modes); i++)
> 		len += sysfs_emit_at(buf, len, "%s%s", cabc_modes[i],
> 				     i == ARRAY_SIZE(cabc_modes) - 1 ? "\n" : "");

Or you could change it to:

	if (len)
		sysfs_emit_at(buf, len - 1, "\n");

But that feels weird.

regards,
dan carpenter

