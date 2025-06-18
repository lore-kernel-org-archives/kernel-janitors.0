Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97C12E8DE8
	for <kernel-janitors@vger.kernel.org>; Wed, 18 Jun 2025 12:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251435; cv=none; b=t9RgYDPPKPUJ2ycAWpzfY8ITKuRrQearhdu4MIeFceEQ0td1QVQLQ6V9c8KHmh1leVLOsl4mql7rFnrvC7aCr6NpUo7z2+OfTPzGsbT6JQSfvfeIxPQdK9emmSZ9/WkRvEOTF/oV3liYvXTy2CyuteFUEbT3WTgFiTKyJMuViGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251435; c=relaxed/simple;
	bh=3FYqq38fif/LxKqKHUHq3crgrlGF8y09qgJq5ooSqws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ddxyT4ElYzpGUJpxCEjAX/ibUTZ1LaBau6sBeb4GOx2SeymZq/55loxynjfPQ/dHV/ZMQGGRDL18rRLY97hukPr5kWQFF1oDGwy59tUv34YONcUqeXLeNul4/9P1SF0vISf7O6ssGTlUDQEin4p0plyi4PAG97tfX2FXxwK0yv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b7H9MyIT; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b7H9MyIT"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e824793a1cfso3238684276.3
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Jun 2025 05:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750251431; x=1750856231; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ImV2tWTmsy2q/yEr+1DaD06Foo/cyEMhoVGfzs5E01c=;
        b=b7H9MyITUwy7yCriEiLoOO2l5RI7y6VMfnXqPYBZAxRaJfkOCg2GY//y9VFsQB0V6O
         0vPcYb5Jy3ALKPNu9iPhZMPrv601Hd0//ZVH/TkU4GKxhPymQyTOFLagRCw1w6XlWSop
         Y0S8b3dtAo9uMx9P4mn/uMWWNrF+/7CCocwr/UOY8ozpqBwnDusriN/rZIexYv8bZtWF
         /kKRk3kcxJq9rkaiV/9s6W2ZyIxDeU3vjSk2H0L78iJnjDIXplks6z5ISWxqsW+IevC0
         qTaE6AdQGpPMVxVmumNTkz3DBjPdV4XZaQWbyhDT62+zUdceA4MiTgcxaHWjUbTvpSpg
         sq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251431; x=1750856231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImV2tWTmsy2q/yEr+1DaD06Foo/cyEMhoVGfzs5E01c=;
        b=sYHTM2aUe6HwATNbRLAEBEgkVIKvc2pzPQIcutGvMpIAp7t1DapoQXX3/LPFZNFoJd
         4OUbYFrjqTK/qp7/vb4A2qdlHCr62IOsghBewkgqyGMFL3QccqDyXI0d6bCrYFTpBE/x
         4yIQ136oPfXALLpnuPiSXqRZ++qyi4M+zL+3xxMusgGgahRs96CklnK8bDtOPzlYD1ma
         wdS3cUMW5G/uErNb9Q0UhNOYCN/RIy+IgR8ApiLbeKqNu1onRU0EaMvLzXA+Tu58/kYW
         5tbqjfsM0I+pPDuTB+8pBgrSXLnxDcv0oNlJ8sygZPAtHoVKhtgSWiikmKkjWyQ5lqb/
         uE0g==
X-Forwarded-Encrypted: i=1; AJvYcCVrv4z/kl7nO2OEjtdqES5JfOCjLlladn9tIXsArbjvlgdZ6MbfRrMqPaSWTmBZihfyGZH2cto9CjpS7/6hUuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTCLDE65idfr/aZ5SGURW8Ewej3ay9yHSfVgjnqNpNSIRPyem4
	QybGvdCOAVr78qe1OUUZKq6HVHcuxr5gKpLJOAJnNa9Lv8NLZvz72ufnstj6nHEsvxidoCE0SQm
	3yMyILQ/5IWeUnEYgH/3kLQWswQPtMPxSy1yxYASJhQ==
X-Gm-Gg: ASbGncsBUcZDr6oohISvsHRM3M1AB30IVSjlnxtA6rMHBdEquaDkMbYlShbSucMfmL8
	F1Jag3BgVwqmnZ5hdgCJ2Wt2s5T5hiCCBSWzZDfdfVT2VylzGRq1VidL9Ys/rjVp+6k3gUZvSPi
	ii1utx0xrwl8V4cpTKGyjEDLXMkk78jA6Lkpl6qfCcs3LD0FgBRM3k7g==
X-Google-Smtp-Source: AGHT+IEyQuheTBiE1KNn6YZq2gnYBnep5nmoSzdbAY5+FjuWnU41fcajc0wk6HzHKqHouIVNOHfqKE34E1wAn8AbOSo=
X-Received: by 2002:a05:6902:108e:b0:e75:c2d7:53d6 with SMTP id
 3f1490d57ef6-e822ac5c6e6mr24203748276.13.1750251431566; Wed, 18 Jun 2025
 05:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Jun 2025 14:56:34 +0200
X-Gm-Features: AX0GCFtmn4waDQnDGcBuyuBWKSA5kWVg6aNQw87L31M-o6t6ciEMxOkcF-FE8sw
Message-ID: <CAPDyKFoPdqfz-3+XAMpg23VzaLUZ6xXJvmknQH7pjNZLPq6eAg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: remove code clutter
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Jun 2025 at 11:08, Lukas Bulwahn <lbulwahn@redhat.com> wrote:
>
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> There is no need to introduce the boolean power_on to select the constant
> value for state. Simply pass the value for state as argument. Just remove
> this code clutter.
>
> No functional change.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/arm/scmi_pm_domain.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
> index 2a213c218126..8fe1c0a501c9 100644
> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
> @@ -22,27 +22,21 @@ struct scmi_pm_domain {
>
>  #define to_scmi_pd(gpd) container_of(gpd, struct scmi_pm_domain, genpd)
>
> -static int scmi_pd_power(struct generic_pm_domain *domain, bool power_on)
> +static int scmi_pd_power(struct generic_pm_domain *domain, u32 state)
>  {
> -       u32 state;
>         struct scmi_pm_domain *pd = to_scmi_pd(domain);
>
> -       if (power_on)
> -               state = SCMI_POWER_STATE_GENERIC_ON;
> -       else
> -               state = SCMI_POWER_STATE_GENERIC_OFF;
> -
>         return power_ops->state_set(pd->ph, pd->domain, state);
>  }
>
>  static int scmi_pd_power_on(struct generic_pm_domain *domain)
>  {
> -       return scmi_pd_power(domain, true);
> +       return scmi_pd_power(domain, SCMI_POWER_STATE_GENERIC_ON);
>  }
>
>  static int scmi_pd_power_off(struct generic_pm_domain *domain)
>  {
> -       return scmi_pd_power(domain, false);
> +       return scmi_pd_power(domain, SCMI_POWER_STATE_GENERIC_OFF);
>  }
>
>  static int scmi_pm_domain_probe(struct scmi_device *sdev)
> --
> 2.49.0
>
