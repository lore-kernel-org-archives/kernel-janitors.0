Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD50478E45
	for <kernel-janitors@vger.kernel.org>; Thu, 22 Jan 2026 06:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769061965; cv=none; b=qUi2Ee+LrYYllLOReod45IvKQ7PfVQk25Oxv6SfOzwX0Xas4/VE5+YitPy97j7G75k7vJrSnohnzHQdT8DmhEsDyxJOotqS9nYhqNOOVCQhE0c5+U/x8vBsj1+lwDwR8Jc+d0KClviuXII1GL1jrq5aNtZzYMoLWqSrnSPDV4J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769061965; c=relaxed/simple;
	bh=xOEbz33bUt9FQPy96H0PFGJJ4MHPtNrRYqYVcOnX5XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sz6QUxETMjEEjjh7Hz72bGDbpelqDKxo0JQagKq+mr/aN8Vu530A3ugVbzDLUuy0U5dsoVdjEDl2Uh0/esgErGaNcVXezCVwUxLhOVvd14YNnm22jKWOPj3Nd8HFPvqYFKBo+xVILkDqoBgPAVCvhUvgF7MVb7SV8lrqVUq6VDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L6zRyiE/; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L6zRyiE/"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-432d2c96215so459733f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Jan 2026 22:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769061958; x=1769666758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dKKYv/QwjgamZm0Z+gBpDqIRHu4ljUK+NYA0+iwZjfs=;
        b=L6zRyiE/dTOjfNvZKhIrJ8IdkTIVOiYlrlKyoQf2lT+Zc48zCOCT4rNyer/PMFlZA7
         283xT7/eZqUecI3IDRtl9OI7QdCqkd4B5+zS82JG+iwcmfZ+Ly1twwFk2NzAPV0xZf9s
         cHavPtHsK/C386H8b/Mg4lP5CIoLxwt+aJIW93dHvbvBe71iJytQKOOrYL1Fa3pyrw3P
         jY9a5AVMoT065BKjHdHDgZ7EBhJSfyuuY4/G2oGB6T4hSh+WJH+x8NRjuLzRGcu8QmZk
         9phidGmdVC2gbBtXgrTSeG1GJUrwLglYG7FHux3We+vd/QoaC/WzwGUOorgUbrQN7Q+M
         yL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769061958; x=1769666758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKKYv/QwjgamZm0Z+gBpDqIRHu4ljUK+NYA0+iwZjfs=;
        b=i5Ayw8am1RTSKERRheiHJcQcFkDun+CCupu12iFKlw7LDmGqGIWhxP8tQbM9EbudP4
         /LalbCDfiiz6LXRCWNFRYk2ghs5SggLD1JUZsqq1yqgfk2IUc1uq4nzPC5nvNMJ6sGp4
         DXgpPmYwfnoVDJoPuQ8+gMeU/9u5KNO6Hs5gh/0lkUH7qCD3XXahpizJbyBH3P7vrbF0
         vkXnH1FtMG/00k7JFq8DGhDeoypOdTQ38flX21vDXZnL48wEsGNx+AGc0cqcaONXRBnr
         iu3SktnbbFiM2IOZvbWoUb9UnrxhcESGuDn/UdRbFoT5QvITq6erIpBl1Nyat9vz0Msf
         rwAA==
X-Forwarded-Encrypted: i=1; AJvYcCUcipKBFBAuoIU1LhvZ8/AKYQIAvIa+pdhSVGFe518o4lgz9zCgopF3H2fLGEYuoKm2sbBk++nKzJulfGUwips=@vger.kernel.org
X-Gm-Message-State: AOJu0YylAPjiuHwl4xcM9AMFbX/HA7m0vgUp5+8UAENpCRzap68gzLnx
	ICf141MNCGXTOfrL9qYDIBgHxZuheI3UhgvS25qPx2bWh82uxFE4DdADYZH1e4hobng=
X-Gm-Gg: AZuq6aJmSCvEaO2WZrgS4mJzLjuJhC653zgHt3yTb9qzuip3GSPQYHmtd3WAgNao3Eb
	lj9DH5YMObz0vRzpODc7Eav0j7ZbZkTGxK8KQAi8ak1ly9ejvlKse7zUL+Keh2g+covExaY8Buz
	pxiFe74aRxTUELoWvqXg9lIUw1hA0mFbCpPqiVXYDDOmFWxDnGnR6k95bV5qfUeqDYk2CZa5oPK
	jFOm9Oe7sNZELk2eNUklJb8O6LgmsFf96qhDtZMshlQWWbO9oJQlItsjVTLKnFxjeptVouqQlqR
	EVUB8TjFQxI6ZLK5IsKNg6EH1iKsDk5ICwF6hTSiETuOqv7UyqJTe0fvWUi0gpUqnLKmMCm/K3J
	FmXH4pSrPxgcmDbMPca0PQdKmKhkN//h6QWhGPVQjp4eF9uxuBdlO5NgSBzOP+fY8bGQUZgIVIB
	tpP2vWswCGVWL948Vk
X-Received: by 2002:a05:6000:290d:b0:435:ad52:31d4 with SMTP id ffacd0b85a97d-435ad5234ccmr515333f8f.26.1769061958037;
        Wed, 21 Jan 2026 22:05:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997ed8bsm42957976f8f.36.2026.01.21.22.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 22:05:57 -0800 (PST)
Date: Thu, 22 Jan 2026 09:05:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Yan <andyshrk@163.com>
Cc: Andy Yan <andy.yan@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/bridge: synopsys: Fix an error return in
 dw_dp_video_need_vsc_sdp()
Message-ID: <aXG-QjoniNS825an@stanley.mountain>
References: <aLaPyJrFsSFuqC1R@stanley.mountain>
 <5f9e8942.7fec.1990997b4de.Coremail.andyshrk@163.com>
 <aO4GGyJLCZEwFYL4@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aO4GGyJLCZEwFYL4@stanley.mountain>

Ping again?

regards,
dan carpenter

On Tue, Oct 14, 2025 at 11:13:15AM +0300, Dan Carpenter wrote:
> On Tue, Sep 02, 2025 at 04:42:41PM +0800, Andy Yan wrote:
> > 
> > Hello Dan,
> > 
> > At 2025-09-02 14:33:44, "Dan Carpenter" <dan.carpenter@linaro.org> wrote:
> > >This dw_dp_video_need_vsc_sdp() function is type bool so returning
> > >-EINVAL means returning true.  Return false instead.
> > >
> > >Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
> > >Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > 
> > 
> > Reviewed-by: Andy Yan <andyshrk@163.com>
> > 
> 
> Ping?
> 
> regards,
> dan carpenter
> 
> > 
> > >---
> > > drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 +-
> > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> > >index 9bbfe8da3de0..33be4eae2b20 100644
> > >--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> > >+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> > >@@ -1149,7 +1149,7 @@ static bool dw_dp_video_need_vsc_sdp(struct dw_dp *dp)
> > > 
> > > 	state = dw_dp_get_bridge_state(dp);
> > > 	if (!state)
> > >-		return -EINVAL;
> > >+		return false;
> > > 
> > > 	if (!link->vsc_sdp_supported)
> > > 		return false;
> > >-- 
> > >2.47.2
