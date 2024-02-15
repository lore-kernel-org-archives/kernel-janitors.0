Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB587129A81
	for <kernel-janitors@vger.kernel.org>; Thu, 15 Feb 2024 10:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707994368; cv=none; b=IO0VOr2qQlElF+50Nrgi1chyWuBsckXVdz1Nl1ZEy7xCD3ncJd0zjT0kDZHGcM56njKC4YEgrKxh3f8FZd4XREBpk+VcR0O8uHaSHjPLPgT1YEjaW8iwYQJAVuiXMrQGS0+JClm0A0zWx2djKK6x30sni/mj3h9dE9Lh6hHdfpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707994368; c=relaxed/simple;
	bh=DrS69cbqai6YRkZOkha+qInzsRn3vy2Nx9Kf8zL2FDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2AX9QcSWdU3R9dN5kEqmH+25qazJ9E1czaH6yXWYIcMDGydmeiHsr7CMkbRBBLZqoI+vODrfKrqFxyOy2tbU94incAA6hinwBDXyImTDj7BOZEZ20p/yiNWd5PRiqXs8T8hHyq2dfi4DBcy0UobVwkXwYruT84dBg7yfUL87ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=oz1Vt0o5; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="oz1Vt0o5"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso683023276.2
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Feb 2024 02:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1707994364; x=1708599164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XVJlypdB8EeG025OlVruBqkZML3RozZ3SqRoFlfo3os=;
        b=oz1Vt0o5HgvOetZMbPmc1EmSDgi6OMeTrk/C5F/cq05VC1vSRghiGrO4TzcjMw12Kt
         whmoIrF5g3WSjer4qLS5Yt/XCJL+Nvuo2Ue/6r/tJfsJCgNw7ZTYHC3aT3weiq8DMi6T
         ep7byMx25T9VxXopNCrGp9uBaZt9ad6BjHulrOdfGM3tlz5JBEDZcHnXbBzxE35q5ri2
         ClqqEHSG03dmfG89r02sHdpsCQYTWBlDKWWXjpM+Wv6No/4cVe218D7J+rk4M6FQjuv8
         N2ZV5cQYGXE4BZDtMEIL7+N1G9n6Klb/Z3acjyBsOFzbPiJjKeQ68yxwmSFi4de0GvvH
         ubcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707994364; x=1708599164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVJlypdB8EeG025OlVruBqkZML3RozZ3SqRoFlfo3os=;
        b=TfL25yzvinEJG8jLiv/aVjqIyyjB9cBSmZmaaL85FYd2LtqoRM+NcNMgNHjKmb/pHt
         lSfaIyVkn0ye4YSQRg4JQkQu53T0I5mv6m6W7vHaQe55zK57yjQVAkfEyio8Wm0GYVzk
         LTNJskGjDvgiTF24iocit4HAeowupVSEwrAxlwMdBc3/Y9aREPbKRDRZUy6L0saxF2kv
         AgcfsLWxvWMxELUxRwRextLqf1b0tfbLBH+6yv/Ed/c0gLyyPwJhyXGhfzGcBaV8X99J
         B+o0C+mQtmw8FvltuZRAB11ogz3xq3S0rqY2nRvLVkDn/NWmfQrwXJnrzuINmh138LvW
         F+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWyByzWEfeMvHPqKbX+70baQ9VCyo1nUq/ZRiXp2+ENI6Nm7DSNob1aZwbbtqffpMO8Bp9efo5Ev38cTq60fsHNwK1LZITIlGYVWl5uMrOk
X-Gm-Message-State: AOJu0YxNqOnX/4t4oa7uZwsTz/ALL3a/fwlPJ07UrO4/Uq/MvIIgO3Za
	8//FwIjGNmDDIDsDxvF4rLptnGWuPrUb1s6AyPYbF/JQIZR3S0r6grhpx/zgMys=
X-Google-Smtp-Source: AGHT+IGKdFSiqy84NLrVA30/4Kts6hwSkrE6XMGw/mKt98wEEGkyKykv5EX2wDueJiJJVPejLrF0lw==
X-Received: by 2002:a25:a049:0:b0:dcc:ae3:d8a0 with SMTP id x67-20020a25a049000000b00dcc0ae3d8a0mr1020389ybh.48.1707994364556;
        Thu, 15 Feb 2024 02:52:44 -0800 (PST)
Received: from localhost ([2620:10d:c091:400::5:4922])
        by smtp.gmail.com with ESMTPSA id bk30-20020a05620a1a1e00b00785d7f634bcsm502508qkb.8.2024.02.15.02.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 02:52:43 -0800 (PST)
Date: Thu, 15 Feb 2024 05:52:42 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeelb@google.com>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mm: Fix spelling mistake "commdandline" ->
 "commandline"
Message-ID: <20240215105242.GA1282507@cmpxchg.org>
References: <20240215090544.1649201-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215090544.1649201-1-colin.i.king@gmail.com>

On Thu, Feb 15, 2024 at 09:05:44AM +0000, Colin Ian King wrote:
> There is a spelling mistake in a pr_warn_once message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  mm/memcontrol.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 94d1b278c458..95c3fccb321b 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -8014,7 +8014,7 @@ static int __init setup_swap_account(char *s)
>  	bool res;
>  
>  	if (!kstrtobool(s, &res) && !res)
> -		pr_warn_once("The swapaccount=0 commdandline option is deprecated "
> +		pr_warn_once("The swapaccount=0 commandline option is deprecated "

Quality workmanship.

Thanks Colin ;)
