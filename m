Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A6231815D
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Dec 2025 15:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767109277; cv=none; b=mVoADvdbu8AgSbs+yEQXs6kRGTc3RPgUB50WD5TGOFjwuOHnq6j+RxvZwi76BItE3ar3WeQdRMw95CCDo2Z35xtM/gVBO3Zixm85TNZ0uZn9N2XDLr2EnfOnRfD9YNYYYbWZrJJWXtc2flt8DeDD928Nu1RSpTYpyNJ3Z7KTj+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767109277; c=relaxed/simple;
	bh=gyHQKb3z1nk+UnpTmdOwQ9Nw5LQ39V8OUPvQxvyOONo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYhq3UxL6ypLK8s5uRSRX4laHjdUwZhwwjbVHq1ZF/1Co4jTYuRZhn33EFiLkXhAzwthKVowd9NjLII7vJHvJ6JYuKJN8EGbq43Dn/LeyIixAL/OxLKArDIl7V/8EzwoyU+vNHdEWtZUgsKoBf1zsaObkxgmTc3WIufUlrfxmQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhXvNZOC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhXvNZOC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19368C2BCB1
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Dec 2025 15:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767109277;
	bh=gyHQKb3z1nk+UnpTmdOwQ9Nw5LQ39V8OUPvQxvyOONo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PhXvNZOCnwhyuQl/sJpP93msu9Bz2T1BSHWyMFhgu1rnkvjje2kXUP3mTYoyo/YBa
	 A8041AbNjQMhqHBamlugNvHPO+5bCDoZt6ZInP8Qm/SimipO6Ffjex3mCMUZvJW/Lp
	 DUWlRZz+BHD+9wVyWaQzpSKD2xsxHeDFY4cJsxhYqIKi7EaOepRspvDlrkwZEKti5Z
	 pwp6TTIYdcOV32pOtC/hmbSvML1tYP2xrzRE13sHlIRV7HAbuoyEPXWaVrNJ1DQDmL
	 aKZ100NRT/ZeY2YZv/xqjiWrG5OFE7UrscBpPhiwpx0hCtRfIzahaw6cedrNB5J2pg
	 fKFDeOSrmv1Gw==
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-121b251438eso3206607c88.0
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Dec 2025 07:41:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWgt7KXx9rp2zqD4t/J31Gxj3cqr5ApS0qHhsPS6vpqWhozUcYpoFrRHx0qQjt0LGmIGN8h0p0ZYjhjGO/4B8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyATU2DlwMoQJBbsewCLEjpAK1NWyapOBEvypKFOSJHphYKyX19
	lyVn+GgCpxkC1tKMW/G2c53BEDQD8g/HpbQjnoCm54cPODhxY5cQaTy7dkxgPi5DshonOogClt5
	4K9X8ZwFQsQgxTAngxLTqaLZ0HTWcIg==
X-Google-Smtp-Source: AGHT+IEh2n2zLpLnAWsSiBjd90/ps/z4xq2CFX5rKvlH82VgvcbIbEKrpQVoNU8JRj6mongRc2KFddek2E8g0FG2WcA=
X-Received: by 2002:a05:7022:e88e:b0:119:e569:f851 with SMTP id
 a92af1059eb24-1206193963cmr33079705c88.8.1767109276351; Tue, 30 Dec 2025
 07:41:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aSW0p5sqnJVJsqDO@stanley.mountain>
In-Reply-To: <aSW0p5sqnJVJsqDO@stanley.mountain>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 30 Dec 2025 15:41:04 +0000
X-Gmail-Original-Message-ID: <CAAOTY__nif43taCWWdxfFqmtC=KibgJZ2AuUohiS1EdhXdDbow@mail.gmail.com>
X-Gm-Features: AQt7F2o-8OY-770n-RCRfh2pqvzP9k8Fyvdsrmq_wWlXdIFfmVOWee9EjRaS2wo
Message-ID: <CAAOTY__nif43taCWWdxfFqmtC=KibgJZ2AuUohiS1EdhXdDbow@mail.gmail.com>
Subject: Re: [PATCH next] drm/mediatek: Fix platform_get_irq() error checking
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Dan:

Dan Carpenter <dan.carpenter@linaro.org> =E6=96=BC 2025=E5=B9=B411=E6=9C=88=
25=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=881:52=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> The platform_get_irq() function returns negative error codes on failure
> and positive non-zero IRQ numbers on success.  It never returns NULL. Fix
> the error checking to look for negatives, and change "hdmi->irq" from
> unsigned int to just int.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT81=
88")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm=
/mediatek/mtk_hdmi_common.c
> index e78eb0876f16..bd7f8c56ec9c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> @@ -303,7 +303,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *h=
dmi, struct platform_device
>                 return dev_err_probe(dev, ret, "Failed to get clocks\n");
>
>         hdmi->irq =3D platform_get_irq(pdev, 0);
> -       if (!hdmi->irq)
> +       if (hdmi->irq < 0)
>                 return hdmi->irq;
>
>         hdmi->regs =3D device_node_to_regmap(dev->of_node);
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm=
/mediatek/mtk_hdmi_common.h
> index de5e064585f8..7a644bbf5843 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
> @@ -168,7 +168,7 @@ struct mtk_hdmi {
>         bool audio_enable;
>         bool powered;
>         bool enabled;
> -       unsigned int irq;
> +       int irq;
>         enum hdmi_hpd_state hpd;
>         hdmi_codec_plugged_cb plugged_cb;
>         struct device *codec_dev;
> --
> 2.51.0
>
