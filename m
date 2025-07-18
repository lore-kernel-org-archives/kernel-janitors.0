Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E49D72633
	for <kernel-janitors@vger.kernel.org>; Fri, 18 Jul 2025 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752842865; cv=none; b=g1cQRRSXSGEBWQot8KfE0H86TLwLZ9YSx7NzYXA3g7W/igIp/VGgK8XWLKpPy3ulgh2Io8aNN6R+ELY90PfFC8aQF31WgVSAw5rF0+UD8AVDC7K0MWl5Ilqbjp5p3T4i/gIaDXsHzHMI7yPRo840Q4nvITKgGRWx82La5fpoK1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752842865; c=relaxed/simple;
	bh=s04Gar8iaD2QraUQUxwoiSLaIB05kvgte6K37xqltbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d5mEdjKYEvC/7czo9u345MK9R3vs8MP8Lp4Koo26ZTlQy/GYQ0PkKaHFsuWkSK3Zlw8S/ScoO88TEhc0Lfr2zg9iisNRcyGjETLAU7MI7lhwotEcCE+KXvNBreQ+PJ3x1ssM9Bz6OMHs3ZlYn0vvB95VQwVlKMDMlNVAolj1dU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QL5c7FMo; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QL5c7FMo"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-748fe69a7baso1944676b3a.3
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Jul 2025 05:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752842863; x=1753447663; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QeRQlyAUR3PqW+g2eLdPPpZ5mVhOZm45aebnnXmKoiE=;
        b=QL5c7FMoFSaxDWPyHCOj8IGVRJSYmBve6nKxNQUhbtlyKxPFBlb0lceN2EC3IUvNQG
         NXpp94SvkZbnk5z2dm1u8AV4XREYG/UNn+E/ijRbDzB+EPspr4dtXlSuCXtd7CcCSq6o
         7L+gUfvclKLcwfrNiD+eZDRf9JR9gGiGxP6Cmf1uU7LQ8xAF6JR9jUZ7LpQknIfTAcFi
         3YbaIljksPknHsTrNz3dSCxu67wAZXqnfgaK+3PJbDv9idGL12wTv5n3CSxqeIMLpSrr
         18DMjtFwcTTe2R4ssj34il95PlyyiRx86KVjQAOBrLgz6+aQuWnL6bGhauYjrpQLIRZ4
         pi4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752842863; x=1753447663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeRQlyAUR3PqW+g2eLdPPpZ5mVhOZm45aebnnXmKoiE=;
        b=v3VCIKXdWLnUnAIVzXNY9CzXr8Luxvpquj7EUbg8gbSvMwLvxoUe2NxEDNYNB6jjnm
         2zTHrkHgMTV0FV9Ai708VVeFKE3MIHOpMUzFT4XgMbSZfZ2X4P+RM27NXLSExIjKPFWG
         QPagMSqevXhFRSgLWNurh0M0WuHhpBbcuWF1Kd03TmBEK6taw684/y/3qreGcnIwmerQ
         I8Re8NNrKR/TMG5JfiURIXXpVGPvK6BMifxKyE1NA55f5+jDLkvJRoFylvjL4m01kDD9
         u2UkBbkxM0Cj187xWYdMVGozu3ogeqOloHmV68tRPVrMmkCcy0k6Faw2Iri5nkyRBY7/
         Hdsg==
X-Forwarded-Encrypted: i=1; AJvYcCW/fcQGLM8ZGhPBe4Rup1md5wp+4fepvLIqwOoruZuiMrmjIIb/BI/qA6ilw1fbFYp823WKwoW3C1il59CkVv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMYs0S7j6DSSqGbyYEwg3pVBw8jM86KFaswGtyXovYcjQW5IMd
	rpSryghlZ4n8SWHeyrpLhNIVSFf6b1GCxB7NccQJOmM0NDhbtDEO03fw76OJQdntaY7vgC0ulso
	wXZGvtF3lNX/320G7v4slJ2+qGxQ2BAxfspbTQCP2WkT3g90beyW0
X-Gm-Gg: ASbGncvEj9HAJPlgZV8dnk9OnoKGvxbjdRf1xRBu2G9zWnAMv/cIB4jEAIgLtrAqy7D
	8pC7SxzkX+TbZEtcQLi/r1hqOtrOVvc+lloROA7X4FWx31P7z4y2BCm2dhejjqj1e8WxPX7/bdC
	sK42kJb9en88vL0xGZ6k52fX88NntN8NJ+X2L5X/fECvTEpecnhdlLKy+LByKg5nB2LFW5V4n6T
	a0lVc1r
X-Google-Smtp-Source: AGHT+IEMc7UZ/KYJa/a3DfDdOy24w8KU+Grmwp7vVtNPwtQHk7nDpLvJRl2+7eiSzAbsGuJXlmMDrfna6kz153iEkMo=
X-Received: by 2002:a05:6a20:9389:b0:234:e900:4fb7 with SMTP id
 adf61e73a8af0-2390dc2f767mr10317148637.24.1752842863244; Fri, 18 Jul 2025
 05:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7bd9fae8-a15f-412a-8800-ce47acf0b5ce@sabinyo.mountain>
In-Reply-To: <7bd9fae8-a15f-412a-8800-ce47acf0b5ce@sabinyo.mountain>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 18 Jul 2025 13:47:31 +0100
X-Gm-Features: Ac12FXwpsQaG8cu8OC5sYhhmw0Xl3b3O3C7eTtu5iWVgpjaqHzEUSGMRFw2z9oM
Message-ID: <CAJ9a7VjykdwBd3_Mh88U_Mqpqsi6aNFeeMS_wMsLE7EV4n_iMA@mail.gmail.com>
Subject: Re: [PATCH next] coresight: Fix a NULL vs IS_ERR() bug in probe
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Yuanfang Zhang <quic_yuanfang@quicinc.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Leo Yan <leo.yan@arm.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Jul 2025 at 20:38, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> The devm_ioremap_resource() function returns error pointers on error.
> It never returns NULL.  Update the error checking to match.
>
> Fixes: 26e20622a8ae ("coresight: add coresight Trace Network On Chip driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-tnoc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> index 0e4164707eea..d542df46ea39 100644
> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -183,8 +183,8 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
>         dev_set_drvdata(dev, drvdata);
>
>         drvdata->base = devm_ioremap_resource(dev, &adev->res);
> -       if (!drvdata->base)
> -               return -ENOMEM;
> +       if (IS_ERR(drvdata->base))
> +               return PTR_ERR(drvdata->base);
>
>         spin_lock_init(&drvdata->spinlock);
>
> --
> 2.47.2
>
Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
