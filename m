Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78A3A55
	for <kernel-janitors@vger.kernel.org>; Sat,  8 Mar 2025 00:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741392901; cv=none; b=VBEbXgCrRFv9+jMC6nUEsqEVCrB9imm3P5P+BG0YFy7fhZRpwrIP3JvIzYf/HFyGfjmh8hGXx2tg3hKs1loOqfh0inptGw8kF4sVKo49FzUldklajDbyOcI0cO2JSNvZR3nItAUMtcN2YQVkqpuEglw+g0ASgH4KvC8xHZn4WMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741392901; c=relaxed/simple;
	bh=ew/35kdLK4qgIIWfEjIh84RGMmwMswvqotUpp4L04wE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5tJdHN/3b+D6CV6DcvmFbdSaoT4PETc7dLmA1T33ZVBp+mgBhVkqFxSYTWSkSpYWBFYJY45umPNxuvYtvlL4Kyxi2pgbiArn4UHvvZxePlCNWI3oiXMZ+SOn96xXOXOq99S9IZi7x/dcBcGmWBZF0dpdluk5XOB5TE/3HgZ2kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mY4NHDD/; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mY4NHDD/"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5498fd0bce9so1912959e87.3
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Mar 2025 16:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741392898; x=1741997698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OI+9sOurb7xWpdPzZDCFl9IV8OhNe2U1hJtvoJa6TD4=;
        b=mY4NHDD/+iY0k/NZbgEBPCVJ7vRSQouileBGpEoGxTkNS8tin5t2lyUpuA5/ae/658
         hkOtOasz0CAcJHQDz/c41qJgNqMuM9iAMQGn5tDNF5ECchNB4JRE8W/NzNbD0zU4G0aw
         n2O1w3JpxRdYi8RUV+lWwSyWhc0Hc2k/KPp0PRgRctvrJHLS5HVosJWQlsYDhL7AGOya
         g+vqCmcCS8QGSlQhzxPmH1LY2Ba3XLzuHgTa0yMJVfEDFEJxTEJUVMt+0iACRbPsVBSW
         J5F1zZ3v4mLSc0vzGo7nQWbqhZSMS0PkprRe0AZHEQ+tR6iqmxllZji6KHjr4knqdBq/
         KelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741392898; x=1741997698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OI+9sOurb7xWpdPzZDCFl9IV8OhNe2U1hJtvoJa6TD4=;
        b=OLwoW5kS2/ZlRmK+qEfQMHPGnh/K6I9EH0NHFN5oYwT04QkQ9U25MGtF7XSQk5PMJU
         P6qHVXO3aFa1n0+QwiB3WTRfyoincEpoIzEcU4sksJbYBSt1hBuaVI2FLaXiXdcwauvE
         zh/Qn9ZZKmv6ZSjIv2PoZ3KMCIr8JtNMqjebj+uxk5S7ejXop2gulvfEMHJqJKW4f5C0
         vPYXfKFXGYFb+h8AY5ZWdVE4W6xT1ya3/SqW2gDs0lswiPvBdsNpha52fzEdhjoR4dh0
         ENYrPsHvMSJvp5py70D7TNwhWk70vzyhJ8E0xJix50WeHq/Gw8i9/5mdOLTP9Y3tndTO
         kwlA==
X-Forwarded-Encrypted: i=1; AJvYcCUhrKGbM+ycFd3FacCw0VqoHIzXVX+krKUPimR+XJiFPxrMeZqiGobWh9q3sUJW5Fvh27+IbACo1uNKDEhsToE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqphkMhHvGXDTcX+tETeZxiQH/NQX4O21bOzpbmcCHRmg//8go
	oSA/IxdaI7JQkrsm9D6iy0c3HwZQ7ap4orN1sy0vGbOa/vqLyTlUO2oEglGS8nI=
X-Gm-Gg: ASbGncslavAYseObc0lH35DCCjYYV61GUfOLZNLuWJ7AyAUHzWWnC/pWqPYVqk0sXfK
	0qicXINep02XqnOolcR5goabiyczXVzeuYfVfqV0pL8IFMOQuKGBDhq0c34GpM6FfOlnWYtG3jV
	RPeT23JdIG3QdPR9BAuxciizfrp4n4ZPvP97BY9cE6fgmGlUY07bGqYe08jqlkatxSlhdVUXa/Q
	qbSvDrj3fk9QxBAcNJHgdORMDzBblon0dakMejpH1WfCLyk6KRS59J85ifsU7oSgGbp1Ft+Ymsn
	b+/zxRF/0NOAgxTeApd9dhgXoZVRKM+Ofs1Ma4U++YahQKiy6SPCQ31sY3wBaK+PX/MftHO67zB
	ITCcQEPdOKKB91HFplNzRUR99
X-Google-Smtp-Source: AGHT+IFbuhinx1qF4on+W3zSP7LNgSQf0IHtNKaQVFWJQ8VobeRY0aVJ73nWM+CnKCUkmpRbt4NgHA==
X-Received: by 2002:a05:6512:118a:b0:549:5b54:2c77 with SMTP id 2adb3069b0e04-54990eaa9e3mr1876943e87.32.1741392897791;
        Fri, 07 Mar 2025 16:14:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd5b5sm651008e87.158.2025.03.07.16.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 16:14:56 -0800 (PST)
Date: Sat, 8 Mar 2025 02:14:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/msm/dpu: Fix uninitialized variable in
 dpu_crtc_kickoff_clone_mode()
Message-ID: <vvg6cvpjtcekulvjrovxhjpsd2loh7ath4eu3nya2dffoabgvw@mtcmctbmpble>
References: <f8ba03dc-0f90-4781-8d54-c16b3251ecb1@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8ba03dc-0f90-4781-8d54-c16b3251ecb1@stanley.mountain>

On Fri, Mar 07, 2025 at 12:29:39PM +0300, Dan Carpenter wrote:
> After the loop there is a check for whether "wb_encoder" has been set
> to non-NULL, however it was never set to NULL.  Initialize it to NULL.
> 
> Fixes: ad06972d5365 ("drm/msm/dpu: Reorder encoder kickoff for CWB")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
