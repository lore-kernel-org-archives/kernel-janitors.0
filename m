Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794676756;
	b=4JhGjZ7DtrnAhdrY3f4AFeqXgbSpSWURedkIYsU1/EFHhSF4tnkxAXTdeRczdnHqs+SV
	 WaSW6Cd4t7szXb4hl5Im1ehY1A6kTZRXocr1UllWhChG9/mdHzMH0XLiVRXLSgTeXcaQb
	 Vclm4VIXJKZFNBIw5HMj9RKrt3geClzLcZFiZJtA0b5Zcx0urdfhJ/RsNGf6PRwBf1d3U
	 5L7fVSi/HFMYEP3cMsexXjoFqom5uN0pcHJqMrhQZxJS5CQPfUKCWxI8D9XcBr062BSf4
	 csET/rfCa+oX7Ij55HwSuDUvMlub4jVgyp4j6c7GxhuGzbz6WnxGpyONuZjPuh8jVcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=YTwcRMSWQ/WwFbflIYFwTeimqUcsUNTJOHfLHF8Dqo0=;
	b=CfwzDe4J6Nk6EYLoul85JR8cxkyvKq8PNt3yaDVbhDCYETcMidjTwRZu8wPb4g/AswBL
	 Ee1F8fZCO+43WtVBvlzE0f98kmdUeFPC3399HVadnDzsrDXnn9jg7wQMtEJ15vLXft8aC
	 ZRgcNDO14WM+ojNh8aY2By4zC5o+jKNQNV2xzX0OBVTTqOx3ng9OiDQsO/t+ezmzvWOAA
	 mCJXD6/x/CwUP+5RZgWx/feK8EdmCi2qWgI9KYi9atrw00KiXV97MxAxv8XzEwss1yU7m
	 k4wc+ZEYuFyE+F7Vn71Ac6eq5T2b61dSbMhFyt8Xx1l4T98pIRgCE3DHCt/4ZNFAQiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHw3eyv7;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216B4606A32D
	for <kernel-janitors@vger.kernel.org>; Sat, 14 Nov 2026 17:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 216B4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHw3eyv7
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so12654345e9.3
        for <kernel-janitors@vger.kernel.org>; Sat, 14 Nov 2026 09:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794676754; x=1795281554; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YTwcRMSWQ/WwFbflIYFwTeimqUcsUNTJOHfLHF8Dqo0=;
        b=vHw3eyv7tVnu7ujo/f014gkgAnXfEOQX+ah3pcWkkUpbq6/tPFuCYxNQdUyvHdFjHq
         2anngKr5UUeaxV7xvlr5ZsZMq6lwaam/S4Bwe7WVITK02XSKNI9U1r14CG3Iojp3n3fL
         1DQY2rBZzTay3cOVSvPXlmNOlufTR6Mc7AuAw8vJEgmJU01qccyWgckLhFY9He1MQxRM
         zdcnv7adqnSQQYqNCWVXdfQPYYCVW1rLdOp61m7NbeiOZPBpyAFu+jRBRNk2Gjx//FB0
         u8hsxePhaRe8UACcS0A6UkPbM/uCRbu8JTOBFmSca6ZflsfRhZTUAblYhES7tIEww7zi
         iuqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676754; x=1795281554;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YTwcRMSWQ/WwFbflIYFwTeimqUcsUNTJOHfLHF8Dqo0=;
        b=s4a/IqLiFGjDDJrIXUdapjItDg0mrFIq+NDbU2wZJTApxMVUG5JLXoz8T1vWFKyBYq
         SwfeD+tSg3deHU0iOhFVFfeURCwQGWz+YBkPaCO783HvHztgCpBNZspXUYszg3Zl6Z1L
         EkWI7q/EHHvt1uPeDAQySSmAVpLOnvy+tSYKa6Ri4HXySF6533jFd8TlzAdfu99KNvD2
         8Kmtain1jHBcIy1vEQNVQ8rLZOKMDCYIiS9FWbGCdXFIJ2nWh6dx748Ol/V3WLx1L9O/
         X94W2z6LSYrFbPCzELz4go3GEhgo1z3aZ4qSpAJnsB+PNqkqpJEiBZ1fY6r2XQzDoCYr
         GyBg==
X-Forwarded-Encrypted: i=1; AL+hErFsMK/N3A7nrN0P3JYCYiplyGWBwtgspiDIEzetpDktWgGY1bvXbOJ7wvtMDxYE7pGhMcjxrXXN+3rfweDEW1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ADZmuRguqqhmWgfPh8kuiOd6nSQoVF/LQ89fLhd1LnEnOHiVG
	711A9xF573dGZGUV9xZczpBbQ/MzN/B4EV7Ltn0276mcv7CNRCZLHpeI
