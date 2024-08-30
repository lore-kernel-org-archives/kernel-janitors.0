Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB5A16A931
	for <kernel-janitors@vger.kernel.org>; Fri, 30 Aug 2024 07:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725003750; cv=none; b=fHTlw+KJBtO7BS8q/rAwQf8sCvfDlmZxLHxLNOnB8ayy5Hg1ntZlZAQexRUC/JJxX7JP0AYheF+fMADeHIStoV9eqt2cKvMNhG0CuiX679Jq54t5fLYeAfHRltmkB+PteiSekunbRTlPhZYbjgnhOwOF63r6z4Es/1zn2uJwzi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725003750; c=relaxed/simple;
	bh=cAvE5yFRIWBiOv7ycyzdrJ4hxw730Ffg6FwXu8x8lP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxTmIq28Udl9+rIhn9drXK9GcVcwtG58V/nbkRcMz5WPDhzqR5iWuI7GoW+y6G6jqQPLdeksaPrwqSjThprL+jKoZw2jVNLyEfaeRlhzQDPpWeeuWOLuwOBBy6MmwlTItc9Z5p9iFI4VSH+fcBLsn3jWTGim7+W/vdmDab8ndPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yIaNXdj1; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yIaNXdj1"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f4f24263acso23738641fa.0
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Aug 2024 00:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725003747; x=1725608547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Gj6cEC3ZMBXWaI7qMCGVoLP3OYeBsgUhcL+MAyzmM4=;
        b=yIaNXdj1YZUbRqPDD8lXbXSqvU3mqqsA9dfKnqCux7afSrU7q94E8nL7tImxTk5/SR
         vwYhOkZfzCXb2aWc/MlpioR9sHZSKBF85ZgLC4ZsE5ab6dyjMZ306KNa3n53s8TlqRer
         UEQe52XfSal4P5IDkn9bZ99QVoNVX5Y+VlLZtxGJGslrYoyxQROouw1kElbrrJ98Bf80
         xEAj8NV5Lbm11en7sxg7sRPuEL5g9ztWDeLgAUF4UAsENu8+4ZbojcEqBPoky9O3kikG
         d8GyXtaPGikoPj1xfh6YC9Q8AoSeZ0jZqrWCm0dDDieKk5AkKmiFd+CZDePZmVgROq5W
         zcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725003747; x=1725608547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Gj6cEC3ZMBXWaI7qMCGVoLP3OYeBsgUhcL+MAyzmM4=;
        b=dAbKexkMD/FRkOqoyrAu8IwjJti21sGQsY2rE/h1jKOr68ox5M1MIrv2txqVOYkNC/
         qtNuj+IJ5hLJiJDDv+BLQ/9ad26KEOmeY44ruVOtdkbSoe+uY1NkstzJgkd/cGQmqzTV
         CZrfOozK4qYd8l0DIYID9JaTCBGmdDdnqK5BtzEtx4TonIR+05vuu/fs3cocA2XO4Tlf
         GqDHPYsCBsGRqfSyiUjabyjLpP5LT4ceDahoaYkQGrjI3SIFWPcmKPH9qpvnf6YwQw2T
         TtFcBLU1WtnENXzObTmhCCDByAIHmUotp+y02kXOyXG+q1N8eMX+VuW3h+cLuUpSH593
         jiOg==
X-Forwarded-Encrypted: i=1; AJvYcCVwgmeRgTswMn7lrh4QkNjSDliIbkl0OLOyVRhxOeQoaBiI//vRvu1J56Aku8ASz6YoYz9qIXfIpnXhx2bkJi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRD7j4pgNcN+qw/UXLVR9p8STzC91Po1FMvO6wv9HMtYz3OeDz
	a/ulB+oimyKTWdHVLalAwiqcPAgo3xiHUEFSuAWImLiBsCs2AMQh52JYe52w5zI=
X-Google-Smtp-Source: AGHT+IEzw81bh2xRm223q+buyjOAOITiTdwAwoJZDyd2Aep0W6LeSNiYRUypwNF+qHr8zX8FOHbh4w==
X-Received: by 2002:a05:651c:b0f:b0:2f3:e9fb:6d5a with SMTP id 38308e7fff4ca-2f6105d755amr51329681fa.13.1725003746710;
        Fri, 30 Aug 2024 00:42:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15f1sm5150601fa.4.2024.08.30.00.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 00:42:26 -0700 (PDT)
Date: Fri, 30 Aug 2024 10:42:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Johan Hovold <johan+linaro@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: uefisecapp: Fix deadlock in
 qcuefi_acquire()
Message-ID: <zxs47gq4v3tbm3jircy4wudrm3guvfbwgrlsckrnwzemyinws5@osk5jfie3gc5>
References: <19829bc4-1b6f-47f7-847a-e90c25749e40@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19829bc4-1b6f-47f7-847a-e90c25749e40@stanley.mountain>

On Thu, Aug 29, 2024 at 10:23:04PM GMT, Dan Carpenter wrote:
> If the __qcuefi pointer is not set, then in the original code, we would
> hold onto the lock.  That means that if we tried to set it later, then
> it would cause a deadlock.  Drop the lock on the error path.  That's
> what all the callers are expecting.
> 
> Fixes: 759e7a2b62eb ("firmware: Add support for Qualcomm UEFI Secure Application")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
