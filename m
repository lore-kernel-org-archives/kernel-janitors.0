Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AD828D830
	for <kernel-janitors@vger.kernel.org>; Fri, 26 Sep 2025 12:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758891142; cv=none; b=XICp55Z3AnH615qyfQ+ac1uYn5fKnkn6Tsow4QE7v43K8PZHWdk41EtodXYDb7OOtdEEuUXn0jKkmmpDaGQIVuYoM8A5sIJFwO4QANK4u727PaQS51J8TNw9EJ+GIPV6aSKER8xOIyip3V89NI8vMIZaf3MLv2iH53NNgirZlTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758891142; c=relaxed/simple;
	bh=NrPTGUoLWdQsj2LPuD42yQfi3Grjh00Qivq8Q3RDB2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IjTtuCBThJhLijx4iRzeJWIG7HJOToTFzo8kIGet5moXyyrSfSKaPTxwHKsoimED/JESphPPvXZGLafzVRWY/Y9Qf1jyOzCVyqlEabhddtAXOXlJkF3IP4O6YFOOZAdlVWPPFRhuYqdLZf9wxOkSzBiOnO1MQ6xSwUBfHTWh+mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KgVB4PFY; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KgVB4PFY"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-74625f748a0so23176647b3.2
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Sep 2025 05:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758891140; x=1759495940; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oeq95/+JFRlc8XyWn/nswZYQ27eu4+ApswNk/R1twrM=;
        b=KgVB4PFYIFe9nPm9V+YdYHN77n91R8WQ7jFBY0Zmudw/Qn2pTMpGQG6K5jnUIkqojU
         TrxtExscXuyZHkf/VG1S+4iSiUQWCOTeGm5ZED9w65rliY5q7qZTHMohSMmzRSEAYma1
         CQXiRcvYfckoKdPOUrFZwAy0AJv9lnbGf2klaExScc338ByqnH+/7LRAfuFBLTlERhl9
         O9J4M+fdnd0rMKJ2Lsr/+IqsJ/YqJkKsVvxrjG1no5eScUWnMwiT5EQ062f8ri+6akcw
         0lA+A0U/9ucSCU2/1eGbp+1zuu2KghX9n8H09dZsSQnngGBwZ9ttETBC9QrKEeKN6qE0
         Xlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758891140; x=1759495940;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeq95/+JFRlc8XyWn/nswZYQ27eu4+ApswNk/R1twrM=;
        b=m5fogrQgew7HBpvi+c1gKvjyFL5c3cKhbHCSTC/blqEoD8/AYAybTov2GKpA/3AlM8
         egFfw2Dt/tT2GGxTSHO2rX3mn4W4HI9u2lCj22e2NQPsmCIZtdIro0ZhhE3GqwTpWaWA
         K7z+7Q0gxdtsoKVyRfpwWduo1Nv7f2zJF+EJ+P3TOCwUHZ+YuR/NHrZBRr98YGDatLz3
         O6kXcFRnMA+Y6YKOJY5us7ac92myrjIzehV+GN8XKH1uJV8/KouAHoYwwaVmTG2q9u6w
         RelUUpUryBSl2N6F6MtbrtD6JzsA5uQqBTtMRvzdBcTfewOHIvdOURELJuGircfqG9er
         hxtg==
X-Forwarded-Encrypted: i=1; AJvYcCXXYH2tW6F5aHhyEezRzgp5MHh3lcpkycEi7/5q0IGLdDfJAEsI16V0HSbEouOar0eqFzVI6BpQyT148tKhbK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEBo8Ja1p1DRgEKND714scmQD3X/aEEjfsctCYTerK/6Fv+zVL
	L1XOWRt2F8dV+qT3Yl2fSpyUJz8UUDHMKl1yNR4tXYdUu2vZb7yENX4AELpcZEU4GKNQzn3w876
	aMmF3IbKu+yneLqEEp+XYJm9iVyBPG2U/BnR63oCYhw==
X-Gm-Gg: ASbGnctueWIcYxuqcankpK/sRkTjs5bHGVPdXbbM68fiy258jhmuLASDVVQYpC6sUbJ
	JJM3oL0WlL+BKYzvH+bAt4y7GBkMCk0E/NWfV4szby7JSvKRUOmiiSokT14J/6U2LulQenYp5Zk
	LqDGRHPY0cYLiqOo2QC9FYuOdKzG3dGAOk+zAAZUCCQgiMcK6O6Uzh0OfYoACdtENfmutf4Z1Tq
	gqFYjK2
X-Google-Smtp-Source: AGHT+IFbegjMBskXETWZWAHtZmLSq0HPSiddGUE92rJmk6oAyCGRgWRczPzi/diLvmOjt/dbfSTu3Ew31MNwwvilOAo=
X-Received: by 2002:a05:690e:144c:b0:635:4ecd:75a0 with SMTP id
 956f58d0204a3-6361a89a815mr5888996d50.46.1758891139937; Fri, 26 Sep 2025
 05:52:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aNYQkVuVpP3Daq7x@stanley.mountain>
In-Reply-To: <aNYQkVuVpP3Daq7x@stanley.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 26 Sep 2025 14:51:43 +0200
X-Gm-Features: AS18NWAJ6VxhUJBeyo9x7sMCxxohCMAJ5raPfUmiVSZRv8RZbBNqJRlbPHJDbI0
Message-ID: <CAPDyKFq7mwW7ys6_1wnhf+BYBeDcsxgcL5HxGhnpxv1vMO2qaA@mail.gmail.com>
Subject: Re: [PATCH next] pmdomain: thead: Fix error pointer vs NULL bug in th1520_pd_reboot_init()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Icenowy Zheng <uwu@icenowy.me>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Sept 2025 at 06:03, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> The devm_auxiliary_device_create() returns NULL on error.  It never
> returns error pointers.  Using PTR_ERR_OR_ZERO() here means the function
> always returns success.  Replace the PTR_ERR_OR_ZERO() call check with
> a NULL check.
>
> Fixes: 64581f41f4c4 ("pmdomain: thead: create auxiliary device for rebooting")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/pmdomain/thead/th1520-pm-domains.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
> index 5213994101a5..d7cb9633c7c8 100644
> --- a/drivers/pmdomain/thead/th1520-pm-domains.c
> +++ b/drivers/pmdomain/thead/th1520-pm-domains.c
> @@ -179,8 +179,10 @@ static int th1520_pd_reboot_init(struct device *dev,
>         struct auxiliary_device *adev;
>
>         adev = devm_auxiliary_device_create(dev, "reboot", aon_chan);
> +       if (!adev)
> +               return -ENODEV;
>
> -       return PTR_ERR_OR_ZERO(adev);
> +       return 0;
>  }
>
>  static int th1520_pd_probe(struct platform_device *pdev)
> --
> 2.51.0
>
