Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5BA267AFE
	for <kernel-janitors@vger.kernel.org>; Tue, 25 Feb 2025 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477894; cv=none; b=euigxhDeyozHxAsyfCfwnnz9aCnqx4xiPhDvukyRabRyRTZYvJHKSp9m2b/6wFImkFLXb8K7YK6humg/oeA1++iRYy2xqwXlQ51QPTc2VekN9x/gGKITJoJ/yddji7QqRLxbpWRK/JLsJ+3CDQsQUFlnWDkrnz2rz/UWVFyD6/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477894; c=relaxed/simple;
	bh=DuA0E92AFzqVAQkY9I4a+gZlF79J+R3+j7twI3wDzXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGu5b3oWoYiGqiz5asu3LsCxuf/AuonluuC2P5/HzH7iKCv1tlakGt2peIPN8TJSpZlPQfSwldGZbQFSiVC25rGiyiBlBk42dECUeyxlcGJA4bDucTJ1KO0SL/pP7yIfFqQ1D2zE3xyhSA1YjXIJ5PBV6JulJpnxjUvPndsGrTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GQegHoU7; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GQegHoU7"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5461a485a72so5238963e87.0
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Feb 2025 02:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477891; x=1741082691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sUfGZOLBpPXz98roGZug6GzOuxZ57fwrWBTaMGnGD5k=;
        b=GQegHoU7zMaoX0CCcDUstVZHEP9+1/KQNkt1EpS+vIIFy5FvWSl5vF7BK1Zg5h18dI
         Yb0r+yajDFy4HpSc34S8mwSN+9kaZ4NfThLl935v9VAzzIk6huLOT9fNeurTlW5kKDvP
         H8rw5tK5PV/sFqO3CFk0nYzXcFm/fVxEC4iib4gr5KfudokWG5A4RcN5dGEanCIuwsX5
         SzXIqprGvO+Kz7u5GVRBE3VQhhyY7NCramgDStv1WpMyBgfFkVw4hZByP9DgslbmGNO0
         oQ2jDwCTPs+to8k0Z/j7xOtKBaGZ36/R86qO6ae65QZIaLni6LFqdKJpWaBB6aQsQg0N
         RPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477891; x=1741082691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUfGZOLBpPXz98roGZug6GzOuxZ57fwrWBTaMGnGD5k=;
        b=dXnIBhbGjSSaSL/p6Ph+z1Vtef5BTzgIl7oflgNpoW+T4XwI1HmGJg7C++g4BSo4qy
         u52rI9VOyIRzGPzOMwrY6yekh4milhHOk43QKGIML8klC23A6NgteaeBtlCa3b6kHT81
         bqPRsu6FSPowOGlo0hkBq6B/l6+XRdWn1QHtwMxmbgTv2ublKGYS8TDgrqs3AqAJky4K
         pjvB4Q7Ufc9nNfl0j/aUORQl9DTJV9BVY5N4l2+LOjWSMFe8lZubJFd1HAQAcJ/2SwJl
         IWDXXon85De5uSe/9Y1BB96O+W+g2EIIpyOXH1IQ8ZbBr7QwAfwucv6cwEVBXzJ5oTap
         EIHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaaB937bVfibGI0TIe1opIs2VhNpULM3NIimNLIDeyak+zrSpOPBPOoslNW2zXqk2dGHVRKFT/pwfc1mslgLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFCZPbYpSTNaGkPr41uDBqSPw4r9WY4d6CNodQ344Nx8oqtlQl
	aCiHVuEe3yhmRYlktPEW1UcPn6GnRWfm1sRD48odHPpFGszC8EgqWVkrxx+IyTZU5z7ElXDizG0
	G
X-Gm-Gg: ASbGnctdmaOLdjm8n8hL+l6NlxQQFqlN+LMDfpZuLa0bPiV9ZJfvJvHrnho1isLZvLK
	4hGoTng/y/MCWzNJl923cFaECH5dtkItIngWn+Q40n5Wyq1epKDie2m5+ybDbH3Nju0R7QSG6lF
	bPnhhwskiRQ8rRB5OJzj6x9RZhdBBlRziAn6Xk7spxjmDz6P1w9uGKmyn5hb9pOOFoaGp4bfHIL
	9L1dRb+f0Kpb98kvjiIqlfsqE4+j0TChW1miNiVLiodJWH+4Yzx5IfARgkgvHVtO9Wd69m05qWR
	GPpA24zxMpx/NqMBnCoJNOgaaOBgtV8u9HmKpAnaaCiV0llt9N2qk1yXsAMXzSCWFR+4D07Ag9b
	qBciDAg==
X-Google-Smtp-Source: AGHT+IFe8roSMzt3VVv7TZk036TpcSGcoxSHvfVATn8ZrfpARrpjkEuvUDMxx89xTrZ/KzUJppvbMQ==
X-Received: by 2002:a05:6512:104e:b0:546:2ea9:6666 with SMTP id 2adb3069b0e04-54838f4e48emr8396425e87.34.1740477890594;
        Tue, 25 Feb 2025 02:04:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b9e11sm136744e87.92.2025.02.25.02.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 02:04:49 -0800 (PST)
Date: Tue, 25 Feb 2025 12:04:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/msm/dpu: fix error pointer dereference in
 msm_kms_init_aspace()
Message-ID: <uzrw5szojucylvminnxghqld34jez7lfzljtdxtkmkxtm5xodt@ruihfzdhkx7p>
References: <3221e88c-3351-42e6-aeb1-69f4f014b509@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3221e88c-3351-42e6-aeb1-69f4f014b509@stanley.mountain>

On Tue, Feb 25, 2025 at 10:30:26AM +0300, Dan Carpenter wrote:
> If msm_gem_address_space_create() fails, then return right away.
> Otherwise it leads to a Oops when we dereference "aspace" on the next
> line.
> 
> Fixes: 2d215d440faa ("drm/msm: register a fault handler for display mmu faults")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
