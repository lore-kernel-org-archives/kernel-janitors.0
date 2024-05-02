Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5613B200C7
	for <kernel-janitors@vger.kernel.org>; Thu,  2 May 2024 07:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714633717; cv=none; b=UQp4/tc1JA/13Fae4yusnLf+xPGgfnDt3Gf+Jd2qVe+mQ1g9XihnmBcGKu0S/HV0fZ8BkhpPpZBT88dhuL+J2T1m9haacafMpXZ86xHJM9j82hnBjy5NIWIo/Wx14Vo4yPcxYSfR/hK8dP4TlFmcoR+Thhqp3Rzb4m1FgKuI3M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714633717; c=relaxed/simple;
	bh=E/JYmqvpE2HASs6arYE5LbOOv0IH0iOwjjlIdgyafdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apuzknhDnkS7bWouUgeG1lNUg5pN1E3LOz1m7FJAy7iaZB19CdaGJ7mYOMyCrdlWA8LsNIMcFvpZz0jwyQ3gkdaDx5QGAQUr5F5RAIatTpzioZsP1ueYzVh+D11YWYvJG0sEcbbCQHFPE1YvA721OGPD1vy6h5oMhZxPxtOEZu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X0q9sNLd; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X0q9sNLd"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51f3761c96aso236271e87.3
        for <kernel-janitors@vger.kernel.org>; Thu, 02 May 2024 00:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714633714; x=1715238514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GcpO4YIhi4cMr/3aRrZ2Ono6fZHeRtd6mWwLqXNR7eI=;
        b=X0q9sNLdjwTzcKAbqDVccGO00VB2KjvPN/6bo5QeBiA9bScpid2pp+F8xtWTtoM+a5
         IGkCUnfvuxXln6V2reu/jBJWliy/sGDHgAqQF2E/TisJMwqjY1IDhSyY/OWfxvjNWUI7
         HlK+oaOKJqugMrQ6+hdBxV5U3kZd2IT90vwrzERSJcI3R/KLL5vQxd49nEH5+zUZqCgN
         ohaSdCncegxI2hSDABKQbk+25CICMzm3lbOEvQHdvoqzepc9csZ/yRBSkqmnc/k2r48V
         x/n7MLGZMOgz5D+GPc5iiKqbzJVL84Y1pulinTHEW7RYBJGK/Io6p+oDWb5w743ZTVB8
         ScTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714633714; x=1715238514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcpO4YIhi4cMr/3aRrZ2Ono6fZHeRtd6mWwLqXNR7eI=;
        b=VheNJTNZBV2NUVIVOJzX//cb45sCwhIO01DCcK1yYKWuYBBFg+ULS+3HTW/4WHvPIS
         Tki21dqqxUNWwWloeNeEaFi/GXSPMDIOhaOTL/n7GhP9rSdMfA4C8QAb3qOibXAvbHTW
         5Lc+z3pMeWAUqphTVZGmCQYzNmCsQvHZJC3UBgDuGDnI3excLraStKpVFzLad61psP+J
         YOOjaT3rhGvrIOip0XxcZP80fPw1Cc8A/SXnMvP83tdyB284D9y+LGeV0lmjsQ8g0j/G
         kdGZePVURsVcGDSRTPYV20CX71gPdw6zOGv6K18dJNXyxOYTTalRXOllSLeqAU0MwnjV
         vFBA==
X-Forwarded-Encrypted: i=1; AJvYcCUKG567WxQWuan9i/fofi5hL2+FWDoMGLniTUq6H51qKqHpD+riGnu1q6v56rZray4nDnPszvlGb8/5JIzUnA64PoKgp5JbngJJ9kx+pOX4
X-Gm-Message-State: AOJu0YzrApKhmQGNhtD9dOAhfEW8rXtcLCSFeau6hct9tCBbRxtXYgZ/
	HKrcds4oq1R+HUR6VUaGOqgnKBSA9GCKAFvc6iovtcyTPwXl95Hs9Pgp2zLL2wM=
X-Google-Smtp-Source: AGHT+IHfGC5fb5+xzCq7HdQyG0wydAOHQEnT2zQt/yt7dSkvzBCJ4sIL9rZ6EbjnuOTX3Q9XLS3ajw==
X-Received: by 2002:a05:6512:20c2:b0:515:d1a6:1b07 with SMTP id u2-20020a05651220c200b00515d1a61b07mr685682lfr.15.1714633714220;
        Thu, 02 May 2024 00:08:34 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id b26-20020a056512025a00b0051f026412b5sm66082lfo.141.2024.05.02.00.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 00:08:33 -0700 (PDT)
Date: Thu, 2 May 2024 10:08:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] spmi: pmic-arb: Fix of_irq_get_byname() error checking
Message-ID: <dba8658a-f13f-4fde-b610-57a391b0a1c2@moroto.mountain>
References: <53c31752-c8a2-4098-837e-2f84f03c8748@moroto.mountain>
 <0d26a80d9b595954aabd8f6c6e18c710.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d26a80d9b595954aabd8f6c6e18c710.sboyd@kernel.org>

On Wed, May 01, 2024 at 05:55:03PM -0700, Stephen Boyd wrote:
> Quoting Dan Carpenter (2024-04-24 04:42:46)
> > There are two bugs in this code:
> > 1)  The "irq" variable needs to be signed for the error handling to
> >     work.
> > 2) The of_irq_get_byname() also returns zero on error so change the
> >    comparison from < 0 to <= 0.
> > 
> > Fixes: 932282f154ac ("spmi: pmic-arb: Register controller for bus instead of arbiter")
> 
> Sadly this isn't stable because I just send patches over email.
> 

If you're going to send these as email then you should fold it into the
original commit or otherwise people will be confused.

> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> 
> Applied to spmi-next

Thanks!

regards,
dan carpenter

