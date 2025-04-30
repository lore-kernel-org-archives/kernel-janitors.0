Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBBC248F53
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 12:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746015510; cv=none; b=tmJLiOOfUGJnstS5YlmNyp08pDV3kG+regDsjO1LwKKkiGwGrazpUvs6OslOZSa16u5Dsju5YRxU3lnNefiqoc8hl9TUfilkqDHugflHlWzSWXrnjxzbbQQIIJTGjV0BYH6C2in1sbCqrVKPBdu8n59HDkLMOoFcYeU7+C+jsbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746015510; c=relaxed/simple;
	bh=jLQ7VSocQYR71p+4p10bsNmcteCmdXgdSrNIPdrCjlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aciooI6ObjfwyxQkiDoRXPvm/G9o2dWQSLsOtVHN4cDBO9Yaqog1rK1osrjyu80q1qpcu6iRXk0xvksltdqMvBVIKQ9JBWB8GJTtX/7hpOzoPybf+VSASCq45oXJHaSEip6rB7WHJygOeIrYWJSW/CvnKli73H5pw66kvR/Skqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=BApprQi7; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="BApprQi7"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4774d68c670so123472371cf.0
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 05:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1746015507; x=1746620307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W+V7cm9jvinYzZ6ye2QtNYnV8/h1lACQcCRpp+snmxs=;
        b=BApprQi7IoHjfzY16R72gtdF43hbuQnsMLp3Qi+93iGBpfA8SatViUBBG0y39LiF2v
         dbJSzUWB0ZjSv/z0WSmu5I98Kc621IYD45FoKZ7KzqNaNwoWmw8uEy189ER/zxYnnX5f
         QqyNKcIAVUhwVSBPw94/pTN5STnY0NcI+yVBA0dKctBJJct8wyDjDplEHucsm5Z7x56d
         WIAwwyJbkDqIQugzkMMLvUJxVhBxHGoPUitEgbL60l9dbSfSKzMquPeM4/tyCFLMH7+Q
         xH+FJk5bzSdrd+TKAdXqFJbduN2vIJHLafOiaqpuBtVtUO2LuVZm43qJ0M0mZsd+1Q+Y
         ObxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746015507; x=1746620307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+V7cm9jvinYzZ6ye2QtNYnV8/h1lACQcCRpp+snmxs=;
        b=Az2tridkqtZ7J9wLZRkQQGJOgtjyC3SXFIpQ0nixbPWjnHEoct4qg/kyEOl3TwhSHr
         73uptD7ZqbY8FMitexh91UNDwX4hKW1fKrk5VzQSXm/kgzYoCH2FLPmkxn9zgn5rZlIp
         qj9Eu/BsvbyIVBrwQbVSRzthIjthnhaQ+a/7oNFOMPcy1rAP0o0tm+JIdDau4N+buENY
         rY6KTns/+ji9WXPkuBo2GBMm4bbvL25o/0WglHEGEz89VsKVsA+siQzuZJnZ2SA+G2Cq
         KWOpoBoPmc1uU34RM5pL5QLaa5QMIqckzBtNS/Mi/ZeVjMCe64qPM4vjinulv3wHK3S+
         fdPg==
X-Forwarded-Encrypted: i=1; AJvYcCXxKwZOKURGZ7QrJXV9MjrYQ8Z6mLahxSGws9voG1eAF4OlIu9JqvqjRZxq/mPHQ069uAU1hhv9Rlc7JAX9Nu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQv5LN2VjlBp/BBNpflSntopppStgwIEFPJjG9VCvacueIVR0D
	X6zmAL7+c/GMdYj0/LCKWAHjuh6GsdriHhGTQVnDpU3j5RYzj4jG8IcUXDoPUGQ5zg8cy8KaUXJ
	E
X-Gm-Gg: ASbGncuglRA8En16Bq90zmarGwJOcxtBcosFBkXnD4OyeMhPYeo9wt8CdzafCTNtl+h
	xjL4mmDzAGP3GZauRP2v2cVWZPf7IaTlVfYzInfo0/EIY7/SSjUsKpk5ODA7cXJESuKdwblkEMJ
	JdsnldIPzEM1PdllI1ypW4QzDe27K6Mj83+2pRqIzWBivGqcJWdLg3NeZEZB6PaipmldnBI2SXN
	krSPE9g3E1M+aLVHbb2yXVcCbJIMvUXLP/6FCS5LSX0XOD8gJt3zLbkQVwG+DmCwDASBGbjom2G
	HnXiZy/pU0Ze6Gs/rkuA8z5BoYO+LVam7m0T4Fsqb092Jolz+13TS8m23WR/2jC2a3iRNm61egL
	h63kVrjok4EwzxBXF9TE=
X-Google-Smtp-Source: AGHT+IELliOgWL1VLuF3keZ0L9C0SuC6eT6G/zrGEIVhFJleyHOjZQlXG23pL+OAV2vZNQZVoxOzXg==
X-Received: by 2002:a05:6214:40a:b0:6e8:f17e:e00d with SMTP id 6a1803df08f44-6f4fe057ae1mr42658596d6.14.1746015507283;
        Wed, 30 Apr 2025 05:18:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4fe70a07esm7585906d6.57.2025.04.30.05.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:18:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uA6OQ-0000000BFaw-0xHr;
	Wed, 30 Apr 2025 09:18:26 -0300
Date: Wed, 30 Apr 2025 09:18:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	linux-integrity@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next][V4] tpm: remove kmalloc failure error message
Message-ID: <20250430121826.GE2260621@ziepe.ca>
References: <20250430083435.860146-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430083435.860146-1-colin.i.king@gmail.com>

On Wed, Apr 30, 2025 at 09:34:35AM +0100, Colin Ian King wrote:
> The kmalloc failure message is just noise. Remove it and
> replace -EFAULT with -ENOMEM as standard for out of memory
> allocation error returns.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
> V1: remove trailing space after \n
> V2: remove entire message, originally just removed a trailing space
> V3: replace -EFAULT with -ENOMEM
> V4: send correct fix for V3, actually return -ENOMEM
> ---
> 
>  drivers/char/tpm/eventlog/tpm1.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
