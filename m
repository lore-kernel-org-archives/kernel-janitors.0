Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D9F25CC7B
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 10:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740738234; cv=none; b=ZZF2gbac/5ekLjo2HgTrq5c9Bs6DFy6Q65DDIPZICO56OVOqc/5HnZ5OHWn0XIObCgairdd8pT5EMmaohwASBctcw4BtigmfraY85xYoMdFIIj0evEZ/jTFA1AP3+nbrGXAnE3byYlDNwrPEzSyYAAV3f8LgFIYSo3Q1Bx5NgSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740738234; c=relaxed/simple;
	bh=6v+0WDwLgpXPJnPNKdHaqelPONmHUTruWATfgBMcnMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uheDpGA8snZiQbvAdjpsBbte0uQFV1dO8AcHcjqRj0HbJMWiZmMkPXbRDp1Ca1lpzsuAyCAuKFwNS8iihN8UHL0WZ04pY1b2Y8h7XRNhJKSAtT4Vh20isJAtgbelswYGKeE+WW0YktiKfDMrYKwECaJMlxzTvp5yD65JLp+xS7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DIlKdcHU; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DIlKdcHU"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54605bfcc72so3475813e87.0
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 02:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740738230; x=1741343030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sOXRurkxs0z+V+7lsmPMX66oMcslr79MsEtI3f5CfhE=;
        b=DIlKdcHUCYQGw98cm/04fmMJFcmKm/eNXu2mr29k8SIqxEDM+OmahSXD2Gpk8JBKL4
         c2kXBz1/Ka08ZTgYTu7wBABr3av+cx1DiaMS2Yr2vQlW58nnk9S6C9RwAmtDt9uHkliP
         rjjYI3KakW1cZ/dq9Xc9Y4P2e4H+Y4b/nHAt6spa7EVZJQML/hVp3W+pdyHnokq7FoUZ
         WfLX4u1zYqw8TFddcg9/Vs1A1O7w/vRGrhm36+PYaCG4heZ0i8Xq1pJX4juA6r7QW+as
         MFrYyI64TqlZ8BUqB2+CmXWFvhIxo3ngRhoryYl6doSufFkV7iYCB+FMXZkQNll5LsbA
         fKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740738230; x=1741343030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOXRurkxs0z+V+7lsmPMX66oMcslr79MsEtI3f5CfhE=;
        b=oMPC/tNMKMEoN+xG/AN9cmHP7fmmiehmIF1X3OKDL8jKV4A/kmBJd6t7I7gpcivOzX
         M+91AOzclHPIP8iapEHISANDgJBZPZcsCRqGE+BIjS6bkBb2LtLzqDvdaNKt4u21LZoX
         vK1fF568DEIeITpUQ/mpfT6zTS/TRZmBo7m0h0EmKKzOIzcJOfOpu4f9uMRQAGvAIdBB
         2AWGSXJEzMtjJZ3RAMKhoTa8EK47STgUtU7JW1zlUd5yF4mlMB6/VYwb5+18Sh8OKMNA
         l046Ogi+qy8f61uZYBI1ESuANaDPtM4MOafOPHWCm6Ti2F9Rrzueqyko5vWjHnBDMVyc
         KzIA==
X-Forwarded-Encrypted: i=1; AJvYcCV/gAAd76y/QF2QMbeEDreE9te9zErRMrAxr+4GiYMh80CX233Va+qOAlFfqd1WomJKvh6xpJc7oC0mWVv+NJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTcQu97cOPyCVUBTJU1GBK75eptfQUVE8JFML+Oo77kdPQa6M0
	5/UTx+/OYDe1tnvNN3bCd4+LisRyDVTkwcu8ox7NSSwFkLr/L16Uu171e8ecKpY=
X-Gm-Gg: ASbGnctR15snUfvhn0tOqs9Th48OQjbbExlE2VBGU4v6F3OBypAjOYZlJFJLBbY2MZ0
	iEnXT7Msxn9j0WQ4nGdbcz+Sz5SRGavQCWf4KpPYkW3AgaHhvAQPp2RH0knFNvbyJSb8dqSzEA5
	zWpm/AngKx2PyqntP7W2jSQKc1qrWpaMmYfpXXjA8BjuJDdw7SUtzx1gYbOcF/btNXNty9eUf3p
	gV0cldj+Nz9Cv4OY8pj2+ljvF6tQz7PBOVTV4rUboKki+db1GCcy9SW6aP7l3y4x4skk8e/2+HR
	dzjRFtHVtH96hD5qsijrsRK/2Y1Wc0uIdqaiS9cHxgdvvBC+wtR8TsW9Z/gVDkA8yY79LuVkDg7
	8CqkWIA==
X-Google-Smtp-Source: AGHT+IF9LbW1HCKmZbmSt9YCfBY3dVCCtw9fK87uyuUzNs/7q6xF88ILJDPLd2GLLROaUD03gbt8UA==
X-Received: by 2002:ac2:4c4f:0:b0:545:25cc:23cd with SMTP id 2adb3069b0e04-5494c3339e6mr1166834e87.16.1740738230560;
        Fri, 28 Feb 2025 02:23:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54944174494sm441628e87.10.2025.02.28.02.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 02:23:49 -0800 (PST)
Date: Fri, 28 Feb 2025 12:23:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/bridge: Fix spelling mistake "gettin" ->
 "getting"
Message-ID: <qyckacqgtlqrmu7xip3o5h3qjrdqegtvsivtqihg2asbk3rzm5@sagoukfjydp6>
References: <20250228083248.676473-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228083248.676473-1-colin.i.king@gmail.com>

On Fri, Feb 28, 2025 at 08:32:47AM +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry
