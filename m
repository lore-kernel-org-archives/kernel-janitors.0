Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFD5188012
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Jan 2025 07:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737357717; cv=none; b=EjgSISw6B/CHroqenRGg2qEXaGnh42K1858WefXPSFkckC33YGOcI7v9/aXngCRv0hIpwTgG13OFiUWBhJ4hcXra19gdY0J03ECgXSaPrgMPV6e58uuxhuAZhyXJRhk7wHIEKvlMRoaiXfn2ibOBhUDlRPcYzs5u0u/+5GEWPRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737357717; c=relaxed/simple;
	bh=W79KDljWS80LjKAcYj+ppHTJAJw83LWP1tQB5kijGR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLx4T4RvE/kf8HDLG0DO8XPZWL078VqZFA4doperlu6FYdY8ZFzI7LfFjH+B1dRglIOs+/Pe2UG/lD9YhKTXpKCmQuy1Zs9oKg20akdMJdIt+lMbNhTVz/864cZMFze8ukqSA/SOWYzZrRX4HDr2zcpWSC2V5Ai+M9o7Nm8U55U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aHetKGDH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aHetKGDH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4363ae65100so44559595e9.0
        for <kernel-janitors@vger.kernel.org>; Sun, 19 Jan 2025 23:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737357713; x=1737962513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pHsq3uOy5eJ5dVbh8dVdNYReOLOhPHBDenlW0oUhiJ0=;
        b=aHetKGDHFN1BnPXE5p1UG42wLsjsVQP65iijSDmDrEGxe21AS6UT3GI9KqT58aw07B
         AbZlG6hVrnEL7t+QnAs76xExiTTSBgi1dL4ov+AcxxofV0AdkwB0tMAlK/xk10jqaVbn
         e17wI8l6xEwcFEgC+NFnmYGpucpPylGV5E1/Bce4znjmltIJIBBUt1UUcPw8BUPTk7vU
         4+aDPg3sPbwldq/8RNAxZp/MB1a4cY1eHalBAdcVRoU7hBAEn5QJ4RoJJOEHgAuvXrYH
         fdfX3/4IFIziG4WK9HlXGMC0Yjv+zN1BmTpLp0sx13SIOasZ5kgJk6voCXFd1O9ftU3f
         Z6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737357713; x=1737962513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHsq3uOy5eJ5dVbh8dVdNYReOLOhPHBDenlW0oUhiJ0=;
        b=a4gEsxlZynEZ03k294BmrYMuyqps34SwgFgLyzhKF67ectatCznWpBfNlGUWJ0th08
         4QKgf+tQxNWEIG6UIuyebXXqMj5WwRSyIITkGrJvgjm/de0yhA4lUdrUiOZp/KKFG1Tp
         1GfU3NiRJZTpNMzBKQnn92tK+ms5b0bI8yS22yNw/oRmvi4b/30JtycDC6Hyerb+hMlO
         LDqeGLvu9KhHQ6W9jss47r6DRerVGFsTWBzHoWggtuG5FWMmGukZztfXS0EWLyfhJbaH
         XRwPNTsy8vwpPzThmpKSqqU0eKDalcV30wtNE2oD2w+wMPSesis7aF7v8jU4vWTbwgRQ
         oHcA==
X-Forwarded-Encrypted: i=1; AJvYcCUFT/CMIuwgmc7ywhsr0LKSPpWTC8FL/goohzdKWUV5E+wdTgxVf0DrJfhpJf5Mjbr/Ov/QOe+hkUy8jIhzmaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYbbPuPPydWPh7E4Fnsc8VAVqfkO/2mBxQgQlkywg3Tk3EQuOh
	wmSk0b8BtSF6zMWyLTW2HQTp2h2hOgzDBdkM2keEmOiSHwfdXK7tWPBxbsgHrnE=
X-Gm-Gg: ASbGncvUGDjSU//mv3APOwazhiG7FtoCA2SgzvkVcV7Pe4KN//hqwRFs0UtKX8GLVI7
	UGj5GbeMY1bQxYc5CwiC+27P3CJk5wUr9B2EWy0bB+PSij78bGNqLFcn2F4g1oq+FNamDJ5Bty/
	GFNqat1Nr8iHpw7wbLxsOi2DaqVhPuovqNBLSmJF6FLJdOIIK9B2mmGgerPlmFUpQXFe7bMoEcn
	/tm4ENobsHMPf4vPEXMeaKUPHI3E1G561oqrxuNp+lQ6l/VrELOIQBmduApyWkOprHpe1FApAc=
X-Google-Smtp-Source: AGHT+IFxoEn538osLb1odgajYw9fSAUZgF6WvPtYoUG5YWbbVnrdjB5k6/fOChqeptiWxLNN08rLeg==
X-Received: by 2002:a05:600c:35c3:b0:434:f131:1e71 with SMTP id 5b1f17b1804b1-438913cf2e0mr106268555e9.8.1737357713032;
        Sun, 19 Jan 2025 23:21:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32222d1sm9595035f8f.38.2025.01.19.23.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 23:21:52 -0800 (PST)
Date: Mon, 20 Jan 2025 10:21:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com,
	liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, mary.guillemard@collabora.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: avoid garbage value in
 panthor_ioctl_dev_query()
Message-ID: <01bf1bd2-2764-41a1-85aa-962f1197387f@stanley.mountain>
References: <20250119025828.1168419-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250119025828.1168419-1-suhui@nfschina.com>

On Sun, Jan 19, 2025 at 10:58:29AM +0800, Su Hui wrote:
> 'priorities_info' is uninitialized, and the uninitialized value is copied
> to user object when calling PANTHOR_UOBJ_SET(). Using memset to initialize
> 'priorities_info' to avoid this garbage value problem.
> 
> Fixes: f70000ef2352 ("drm/panthor: Add DEV_QUERY_GROUP_PRIORITIES_INFO dev query")
> Signed-off-by: Su Hui <suhui@nfschina.com>

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

How did you find this bug?

regards,
dan carpenter

