Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869DDC47083
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Jun 2021 07:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 671D661042
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Jun 2021 07:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbhFBHwi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 2 Jun 2021 03:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbhFBHwh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Jun 2021 03:52:37 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAECC061574
        for <kernel-janitors@vger.kernel.org>; Wed,  2 Jun 2021 00:50:53 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id h24so2488567ejy.2
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Jun 2021 00:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VY1iZwIBhUlZ72YXvpAem8SwH7oltFUP+kYp7zCLOFw=;
        b=sTyRKFEQflZ4nbEcYajpc/Txd8xlDzzpT50nrZEUlhtsxgk0RJSpkPfptR2+Eugkgt
         gBUEYlGUhFUU/z5HQerEA5sruG1gyD4M3gcjZUaKYl/LQPE3BHY2goEcd5b38M1S+Tfp
         uWH4tK9GaDofqTDSrxp4BeEQOSThhs/3LQwqrsfdeKSRl9ZUEYgwnbN5N7yGcq+g0Hje
         FsNBaSD4028vciZDTu+2fN7pKqgU8Lqo4qAmrw7z738Df1pp4f/EIliXFhX+knNg3lfI
         BxxT3ho3CKPdJJUn0EnAJ1ijj7VhbU8EF1q6IrFFh1DRRNzEjs1i7HCR3qmgaGcK+Z6C
         AlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VY1iZwIBhUlZ72YXvpAem8SwH7oltFUP+kYp7zCLOFw=;
        b=PMhPW8rlIexhsJwcoJL2ZQ9ROOIUYjlOmMlVIpOyVin/WGL6nD3zipkTYdRCBlxbNM
         4unQV+7GoRY3K+SjkIx9wSALnuo9hR2cTOdJZgTMGg7lmJHBUjtIAyJPmlRUEwEFTPX+
         bYWkYAs1WYrc1kl+OawJbPNflSY7mjcim9IVUg1/NqjFtqoBAfZfjvHnO27TJnn06eSz
         vQg5bBzOvgLlWE7/aqaEhjuBV1QZ+Z8f2qhv/HkkfMDYHEV5//YWJx9/9fosllKH7ffF
         BAZDTnI8Zj4BGmIH/ny7Vd4rppcJN5N5qBLdGhqNCsWDCxH2BzX1VfVGJnjig2pFEeaX
         0vfA==
X-Gm-Message-State: AOAM530bW3Ff2GA9D2SCCZbP8Haoxe21X+9qv9c6qgI677BGSSC7NOaM
        bnDv2825RPw1ZIuY1reLO4Ir3lIBSs/5asCM
X-Google-Smtp-Source: ABdhPJz95yJCoDmlG3Ec7cqaFUhfk9im/Gn8l1Z6M9MylMBHaviMyieZUKSaRBnpz1zwSDLYP5aOIQ==
X-Received: by 2002:a17:906:4e81:: with SMTP id v1mr24204eju.125.1622620252474;
        Wed, 02 Jun 2021 00:50:52 -0700 (PDT)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id r19sm775556eds.75.2021.06.02.00.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 00:50:51 -0700 (PDT)
Subject: Re: [PATCH] arch: microblaze: Fix spelling mistake "vesion" ->
 "version"
To:     Colin King <colin.king@canonical.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210601103707.9701-1-colin.king@canonical.com>
From:   Michal Simek <monstr@monstr.eu>
Message-ID: <b46ad1a5-7901-443a-16e5-17f7695d7183@monstr.eu>
Date:   Wed, 2 Jun 2021 09:50:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210601103707.9701-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 6/1/21 12:37 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the comment. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/microblaze/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
> index b41f323e1fde..6d4af39e3890 100644
> --- a/arch/microblaze/Makefile
> +++ b/arch/microblaze/Makefile
> @@ -3,7 +3,7 @@ KBUILD_DEFCONFIG := mmu_defconfig
>  
>  UTS_SYSNAME = -DUTS_SYSNAME=\"Linux\"
>  
> -# What CPU vesion are we building for, and crack it open
> +# What CPU version are we building for, and crack it open
>  # as major.minor.rev
>  CPU_VER   := $(shell echo $(CONFIG_XILINX_MICROBLAZE0_HW_VER))
>  CPU_MAJOR := $(shell echo $(CPU_VER) | cut -d '.' -f 1)
> 

Applied.
M

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

