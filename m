Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912413DBBB
	for <kernel-janitors@vger.kernel.org>; Sun, 11 Feb 2024 18:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707677712; cv=none; b=YGIVQAaGJz+Stv+NgG6V1Gct7pN0WPGdLF6QuRhOXv8MU+cpVZrDQyKVcvlpgXEkMtrrwTAkaVKjEOYMkWIlpZPkvGSiLrW452uj7wpgGBAj3HKs3OqMn9pLP7nCKyk9cXC4rCsPPrtOFF0oD/D5cbuHnCOUgOImt9Q1UZxzDqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707677712; c=relaxed/simple;
	bh=zOMiltPoLSaPVXQpX+AyhP1tWAB8q+YFG5onf3ColLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QEFb5k4vQlVIve1NSoo32x7mhoRcAGhiulKuNcp7usgjsIlRY2KLljd3eXR0T2JG1zJUBmT3QAAgpdJ8AWjObI7Nb97dCwmwocFPDLHcAS6XRLsNyEMf60V+ZeRxSeksjXm+FjVARr1h8D0EH5OMAs3MLd5NI5yqXBQ9imrGVC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=redhat.com; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-785d48dc0a3so32052385a.0
        for <kernel-janitors@vger.kernel.org>; Sun, 11 Feb 2024 10:55:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707677708; x=1708282508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYaFnPH4T57xbODxsrD1uA/JRSAy3nBPFfHDTo1ipmE=;
        b=riSpYUIOBBXhxxC5Tz31bkuL7H5kwm3cEFg3d9+YRgz6OEYnNJziGTvvKstQ7laESV
         RKkMZlgrdZDOlP6t+Uww8r8MWPkr7++C5Bq6a40LcPgrWvnTw9/r9iHoFHld2P/HWhY/
         ewCEp3zKSk+Q/8TMiVQK2J2qUyQgV+vKhbucRrFoH021TPxAP4jHw00K+3oOr7qQryyQ
         OoV8dSyyWy5eGO4HGcCxrCNKCJWHxOycXIdn2aUtIJ10zQxkHIi3YugGohQZhSjxNmRq
         k35QSps03dGpv/vEYlYcZIElLKIkQ0bMucg3xiu2sQ8J7NTNaHMgfOjilJinNoYNRPym
         ocVQ==
X-Gm-Message-State: AOJu0YwGk1hO+xpFYwehgd756lUkNPkk2jYqVWVtDfzGK/X50rqlY8dS
	jHF15SXwN30lUoWqdk0KTLLC3ZQhLBRNWXyGaetrhg8iwrNA8wqe5sRBm9DhfQ==
X-Google-Smtp-Source: AGHT+IEpVYQgDizFElfNgxxrxcQYJwrK2TguA2ymoGhXLUMM6BM6g4VnY8a5QEGnidAYziFgxvHqig==
X-Received: by 2002:a0c:dd08:0:b0:68c:48fd:4441 with SMTP id u8-20020a0cdd08000000b0068c48fd4441mr5088279qvk.64.1707677708614;
        Sun, 11 Feb 2024 10:55:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUN17KHbxG10s+yxCtcs3OdW+Xkyi+j12gZmyMIv8GAHSnYGoSY4HE9hwNcdGiorsU8NTu+jVS/XyFjRSfwsSAoH1fHgR3wyBbxKRyqKN35MPBaBUG6gQVbISVPBRikukhUy1XefK4QGMevRepkn0rmKH+phaIL7Sg9NxV67STQkMKJyC0Cckw=
Received: from localhost (pool-68-160-141-91.bstnma.fios.verizon.net. [68.160.141.91])
        by smtp.gmail.com with ESMTPSA id nh6-20020a056214390600b0068c6dd9af10sm2685704qvb.64.2024.02.11.10.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 10:55:08 -0800 (PST)
Date: Sun, 11 Feb 2024 13:55:07 -0500
From: Mike Snitzer <snitzer@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Matthew Sakai <msakai@redhat.com>, dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: dm vdo slab-depot: delete unnecessary check
Message-ID: <ZckYC4wyzbX2870P@redhat.com>
References: <16ffd614-48a9-42b8-961d-2dc8a69c48d6@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16ffd614-48a9-42b8-961d-2dc8a69c48d6@moroto.mountain>

On Fri, Feb 09 2024 at  8:06P -0500,
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> This is a duplicate check so it can't be true.  Delete it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/md/dm-vdo/slab-depot.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/md/dm-vdo/slab-depot.c b/drivers/md/dm-vdo/slab-depot.c
> index 42126bd60242..2f4a2ae5e082 100644
> --- a/drivers/md/dm-vdo/slab-depot.c
> +++ b/drivers/md/dm-vdo/slab-depot.c
> @@ -4100,9 +4100,6 @@ static int allocate_components(struct slab_depot *depot,
>  		};
>  	}
>  
> -	if (result != VDO_SUCCESS)
> -		return result;
> -
>  	slab_count = vdo_compute_slab_count(depot->first_block, depot->last_block,
>  					    depot->slab_size_shift);
>  	if (thread_config->physical_zone_count > slab_count) {
> -- 
> 2.43.0
> 
> 

Looks good, I've picked this up.

Thanks,
Mike
