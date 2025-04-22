Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD891E9B39
	for <kernel-janitors@vger.kernel.org>; Tue, 22 Apr 2025 10:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745318293; cv=none; b=AyXIKyJzw+r2CvKwNDQetfV0e8GP4X31Bh1Ba22LY7yI39qAaa+RdCFqz1U8XAambRqj3yqVG5O0nh+VAOC4214Uu8CDtTd/Kr5cvtXiP31FVLRDbIsa1HLEDu47Bb1D5UU5L+uKcJZqq7AUchVSrpmc46FAoh7u/ZN2m8bAo2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745318293; c=relaxed/simple;
	bh=Z6c8uzRwUL9CRemIiGxumCOt8oUxWa50U/RnhdvAm6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUZixHolmUViYOGfaXYBm+zawNWmw1kyx7H8bTOcj6m1oBYTuZbh5L+8HowRmCq64597HihWF0CyDEko+YAzZftQvku2kshMSRsMBb3gXtkUfs9xfl5vEjiidDDjP/hBh86JG8EEKnh7J3o0QSbHO8ksz1AM904pF/44AXFLVeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UYuN729t; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UYuN729t"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c14016868so4911551f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Apr 2025 03:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745318290; x=1745923090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x36ME9YCkgctStKKRl+yxhgMtdLAC+ajKdEDhmCB47Q=;
        b=UYuN729tFlE1b8gcMDPRHDaj6XCStLAeknCXmSw9t2PY2JATnzPR7wgDb/lcx05szA
         gEKhuB/Utg3QLnUrAFNc12rxX40Rk0Peqkn/aButFChd8H27MmOifIWb5OMcX4WbkvyL
         I9VGZyUiVOJM/Vn60QAfhEensSwrU9yF5EGBi3I2b6n8/PcbMDjE+wCboRG07VB2edIW
         1P8NgpH4UolZBqshO8zke2RMZeL8MWDKWQakg19FJjCO9RWl1KcIu2qL8mqIL0aRu20Q
         IbyWkwu5Bk1JSZXwDMyFeLnOONPmFd7D8LoTFGxt1cYaEQAOp3eHQzzmPj4+BfGr1qKP
         U7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745318290; x=1745923090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x36ME9YCkgctStKKRl+yxhgMtdLAC+ajKdEDhmCB47Q=;
        b=Y38orGM/TkSYfj4LEO/78FDqCfAnTiLGSEddTqGlWdS06OvbM1Zwuwd5U6nL8r4Z0r
         UWzmSkNLHUUd39iYyIQeofU5snIc0WeCp1kZ/aeYdSYod4zsRf90+jFKm7VVEUQtKkFO
         /y+p8Jdrh6FVAJ4oiQjoiH4COYFronARCrF9DDw8EMLhHL9qf4TZBLmn+ybtJl+1QJ0v
         jIH4BpWirU5kOGdTFrQEEmwHu3PEiF+w7zq56qG306/iXunEis98TtexwmzInZbATdPN
         H8FcXM01DYcaK5CGBMaarACW/RAJ+yQ3//uCtbMXTL/g8r0m21hR6CIfO4/Eon0tBTan
         7tJA==
X-Forwarded-Encrypted: i=1; AJvYcCUeUHc6JGvwUffZ4XXLDQBp0ugYzO8u7CpEesbQBe/KQiKwy17dR3KFXkEOFwv6u4LhL9r8zYhNFS0/CgAojm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRzPe9ecRJC9azh6HMRei9uPSF0wp41MCBX8GCm7CyPXNepRq+
	nI5cFBETAFbovRy1alHuPX6McCj1xB9I6utL6AekIchA+DJ2V5HD1jCiS14C7EEtGfqGeWrg8F/
	I
X-Gm-Gg: ASbGncscQf6HQeFF/MH7YEkptRWC/1CqAroZOGnmhizwOW0DVZIvIxVeMGTo9B/ZVUT
	Ufmizyb0awL9j0+NqjVXrRm1gA6/yS8FJuBNDSOQjv9rXeRNbjcI5+RgiVXF5x6Wocwlvibd5S4
	WVwWbo0exR0M616nJ7Vk7vN/OAJFpPHm1hSRhjlPRXvVMoRAJomHSJWk6/fwjZZ4joQRW7hXMsQ
	cC1eqgSS/ErhWZ2B8KYbvwbouhki9GcxLsphVaEbhdqxf6SLOs6OINWDibidQX+idQoNZ4PZ+WG
	UFBppPByjER3LljAxaFW1FM9GapZuSvFo0k2sS7AIoB/3w==
X-Google-Smtp-Source: AGHT+IHmdZrRl8dVYpwJVQVgKnWXt370mTD794FHi8G5zh54eb5aEDf4XYuBmeYKL/FdPLvQGd7cdw==
X-Received: by 2002:a5d:64a5:0:b0:391:4914:3c6a with SMTP id ffacd0b85a97d-39efba5c644mr10470205f8f.29.1745318289843;
        Tue, 22 Apr 2025 03:38:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa421c79sm14615464f8f.1.2025.04.22.03.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:38:09 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:38:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: sj@kernel.org, akpm@linux-foundation.org, damon@lists.linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mm/damon/sysfs-schemes: using kmalloc_array() and
 size_add()
Message-ID: <2713f419-760b-4ccc-aeed-de9c4c899506@stanley.mountain>
References: <20250421062423.740605-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421062423.740605-1-suhui@nfschina.com>

On Mon, Apr 21, 2025 at 02:24:24PM +0800, Su Hui wrote:
> It's safer to using kmalloc_array() and size_add() because it can
> prevent possible overflow problem.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  mm/damon/sysfs-schemes.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/damon/sysfs-schemes.c b/mm/damon/sysfs-schemes.c
> index 23b562df0839..79220aba436f 100644
> --- a/mm/damon/sysfs-schemes.c
> +++ b/mm/damon/sysfs-schemes.c
> @@ -465,7 +465,8 @@ static ssize_t memcg_path_store(struct kobject *kobj,
>  {
>  	struct damon_sysfs_scheme_filter *filter = container_of(kobj,
>  			struct damon_sysfs_scheme_filter, kobj);
> -	char *path = kmalloc(sizeof(*path) * (count + 1), GFP_KERNEL);
> +	char *path = kmalloc_array(size_add(count, 1), sizeof(*path),
> +				   GFP_KERNEL);

Count is clamped in rw_verify_area().

Smatch does a kind of ugly hack to handle rw_verify_area() which is that
it says neither the count nor the pos can be more than 1G.  And obviously
files which are larger than 2GB exist but pretending they don't silences
all these integer overflow warnings.

>  
>  	if (!path)
>  		return -ENOMEM;
> @@ -2035,7 +2036,7 @@ static int damon_sysfs_memcg_path_to_id(char *memcg_path, unsigned short *id)
>  	if (!memcg_path)
>  		return -EINVAL;
>  
> -	path = kmalloc(sizeof(*path) * PATH_MAX, GFP_KERNEL);
> +	path = kmalloc_array(PATH_MAX, sizeof(*path), GFP_KERNEL);

If we boost PATH_MAX to that high then we're going to run into
all sorts of other issues first.

regards,
dan carpenter

