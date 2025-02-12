Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98883202F71
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 20:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739393974; cv=none; b=nYtWAZ5pn6d/qY8bjmHOAQvJRBomxUNPFuJfTykYr/DPfmaPOLtpiwxJ9xhD9Ydk4ozAuFX9M+lT+Jr2jwKH90F+6KXt8yfbYiOEIDgPRz/8D2tGyLzpugog2xBdNTCkoIg8oTsiRnV2i2dfDrmulD3xhQHuMQRVHGvmwDcwsNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739393974; c=relaxed/simple;
	bh=sKI0vLNVhAmeaIjFu9+Bt3XY4WiDbFQ5R37qD+xyL1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRngc8IXgjFJriegrKU/zdjDntpJa49TPAN8dmiQdVTHqevJDnbawUiIz4xC0LVT2iccFzbBN3pn2QKmcwWiA6JCN/5wHM7aPa9vi3b5TRGlghmS0KDC6+KIjLYiaivBRyMDFP7lgwJZIBMAX//LWt2nk179+DrCmDH1/FvlFU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ss9ABUeM; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ss9ABUeM"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-308dc0878dfso1782291fa.3
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 12:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739393970; x=1739998770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kAeorjfeT+F7+M8JM4C+sVVtADje7c1d5OIpx9HNApo=;
        b=ss9ABUeM647d663Q6uWHjTT0FDiu9Pvn843K4DqGhkfB02byt88cGRotJS8+7bOKn0
         0WfWy9eKV6bjcETcfe+Cf5KOWqNumwlEp0Zulam7l8Cfl++HOY734Ed1VoWDXOhDZHps
         u3XHREgSpz2algvI05sFgBlsL+nQHTUnnUjKQ+Jw3e8yPrhgJLLJH7qvrJ0qHsZrcXCr
         Gy5vX50Dezo1CStp/sn/m3qQjz0lqrp+6rIE1rz6+vDfi4JToPJz7yb2UPqMILX5E+kM
         6tWlZU3wlf3+rnHy/T9yPQX3G+joVxBQrTgcUvb+Zu38SiFMhr7feTU0c3rt1kjQXpia
         XGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739393970; x=1739998770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAeorjfeT+F7+M8JM4C+sVVtADje7c1d5OIpx9HNApo=;
        b=t+LgmKwF07/iPxaAlSWSIUbz5Sztbu7RGhfx6iu6fkasHMSLmJzInXnzDMs3E18Liv
         ILZri7/LjOyzd6U/oJYtjB3xlELEMq9QTc9GTb8CnUTXj2WxzfOEpaLoFXg7uNjlb0r2
         SrONVW4VQ5MTjv+VkJ9Cg13dz2fAdcLaIEsY1mhm0FcL0tLJVr3Xwtp/9dre8e0/4B3R
         CNliFUlBKVbP0KMEyWAXYEujn59B8Yxq76G/XxXhY4/dLOk4HudJkAb2cPda0IjebDz2
         Ccd+dzBTpOY0txGxgVVYHIWFvG/kEm51aiUcSDkvGgLRnWtRX2djmIBQoydwm69fdtcH
         0qDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7/XXwn+Bm/f+rRLcoQxEYz+5eyj/sTOaMx7F1Xgifqh5mDYT7T73eQBVw/RsGkQfekndsIPo9QMaDjIkiFNU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ktqsvZCb89fy/YyZ0qG/lNkQwBDO6eqBpo5u0yuzq4kpNYo9
	sXNKhy4lm9aeP+DQ+CfR8deS4hRdyY9bJd0PFWGmefyNdh4y4Xn0TxMTHcIaCGA=
X-Gm-Gg: ASbGncsgk8VBsSOErfLewU4oC2QIHZE1QM249nJO0hOa+bSiCpi58WkRk9KTpGoHt6P
	Ll6foXT3H0719y5xarkW2t6cD9KAezfX/iR6bYFwFKMnhfBSqhpgBEbUjcyan7OlEvbjaYrBUMR
	VSpRdaDLZpc34GzMfRww0EeW5ZjxiaIgUXU3dwnXk9CXN7ggU5P9p/0ec9BBFixvyMwI/HIj12T
	pQbuhypMjc2q0Epc9Rlt0qD8R9tzKRMVXW8kk4/x6nBDpDTl0PQnkCoP+kqRekk5cD/daHUu3KY
	gqWlgPbBgv8G5/6IWDGmpOSYMXG8qf8MjCZcBfF+ssd8bBc7OPvFjggWrRPs4UyemdUClIg=
X-Google-Smtp-Source: AGHT+IGChs7eHa5zRInuSJK19SwStAtnpkYkKhpcmEqmNGCW83MiqEgl21ooIzHv9HbzfRFXz88PHA==
X-Received: by 2002:a2e:a58a:0:b0:308:fd11:7705 with SMTP id 38308e7fff4ca-3090363079amr18485971fa.2.1739393970449;
        Wed, 12 Feb 2025 12:59:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308e5ece169sm13217001fa.32.2025.02.12.12.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 12:59:29 -0800 (PST)
Date: Wed, 12 Feb 2025 22:59:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm: writeback: Fix use after free in
 drm_writeback_connector_cleanup()
Message-ID: <bzcdg7wclj4moorz6f2hqkoycl6z7vqzsonok6h7s4wc3pfeo5@whduc52pided>
References: <78abd541-71e9-4b3b-a05d-2c7caf8d5b2f@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78abd541-71e9-4b3b-a05d-2c7caf8d5b2f@stanley.mountain>

On Wed, Feb 12, 2025 at 06:23:48PM +0300, Dan Carpenter wrote:
> The drm_writeback_cleanup_job() function frees "pos" so call
> list_del(&pos->list_entry) first to avoid a use after free.
> 
> Fixes: 1914ba2b91ea ("drm: writeback: Create drmm variants for drm_writeback_connector initialization")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/drm_writeback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
