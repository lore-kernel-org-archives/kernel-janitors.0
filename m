Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B5944C93
	for <kernel-janitors@vger.kernel.org>; Thu, 29 Feb 2024 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709191889; cv=none; b=YeksgEBnYtqFju2wL7kgM6hQzVT5nT2qVsTm0J7ZlYgfsVqtdPutMPRMnskycqRfnlvCJXQ3lR2CcCB2ahkCx0Ijqiov4NrLpSA5AJd/CE03/+rM2KVXq3hHbW4ymcSrGshBNbJ8dcEptZQSkLXfC9A/yTlYu0oBDhkLmcfOHR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709191889; c=relaxed/simple;
	bh=3uSBsX/h4xXlrUva8XPFdy9iWJ+hnl3udviF8wSyM9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDXyFRmBU2NnD0DuF4geE/xWsWSzACsUzR/ICgkslsZi29YwbKMD5xdbgVmoX2BJlMovRjUVyWLVHMA5QVMMWQzEk0SqfyUwV+5sTJd4oUKQjE0sddQf8VDvtV/c+a1ucWLxebxWQlCACRbf0wuS+TzzMT58R1pzu6kOkyad9os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OiGBpDUe; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OiGBpDUe"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-412b5a99204so4216655e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 23:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709191885; x=1709796685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RiWXS0Lycg9PCC0fyWU9eT4uTxRcxADLMUayXiNfgPY=;
        b=OiGBpDUe0TWApJDgwCkZfL7pQJeFirP39TWGjnMcb0GrANqnaSBaDu+gmZqb1FETv+
         w3CoppLAbkxJhJUIA2SutHxhzHROumgphoLCoQ71iYMcN8dXgooUm5EjgVxGJorgotVq
         cGuX9pWx+FCAbfaM//WDCtzX5NIT/xNiRe/+Qb5eQEa1ce/kH5TIRcm7y26fb6Rdds8Z
         fGeXVQOdE3ISkPWAMbQsq9tVNQ/PqdI82D0qOu7MWM4BZC7JIxEqunsyyRwx+N9dSFZC
         hm7ly6kVkOfU1zolzmb54/W4VXzwTgvpSGnRA3EAe5qwVHRaQOb7WCO21JpyTKyfHK6t
         CzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709191885; x=1709796685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiWXS0Lycg9PCC0fyWU9eT4uTxRcxADLMUayXiNfgPY=;
        b=DG/AsZ51boJjRRAcp+GV+8TGaIfY6Vu1VxnYEwAGOy5+8lhTpoFyISy/vxCkp1BEx5
         r2czP2F4GoCzatJhUvyPbRY5AFUF3caZXMwUW6DfE99vi8HXEaO249Ixnjsd41qTI4Mu
         L1GM2+5GyFVJfPqZXLbUMHPJRRFOD4mtiCJ2fHBrD/t70WbCZavBXRFTXeXOQVL9U69c
         K2b7u90NhL6jb4qTwR6s6+cioqb3WRSLSw23+eNWXvoz5uHHwJnwqpiWwq35owUoXI2X
         0gN1xOnarxB3iEHgbzeEitwWT4x+Bzn451Nub1NIcxsHdwlikNFGWzlTtqpTgTHuMDFi
         1jjg==
X-Forwarded-Encrypted: i=1; AJvYcCUHVt9cGi1Hfl0jw/meqVqnmCFWW48bhtS6RxJSMNCLDqQdcA3iXvLjrB2KeZ0OufxyCo6/4fMki7XorVyMKs/EhyGc99Wed1uGEuGYmMCV
X-Gm-Message-State: AOJu0Yy4aCkgNRL2wu6thqdegeT+6fr2ttgVHplbmwu4TpEcf6544Mu9
	U7NITpcllMw5ySyZVBc+Jgt5I08eQiztEWL8nHC3TjOgGVhv151A7cWlnf0eu4k=
X-Google-Smtp-Source: AGHT+IFm2NXimeRlzG6mxS8tXCGpz0iq1MJcSQj/J2MMs2rGLvivZnF1HI63cA99XXODIDWyyxPCYw==
X-Received: by 2002:a05:600c:190c:b0:412:b8cf:150b with SMTP id j12-20020a05600c190c00b00412b8cf150bmr973212wmq.10.1709191884805;
        Wed, 28 Feb 2024 23:31:24 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id q16-20020a5d6590000000b0033d56aa4f45sm928856wru.112.2024.02.28.23.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 23:31:24 -0800 (PST)
Date: Thu, 29 Feb 2024 10:31:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-arm-msm@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-phy@lists.infradead.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Clark <robdclark@gmail.com>, Robert Foss <rfoss@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Use common error handling
 code in pmic_glink_altmode_probe()
Message-ID: <fefbec63-df17-4515-8e63-66ba3a3b9cd2@moroto.mountain>
References: <29b63eb4-2342-4ca8-a313-5de2a6ec6a83@web.de>
 <c25aa425-f350-4ad2-b92e-67de996daed3@linaro.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c25aa425-f350-4ad2-b92e-67de996daed3@linaro.org>

On Thu, Feb 29, 2024 at 12:26:49AM +0100, Konrad Dybcio wrote:
> 
> 
> On 2/28/24 19:05, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Wed, 28 Feb 2024 18:45:13 +0100
> > 
> > Add a jump target so that a bit of exception handling can be better reused
> > at the end of this function implementation.
> > 
> > This issue was transformed by using the Coccinelle software.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> 
> (+CC Peter)
> 
> Hmm.. this looks very similar to the problem that __free solves
> with <linux/cleanup.h>..
> 
> I know no better, but wouldn't the same mechanism, down to the
> usage of DEFINE_FREE work fine for _put-like functions?

Jonathan Cameron has created something like this:
https://lore.kernel.org/all/20240225142714.286440-1-jic23@kernel.org/

It hasn't been merged yet and it would need a bit of adjusting for this
use case but it's basically what you want.

regards,
dan carpenter

