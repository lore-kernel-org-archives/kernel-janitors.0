Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6348CC77B72
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 Apr 2023 16:03:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233948AbjDTQDu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 Apr 2023 12:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231829AbjDTQDt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Apr 2023 12:03:49 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CFDD30C0
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Apr 2023 09:03:47 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-555bc7f6746so48751227b3.6
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Apr 2023 09:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682006626; x=1684598626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tm7UM09pqDmlXaw6Tzr7qP2zDTs3fe2QxDAwCvAjZNE=;
        b=s/szI3S3BNGYQK9FXOWp5Q12Spuk3y1VNrfdsdKoWaFd8d/OkTqF705YKadvZ3Vcw1
         /uPwAeCBgmJCvQU38bCYJDv9g3ZO8/dWbm2GQrNX7ZlmN7/L1yowgC45dn566WbSV1Ag
         QYO6gwJyIuIwIM2ZdNKNCpmBa4BDOBfEXMJRTamzsCOK1DCKKyUxMR52zge+hBm/hi8T
         FrqRVw435uDvp98jfUeiYPRbX5tmpqY6aWTGTIki5VsV7Kvtd0CHIx4IUZ+P0A7qyr6R
         rMWwzcHT4GZ0ZqJna60z3PGkdFDR2caFmV5wxAkrVK6Zb837Uv4XR5H7TZl13AY3TEhU
         DOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682006626; x=1684598626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tm7UM09pqDmlXaw6Tzr7qP2zDTs3fe2QxDAwCvAjZNE=;
        b=d8jd2FXBJYHqpKLx47gxr8VtrzlNeIia5A5dTsxzMFatykJDLx3Rf2AXbhps1/jVo1
         xzu+AfNHn/qx0QMICCjMLqU14gpEYzf6NHyOxEs3SyPZjtjn9F+oJeQheWcsxs6ZSLfi
         CcaMWclUCOr/8+Y22nAmYdN7TgSw60RNT25vq1nobsspD46CnZCE3C+zObhGVMi7vmL3
         8FC7voAIJe5B+aiKuxgK+jWMUq1DCWjvm3Q44vztoCiw+A2fElvkmNXG9GGTvYL6Eigd
         cRiH3OH/EJN+SFcG6j+dVCSUfiOEeNqlUPUNX3kKGju63dNHVdpFhHPYwbuHxbN6xw+x
         lkIA==
X-Gm-Message-State: AAQBX9fW2ew7lmRFKip7EHGueDCQ1fQHZF76klcBh7B6MKlXYnKlkmn3
        hHyrcu1cu1XxJmsdjJV4xzOOjQ==
X-Google-Smtp-Source: AKy350Yu9IG1YHAMzYuvIvj7MAeXVpM+6S8RWIeEeZ8ZjVGUOX/x/OwISois3DxMyrDxF8jvlmRIBg==
X-Received: by 2002:a0d:ca07:0:b0:54f:d538:cdde with SMTP id m7-20020a0dca07000000b0054fd538cddemr1117552ywd.39.1682006626202;
        Thu, 20 Apr 2023 09:03:46 -0700 (PDT)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id u16-20020a0deb10000000b00545a0818495sm415121ywe.37.2023.04.20.09.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 09:03:45 -0700 (PDT)
Date:   Thu, 20 Apr 2023 12:03:42 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Lee Jones <lee@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-iio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] counter: rz-mtu3-cnt: Unlock on error in
 rz_mtu3_count_ceiling_write()
Message-ID: <ZEFiXnSKsnIB4XP9@fedora>
References: <7b535d6b-6031-493a-84f6-82842089e637@kili.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TsFbSMEL8oftP2/4"
Content-Disposition: inline
In-Reply-To: <7b535d6b-6031-493a-84f6-82842089e637@kili.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--TsFbSMEL8oftP2/4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 06:02:11PM +0300, Dan Carpenter wrote:
> These error paths need to call mutex_unlock(&priv->lock) before
> returning.  The lock is taken in rz_mtu3_lock_if_counter_is_valid().
>=20
> Fixes: 25d21447d896 ("counter: Add Renesas RZ/G2L MTU3a counter driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Acked-by: William Breathitt Gray <william.gray@linaro.org>

Despite this being a fix, I think this driver currently is only in the
mfd tree, right? So I assume Lee Jones will pick this up for there.

Thanks,

William Breathitt Gray

> ---
> v2: I had the wrong function in the subject.  Also style changes.
>=20
>  drivers/counter/rz-mtu3-cnt.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/counter/rz-mtu3-cnt.c b/drivers/counter/rz-mtu3-cnt.c
> index a371bab68499..48c83933aa2f 100644
> --- a/drivers/counter/rz-mtu3-cnt.c
> +++ b/drivers/counter/rz-mtu3-cnt.c
> @@ -358,13 +358,17 @@ static int rz_mtu3_count_ceiling_write(struct count=
er_device *counter,
>  	switch (count->id) {
>  	case RZ_MTU3_16_BIT_MTU1_CH:
>  	case RZ_MTU3_16_BIT_MTU2_CH:
> -		if (ceiling > U16_MAX)
> +		if (ceiling > U16_MAX) {
> +			mutex_unlock(&priv->lock);
>  			return -ERANGE;
> +		}
>  		priv->mtu_16bit_max[ch_id] =3D ceiling;
>  		break;
>  	case RZ_MTU3_32_BIT_CH:
> -		if (ceiling > U32_MAX)
> +		if (ceiling > U32_MAX) {
> +			mutex_unlock(&priv->lock);
>  			return -ERANGE;
> +		}
>  		priv->mtu_32bit_max =3D ceiling;
>  		break;
>  	default:
> --=20
> 2.39.2
>=20

--TsFbSMEL8oftP2/4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZEFiXgAKCRC1SFbKvhIj
K+/IAQDB/u9EYoHlICtDCDuXq8he0TUmUBmmqPLAfORM5+FnTQD9E6U0q3fvZwy7
ndnh8Hsiu9p+gANJR+a4CNd3NS8LXwQ=
=XEv5
-----END PGP SIGNATURE-----

--TsFbSMEL8oftP2/4--
