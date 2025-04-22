Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFB41F130A
	for <kernel-janitors@vger.kernel.org>; Tue, 22 Apr 2025 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745318686; cv=none; b=Nf2bud6mNHybmD9haDa/j0ZjNfrPQGuNIskTjtDqBUveX41e1xdMWW15CGSrcY3RYqcYwjcJzTjUoU6V4P0knGhkVi2yLPE3TndQiExx1X8dX6gmRR7L2ElwOUdJy09ytHJI2wy8p4mop9DiQ5+FGYkLQbyWEwJd7fAY115VT6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745318686; c=relaxed/simple;
	bh=jaIK3y9skttjOZKNe7Pdvk/sD+BmWmSRwYZmKO1UDRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drwLUnSMDcWsAhBDfb695URkoMlqeAJVdgshbNFMqaTiCjbpbUYIgWz0pk52DNp6MoxktC8ByzbipeIknVzpkt0sJavJZVW+AQhGXcm8VXvW9yV0ufjm+09J6FhdSFlvLB4AGlU2IlykzzgKyBIvy3XMmjV4PJ8l/l+Fu5iFync=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=arkE2kQy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="arkE2kQy"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf257158fso33030455e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Apr 2025 03:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745318683; x=1745923483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E2ZlSb8C4TopIE9lOnaluqGxSWa7ZTy/niRKFxlJXsg=;
        b=arkE2kQyThHt6WlohJEBhCB+n9V6jgMfdVhAL0onHrxt8jDojvTT72F8LICuqzKnxy
         PrAmNgkUH4RjEQyPcgntght4KJJKzxOGBQTgY6bCDcVSnZndZ0O5kwEpAgY1ufMAcvwi
         iVqFim2NvgAICptpF1nU+WJDPIWHyHPTjK5dQzSeLrZotitKcSc2xsKZtMgmKJp6wMqo
         BtxUZIROgAA+TQAz7q4Tfd7wiRjsTMxhqd6Dfomp/bP3z6Pb8ULex1Es3XfpgzeW8ETi
         pncbEMQFyjRNyjik7akh3J7p2G41smDEAZvIA7JimPSQfSr5cP4O7KcG6xhWulVriLH6
         vyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745318683; x=1745923483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2ZlSb8C4TopIE9lOnaluqGxSWa7ZTy/niRKFxlJXsg=;
        b=ieVtoSiT/MtMSmniYEIhWqzE0R7Xp+R1bNTAcvVHMpaIYKnF+oVcEoxlwqcsCenqK9
         JFzyzdFTnRlYqzUqROcm7GIlQH6vzH72naZpsBLudarhiMcy7qKegVx8QzrND8duhwC7
         Gua6Yw/gcPn2AiVSsMibe45skZrG9t5tw5cwLPXHpxbvmyN4fxqzm+/iCUifNWDMlJSM
         gm+VQdLDbdU3+Ty34Gh9nI0w4lk1ckG0is94UMTYKG/lPhNMPf13C/XTcTdHR7qrn+58
         sb1+1a9rse/fpSGpu4HHxgxP+aHL3atsyHK6XwnDiQoJltHyX3Kl0bxTyBXqzAS61nF/
         rk9A==
X-Forwarded-Encrypted: i=1; AJvYcCVgKUodkITP/Xl4uxHx3QOT0L8we007ATfhRp13Taort08wRxsIprR1dgmrw50d8G8STiXYwdS8XaWpvEROpJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4t5HoBXgjjZsngS49pJM/TOI7d3y6HU6jEXkJYMxZBURYOqmH
	1XJCp/smnLzij8uRDLe3MEZrOuy1SedU2O4KSPScpslrJS+Z271QqWx36r6xH80=
X-Gm-Gg: ASbGnctMJ/ikUgTINnZDAhNiFlALmDvnQ21eW4RuCKIEsp7UQFZN8bsBUs+of3HdyzT
	Wp751IkUQFgjHmqMGr0qwHZm6cBS3FouEqUzPHIFf1TPM7xl9GelCt3mRoVdFQOp8ahofQaQ5pT
	X117q2uvhpBzuohY3wjlI2l3cLGBmTuNpV2HKhH4Fk6+lMs7z075gKQI+mHYWXtrDwt0j/m67YN
	LggykmaFSqUEteSdNn8fpowuK8CXPo9nMUPmRVDEO+9ARNTfe3q10NRinZZ+0OwbxuksLm6wrBN
	YGwWNve7bT1O7lKN/gFOAq7tnhxUr4S5IcFkzRJ4ov9Yls3/jnt+cje5
X-Google-Smtp-Source: AGHT+IGmQB87kk25ssevPLdZ7b8PjzlRTbK4qnCrbpA2fIVwAWfGo22Ft+WhXErpVr6BVQJ+4nZjZg==
X-Received: by 2002:a05:600c:5395:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-4406ab96f63mr141741765e9.12.1745318683311;
        Tue, 22 Apr 2025 03:44:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5d712esm166577665e9.36.2025.04.22.03.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:44:42 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:44:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: sj@kernel.org, akpm@linux-foundation.org, damon@lists.linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mm/damon/sysfs-schemes: using kmalloc_array() and
 size_add()
Message-ID: <adbc06d8-1a6c-4279-9596-d743505d64dd@stanley.mountain>
References: <20250421062423.740605-1-suhui@nfschina.com>
 <2713f419-760b-4ccc-aeed-de9c4c899506@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2713f419-760b-4ccc-aeed-de9c4c899506@stanley.mountain>

On Tue, Apr 22, 2025 at 01:38:05PM +0300, Dan Carpenter wrote:
> On Mon, Apr 21, 2025 at 02:24:24PM +0800, Su Hui wrote:
> > It's safer to using kmalloc_array() and size_add() because it can
> > prevent possible overflow problem.
> > 
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> > ---
> >  mm/damon/sysfs-schemes.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/damon/sysfs-schemes.c b/mm/damon/sysfs-schemes.c
> > index 23b562df0839..79220aba436f 100644
> > --- a/mm/damon/sysfs-schemes.c
> > +++ b/mm/damon/sysfs-schemes.c
> > @@ -465,7 +465,8 @@ static ssize_t memcg_path_store(struct kobject *kobj,
> >  {
> >  	struct damon_sysfs_scheme_filter *filter = container_of(kobj,
> >  			struct damon_sysfs_scheme_filter, kobj);
> > -	char *path = kmalloc(sizeof(*path) * (count + 1), GFP_KERNEL);
> > +	char *path = kmalloc_array(size_add(count, 1), sizeof(*path),
> > +				   GFP_KERNEL);
> 
> Count is clamped in rw_verify_area().
> 
> Smatch does a kind of ugly hack to handle rw_verify_area() which is that
> it says neither the count nor the pos can be more than 1G.  And obviously
> files which are larger than 2GB exist but pretending they don't silences
> all these integer overflow warnings.
> 

Actually rw_verify_area() ensures that "pos + count" can't overflow.  But
here we are multiplying.  Fortunately, we are multiplying by 1 so that's
safe and also count can't be larger than PAGE_SIZE here which is safe as
well.

regards,
dan carpenter

