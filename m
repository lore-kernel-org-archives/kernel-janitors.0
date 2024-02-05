Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8261B952
	for <kernel-janitors@vger.kernel.org>; Mon,  5 Feb 2024 18:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707156688; cv=none; b=GMEz3svRToWYThZpa3NnefwNAjkI9tBQHkc1ktUOMjQbyeGg8EXN046FbHxXI3ZtGpoEKlwzj5MxfEFvxpRx9GWdjls8GUmVmorqfpf1LRnf7PcxAbZiCgNMTUk547hT3PRJgAzjwz3fCkhoaaCkdCx3BRWsBA6AbPezNfOeJCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707156688; c=relaxed/simple;
	bh=VwcaSmtvjRjxf/Iv6lMWF4GZNaFQ25DKb9caAPo+0mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IOWbYGZsR7gUWzFx4wDdHubH48haZSVSuEpz6U4XiVq7chz6qvjfIFPuUBTlU3l0XBavTUyGP+tcSpwN8rSBK7RiwhfpOrujkSjRAheX6gm2xQer+vOabY5WjXFIGrM6ebc0f5faeJtrpY5Ph5GeqIJ/QTNTcK13oYr6ojTGzOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SY5FVJRt; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SY5FVJRt"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5114cd44fdbso2704701e87.2
        for <kernel-janitors@vger.kernel.org>; Mon, 05 Feb 2024 10:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707156684; x=1707761484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ood9JeXOKG87bTqfPH5vVrFrWxV318p/Ke+LplXjoho=;
        b=SY5FVJRtMxyIaBCZIYVpMJBjVm1mDsbOdLEzVMJOsPItbwjtNBL5AL3F3JEoQ+I4J/
         VuZAm2FRPCWCHlBq/webge+BGMUoVQ/r+mfOWyRe/vlQJ6jGSd/L+fusi3tB+occoG+6
         CpK4v5f7ucv62biL1GFSZ9b8feC8TOAvlzwlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707156684; x=1707761484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ood9JeXOKG87bTqfPH5vVrFrWxV318p/Ke+LplXjoho=;
        b=wuE6ayxWY6pc0scUgk8DkPe7Vj2b8dMG9m92DlqbadQ7ns2GZg56E3fJvhLWhMUOc/
         FeOea3OdPQA9ffDQNUunNpKoDBzlorr6dFdg+aJapaDZSbzxVtVdeuWZ7PlR8dERcjWn
         igHDTIiWwIGokHMn8vXWS71y0jPpfm20XjqLeYt/Dlc6/ng1/7DoF7N9id/fJwSKZMRX
         2/4KdBp/HZOoFgxMLPhkB8h2DM5M1fH4TufbfzDptfVJObhhXoR/5QSeekR1xYI5EJV2
         7Hmxq5yyzzFzeSSPFFOj9yhIUthuM9O/wD73XMYtd4SPwzMidkp6oE1Na6NpYKFhixnc
         hlAQ==
X-Gm-Message-State: AOJu0Yy+5sY4OopGcK8jzR06JbCD0DIObrByiZtmNzsyfAFVwsi6F4TJ
	wmACQQWOZFB2SgKtAUuz6meIE7iAEV9FOTTqw452jUJxqgP9KK05z9nH7HzSDoeb3JiIM6RZZbq
	GLa5T
X-Google-Smtp-Source: AGHT+IEwWtK9TErs/GV86kcMDXuchYxENNy2wBKzAfY2JCz54jSMZfkiFcR4ySujT6bKN0TSULDrDA==
X-Received: by 2002:a05:6512:39c7:b0:511:3a20:e116 with SMTP id k7-20020a05651239c700b005113a20e116mr330064lfu.11.1707156684437;
        Mon, 05 Feb 2024 10:11:24 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV3y6pgw7/1ExgDjvXfrRJXEtfvQKb5eRUV6Q5o8XnZyIP33tgfmg2ZpHcAIjOYs9iGCEhgmm10mVZ99Q+HQ4NLyFu0swxtey3qHCz0U6xI
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id d15-20020a194f0f000000b005114ebaf941sm23113lfb.191.2024.02.05.10.11.23
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 10:11:23 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5113a1f2867so365e87.0
        for <kernel-janitors@vger.kernel.org>; Mon, 05 Feb 2024 10:11:23 -0800 (PST)
X-Received: by 2002:a19:5f50:0:b0:511:4a7c:51aa with SMTP id
 a16-20020a195f50000000b005114a7c51aamr19188lfj.6.1707156683549; Mon, 05 Feb
 2024 10:11:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b236236a-9953-4246-a697-19ed1b22d86a@web.de>
In-Reply-To: <b236236a-9953-4246-a697-19ed1b22d86a@web.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 Feb 2024 10:11:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xsg3Fs8XQ0piBYKGSYOhuGXyKpoJ5dbtGPdP5HU+2RyQ@mail.gmail.com>
Message-ID: <CAD=FV=Xsg3Fs8XQ0piBYKGSYOhuGXyKpoJ5dbtGPdP5HU+2RyQ@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon: Use devm_platform_get_and_ioremap_resource()
 in dsi_parse_dt()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, John Stultz <jstultz@google.com>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Tian Tao <tiantao6@hisilicon.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Xinliang Liu <xinliang.liu@linaro.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
	Yongqin Liu <yongqin.liu@linaro.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 5, 2024 at 12:13=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 5 Feb 2024 08:58:21 +0100
>
> A wrapper function is available since the commit 890cc39a879906b63912482d=
fc41944579df2dc6
> ("drivers: provide devm_platform_get_and_ioremap_resource()").
> Thus reuse existing functionality instead of keeping duplicate source cod=
e.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/d=
rm/hisilicon/kirin/dw_drm_dsi.c
> index 566de4658719..1edf429c49d7 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> @@ -834,8 +834,7 @@ static int dsi_parse_dt(struct platform_device *pdev,=
 struct dw_dsi *dsi)
>                 return PTR_ERR(ctx->pclk);
>         }
>
> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       ctx->base =3D devm_ioremap_resource(&pdev->dev, res);
> +       ctx->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &re=
s);
>         if (IS_ERR(ctx->base)) {
>                 DRM_ERROR("failed to remap dsi io region\n");
>                 return PTR_ERR(ctx->base);

This function no longer needs the local variable "res". Remove it and
then change the function call to devm_platform_ioremap_resource().
With that:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
