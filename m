Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA71132C25
	for <kernel-janitors@vger.kernel.org>; Tue,  6 Feb 2024 14:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707231363; cv=none; b=XMdKV5ViWFCVJouXnI/YPnVwqp8cfOeEf2Nlmilw+PcM2O+Vf10zsBS4DeKIW0ITD1P1zobjRD/sLKKFCcKGmr9wBOGyb3cObMxAgvCft+AOk9UKUtc1e6fucOFcjE8Z6zfhHdyN15rbP14yGcCIKeSpIfbh0Q7UCIi7KtgxuHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707231363; c=relaxed/simple;
	bh=hXolM7uNjrqi4kvTV1pVtTTaI60yBGc/tHdLQl6Jd68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rb8ZJscMUJKHh9kwqU4hCC56mCaP0GVSWvq4zT5aF26UO10CI5qocHOruEXq2XpuHOILUBX38tlwW1GKtLT+yaxg6rAkDKiC10V4zVlzrJ2A308fZkdi9Zk6r7mOdsscZscnfF565s2SN0T8mcYqGMEXfk8UF+Thz9jADI0jzHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SWXIoCxE; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SWXIoCxE"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-59a8ee08c23so2234879eaf.2
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Feb 2024 06:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707231360; x=1707836160; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JKCZke1KMPopQ9RKPdCxdFTkVP9U+Bz1cnxAljvkmYE=;
        b=SWXIoCxEkE7gxoZcd8yCWS72shPdnhLgjxYmrAxh70zJq6Zs1JgzBCAdIkaR/biSgI
         ywQFPM5Y6+jBqrWmro71jC/IJc+wxykVMpO3flRlJuK25WD2ommgk2PZqyXjCjnWCY1R
         Hbf7gB6yG2liZyOIlwZiC/AModrZ2tkV8PkpzPb3/xe3chWfScZPrqCEEPCFkW5sOUjD
         BfPvMw743aVPDaUEOaQ0opBMlZXofY2aOEymKPaSfB2im/pALYen31TL1w9yYCxN14sv
         WW9thKxlSxszgcBlFd6Ay9OC5WWNjbGhweW1fLsIE2u2HQ7Qfbbp8k4mzEYTtIK4kUq0
         0k0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707231360; x=1707836160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKCZke1KMPopQ9RKPdCxdFTkVP9U+Bz1cnxAljvkmYE=;
        b=szc/4j0lMqroGAwIaV4QMqQ5LJCbCF8kan/JeyrNPczXlDiPLl2rQsz0bszui4yf43
         K0rrodaO7blHAT5WcwN6Q3Mmx7C52T0ezSpfd0TY6cAAqbXvUsXyax3TrEZreYMaqoi8
         hwUG5mtv3TerPzdsca3HanHGatfoLQ/IFqVD70dbpNYp9XbXwBHX8gnRkHLh/udgn5t3
         kPGn/uN8nm1T9OIxHgKS1CLdTt9Z8xo0HP/yDCfOPuyH+mKW4T2WizOskyOHfwS/vIgg
         W0wGdadsT9DcIERF5WeFp7XBDwZCSfjD5fQb3NkbZcC3FKzEjzl/W0sugk/3+kygkJIH
         8J0g==
X-Gm-Message-State: AOJu0Ywhqp7svEgIUa1yQo4ce6gpdjY1aAhkaAc69f2FP03ORJ/O9UnQ
	VwattYo7L7XMEFn9QPqM4WSrzE0KTlD7dF3/FQavjWFDJ2v9qis1GCbu1K466j/01jkAHAnxWE6
	AUtA8U+IWiXUDNyVAZmnFR3SILqRdYORg+VLVVA==
X-Google-Smtp-Source: AGHT+IEjZNrhvqIStbF4U44ytlGPmSnzsLH2enASrVkowIdVD2zLnzSWnYbwn6i/81EJzWZPXL1iPryIbri0vd8KjCI=
X-Received: by 2002:a05:6359:4113:b0:176:40fb:cf3a with SMTP id
 kh19-20020a056359411300b0017640fbcf3amr2357172rwc.14.1707231360167; Tue, 06
 Feb 2024 06:56:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <da6af483-5ee9-45cd-922e-d9d5364674dc@web.de> <CAMuHMdUxn4Ne7kmEfONz8Uk3Why3m9r83GdM5RzTxm_4Gj_a6g@mail.gmail.com>
 <6e397bf2-1d45-434f-8619-58a737a138e3@web.de>
In-Reply-To: <6e397bf2-1d45-434f-8619-58a737a138e3@web.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 6 Feb 2024 15:55:24 +0100
Message-ID: <CAPDyKFrVgHKXrps5wB3yhOK6JFdBeW8zzYHcQJC1RVs8PXJgOw@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: mediatek: Use devm_platform_ioremap_resource()
 in init_scp()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, 
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Feb 2024 at 10:21, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 6 Feb 2024 10:05:34 +0100
> Subject: [PATCH v2] pmdomain: mediatek: Use devm_platform_ioremap_resource() in init_scp()
>
> A wrapper function is available since the commit 7945f929f1a77a1c8887a97ca07f87626858ff42
> ("drivers: provide devm_platform_ioremap_resource()").
>
> * Thus reuse existing functionality instead of keeping duplicate source code.
>
> * Delete a local variable which became unnecessary with this refactoring.
>
>
> This issue was transformed by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> v2:
> The transformation pattern was adjusted based on advices by known contributors.
>
> Examples:
> * Doug Anderson
> * Geert Uytterhoeven
> * Robin Murphy
>
>
>  drivers/pmdomain/mediatek/mtk-scpsys.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/mediatek/mtk-scpsys.c
> index b374d01fdac7..59a7a8c261ed 100644
> --- a/drivers/pmdomain/mediatek/mtk-scpsys.c
> +++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
> @@ -425,7 +425,6 @@ static struct scp *init_scp(struct platform_device *pdev,
>                         bool bus_prot_reg_update)
>  {
>         struct genpd_onecell_data *pd_data;
> -       struct resource *res;
>         int i, j;
>         struct scp *scp;
>         struct clk *clk[CLK_MAX];
> @@ -441,8 +440,7 @@ static struct scp *init_scp(struct platform_device *pdev,
>
>         scp->dev = &pdev->dev;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       scp->base = devm_ioremap_resource(&pdev->dev, res);
> +       scp->base = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(scp->base))
>                 return ERR_CAST(scp->base);
>
> --
> 2.43.0
>
