Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D203C872A
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Jun 2026 08:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201828; cv=none; b=YUqhz5XtdV/enrqp1/jtSgjCNpdV0047V39fDRIzjGdTo2LegSwnzv1RALXlvJ4VCuroENGDfgOvnID7lIQ8l0Up9jOWh+NdWzAPRThylu+BEWWN7lzwvX38O2SsIck/UcYRqyfnJEnKosEFBBJx+TQ5xTfD2ieZ/V+NB4eVWY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201828; c=relaxed/simple;
	bh=9/9WurOzF9dwMznlkRpWinreZjoxe94EtrhFlkOjeOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=urHrZUtqrrqqdCcnTrjO8JXpS7vLjQxHw15FdJV9GfRA3anYYm6ygTY9wUY3lZMiLV1ESkU8eRyC2V6n6HSWoSOyizEKlNqB86XAM9pkFWjjhVH/3XMUpZjmwNxIeuy6wxBeRYYq/IMuPB7gfpQ107J4OA0Jm0sQSsHnx6z9rr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9638f7e9896so457800241.1
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Jun 2026 01:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782201826; x=1782806626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6Wevye877SnOLln/AlwHOkqlk8j8CTpCElmFHp1hxM=;
        b=Qg+S8cuaTyuV++RE+pkfQARJdxi5SKHt9fXbOWb9/3Tc05OLzygNBHJyPsuwhlZNGm
         Zc2K+sLaG4CSmRcfg+XiB6rurU8fx+f4jv3XOEkUNQGTm6HZ/GoZaSsExbjECd80hGZz
         5zhZ2MsGm4U3wVWtaoqT5WdxkPNeZFgNVHLp4uJLIQwk6F8wXpRqiKRbbJXqjbxwxwH1
         W7RwHtDeSBViCKrwACCQqkvMSOW57T8r0j0Lhjnq02lzu3jOodRwQsa92As0g1BFJ1fG
         Q1XPRVnWe5iRs05XOkqjDU8X/LoLhdw/Rgz/4wgKp1keW21SYInc9mTqjwplBVV6kWqQ
         0rJA==
X-Forwarded-Encrypted: i=1; AFNElJ/2XrGh5tORa0I8pAzw9rXjhhBK4cM3QnGWXpQnRGJpP2aFgCiZJFcENCACuSje8Yf8mcW7eTKsH8sOASmhH4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK4sXEt5xrRTs1xnX/sGab3eqVLspCpTbN9H5MuiRG3aPmvFuj
	GjU/tX8hyd0NBVmNHdNl11YnVa7bSJp7KA0LdC0pfkUhMrQTY72TG5cLxecWqlq/kM8=
X-Gm-Gg: AfdE7cm4Jx7pGAz9T/CRrf5RHFkcc6KQwfos/i9+LCH6rJMrTLxu9doCeGfC379p4jd
	J3p4ZjLaBWurQUdRqC9tLAUNv1a8uPmvuyDkXkVxBh+KAnSHyvxyQ6MFdASP9SVRyWTvWdVS60T
	V1qCmu3TlG7dWdBlBEHwpCRY6tr/bXSCJlQzBsbnKa8LjtjnghKkR9IugNznjjKkOWmE+xaStqH
	pf0FmOM5DSJL/4D9OX6YKjLibydH/dP7OO38zM7OZbvV+I+OFpfEvnxrg9oNU96EQS9Tjzoqb/L
	rEO0hJ+h70nfBP4EojP0DvT2Mrh0hdilAQ6EJdaVhxYgy3fuRW+egf58NmnzESjXPwKgQou9cqu
	ht6JLlzkneP6mX8LdrCzhZvpRrhASs6bc/b6QEps0vP00DI/sV+B8vzP6uOXfK369/9FRAhhjQe
	Ye76k6InrI0vA04NJuHimf3Awt2VU07mrAOx2xmz+3pQW8RyrWMA==
X-Received: by 2002:a05:6102:3713:b0:650:94b2:b214 with SMTP id ada2fe7eead31-72f847f525amr1108372137.12.1782201826307;
        Tue, 23 Jun 2026 01:03:46 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72b9f7b1e4esm7858023137.0.2026.06.23.01.03.45
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 01:03:45 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9638f7e9896so457791241.1
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Jun 2026 01:03:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/dA27s4wswLjq2hbQx3c5WFbcvM4K69mK1wUgoQNrakA8Hc+BiZeQCmMWP6uTBIqefDfVSKVHGgR23E/+ka78=@vger.kernel.org
X-Received: by 2002:a67:f993:0:b0:6cd:23a8:3a31 with SMTP id
 ada2fe7eead31-72f83501311mr955964137.1.1782201825012; Tue, 23 Jun 2026
 01:03:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ajo6iQ3VWvcxedA9@stanley.mountain>
In-Reply-To: <ajo6iQ3VWvcxedA9@stanley.mountain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Jun 2026 10:03:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXkXCj7ijeQmOkK7OQSAGkYgBZJyMJoEV4i_XhamwDSQ@mail.gmail.com>
X-Gm-Features: AVVi8CdbyX-JVUOWc5no0UNDnFuGEWPAevzQbiu2OWUTSFIMBurTqmBhzrOsCSk
Message-ID: <CAMuHMdUXkXCj7ijeQmOkK7OQSAGkYgBZJyMJoEV4i_XhamwDSQ@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/rcar: add error checking in probe()
To: Dan Carpenter <error27@gmail.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

Thanks for your patch!

On Tue, 23 Jun 2026 at 09:49, Dan Carpenter <error27@gmail.com> wrote:
> The thermal_zone_device_register_with_trips() can fail for a number of
> reasons, including allocation failures.  Check for error pointers to
> avoid an error pointer dereference.
>
> Fixes: 9d617949d490 ("thermal/drivers/renesas: Group all renesas thermal drivers together")

This is not the commit you are looking for...

Fixes: bbcf90c0646ac797 ("thermal: Explicitly enable non-changing
thermal zone devices")

> Signed-off-by: Dan Carpenter <error27@gmail.com>

> --- a/drivers/thermal/renesas/rcar_thermal.c
> +++ b/drivers/thermal/renesas/rcar_thermal.c
> @@ -492,6 +492,11 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>                                 "rcar_thermal", trips, ARRAY_SIZE(trips), priv,
>                                                 &rcar_thermal_zone_ops, NULL, 0,
>                                                 idle);
> +                       if (IS_ERR(priv->zone)) {
> +                               ret = PTR_ERR(priv->zone);
> +                               priv->zone = NULL;
> +                               goto error_unregister;
> +                       }

This check is already present below (out of context), so it would be good
to avoid duplicating it.

>
>                         ret = thermal_zone_device_enable(priv->zone);
>                         if (ret) {

The issue is that this call was added before the error checking is done.
So this should be moved below instead (to the else branch of the next
chip->use_of_thermal test?).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
