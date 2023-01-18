Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7577AC32793
	for <kernel-janitors@archiver.kernel.org>; Wed, 18 Jan 2023 15:04:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbjARPEW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 18 Jan 2023 10:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbjARPDp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 Jan 2023 10:03:45 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7673615544
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Jan 2023 07:02:14 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id q130so3561937iod.4
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Jan 2023 07:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lFSlJrlky2vAw3bGZpl7Yc3Zqu8itKzSOTxJU1sUyDs=;
        b=xB/YG6ErAkorBupCK2neBx+A7oNrKfOb67Qfoo8QOIaJONJlGcRe+a4FztJpagZ6ir
         jtPxeHNzloH2msRBrnZUx3p5mtdKdEvz4KgvKDBs39jcePEy4g9ggITXXKeR5jUq0sk8
         4H7iNfPJY3rh+P7MgPA9HFg6DbK8HCtQ/4yrSCn7pWOp49MerkwYx6wTfuCsIAgVMCzK
         91iuK6yL/JN5bIdz6gbSN4J+H7UHVhZCSPxm0GrfgJ+ZzkNjWM95XqY77J3Cq1xhTeoq
         iUM681Sum9kLgJx4I4BGiivOc01VohLqLycF8G+Zhp3whK3NXPWdkjWqgaRSS1HQKk/3
         Z3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFSlJrlky2vAw3bGZpl7Yc3Zqu8itKzSOTxJU1sUyDs=;
        b=Cm+SLphevSivVX24Ae4jC2xpn/FxjKCQwlMe7rAH0ZGDeif+z4xCps/dVDpax4uloH
         d2ED3kyNljlk6lvoxoL7Yr+iYffUlduA6Y4lTfwryDKAoEALTLnQRXa6rwx3LRDKAcTB
         BWdMwQexnKR7BNOEt5OE43trzVCf5yP/0wYFKPhfWxUovh/BySMPo/DLccF+8pl22iql
         ycElSaSUUYqOARX2kGnzKKMfa6nu7t7AypqxHU4JkUvpOx8Xgub+Vr+tqgvGNR7Jyq+Q
         MDAiWtq1bPEp0mtmwqNWe5hOEXSbB3sDa6vUlVH3E5dtt3KFpV00h2hFgqGss3M/sxLr
         CFgQ==
X-Gm-Message-State: AFqh2kp+HZEc2DDCv6JM3zs+wntTEiN6rMuntF6kywb1xRWzk0l/dVii
        ziXMGOZczRW7DBEQtOJv12vQ/Q==
X-Google-Smtp-Source: AMrXdXvI+yd4CdLll7l4TRRe/pWKR0LO9NZcgtbN4mW0LOSAqxaTytI794LRD5/Hl0ZK/vH94Yq0RQ==
X-Received: by 2002:a5d:8502:0:b0:6bc:d71a:570e with SMTP id q2-20020a5d8502000000b006bcd71a570emr5242217ion.16.1674054133648;
        Wed, 18 Jan 2023 07:02:13 -0800 (PST)
Received: from fedora ([185.203.218.253])
        by smtp.gmail.com with ESMTPSA id c9-20020a02a609000000b003a53692d6dbsm2701272jam.124.2023.01.18.07.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 07:02:12 -0800 (PST)
Date:   Wed, 18 Jan 2023 10:02:10 -0500
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Peter Robinson <pbrobinson@gmail.com>, linux-iio@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] counter: fix dependency references for config
 MICROCHIP_TCB_CAPTURE
Message-ID: <Y8gJ8lPAg3l3bugb@fedora>
References: <20230118074659.5909-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VSsqTeVGGrf4e10X"
Content-Disposition: inline
In-Reply-To: <20230118074659.5909-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--VSsqTeVGGrf4e10X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2023 at 08:46:59AM +0100, Lukas Bulwahn wrote:
> Commit dfeef15e73ca ("counter: microchip-tcp-capture: Add appropriate arch
> deps for TCP driver") intends to add appropriate dependencies for the
> config MICROCHIP_TCB_CAPTURE. It however prefixes the intended configs wi=
th
> CONFIG, but in Kconfig files in contrast to source files, the configs are
> referenced to without prefixing them with CONFIG.
>=20
> Fix the dependency references due to this minor misconception.
>=20
> Fixes: dfeef15e73ca ("counter: microchip-tcp-capture: Add appropriate arc=
h deps for TCP driver")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  drivers/counter/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/counter/Kconfig b/drivers/counter/Kconfig
> index 90602536fb13..b5ba8fb02cf7 100644
> --- a/drivers/counter/Kconfig
> +++ b/drivers/counter/Kconfig
> @@ -63,7 +63,7 @@ config INTERRUPT_CNT
> =20
>  config MICROCHIP_TCB_CAPTURE
>  	tristate "Microchip Timer Counter Capture driver"
> -	depends on CONFIG_SOC_AT91SAM9 || CONFIG_SOC_SAM_V7 || COMPILE_TEST
> +	depends on SOC_AT91SAM9 || SOC_SAM_V7 || COMPILE_TEST
>  	depends on HAS_IOMEM && OF
>  	select REGMAP_MMIO
>  	help
> --=20
> 2.17.1

Applied to counter-next.

William Breathitt Gray

--VSsqTeVGGrf4e10X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY8gJ8gAKCRC1SFbKvhIj
K8uNAP9qN+iORDxdNOV4OEqfNM749PKlUtm0pDXR9Sg1YmydHQEAiaD1RnPdcmAD
SAL1qkwRLcVlg8tDcLtndKHqaju05w0=
=I0Ud
-----END PGP SIGNATURE-----

--VSsqTeVGGrf4e10X--
