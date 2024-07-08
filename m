Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAAD146A98
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Jul 2024 20:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720470418; cv=none; b=EYtRWzEc9/ZexvwglOYPuWZc16xSrxxFDZp5ZpqACXmdpRUAZvqp//gAixcKF6sVR7PzsBmsWOXjdp9Iyp7M4SsBWo0rfuKbsSUhKMnjDbNvgvuZTqQCw3U0gRJ0i8+mbeiQ7uQDz+WpSfzPZqq0mXikTUyfVBzLM+qpWpLAEL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720470418; c=relaxed/simple;
	bh=iP0jvq7PGIFczaEA5bqaPg8rzTLnc33XdldzK181P5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oJ5iUfCtrQmyGeot/mZJ/U7FmUKC70jc7dERcO2oTD8E5j5Qe4KTsHJyE2f0Sc7tiA6r044Q+o6L02t+N8vVPhxcgB0VEflQMrzQI81FNfGS2Wo5oLxkvaJ19I0XGuDAyZ4tbvQ3NQdXktKwW+PTC8nsr5ipVI6MihsTZYDacxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bpBFcbj4; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bpBFcbj4"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-651da7c1531so40073737b3.0
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Jul 2024 13:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720470415; x=1721075215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQqAxoPni/sISUNtLPGbi6yaKTLLkE7TWz06MwgXUpw=;
        b=bpBFcbj4V+g9sYzyufrCz+ceNYlJ8B73U96MDIBLf8IBoUzymmB61yuip291Ci8fgF
         iZNDkatbR/84jHsW26gu1p1J9s8dJOFOmTR2qa7TbXtLx3MNLGdagquAx3xGadeN13tg
         hx2Dx3Y4W3rD8C9xMvbJOFUR9s+IS4u7OMhnLm4IAMIA6hN1vn4gWzBE973ffeeugQYe
         d6MMfsRBTp2Rh8aj1A6o56UPpp1A4YMhfH/tNtkFPR36rZFhK+W9BsyZ4OZ8ETiC6lAA
         t8ljsWtS5g2koclncYr7vQyW1giEPdUiHAdE1XIybYoSYuDoERDjDmojUzA+j0XcErYo
         KBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720470415; x=1721075215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQqAxoPni/sISUNtLPGbi6yaKTLLkE7TWz06MwgXUpw=;
        b=pe7Pqud0OBaYTIXpcxheLY3traanngnFxHXKhE7VdPMKPTMO9zVuW0cr0z+eY69NMc
         E5wVT8wztVv2H7iUWH4SueY55fuKsYIRqLH/L7gufMzCN143EC/d96knDEgb+GjNjYrR
         m8Z8qv50rIGg6OaH7J0TKVkKPNJ5JWg2O9Vtur5Q6zPwW+0oWcDi53g7Uox+HTzRXXMV
         G+N9v5BnEbE3FM4wPJK3u0rCQe9BvkCpuNNFCeSoNyzwmpdXVnQ70/JLOs2/1iH4XsBm
         BYPezIABhY9SS73jLedDDihjKXJCdANO6XieNOwGVoDvbRdxrSyXkj0Ee8f+89p8BtL9
         7jsA==
X-Forwarded-Encrypted: i=1; AJvYcCWQPgg+biUFomKMzTPeDRah8U9apIIht9jy+ihPE9CXPoJhnnMUFkQtICd2zn+rodoFdNe0B2XMm+sIqmfXuo/yn4dYHNkwAT/SaHwHSgBM
X-Gm-Message-State: AOJu0YzcNeNG6K3/wPDyDeI2+QKXRMEGuQfGW2q5+DO54YJ7VCsaQ8re
	mXCc4o68dfD2ZBkVfNiWCsTuS5WKmsQL8z1UuPsYD2v3NXrccW3VLyQINObBTj9FEnXX9BVTcp9
	yF99l4Ah1OxySWnCpEscMdJTboX87Su05KIL3Ig==
X-Google-Smtp-Source: AGHT+IGO2ni/QPKZ5DyTQznLmq+yxlD7B6UffX80ITsFXuqHyccHxv2wbcoz3FyUQBIlQaTdDB4QDOW83uoQ6RkVu50=
X-Received: by 2002:a81:ae04:0:b0:649:fa54:1f8c with SMTP id
 00721157ae682-658f11a595cmr7769077b3.48.1720470415272; Mon, 08 Jul 2024
 13:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a956a3e2-c6ce-4f07-ad80-ec8a96e00d16@stanley.mountain>
In-Reply-To: <a956a3e2-c6ce-4f07-ad80-ec8a96e00d16@stanley.mountain>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 8 Jul 2024 15:26:44 -0500
Message-ID: <CAPLW+4kwiKUUdwPW-TjdXEWivWbh4dTe+LYqsR+YssYy6XSzvg@mail.gmail.com>
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix error code in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 12:04=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Return negative -ENOMEM instead of positive ENOMEM.
>
> Fixes: 497ddafe915e ("phy: exynos5-usbdrd: convert Vbus supplies to regul=
ator_bulk")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsu=
ng/phy-exynos5-usbdrd.c
> index df52b78a120b..9cbf90142950 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -1745,7 +1745,7 @@ static int exynos5_usbdrd_phy_probe(struct platform=
_device *pdev)
>                                            sizeof(*phy_drd->regulators),
>                                            GFP_KERNEL);
>         if (!phy_drd->regulators)
> -               return ENOMEM;
> +               return -ENOMEM;
>         regulator_bulk_set_supply_names(phy_drd->regulators,
>                                         drv_data->regulator_names,
>                                         drv_data->n_regulators);
> --
> 2.43.0
>
