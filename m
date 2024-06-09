Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629094D8C7
	for <kernel-janitors@vger.kernel.org>; Sun,  9 Jun 2024 20:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717966748; cv=none; b=KOReqUh8MniJmcUWclFIBQ9g9ZonkCxb+ISaMfkHs6Qc6WrLsSqJzFTlQCFU5NuXGtNzUQa/wuBmNNatsJyvUaH7eUs+CAV1CQegTSvnGtvGdrk7CSDNddou34xFnm+K1YjSpUjrF6LuzTvidxq24+kGbsMGRfYJwN5KGF4PUio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717966748; c=relaxed/simple;
	bh=7j1v+9e9Niga/uAleJmKC8ouLVwD561QrPfRenVGGhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hG1z0EPIDd8+1/AYNGxQuK4ZNZC5x55f5TrzezaAOr7KxX57eM/rLCW7Hg4FCkLVY7sv/Xq5CfbKicPRiLwM8a/SC7+xaLzK6RgZtadeaXDgpylBlg5ZSho7jPMj3ehcNdejmTwp4sg2Odh+/fva/YgmMBHa728cyB+v22SYMt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lhLw7vfo; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lhLw7vfo"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-421eab59723so749305e9.3
        for <kernel-janitors@vger.kernel.org>; Sun, 09 Jun 2024 13:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717966744; x=1718571544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S/4EBuqn92sFzanqVMeYwTClL1PJfXX0U+C7af6lxxE=;
        b=lhLw7vfofOYQ39xo6a6jGU0S+Bogg3cUW5Fwc0PfadUxIqtY1KDpVkigPq+KPEu9YS
         mF3T7uufRS2qyE4drIW68dG2ZzevQZ+5Hr3SYvOKBrYjuuRbFbKgnWLuGnSLLKreCa4X
         w+3b1J63D1DihjQHDPC/XzDCjonbie43adSfSCbNRqswg61I2350EkRaguGobu7+S0T7
         2N3k4u8J75vZLZiIRSiFymXA0cSMfhnzCo95CYYwhUCh9yO9owChA8sUvoqKEhF/7TdX
         UiWTIBNYlQ1bXLu6+RmRxZn7SR0o9+YIqER9vxx75czvaRAyd9UqplkSue2uYazeU7/R
         n37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717966744; x=1718571544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/4EBuqn92sFzanqVMeYwTClL1PJfXX0U+C7af6lxxE=;
        b=WtEHHC6rqvl5RiOXflPaSiDet9WqRDv5NnoD60QGJ3VNKI2HKoo8bd/9PCJmLr3EaV
         5akrgFn4B7X3rWvNKbATLeSEfKk3tdBZ/uROxZCIR5cfzc4eTUCUlDbEgio2qJAa+1bs
         M3J7TcmW5oGyDQtDm4EzjJQ+Tu6mRuZXV1+oNMxeYfrMseKm9kiFO6JFwyrnmF0ze07l
         sYLqb1x33NYjJ9FZAu1iqR7G3+cnD8JWtdcAqWN0szx9YNqqmBLadNChlZvS97/japz1
         +AMXdPmNZnfz183WsjpUeMS1u9BFMQ5WaVrGQsTT8Yeu3+k0wzqnFgx51pUi0H5U04CN
         DJww==
X-Forwarded-Encrypted: i=1; AJvYcCXJYH+bT690QlxvndYT+zGdAvODDQT4odbSjQCELY5n9JJ443lTb5VfrdHO+ahH23yBUJ7EwsNtO9lwbSV2LS8INz/X9AeiCQHBAnCUm+VE
X-Gm-Message-State: AOJu0YwHm58mq92ZJtJsne8BZ1NLXXBMukxiVPy8nUFMNaQMDxgrY70L
	iqIjHWTorJ5/CpitfEMJ8f4cWxZlAROpRGQP3kKjdOxcrZa8U0/0QeNh/u6blE8=
X-Google-Smtp-Source: AGHT+IEEO/PHTW8AqU1APaxSs65MvnQM7xM/9DOK9VOy1PLDH9qtbNk2AlRHMSQ2/X/MVbgwKv4E1g==
X-Received: by 2002:a05:600c:35c8:b0:421:819c:5d84 with SMTP id 5b1f17b1804b1-421819c5f0bmr19950585e9.10.1717966744343;
        Sun, 09 Jun 2024 13:59:04 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d6985csm9336089f8f.60.2024.06.09.13.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 13:59:03 -0700 (PDT)
Date: Sun, 9 Jun 2024 23:59:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Allen Chen <allen.chen@ite.com.tw>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: it6505: Fix potential NULL dereference
Message-ID: <85dd2c45-df99-4270-abeb-a3633afb9d6a@moroto.mountain>
References: <5e6e8882-478a-46c0-9119-b643d524cc0c@moroto.mountain>
 <vk76z5x3al6rrzb3n2misu6br4fbmc4kj3agyo4ry5fz7ajsm6@dfpq5yzuolvm>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vk76z5x3al6rrzb3n2misu6br4fbmc4kj3agyo4ry5fz7ajsm6@dfpq5yzuolvm>

On Sun, Jun 09, 2024 at 10:38:39PM +0300, Dmitry Baryshkov wrote:
> On Sat, Jun 08, 2024 at 05:21:08PM +0300, Dan Carpenter wrote:
> > Smatch complains correctly that the NULL checking isn't consistent:
> > 
> >     drivers/gpu/drm/bridge/ite-it6505.c:2583 it6505_poweron()
> >     error: we previously assumed 'pdata->pwr18' could be null
> >     (see line 2569)
> > 
> > Add a NULL check to prevent a NULL dereference on the error path.
> > 
> > Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/ite-it6505.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> > index 3f68c82888c2..4f01fadaec0f 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6505.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> > @@ -2580,7 +2580,8 @@ static int it6505_poweron(struct it6505 *it6505)
> >  		usleep_range(1000, 2000);
> >  		err = regulator_enable(pdata->ovdd);
> >  		if (err) {
> > -			regulator_disable(pdata->pwr18);
> > +			if (pdata->pwr18)
> > +				regulator_disable(pdata->pwr18);
> 
> Wait... I wat too quick to R-B it. The driver uses devm_regulator_get(),
> which always returns non-NULL result. So all `if (pdata->pwr18)` and
> `if (pdata->ovdd)` checks in the driver are useless. Could you please
> send a patch, removing them?
> 

Sure.  Will do.

regards,
dan carpenter

