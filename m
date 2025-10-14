Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C86C30F81D
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Oct 2025 08:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760429603; cv=none; b=ceynz0sy1ZNDf81FH/z3llpecI9TSoa05IUX9TBUHh6PnINURbCHARWndzAGKN8whO8pJaO7aJbNuN21ajglzzZF/7Duof7zwaRtCzkID+ce2XIWBgkgTf0G3wMH0oflZJhyLiTniRuJeOqYKkcgcw3VmxxO6CrDlUAiNnkxu2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760429603; c=relaxed/simple;
	bh=Qjf5s9p3okVSF/8iwSV6tY3wMOMvdfYVeDRDYwN+sNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpfW1OqxxqRbYO/ItDgI2oiWcRi3OXsdRXI9MYrsGVJdUasHTlpjQkYUrwCDkXA6OnstcM4yK/ei8WpJ8zoUFwxaCgUHzrLqNcz7lfHada02Sgtp+hXR6oXimBE44mrdZzAcu4qicGujk6iziUNwXm0qZvKTwu7Kq3p3L8aKXIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=doLUHXZu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="doLUHXZu"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e52279279so35620325e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Oct 2025 01:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760429599; x=1761034399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=77ONa64qN0g6cheWy5Vrvof/4mmnbDRUL6LLOyJY7B4=;
        b=doLUHXZu3judS3oaLBhy4XJmeVmfP7nCAhSaUxdP+39fLYRcDGswKLkThmvppzErej
         uN06Zxw8Q5eXyBC4H7RqFFn3xXQCYvWZ3whC+WArZ9moN34cQFXMuqQnLPNkF/PUUbuZ
         gLEAOcaiSDfqMIBh1aZL8estrXdq6KgwmzHyuXgTzHolaNFLNj48VnDHX18Q/MzC06m4
         e3pshSCYSp/jmpvZJMmnfZeD/swnMmoENxRHBCPLcEQPv4yxol0wRbdLuhuVHHzIeDU9
         reloLlypAVss18H6wPSoAciB9+0UL7yiLl/HsXUMhCiGoN0EGuvYyDNjq7rWNQC1VEWK
         Ceuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760429599; x=1761034399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77ONa64qN0g6cheWy5Vrvof/4mmnbDRUL6LLOyJY7B4=;
        b=KcKbtj82JLC7I4S9WyExR55RZnRGA6LI4KzIZTAejG/VIUo/erKGfRfjyXZUHpauh/
         jateCiXrYJ7EpUrlR0eopl7gTKHPMF4hjzlPYdFK0IQPQiDrBjUUyFUAtAW9vkmcFlri
         zeA8TMhzcqOFzgp+qZGHMaLG0KGkZXW1Ti5tDaLRvX9E0xB/H1nJrfRI2SMZ0pT3dSAq
         UQ01SiVahTyID3L0n0ybOHbDItygczqBgR/fAYIgy63uG2oTnQLJteXx8xxhAZzw17iD
         6g7Tki2i42yhl3ZLunHkZuV4k8syvFCY0iq4fANtBOJGJUtVs9vh3KLz5c3FwwvAkijW
         JGpA==
X-Forwarded-Encrypted: i=1; AJvYcCV8qA5n6P8OzaisBD9wQl1FEuVyChVKbxAiy70G/d11KP7aXj2zI8bhTNIz67X24ItrVXQ7513cIk0FT+gFf8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YztqosBv8gZ8ZnVs4IJAbqjyMElU5l5VJ7zEMEiYeYy//n1ADtw
	i0x47WFd+K4TbSsUs/f3ziS6TiKVVCekrW33Z/SXl0XuDKDDxsBT1gTQEhhplp/LPoo=
X-Gm-Gg: ASbGnctbhORyYO3RvX2HzWOp3OL/oehY4g052QmqGeKTv1oMcgji0oV4392sAFg4QaY
	QT2BE9T6pUKLBFr3iX1nmtj5ZqHKaUrelgXD1iN01wkptzQi3UVi9m9DOwq3bu+vtaH4l62bjIb
	QovKsg53ZMA0WwqoRc+plejJUBE5FRIO9emKralFlxjJ+zUhXhvoKzLBxw4JC+8zLbEAZA/7X99
	SWI9wiIi70Z8xeRBzYLDuPrr82RFKrUOWr+FM9rbpC3lwqUQKbGyqmA7Q6ekdKsuw2/aLPEJLt+
	dtJfi5N6F6yzWDLAlw2ciCjQ2eRbagK2pokd99n8k6+RUDuCerbMyDqv/RJRUacC/K8zHMuqfvH
	4ZT1JehOP+wBgdXLMNrpAj6rMl6ZR5Agc+TIAi+3gpl2cC1ahz5xn6Ap3uZZ4yA==
X-Google-Smtp-Source: AGHT+IFbab0I6IbunJxw9DMnNGmlNTMAcT5O1ylJxmLdoG5nQ5JswxZUKVkCCcAgGghuYeWd5vIj3w==
X-Received: by 2002:a05:600c:46d1:b0:46e:45fd:946e with SMTP id 5b1f17b1804b1-46fa9b078e2mr170662745e9.31.1760429599330;
        Tue, 14 Oct 2025 01:13:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fb49c3eeasm225967545e9.14.2025.10.14.01.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 01:13:18 -0700 (PDT)
Date: Tue, 14 Oct 2025 11:13:15 +0300
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
Message-ID: <aO4GGyJLCZEwFYL4@stanley.mountain>
References: <aLaPyJrFsSFuqC1R@stanley.mountain>
 <5f9e8942.7fec.1990997b4de.Coremail.andyshrk@163.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f9e8942.7fec.1990997b4de.Coremail.andyshrk@163.com>

On Tue, Sep 02, 2025 at 04:42:41PM +0800, Andy Yan wrote:
> 
> Hello Dan,
> 
> At 2025-09-02 14:33:44, "Dan Carpenter" <dan.carpenter@linaro.org> wrote:
> >This dw_dp_video_need_vsc_sdp() function is type bool so returning
> >-EINVAL means returning true.  Return false instead.
> >
> >Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
> >Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> 
> Reviewed-by: Andy Yan <andyshrk@163.com>
> 

Ping?

regards,
dan carpenter

> 
> >---
> > drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> >index 9bbfe8da3de0..33be4eae2b20 100644
> >--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> >+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> >@@ -1149,7 +1149,7 @@ static bool dw_dp_video_need_vsc_sdp(struct dw_dp *dp)
> > 
> > 	state = dw_dp_get_bridge_state(dp);
> > 	if (!state)
> >-		return -EINVAL;
> >+		return false;
> > 
> > 	if (!link->vsc_sdp_supported)
> > 		return false;
> >-- 
> >2.47.2