X-Gm-Gg: AYBFou1KLtIbXSsAX+wsfnvLneZIm/z5T6BYNWhPyFoDnypne2HnSUEmXoYzvcU4H9p
	7peXRATgrYCBTUsFdky7mIAGWW4llS8q79+eBWDdPhRLc8CVHzNJrBSn0X0wDrleUl3HarjL/zl
	Q/1Mb0RJCoJzUMVifk8a7IdHETB80N4V96/xog4mXcUOKSjPmVyyB5sAetdjKeee58r2CWqy664
	+zC+uruDQxuFoqhKA6EWl3EJ4YEYAG6f8tVumYlvFdqsdrUGK6OD6iqm7tK/Lim79DdKZPbHMrL
	6ji0eSXuTz529ukoBSrUBF1r/S6Q+ni1x+bhWFLk0a2MbgQ/Ww0vpBVv2UygCOE6ygNePlNHTpS
	dDPNTBcB+DkcZy9J+Hrw7H63NcdgQLVS23VagoYRCo78lCWUaJEYu3BSSIlnZjEdr085Lv0eg8F
	cc3ZT8CohH+8NS85AYrKl9k/pzP8xrdRf1pt3A0VK0ph7XD9xR+zTwxpFdhmA8y8L+kvavJccSV
	G/Nd/obaOaB+F7rzSQONV9oy82Dur33XD6GnRU+otLYmA70maMp1P7DAgq7qwY0fMCbHZn80c6t
	Fo/1EWAVNL52eVSaXsylLnwoxJLFowftsdEIKe35ulHW3P4+uBFUcmTXNXWuixSTUL4qJRT+GCq
	//U9T5yTTQ/xE5Q4ydwLMY6BIE1QvgUoNkMIg3OBcJalndXVekp5guje1WZ4kTvBHr20Zpp0gQG
	7ssbM8U4qDGsuyBYQSBXYobhV/X0XgBAPP2gW7dltCy6deVrYoenKE72kE8393o0kMtque/9Mc6
	h0AqiL57tHxx3JOn8zmAl2Kqg==
X-Received: by 2002:a05:600c:5395:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb55abba24mr132258135e9.30.1794676754290;
        Sat, 14 Nov 2026 09:19:14 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm20031827f8f.7.2026.11.14.09.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:19:13 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Chen-Yu Tsai <wens@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Felix Gu <ustc.gu@gmail.com>
Subject:
 Re: [PATCH] iio: adc: sun20i-gpadc: Use
 devm_reset_control_get_exclusive_deasserted() in sun20i_gpadc_probe()
Date: Sat, 14 Nov 2026 18:19:12 +0100
Message-ID: <lGotwwBTRaeZcOCAphaQBQ@gmail.com>
In-Reply-To: <368d548f-2b86-4da5-857a-6ee9473a8d0e@web.de>
References: <368d548f-2b86-4da5-857a-6ee9473a8d0e@web.de>
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 14. november 2026 ob 18:08:10 Srednjeevropski standardni =C4=8D=
as je Markus Elfring napisal(a):
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 14 Nov 2026 17:55:16 +0100
>=20
> Use devm_reset_control_get_exclusive_deasserted() to replace the
> explicit reset acquisition, deassertion, and cleanup action registered
> with devm_add_action_or_reset().
> Simplify reset handling and remove the custom reset assertion callback
> while preserving reset assertion during cleanup.
>=20
> The source code was transformed by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/iio/adc/sun20i-gpadc-iio.c | 20 +++-----------------
>  1 file changed, 3 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-=
gpadc-iio.c
> index baa7661db13b..070d061572c6 100644
> --- a/drivers/iio/adc/sun20i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun20i-gpadc-iio.c
> @@ -157,13 +157,6 @@ static const struct iio_info sun20i_gpadc_iio_info =
=3D {
>  	.fwnode_xlate =3D sun20i_gpadc_fwnode_xlate,
>  };
> =20
> -static void sun20i_gpadc_reset_assert(void *data)
> -{
> -	struct reset_control *rst =3D data;
> -
> -	reset_control_assert(rst);
> -}
> -
>  static const struct iio_chan_spec sun20i_gpadc_chan_template =3D {
>  	.type =3D IIO_VOLTAGE,
>  	.indexed =3D 1,
> @@ -225,17 +218,10 @@ static int sun20i_gpadc_probe(struct platform_devic=
e *pdev)
>  	if (ret =3D=3D 0)
>  		return dev_err_probe(dev, -ENODEV, "needs at least one clocks\n");
> =20
> -	rst =3D devm_reset_control_get_exclusive(dev, NULL);
> +	rst =3D devm_reset_control_get_exclusive_deasserted(dev, NULL);
>  	if (IS_ERR(rst))
> -		return dev_err_probe(dev, PTR_ERR(rst), "failed to get reset control\n=
");
> -
> -	ret =3D reset_control_deassert(rst);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to deassert reset\n");
> -
> -	ret =3D devm_add_action_or_reset(dev, sun20i_gpadc_reset_assert, rst);
> -	if (ret)
> -		return ret;
> +		return dev_err_probe(dev, PTR_ERR(rst),
> +				     "failed to get and deassert reset\n");
> =20
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0)
>=20




