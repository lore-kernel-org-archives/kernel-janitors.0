Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522C122C6CD
	for <kernel-janitors@vger.kernel.org>; Sat,  7 Dec 2024 17:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733591275; cv=none; b=R4cWd8F4lsW8+FLpy0/0wEpQwUzXuVfw4aZkSpWLloFRihwCDGYcF1SxhaCYyo5dvJYVZIQ7RJdsq/KsWoX4IZmwlboMyeOuJGvkVi2r5LDmKZOc9bXyAMhvKPEXHkgbt8MRe/41SXFGozsW4RzGBNwVcAEn8ndaijKJN+kPaIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733591275; c=relaxed/simple;
	bh=6Fwkd5+NYkMOBlBy1d/flglYMZo39/21KFlyI6RzobY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAHd0M9TJgXAnUpE1VUiOaqufZe8Pl4+g/BVZ/sQLTrqScmE3L8lMHN0aucQbpvPrOYcyDwA7BbpQu6zKMjn/iZzXQ1tsQYUCAN/MtfPyNphLMlZGA4Vhs/vU1YH/klbS027mcTMgfS3rzLbQHwmABon5whaaWTLBuEJbHjqJss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lTHX3whf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lTHX3whf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434aafd68e9so20438355e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 07 Dec 2024 09:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733591272; x=1734196072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SjZHyEC8LMjiZRbwtvjzRgv7YlJDtkKDxaRNiR/V4l0=;
        b=lTHX3whfrTZLt6PH2gQ8KvOJuzVBBPWmCR2DZEZxUP9VDMUCoQWsZbj4udv9XgCa2Y
         WYdXvSwKcr638CjMwjaTJwOjz/xy2kc/w9AxyZt5Hh1Vl6Cxc7mubJmjieqt2zfRZ9hP
         +DS5ERml2as9AEChYSABsgnpiJTMmPRxGHYG2ZfyJUfE7ncDTtSmUYRLqrry3drPoyqY
         FlfS5UH0cLKOadEllobva6JNCxTtF8tbafsm3UAmEWPhBtUIetaQOqZm+tk+npahwaaR
         uQx6EdOaJEOc3zme1Yhu4D4uaF4ORtH6XJCOR5cAciP1gKFuS8v+RwrnjuWocHOCt/TL
         JCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733591272; x=1734196072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjZHyEC8LMjiZRbwtvjzRgv7YlJDtkKDxaRNiR/V4l0=;
        b=sPkTWgV3pR6p/vqo+++I2MA+DmPJzC4bOXi6CqW3PYe3XLAczfaSNv3DW1Si1aeuk6
         5yDpAVWTNOnzV+5yCqVxSGEute6g0QHt+U35Miuc3IgbiEE6VVkNYtrPVHfSLChCJLJc
         Myqa+bEdwIqulZwYj0Tn+4I73fmNC57Xfowfn0pNAe4AKDtSThrgjYHD4BiulNPrYNj9
         mo0Cx1fUHlDGNR7fCpEoIJY2nYbEwZHxsNgogu2OgrXQ8Vk1HUz2cF/x0azf7nmgP4GI
         ES1R3LofSf5Y69qrzkmI4aPrRBuF68rxMYZUGKzdzK6jQPT+8S/IJgO2ER/cDzXUXYql
         6WxA==
X-Forwarded-Encrypted: i=1; AJvYcCXy/ry6s4vKpbgXL/PGsTirkCiJ3YNARvAlgr+Xzkv7/GS9kihMNSMzgxcpYV/FjVkK/9j7G8lttM21n1mSSvY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ovA5t3KyRWE3dVeL2cmPU7B8SXfdRA7pxJUA0YEWmISgn1ni
	ApOYP/fJPmT78GxBGT6oT986TpviRp2SB/aMAB//b/p7DEQeG+IuuUBk7DVwYaw=
X-Gm-Gg: ASbGncsJq6l71Jd2CBwFeJH/a8Nak4cERxhin35pY6Ysq7UbC790xhA1PFH/KwHxrot
	OX+K7ekf0lzalwFqfcp6QKB48sjMVN3IpSbaw8B02S+TW/3dckwiwj44qLFLUQiPNaSLMfnCyIp
	D9uYWShI6Q+izAW50Cudr8NjhFrNsNxbJ3d/iMOvu8I5U9pjqrFfkjUooIyy3OIqi7bGUXg1l/v
	fV4BnQEZNpAiZ24vNOXplVrEcZKElI/2RaZH06y6YU8Itvwihkgsew=
X-Google-Smtp-Source: AGHT+IH++nUpXJiDBC4Fh9UkriWZ5KGl+qJZ3UNbkzOLpeFQE0OB7VJDLKVp6G3O8SOriSIauNPMjQ==
X-Received: by 2002:a05:600c:4ecd:b0:434:a802:e99a with SMTP id 5b1f17b1804b1-434ddeadafcmr61344335e9.4.1733591271628;
        Sat, 07 Dec 2024 09:07:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862e975194sm4251385f8f.74.2024.12.07.09.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 09:07:51 -0800 (PST)
Date: Sat, 7 Dec 2024 20:07:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: cong.wang@bytedance.com, davem@davemloft.net, edumazet@google.com,
	horms@kernel.org, idosch@nvidia.com,
	kernel-janitors@vger.kernel.org, kuba@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH net-next] rtnetlink: fix error code in rtnl_newlink()
Message-ID: <4639f75f-d081-477c-bd61-a9ece93db5c7@stanley.mountain>
References: <a2d20cd4-387a-4475-887c-bb7d0e88e25a@stanley.mountain>
 <20241206232731.38026-1-kuniyu@amazon.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206232731.38026-1-kuniyu@amazon.com>

On Sat, Dec 07, 2024 at 08:27:31AM +0900, Kuniyuki Iwashima wrote:
> > [PATCH net-next] rtnetlink: fix error code in rtnl_newlink()
> 
> This should be tagged for net.git.
> 

Sorry about that.  It was a mistake in my scripting.  I'll fix it.

regards,
dan carpenter

