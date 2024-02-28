Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E2415B967
	for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709132380; cv=none; b=JN4F7OhssvzL3JLfI+4AddxNdf1reiw//9CD9xgUGIpyvmYlEqUWQlRzm3fbtL9LNiSP9yorWB5B9iTpFBktim5y6gN7hcqepjvm355QslYpzTXEbLHwt64nlsOplJ8D1gZ3Zp9ShSVrVCgmA/+RL06R3+7os6xrue3H3t6H0kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709132380; c=relaxed/simple;
	bh=DGibxGXROfONoqQx0DYX48YEs23do8kEJg5PaBmKah8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V698VaUnw5d60stPg8YmQJzptoy43nlrBREnFE7zP4JU7z18/f9NKt/ggp9wjocooMzy6LSHKfoNs81DrES88h4caVHJEizLj9/Zxdcz4aGnLhW51yIrvfvmI9wVBXxzx8SMb2Bf5aDZRFAlg9grihOtV2U/B7YqHoRO4Z0eBPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yHGCC82G; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yHGCC82G"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-412a9e9c776so6056365e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 06:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709132377; x=1709737177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rbrx7HVa2y5fUE9QU+x+EKnMvXEJQXBHESgYcH8oieA=;
        b=yHGCC82GKurxUf1GMdZo7v8eQMvPo0SYB9A5P3+tWrRxZCGGp57JCZefy73yrc30Xm
         06b6GUF60XNXLtiLpH515CyWM8edfDpEyHZ4QVrga07VV4V8Pp/tIN2RQIlaRKdFGwjH
         J5isN3+YK5/RMeMochXSUcV5NIQ4OeNndG/MXoitUA86Dllyes1pL4DAJmrHF4ffC2KT
         iU7kLbUbVCM2sUG39gcpoJxENypeA0Es6K0mh53HsqlYbkg4/9DxzelzjAY0CMBWhlaN
         zmfy3dVyb7Qb8ltOsn4EPaB8fncQuDqpeDxiZBRiINxudo69oAAb2FAgdOHvCvyOx0ar
         oTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709132377; x=1709737177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbrx7HVa2y5fUE9QU+x+EKnMvXEJQXBHESgYcH8oieA=;
        b=CqshyhdMJHzBdJ0jGCGBieZ8kQ3gW9EoeQTZo1/4FwmE4IJU6eij3aOFF5TtrlhZ4/
         SU+SEu3R0DeByY9vXQiuWPKYdfvksqcuLyMEbSghC0byDCmlgIYkul7Ttzt3WMLDAA/f
         zNmoagQxdwRVyrXZ89bsd3O7SY6i5eNID18aqN2cSnZmKuFZX19K8pC+d/JbWWhiNHDb
         LB19LYCvGJg2wgYFd55RRTaVt0//kLWHCix2uqyPFwSaHqNXxceNUSFue/nASTsRcsvg
         WNtzDoIKcH5PYnTU2goPLIg6rsDkWpO8/VF3krpWJLKw0KPmcW8N1h7Za2LxbMPrvC21
         hnbg==
X-Forwarded-Encrypted: i=1; AJvYcCUYN1F/zz2KRk0EUwdLD1INxqelOgRchMa6kHkwC6ojcziHK0V8ietkk0IRE9oUUEQ3ffBtQYlTlUHogJ+kLevchMLrbANgRxmVVKC1ZsG2
X-Gm-Message-State: AOJu0Ywut9OvM6O2pyd6Et+z+IVV4YiemPimAsnXzZQVc5wKXmWB2XtW
	tWcxiNi84ZFb6XvFnB2fSf5rxt7oDgbjV93y4l2bF07WfgZVcTEfUz0tahynX1s=
X-Google-Smtp-Source: AGHT+IFchycGMykpHbANjTJFoomdujpktccrhzPLJQUuqBou81fEAjdXv27WGdHHfvK2TAZOUqVLxg==
X-Received: by 2002:a05:600c:4f0c:b0:412:b431:eb31 with SMTP id l12-20020a05600c4f0c00b00412b431eb31mr1837067wmq.18.1709132376444;
        Wed, 28 Feb 2024 06:59:36 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id k8-20020a7bc408000000b00412b011458fsm2304389wmi.30.2024.02.28.06.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 06:59:36 -0800 (PST)
Date: Wed, 28 Feb 2024 17:59:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jiri Pirko <jiri@resnulli.us>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Anderson <sean.anderson@seco.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: fman: Use common error handling code in dtsec_init()
Message-ID: <8e3b3338-d2f9-44ac-bcf6-e53ccc3c9cb2@moroto.mountain>
References: <9b879c8d-4c28-4748-acf6-18dc69d8ebdf@web.de>
 <20240227184657.76ec4e82@kernel.org>
 <Zd7mFe3-kbqjGpxh@nanopsycho>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zd7mFe3-kbqjGpxh@nanopsycho>

On Wed, Feb 28, 2024 at 08:51:49AM +0100, Jiri Pirko wrote:
> Wed, Feb 28, 2024 at 03:46:57AM CET, kuba@kernel.org wrote:
> >On Tue, 27 Feb 2024 14:14:52 +0100 Markus Elfring wrote:
> >> Adjust jump targets so that a bit of exception handling can be better
> >> reused at the end of this function implementation.
> >
> >Okay, but..
> >
> >>  .../net/ethernet/freescale/fman/fman_dtsec.c  | 19 +++++++++++--------
> >>  1 file changed, 11 insertions(+), 8 deletions(-)
> >
> >..you've added more lines than you've removed so what's the point.
> 
> To have cleaner error path? Not always lines of code is the correct
> indicator of patch quality :)
> 

I really don't like those goto e_nomem type of things.  When you're
laddering gotos you should do that kind of thing before the gotos so
that when people add new gotos it doesn't make a mess.  It's the same
for unlocks, do that before the goto unless it matches a lock at the
very start of the function.  Or if you're doing a goto from inside a
loop then clean up the partial iteration through the loop before the
goto.

regards,
dan carpenter

