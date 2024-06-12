Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E6116F0C6
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 11:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718191804; cv=none; b=hr92u69kIQGDbPYKTm/OavOO2QRhnfYZ0jxcMJqKAw/4WMzv3MWdZxZJJndtfcfrTLBPRm+OkTuQLASv0VeTVZe3VLkjlHwYuR0yFzqD0r+xoFJMT9hVC8h9yOsHy/6Z/PdcGn2Qu4RxQ8gXl5L7YUIFH3pIz+7GphwFHOpuKXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718191804; c=relaxed/simple;
	bh=gNuCvJHiPsplupaqqLmNzsGe//s26kGlbP+C9lEfkzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEuAslntOSotydBQkohw3ZFZ/G5OUuyo2s6zE4Tna+QmtEzorpZMy6SDyRNk5BYRoYzYvkpkBxNmdCseDD+xFpcwUacuY84kyB6env6nwfvJd38VdI2FJNjhL4I3OW427UCYHPkMTfeoscLdbDb4VXHtLdvl+NWnyVNnY3TM5OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Kux3XY7j; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Kux3XY7j"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52bc0a9cea4so751364e87.0
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 04:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718191799; x=1718796599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ggc41s1xFDytmiIRx6WqUeauOWT0puNfK03Y/4MiVTg=;
        b=Kux3XY7j05/6HvbROeNPhyXY4/H06xc+HUSF4DHld0L/+2tew7VAEyRQPl+C/ccF4c
         8IkXu8CnHDpRt5jMC1CV/u4AuylY1ogAfSqqvWGhLMpDrMdVfC13vxvlvZtlDYXBhmgS
         jdj66Epgmwz6tTrHz+bslX08iWuPip7McObPFopNtIERsWvG5Xf4lkwgufh87svcQz69
         SQDLQAAx0PShEhHG9HobKzvWRyyLsN1+b01f+gmGvXXV3YZmSlnKkScOmf3Z3p8Wd2VQ
         xwlpHDor7CcqpHW7A29oqUI2zaS9hSmDfOd0OLpC0h70X9weS5HNYFBt59ulmVVs5EvW
         AJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718191799; x=1718796599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ggc41s1xFDytmiIRx6WqUeauOWT0puNfK03Y/4MiVTg=;
        b=Wk46Aoew5pTwZgDGEN3dj48EWZ70SGUPC4pYdwCN6IlmV3T9ofE+cjKTflBn5+b4nx
         3OpaxlYKvSfXQ/kVoKy1UhwFchKbXeQyK2hrXG6oTud85LusAzAIr0g6x9mEKS4SMroe
         Eq4WFkPfR9UqKXjEg4CzCRN34P35ArJFgooRMJk917cLAaucSenBQTkgtXuHxAQHkw0X
         PJw9k/XFDbCUBqmW8O3q5Tco8OtRZiqnQHbP5chyx9gEZIAS91+Mgj96d1r9cAKKznds
         uqljyGt/PbNH2HWEqYYrwvd7oRp/pygLQoB/f9+42TUmTOZfyWZf47cGP4mxhIrfqzye
         riLg==
X-Forwarded-Encrypted: i=1; AJvYcCVTOTVJW/5g/wH8wXbb0C0cfeV6DhR46T1PXuxUeWFHSCQXuDdC3T7OAtqh/Cckyc2K54KB7zo0bMhL5CynDJRxW2bR1K/Yj7LTYDGniCcb
X-Gm-Message-State: AOJu0YwNhhfIOtMFZTbQqJL6WRQDe7p+kEHE7fpMitg4MDe0hvenyWZE
	QZ7pfszzsqBnwcnGtQ8DbHQy5QcqTjzzpg9XHSRynVxIx3aEItP1vION7Y2peng=
X-Google-Smtp-Source: AGHT+IEb+HkuGtmX+A7+HewHkLMtey9b0gN6G8NRsTakT+eTQXDShYDGHEl0gd3bXYFniSe1ZalEdw==
X-Received: by 2002:a05:6512:1c8:b0:52c:8355:422a with SMTP id 2adb3069b0e04-52c9214fc32mr1600954e87.9.1718191799330;
        Wed, 12 Jun 2024 04:29:59 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c9a100278sm181968e87.22.2024.06.12.04.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 04:29:59 -0700 (PDT)
Date: Wed, 12 Jun 2024 13:29:56 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] vsprintf: add missing MODULE_DESCRIPTION() macro
Message-ID: <ZmmGtJLKdQAHhDOW@pathway.suse.cz>
References: <20240531-md-vsprintf-v1-1-d8bc7e21539a@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531-md-vsprintf-v1-1-d8bc7e21539a@quicinc.com>

On Fri 2024-05-31 19:42:25, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_printf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_scanf.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
