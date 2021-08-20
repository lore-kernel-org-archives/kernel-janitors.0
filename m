Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3707C4338F
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Aug 2021 00:03:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D6DF60FDC
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Aug 2021 00:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236872AbhHTADt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Aug 2021 20:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237066AbhHTADt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Aug 2021 20:03:49 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4026FC061575
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Aug 2021 17:03:12 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id a21so7037538pfh.5
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Aug 2021 17:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=vRFO+rG5NKULoNq4nrGremPyKJ3sp4O0aBsDwvD+Jws=;
        b=bUVS0z1tbTEuTnJpUI0DCsREOWqYBS393adFo6vkPpAcDd3VFldkcu6Bu8+NPNkVIr
         zVB/aqzwm03BccvSPAo1MxAZoGqM1V3G7Ml6IdOp9vADp+ZnRlfr9+qSxRd7e6+I4Agi
         5JhMzvnd1IByLpNrXS8swwAmSNZRyvnAn463M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=vRFO+rG5NKULoNq4nrGremPyKJ3sp4O0aBsDwvD+Jws=;
        b=QTnItiebh2lAUL8jhmMvZH5bbgXSouu2ilIRm7HHLsTU3EEX1CQFkQ9qMaY1nP/n4a
         490nGTW1IBeooZAr9dETFRJXF4ZauUjdyVSbEAEOS7pHeAd669CI8W3ECoayGNEnQWv2
         /hK/3eAWeJ/X166VgMKZrl0ot3bMe8ZTt5Ms/n/oJPnwnADM4vBau+HUSa0nQvoCW0xL
         Wu8uB0sf4hdF6xGqNMOeVRRnvhPjrUU0dIz99zo2w/wdVJqVoa+njzQ+n2xCAHNPVII3
         5vxfJmx64InEuKX5TtKYqTSdhiT2PG6+wi2teKAPbay7ZHKmdpwO6zg3q2BW4rZ5V7QD
         IYcQ==
X-Gm-Message-State: AOAM5307UlZAqtOkFMvZrJKNN5dNay1xPokktIyC/LUv5/8ApiZGPiRP
        nV1ZlZdAfihoC+OvAAgy7nM69g==
X-Google-Smtp-Source: ABdhPJxUAM4AJRANovdfNIBfj6aTNBPXbXy30qW0KYGlBj+lnS2H5nQpOUOt6OPGf27oUrWy+/Ipjg==
X-Received: by 2002:a63:2242:: with SMTP id t2mr15735424pgm.111.1629417791779;
        Thu, 19 Aug 2021 17:03:11 -0700 (PDT)
Received: from localhost ([2001:4479:e000:e400:3a83:f47e:d5a3:378a])
        by smtp.gmail.com with ESMTPSA id d15sm3189825pfh.34.2021.08.19.17.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 17:03:11 -0700 (PDT)
From:   Daniel Axtens <dja@axtens.net>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Neuling <mikey@neuling.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        kernel-janitors@vger.kernel.org, stable@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] powerpc: rectify selection to
 ARCH_ENABLE_SPLIT_PMD_PTLOCK
In-Reply-To: <20210819113954.17515-3-lukas.bulwahn@gmail.com>
References: <20210819113954.17515-1-lukas.bulwahn@gmail.com>
 <20210819113954.17515-3-lukas.bulwahn@gmail.com>
Date:   Fri, 20 Aug 2021 10:03:08 +1000
Message-ID: <87pmu99e4j.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:

> Commit 66f24fa766e3 ("mm: drop redundant ARCH_ENABLE_SPLIT_PMD_PTLOCK")
> selects the non-existing config ARCH_ENABLE_PMD_SPLIT_PTLOCK in
> ./arch/powerpc/platforms/Kconfig.cputype, but clearly it intends to select
> ARCH_ENABLE_SPLIT_PMD_PTLOCK here (notice the word swapping!), as this
> commit does select that for all other architectures.
>
> Rectify selection to ARCH_ENABLE_SPLIT_PMD_PTLOCK instead.
>

Yikes, yes, 66f24fa766e3 does seem to have got that wrong. It looks like
that went into 5.13.

I think we want to specifically target this for stable so that we don't
lose the perfomance and scalability benefits of split pmd ptlocks:

Cc: stable@vger.kernel.org # v5.13+

(I don't think you need to do another revision for this, I think mpe
could add it when merging.)

I tried to check whether we accidentally broke SPLIT_PMD_PTLOCKs while
they were disabled:

 - There hasn't been any change to the pgtable_pmd_page_ctor or _dtor
   prototypes, and we haven't made any relevant changes to any of the
   files in arch/powerpc that called it.

 - I checked out v5.13 and powerpc/merge, applied this patch, built a
   pseries_le_defconfig and boot tested it in qemu. It didn't crash on
   boot or with /bin/sh and some shell commands, but I didn't exactly
   stress test the VM subsystem either.

This gives me some confidence it's both good for powerpc and stable-worthy.

Overall:
Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

> Fixes: 66f24fa766e3 ("mm: drop redundant ARCH_ENABLE_SPLIT_PMD_PTLOCK")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  arch/powerpc/platforms/Kconfig.cputype | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 6794145603de..a208997ade88 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -98,7 +98,7 @@ config PPC_BOOK3S_64
>  	select PPC_HAVE_PMU_SUPPORT
>  	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
>  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
> -	select ARCH_ENABLE_PMD_SPLIT_PTLOCK
> +	select ARCH_ENABLE_SPLIT_PMD_PTLOCK
>  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>  	select ARCH_SUPPORTS_HUGETLBFS
>  	select ARCH_SUPPORTS_NUMA_BALANCING
> -- 
> 2.26.2
