Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570D022CBC0
	for <kernel-janitors@vger.kernel.org>; Mon, 15 Dec 2025 08:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765787626; cv=none; b=fp08/e7srXjZDB4UTfo/w0XLQAoCrmmbugSDaOGbJjxUaCwW0VXwUNN9bs9C08gCjkPgM4RH1JhNOCZK5hsaO64Aw34W/CzzhGsvvSAWqp2sXaa1E32vPZYNPpCLTmaaNGuSpEJafmCgVnbjtOURudE33regKoIH9JMezB6yJXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765787626; c=relaxed/simple;
	bh=re/J2u5kW+iYFobhHys3ZYJFb/BDqlJM/16+S9FipJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbZW4ducGgJTsUzwfooXuYNQw6aWRCxzYAYH4ZBQwZ5DKZSdyRyOqYa94al3uAzW++YBB83QBttPgpmAtDVpKnH/9ntoboNelAoK3Thr5EuJKQ8mOI1aWoZzQSiHUVZpnNw2cbwrF5nwhs3nleuKTTuFnvtBC+zlNDHDn07Jrkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LAIm4Ueq; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LAIm4Ueq"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so1899557f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Dec 2025 00:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765787623; x=1766392423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KqNsmeS8+YWAkdie5NFeKUkBgtpn0Yqa9GJN2uw9A6I=;
        b=LAIm4Ueq+MKrowywXebssjCj7deHMn3nRJ92DQK6X3lCORRWeQy2sn67/kpP6AugwW
         NUiJ1H2VXdbSIV6RnlKwMpxcR/ZcRdy52N8PiCE8s6LiUOplyMEsmSZLB36rbyV8NKSd
         RdDzQbrM0gX20FJL7WIeh6TbcFVWKwom3c/BzFcHzdsiTdikAGwyqVMGUm6qp1Y44JL3
         EFNKio42bb6cAS6DHgPfhyF9gMtXvBzwfrYIOC4ApJxT0oT/ls0jc5ykQbDu/wwQK8SX
         vXC3OcBZlQuXLWmuNxFGIJeZ2UMvItYHIbS/rzREDbvpfmhykEGHj2t4t375ddQo6LvI
         sdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765787623; x=1766392423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqNsmeS8+YWAkdie5NFeKUkBgtpn0Yqa9GJN2uw9A6I=;
        b=X5CmrfXfNrO2uk7LdFEcOBbjY4LoDDWe2SBtUi3pcOJ/qIpvb/qP1nQSE9C2zpwFtA
         Y8grr3OuJZam2oyOx2AFtzU5rcFwu/AflsRR7d8BV1CnCWkUh4/zYhvE+WUdhBNcJbMK
         BMSk2iudC8E4ZBNQUq9xSwF6pZXWvnfFDCeDiL+cwr88rK1RPa/USOzg3Z5y5f4YTZPX
         NwZfaonv9hBGdAwGDsFIi1QnA+2iQzHNS4Ts17zSPcmdT7rzuVolwD3O5AjXJ0PwCPtm
         h2mHOajmZ9Y0k4yn+gdVQSoQl1+tMOXP8rQ6ZXJcBkdCo8nlAGVfVXCA0WhNtwAn0M9k
         IIsg==
X-Forwarded-Encrypted: i=1; AJvYcCW2io1Qtquo8iGN/pekVmOKO2cnXYHchd6nHHnpGLK5Aw/K2uMzxQCFSnRODpJcoYHS20Iw2F6boTgOxRrA5FE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFNFvz5vA4TUu+LltA8fNlQ474OQwocjTyHEFuB8uHo1XbdzEQ
	dnOSOVqtmwDSLLEyDwVhNzRJTgYw59mvr1+qByw/0luMmQvXKcboV2JFKra++xBSh7M=
