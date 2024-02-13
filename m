Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68D05FDC0
	for <kernel-janitors@vger.kernel.org>; Tue, 13 Feb 2024 16:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707842779; cv=none; b=PFieGPrex0VXsHDiXErlXSKR0zAqqWhxBOeO2DhWx5aLKoah8OmXN7t7aAZijoRcL/dwOHzsBMNyLYbW2dQkc7GOX9dXGWGO6sCgNBctjd2mW1NoRUuMmUO+q50rWXijKVmr7pJv65oiYKGeUrX+gs1G8s3ufwEuFktduykFwmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707842779; c=relaxed/simple;
	bh=PgjTP+jAldDzZvNkkLw9p9+UZioEknqqlxV4bryGL/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUIyYmpGh1FCgbIqdl9DsFUTY6HhidLuABtuqf6UBao17XMgWqUloteCNC9q2C+52KqHl+kj/FIlY9zThzh6gkcMzzsro+IMUweCJSKSaVtvwlQj9AO6SiDcOkBbwQfDGWJDW3QPsLpI3HlDxzD9LseUxbu0bh72Al0QhK/zOiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hKarg2Za; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hKarg2Za"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-604a1581cffso42767157b3.3
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Feb 2024 08:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707842776; x=1708447576; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l5a68IdhU93s6nayn9QvXY3x6rSta9JyyQ+kVi2H3Fg=;
        b=hKarg2Za9Xp/vp3WsxEfqQX/pnW4lxXKUz35x26tqxB9/SsR32B64WI4YWnWiOZ6hw
         l7ssXWVpplTopji+dyR1QsSsA2+m6t/8Dfu19oJgXRnDobijQkjozwkcpPX1cTBhc/Ov
         d+6033F3XGtT6sBU4+xII1b7C+TwBbFMN2bcUS0gcCql6A1fp7kEB9LXdVBEd6af67aP
         GS6LEoIcFqQRXtkL0JZTnf6in+v/eyP7ccvg7yvMZVKjX2yZEBCAVlSZYqlk1WBLTHZ8
         S0zD7/Wm0hbzHuMM+6bikXX+usTnedygOjxX/vHDohKG/n/hhAWefFqKeL19GQkW1+dd
         yGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707842776; x=1708447576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5a68IdhU93s6nayn9QvXY3x6rSta9JyyQ+kVi2H3Fg=;
        b=TqLgZluDdHLZSJSE8PffYspwbyobSqHOqrY6KXDotlerJYfZIY+VavHmQvjifP7WFO
         OPbKVW20TKDCD56q+dzbw8q74fbftKkvrVicAULJ1kIfooFHmebD6+hOpnxkxhl+3PR3
         VSaChbJpM9LgzU5yYMsFVHehwMp+nlVZxBDPbD/1SRRCfRU6mytW7fG4eO+g9PXa0MSd
         IHYhfzb82L4K3W+l5/nCueIx5hNob1pCKbkNS4PUKxwdOwvo33Wp3CPZczDxI06Kmd5p
         U1cP+0QifVZl0tabhiYR96DtSzn+RJcUnOcWYq0+u2yWZk6EVSvMyPXQ3pMmCc3mFP/b
         MbVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVP0Ff2N0R6zGKZG4IwU4o0jm2YIYWRFQMOpH+qVZ7aRUhAVVvo1C4GbviKI6Yea6cma0u0ZtgDODauw0TgF6UbRaYjMj7oH3FK2MhVq6p
X-Gm-Message-State: AOJu0YxnfxRSZpVKePY+2b2YHPR34zCsv4Pv9wrxThha+tUDWzE1xumM
	CqRDwiDcyVeVXvMumd6rOis8nYTwIprGWbN8bl/O/v3G3sWAngWCYo54w8xsPDBlJ9LtwW6e7Lk
	YE0+nG10g4mq9/kvqAfx4jpz5Dq1cp+J8wGfUvaDbqzIcsJxa
X-Google-Smtp-Source: AGHT+IHOHrn1g2cCcbRnoM3yYKfyAnYdbVkMUROkJT2FJJBuz1aAlLP2tXhLSaLtR3z4eZbcyAeUIZJpDoEUFz2dx9M=
X-Received: by 2002:a81:9245:0:b0:607:87ca:ea8d with SMTP id
 j66-20020a819245000000b0060787caea8dmr1977261ywg.23.1707842776613; Tue, 13
 Feb 2024 08:46:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206171245.2421538-1-colin.i.king@gmail.com>
In-Reply-To: <20240206171245.2421538-1-colin.i.king@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 13 Feb 2024 17:45:41 +0100
Message-ID: <CAPDyKFr8o9n7RAN1HLoQGUg5AHXBR-5Fn1gkEz5tTTULNpv=wA@mail.gmail.com>
Subject: Re: [PATCH][next][V2] mmc: wbsd: remove redundant assignment to
 variable id and id check
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Pierre Ossman <pierre@ossman.eu>, Nathan Chancellor <nathan@kernel.org>, linux-mmc@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Feb 2024 at 18:12, Colin Ian King <colin.i.king@gmail.com> wrote:
>
> The variable id is being initialized with a value that is never
> read, it is being re-assigned later on. The initialization is
> redundant and can be removed.
>
> As noted by Ulf Hansson the unknown hardware check id != 0xFFFF
> is also redundant and can be removed too.
>
> Cleans up clang scan build warning:
> drivers/mmc/host/wbsd.c:1287:4: warning: Value stored to 'id'
> is never read [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

I had a second look and it's not entirely clear what the check  if (id
!= 0xFFFF) is used for. Therefore, I suggest we simply keep that
check, to be safe.

That said, I decided to pick your patch v1 for next, thanks!

Kind regards
Uffe


> ---
> V2: As suggested by Ulf Hansson, also remove the redundant
>     hardware check for id != 0xFFFF.
> ---
>  drivers/mmc/host/wbsd.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/mmc/host/wbsd.c b/drivers/mmc/host/wbsd.c
> index 001a468bc149..4b32421d9f6d 100644
> --- a/drivers/mmc/host/wbsd.c
> +++ b/drivers/mmc/host/wbsd.c
> @@ -1284,8 +1284,6 @@ static int wbsd_scan(struct wbsd_host *host)
>                         continue;
>
>                 for (j = 0; j < ARRAY_SIZE(unlock_codes); j++) {
> -                       id = 0xFFFF;
> -
>                         host->config = config_ports[i];
>                         host->unlock_code = unlock_codes[j];
>
> @@ -1306,11 +1304,6 @@ static int wbsd_scan(struct wbsd_host *host)
>                                         return 0;
>                                 }
>                         }
> -
> -                       if (id != 0xFFFF) {
> -                               DBG("Unknown hardware (id %x) found at %x\n",
> -                                       id, config_ports[i]);
> -                       }
>                 }
>
>                 release_region(config_ports[i], 2);
> --
> 2.39.2
>
