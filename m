Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 118F6C54E94
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Jan 2023 16:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232642AbjAZQTH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Jan 2023 11:19:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232725AbjAZQSn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Jan 2023 11:18:43 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341E91F936
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Jan 2023 08:18:41 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id tz11so6596618ejc.0
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Jan 2023 08:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUBsQLCrBYvivpWewp0oU92BS4YfC60hR9QBE+PdkbE=;
        b=MDT9jpfK9P3FwxyqCm5a1rLJrZNTV6H0yJVbSzRPOSeHdbI82Lus4jUzoERKF8PvJN
         9JH2GCyoAaBT5BgN/t72cHMWW9J6j62yeSctn2ozOBsGjPwbiV40xI1m5GxZ6tqAOL9e
         4VD9EbRiZuN8A1iVNF/XUu/o3O0ARrm/QOYlfJdloUPze1lPIuuFczM/b+Rbem4k0Ju6
         Dd5z/GDEiHJAlmVGHI8zl4lThCl5OvlEouFdoxthnbTwXcV91vG/n8ITGlLAhSZNz5Do
         DMq95jBgu+p0UCELr28Dw8kVPj/i57AotVA1mLKdHX6voPMsFGHFCbVeHyLKZPs+W8HA
         WUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUBsQLCrBYvivpWewp0oU92BS4YfC60hR9QBE+PdkbE=;
        b=WOwCz0w2aU6BtqYG88iKgnE0srbNAYYY8yLXAKP+U7IHq7Vr4wInd3AO4pbaL8nXyL
         RzE7841u89j6C2oLW2zpq34ATgMbvZXPSRlVrSWrvB5pfqv+RPx/scyv1k0f8a+6vpAQ
         KzbYDxbTv5953gVda8S08WKV9WMw8Go8O4eFGPm1Qhhqng6CQr9vWL5704jlA0qZHb5H
         eU9QztCpJCrKsNzplMSiQvYSlK95eCiloDhSeK5wKEC3bHgQ9iuWItUItefbh/MvtjGb
         U4C6hOZsZ/3zKzYmu2Qzugi98uEuMGAK6xnqdhZNO7PtBSkiy+FeIZtZwFh4oX4BAmwm
         QMgw==
X-Gm-Message-State: AO0yUKVfCsX5ZL8ibmL37SwCT0MiZmAmHhHRHklWexajMXJS4oraj3WD
        bAa3KIMtc9N9Pt5vpEwiIH2J6QNAotI=
X-Google-Smtp-Source: AK7set8+0zZ5cyuprg85X8cYX0HvtU9ZtPVvQ5tjiO/y8rHKxnwhKwllcAVZglc/XqIoZvfF9LwjKQ==
X-Received: by 2002:a17:906:d1d0:b0:878:6df7:ce74 with SMTP id bs16-20020a170906d1d000b008786df7ce74mr1931574ejb.23.1674749919780;
        Thu, 26 Jan 2023 08:18:39 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id z21-20020a1709060f1500b0084debc3fdadsm776545eji.188.2023.01.26.08.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 08:18:39 -0800 (PST)
Date:   Thu, 26 Jan 2023 17:18:37 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/simpledrm: Fix an NULL vs IS_ERR() bug
Message-ID: <Y9Kn3UQ8WGUtgJgi@orome>
References: <Y9JHzImRcUaa0mi1@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FvZpDm5J7z3glGpv"
Content-Disposition: inline
In-Reply-To: <Y9JHzImRcUaa0mi1@kili>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--FvZpDm5J7z3glGpv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2023 at 12:28:44PM +0300, Dan Carpenter wrote:
> The devm_memremap() function doesn't return NULL, it returns error
> pointers.
>=20
> Fixes: 9a10c7e6519b ("drm/simpledrm: Add support for system memory frameb=
uffers")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Good catch! Applied to drm-misc-next, thanks.

Thierry

--FvZpDm5J7z3glGpv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPSp9sACgkQ3SOs138+
s6ECOw//YIt/L+hHtCZtIp19H1O9jC1ZEjq0DLfDAEVYv+sousVYhkgAaxdKySj3
Kj9RNprI2A0+cQxtx+P1iP6zPwJSCj0KI1mxY10rHCoOKVVS3QyrHKudWs5kTwBc
dOqbPTTrn+KOK+ie4IBj3mbpyheGBnoNC+7Z+GirC5p7J/7kiG6fHRiNZc0ha8MS
VQc5TSA7eFGhEk0Vwrg+IPmvs2MP73CQbr38Q+lWZWi1IrWHtQovFsIZljrvG786
EHot53V/wgSbcEMDjDkvUdZSybnDSRKobNuVAXnRfmasXnsoe0dIJH4/Nads/oyL
XSBRvuqPV6KjPflZQhOQ1ptTirEh/duhhaY8rPppIBuBk9AjV2oBZwe/tQHyKyUb
pyTg8lx3mtLigqQMc0pgjIX0zkrdrTFbcX1y0y6CJsneN6wfs4itjVfn/EezSB4T
nlFCVD72SCESU82j9YoLh7suWUVhkQRt3O80a9DCOkRKfY+HVxGL0HxW9i63GRnK
8Pz2SpLTHe9kTv5w3/4iUCKYqBUusB/VixPq97r1AacfTJRr891wk0DDX8gc9cLv
+Pm6vHX44/44uo2AD2GijHLBQNcuFSvHF5NOEuZbhT4079hugc4U3P3Xx3MbK7xa
3guf7rsp88R9Q6KxQHH/L1siiCyXGu9ERdia7KpQOOJYPB5HCik=
=2ARH
-----END PGP SIGNATURE-----

--FvZpDm5J7z3glGpv--
