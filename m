Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE97ECD37B0
	for <kernel-janitors@archiver.kernel.org>; Mon, 18 Sep 2023 22:25:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjIRWZn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 18 Sep 2023 18:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjIRWZm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 18 Sep 2023 18:25:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58105A3
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Sep 2023 15:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695075900;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WG8Pu+Mw6aXgo3oVLCA7cZJ3LSi2mKUayS+JlD6Q7jo=;
        b=CJcLNNFHkotc5a4a8VLVB0IZ2qxgW9K5Fz4aonHJZJC77Egjz7LYMeEuVCRQvS0A3i0PdX
        Hrn21aWrFWeKsdS/invh3U28N6Ios4yum49IF0TdWJk+FhjBV3VdedhMSYmIrQUFG2W/m0
        V1B2FHvt1BDjp78k2yXECDULThE5XVU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-rtcRt_uFNBCH0q2GcSfNew-1; Mon, 18 Sep 2023 18:24:58 -0400
X-MC-Unique: rtcRt_uFNBCH0q2GcSfNew-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-655d89a574eso59501416d6.3
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Sep 2023 15:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695075898; x=1695680698;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WG8Pu+Mw6aXgo3oVLCA7cZJ3LSi2mKUayS+JlD6Q7jo=;
        b=jnESe12vCofUEZ8aJQ98Z3o11PW/6vzN1WAaN5JHqJwWxk4gJLKy/SQbe4hCov4s3Z
         j42X7ARJEBRwxPho6MMe+MBv/xt7I69sfZaNMVr0AmAeNa0BL9v9Vo8kTsqUieAAmTGt
         vVucnfIr7VMh29HejRmFVA9MK3zzBHHYf2vWUY5V4wIWFe3PhitDfJDqWoKhF8qMYR76
         ySpGJ37vlIHniH/LSMkGnQYo/EsouPZkMXnLEBxhwVYbvyu0MA8xe+e4iRtBWutjWkjV
         32qBkR8UZFasezMZqjzd0ajleH9TMy7QzlKvTGAhs6kPt9E2wR0hdCZNArqo2axGFjqr
         hvQA==
X-Gm-Message-State: AOJu0YwgKen6STg56YE8JyoyPgr6nBFiRq5c81OgYplAqF8mmgjq7xNg
        /7cjbnSek4KZE5fG+oL3bpiM1e8f/lV2nscUNHflVVJaqVyPhQXqREIXgItONgkkYvRYUnPg5hc
        qqkBJyifEv2MU/yheb3y2TZEu75N7
X-Received: by 2002:a0c:cdcd:0:b0:655:88e9:1b0c with SMTP id a13-20020a0ccdcd000000b0065588e91b0cmr10311583qvn.38.1695075898341;
        Mon, 18 Sep 2023 15:24:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj7nahJ/IxATPNQUGSshqEPQ29nHykvjD/+zTI+gGvnxe5EWaVWGI/vQ9GRABMAcnfQ+LBUg==
X-Received: by 2002:a0c:cdcd:0:b0:655:88e9:1b0c with SMTP id a13-20020a0ccdcd000000b0065588e91b0cmr10311573qvn.38.1695075898129;
        Mon, 18 Sep 2023 15:24:58 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
        by smtp.gmail.com with ESMTPSA id o10-20020a0cf4ca000000b00656329bb3b1sm3217669qvm.10.2023.09.18.15.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 15:24:57 -0700 (PDT)
Message-ID: <10db3f25dc671ca0b8f50be548d409fcd3fc896c.camel@redhat.com>
Subject: Re: [PATCH] nouveau/u_memcpya: fix NULL vs error pointer bug
From:   Lyude Paul <lyude@redhat.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Dave Airlie <airlied@redhat.com>
Cc:     Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Danilo Krummrich <dakr@redhat.com>,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Date:   Mon, 18 Sep 2023 18:24:56 -0400
In-Reply-To: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
References: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Reviewed-by: Lyude Paul <lyude@redhat.com>

I assume you need me to push this to drm-misc?

On Fri, 2023-09-15 at 15:59 +0300, Dan Carpenter wrote:
> The u_memcpya() function is supposed to return error pointers on
> error.  Returning NULL will lead to an Oops.
>=20
> Fixes: 68132cc6d1bc ("nouveau/u_memcpya: use vmemdup_user")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouv=
eau/nouveau_drv.h
> index 3666a7403e47..52a708a98915 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -193,7 +193,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned=
 int size)
>  	size_t bytes;
> =20
>  	if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>  	return vmemdup_user(userptr, bytes);
>  }
> =20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

