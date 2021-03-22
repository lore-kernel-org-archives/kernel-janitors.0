Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99484C433DB
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 Mar 2021 02:47:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AA2C61930
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 Mar 2021 02:47:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbhCVCqx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 21 Mar 2021 22:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbhCVCqr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 21 Mar 2021 22:46:47 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B565C061574;
        Sun, 21 Mar 2021 19:46:47 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id l3so9976272pfc.7;
        Sun, 21 Mar 2021 19:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=ROrvaACa9JFo5JYfkhQ5xT+HNviJr75NpvRYSiGrQY0=;
        b=CdIc2p6wl8pgrq+L9C/WOp5shBZ8eAYIj5Su6jyrnILApkbqSZh8lpsa7SobD5t4nJ
         WjtoobZXECzRcztRxpG2oKrwLev2/pS692wdjrbY+ljuaulIg0wDgiLNO2mmmi++WpIu
         B2stIGEKNSvkBjeC7H3prZu48UxuQ26URpeAXSqrbhn2lu0OTaQETGN5+DFeHWRA4BCY
         iNewr+pCJUckhfCAdNxSQShvGMjhaxbE8CUUBpYOWJgrZX7aAy8wRx5OIaNby38cSG6y
         HPfwsAznYMJP172P2uyyLKPbfC3MHBmDBXeXuHXy/T8v1Tn40rfjm873wsVbX2aHsqU7
         lLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=ROrvaACa9JFo5JYfkhQ5xT+HNviJr75NpvRYSiGrQY0=;
        b=fOmUP9RdrMtdmecMeEtcR7TC88mA1ODlh9jjRgAPnNZUoOUNEh30UKO4vO/2ovtEGd
         wgHdOLkMgxwjkSAeRSs9mOctn77r95d4O6Wf3ofo3su4sxWGkp+3B+pirXntcJWdd7ws
         /T47EOtL8+rXxSBz05SiW7gFRl8+nvGQm91NXWRg6JKcqkx8i/Uf4fLcLMy1AU7brd7S
         soj6o5mY+VvMA0HCa1qmc09jUhdNSY7SnceKyaMmFXgBWJLgMYbKuD2CZwagI4/1uJ7J
         opQ1PIjZ48ZrN8Vx5HLc62nRpWIQzfg0Dip84XBx1n6RijHJnmY+ZLMneDpYiC9fmK4f
         OFow==
X-Gm-Message-State: AOAM532TG1iOvPix5yPdGQZpZn0PgbxNNd1u6SXYIZ1LFxMcVdZNIDI5
        AtRFGCtA49WhtEQhxe89sUIottc694g=
X-Google-Smtp-Source: ABdhPJwfFsd694+wMyX4mbtZFeSavL4b/+VWKM8IKCcOqj8Yr8G9hzvBwLqJaLUJTUrK60NqlM50Og==
X-Received: by 2002:a05:6a00:a95:b029:1ee:471f:e323 with SMTP id b21-20020a056a000a95b02901ee471fe323mr18880496pfl.69.1616381206887;
        Sun, 21 Mar 2021 19:46:46 -0700 (PDT)
Received: from localhost ([58.84.78.96])
        by smtp.gmail.com with ESMTPSA id v27sm11703351pfi.89.2021.03.21.19.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 19:46:46 -0700 (PDT)
Date:   Mon, 22 Mar 2021 12:46:40 +1000
From:   Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH][next] mm/vmalloc: fix read of uninitialized pointer area
To:     Andrew Morton <akpm@linux-foundation.org>,
        Colin King <colin.king@canonical.com>, linux-mm@kvack.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210318155955.18220-1-colin.king@canonical.com>
In-Reply-To: <20210318155955.18220-1-colin.king@canonical.com>
MIME-Version: 1.0
Message-Id: <1616381157.eirpjq5f8p.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Excerpts from Colin King's message of March 19, 2021 1:59 am:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There is a corner case where the sanity check of variable size fails
> and branches to label fail and shift can be less than PAGE_SHIFT
> causing area to never be assigned. This was picked up by static
> analysis as follows:
>=20
>     1. var_decl: Declaring variable area without initializer.
>        struct vm_struct *area;
>=20
>    ...
>=20
>     2. Condition !size, taking true branch.
>        if (!size || (size >> PAGE_SHIFT) > totalram_pages())
>     3. Jumping to label fail.
>                goto fail;
>=20
>     ...
>=20
>     4. Condition shift > 12, taking false branch.
> 	fail:
> 		if (shift > PAGE_SHIFT) {
> 			shift =3D PAGE_SHIFT;
> 			align =3D real_align;
> 			size =3D real_size;
> 			goto again;
> 		}
>=20
>      Uninitialized pointer read (UNINIT)
>      5. uninit_use: Using uninitialized value area.
>  		if (!area) {
> 			...
> 		}
>=20
> Fix this by setting area to NULL to avoid the uninitialized read
> of area.
>=20
> Addresses-Coverity: ("Uninitialized pointer read")
> Fixes: 92db9fec381b ("mm/vmalloc: hugepage vmalloc mappings")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks good to me.

Acked-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

> ---
>  mm/vmalloc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 96444d64129a..4b415b4bb7ae 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2888,8 +2888,10 @@ void *__vmalloc_node_range(unsigned long size, uns=
igned long align,
>  	unsigned long real_align =3D align;
>  	unsigned int shift =3D PAGE_SHIFT;
> =20
> -	if (!size || (size >> PAGE_SHIFT) > totalram_pages())
> +	if (!size || (size >> PAGE_SHIFT) > totalram_pages()) {
> +		area =3D NULL;
>  		goto fail;
> +	}
> =20
>  	if (vmap_allow_huge && !(vm_flags & VM_NO_HUGE_VMAP) &&
>  			arch_vmap_pmd_supported(prot)) {
> --=20
> 2.30.2
>=20
>=20