X-Gm-Gg: AY/fxX6VgHxhVqN0NjShr1vLODtxRbbAZrpPWfJL8pqntGqR56W0AV3mUZTaQhmRv6/
	9ilBfkHO35+oa6T9Uh5r5Zg9Yk3MO3ws94H2U8FpwREF4Q7iRxS+DDjIg8ggio9fMAS5TVesBzq
	FQSoozyC9wnD0a3/y2F1pB3u3h4WblaSCErL5WaPNde6J6bjqiX94lcHkuanyAd5JUjV6tEPYhd
	DqQtsyE1Vd7Qe/gGsacuTSuZT7XRpUFPm5RwjqyZvhMGmVJ+I7M2o4B84GZc4DpGEDVnm855j7C
	/zP1n6f64hq/vF6ldx5SwZz3wVeUUdiLzwkQLgcFNhYIIYvEgufRaOko0haVh916runJnxtT8EQ
	gJ4W/ASRsLM+uvBGqnZQSrpAESBOsbZYMvtw/bQjTDFJ/JgKvDkRU/rwldBwlpVl6eYAABEOttV
	CWa35snjt5SZci7ez6
X-Google-Smtp-Source: AGHT+IG4+XfIn0mjObpdlgl5MILZfrqvfE1FP5G+Qu4VQUIjo1Xf6YK5qSrSpnlntD5Ncnv7tT4dGQ==
X-Received: by 2002:a5d:6ac6:0:b0:42f:bbc6:edc1 with SMTP id ffacd0b85a97d-42fbbc6eeeamr5907976f8f.1.1765787622553;
        Mon, 15 Dec 2025 00:33:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fb0fc8d5fsm20370114f8f.2.2025.12.15.00.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:33:42 -0800 (PST)
Date: Mon, 15 Dec 2025 11:33:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: Amit Daniel Kachhap <amit.kachhap@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] thermal/cpufreq: increment i in
 cpufreq_get_requested_power()
Message-ID: <aT_H4m28SuAwuQzp@stanley.mountain>
References: <a7c1fe73-b40e-437c-8ccb-7b3baad04df7@moroto.mountain>
 <67159a18-3923-4345-bff8-ade49cc769ba@arm.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67159a18-3923-4345-bff8-ade49cc769ba@arm.com>

On Mon, May 06, 2024 at 10:41:52AM +0100, Lukasz Luba wrote:
> Hi Dan,
> 
> On 5/4/24 12:25, Dan Carpenter wrote:
> > We accidentally deleted the "i++" as part of a cleanup.  Restore it.
> > 
> > Fixes: 3f7ced7ac9af ("drivers/thermal/cpufreq_cooling : Refactor thermal_power_cpu_get_power tracing")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > This is based on static analysis and not tested.
> 
> Thank you for the patch. I have analyzed the code and why it
> haven't trigger an issue when I was testing it.
> 
> I looks like the function get_load() which is called above that 'i++'
> and takes the 'i' as the last argument is compiled in 2 versions:
> 1. for SMP system and the last argument 'cpu_idx' is ignored
> 2. for !SMP where we use the last argument 'cpu_idx' which is 'i'
> value. Although, for !SMP system we only have 1 cpu, thus the
> initialized 'int i = 0' at the beginning of that
> cpufreq_get_requested_power() is used correctly.
> The loop for !SMP goes only once.
> 
> > 
> >   drivers/thermal/cpufreq_cooling.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
> > index 280071be30b1..a074192896de 100644
> > --- a/drivers/thermal/cpufreq_cooling.c
> > +++ b/drivers/thermal/cpufreq_cooling.c
> > @@ -249,6 +249,7 @@ static int cpufreq_get_requested_power(struct thermal_cooling_device *cdev,
> >   			load = 0;
> >   		total_load += load;
> > +		i++;
> >   	}
> >   	cpufreq_cdev->last_load = total_load;
> 
> Would you agree that I will keep you as 'Reported-by' and send a
> separate patch to change that !SMP code completely in that
> get_load() function and get rid of the 'cpu_idx' argument?

Yes, please.

> Or I'm happy that you can develop such code and I can review it.
> It's up to you.

Happy to just get a Reported-by tag.

regards,
dan carpenter

