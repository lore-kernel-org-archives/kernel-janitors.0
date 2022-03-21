Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7E6C433EF
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Mar 2022 05:11:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344123AbiCUFNL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 21 Mar 2022 01:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343527AbiCUFNK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 21 Mar 2022 01:13:10 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C67064C78D
        for <kernel-janitors@vger.kernel.org>; Sun, 20 Mar 2022 22:11:45 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d18so11734067plr.6
        for <kernel-janitors@vger.kernel.org>; Sun, 20 Mar 2022 22:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ljtCtXdVDHvboQzqZn2Q/lABoXg83zrD6bjOe7HHLFQ=;
        b=zfrmFyu/ZYdoUki2x8lfXqzA+xFOfDNne30+A0kuctzZXnrUfD659CDieFanTrv3ym
         h7/+Mi9WRZ8kPZXyA2Y27+TEoVcM3QsxC8yjssKaQgYIvuKCwEYlB3Wnyfr4cFQyTaK1
         nZ4s7AJMu7uVqv4/UnjgC8rv6vmx1l4/ycjLOnkiVxihvPOarlJvT1pnSRLkSeyqMRO5
         1qJl9DJK93bcaINaFdqtb9UQo84Y4IuUmTxZHvmmDep2CP0z9r9lEE6bISsIM8eCBXvo
         uPppjNLRkdm1iCvcgOQmohE4QG+QzsF8ONc1U9VYeQaBcQPx+aaTA/Fd7WgnHb+z0bVV
         Dd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ljtCtXdVDHvboQzqZn2Q/lABoXg83zrD6bjOe7HHLFQ=;
        b=dQXDzCyu60tMH+X70lvwIkVZkzgioA7eBS3atDSxjStEHwwuGuDKdiK4EPQthoaJ9N
         jqvHyaZVSsYFhPAArshN+Ggqb8x1IVXVux+oLh90EiFRq+dDaX0IP7mU9Mz9r8PSzisw
         0LxzZwk7m8c3frh+uJRqDmPDZKmrNZh3zbAR4m61oeVzLc2MenC6EYdX5lZ/clf2RlTL
         ikRk/4Urn6GIZtGqzJZyfiaiSqPksAEkvDM/Iioo9besowHlYsRq3i76kKSkNBpSnyzS
         /9oixB/CW9fm7rsjmU8gTZ5xLMdMchR1KJbVU8wWEPlSLA+dK+0bHSdEos6X5w9N41nA
         KTcA==
X-Gm-Message-State: AOAM533B8fp5+lSIMGjZtfvpYr4AEz/Gu4wKQbK1KIeZi5+onGxG8gdH
        fTntplY9V4/DLhPaM5TydBisoaYWgoPcXQ==
X-Google-Smtp-Source: ABdhPJxpP7IH2vtw0+4J1t9nHjBU4tJNb2wQP+R8AXexRkuTkU6j6fBJND4g9OSGcNQaJ2MyM1HtBQ==
X-Received: by 2002:a17:902:700b:b0:148:ee33:70fe with SMTP id y11-20020a170902700b00b00148ee3370femr11279112plk.38.1647839505294;
        Sun, 20 Mar 2022 22:11:45 -0700 (PDT)
Received: from localhost ([223.184.83.228])
        by smtp.gmail.com with ESMTPSA id o5-20020a655bc5000000b00372f7ecfcecsm13170925pgr.37.2022.03.20.22.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 22:11:44 -0700 (PDT)
Date:   Mon, 21 Mar 2022 10:41:42 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Viresh Kumar <vireshk@kernel.org>, kernel-janitors@vger.kernel.org,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: spear: fix typos in comments
Message-ID: <20220321051142.pkihlm6bnclmtdrq@vireshk-i7>
References: <20220318103729.157574-21-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318103729.157574-21-Julia.Lawall@inria.fr>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 18-03-22, 11:37, Julia Lawall wrote:
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  arch/arm/mach-spear/spear13xx.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-spear/spear13xx.c b/arch/arm/mach-spear/spear13xx.c
> index 74d1ca2a529a..b38391e9d8bf 100644
> --- a/arch/arm/mach-spear/spear13xx.c
> +++ b/arch/arm/mach-spear/spear13xx.c
> @@ -29,7 +29,7 @@ void __init spear13xx_l2x0_init(void)
>  	/*
>  	 * 512KB (64KB/way), 8-way associativity, parity supported
>  	 *
> -	 * FIXME: 9th bit, of Auxillary Controller register must be set
> +	 * FIXME: 9th bit, of Auxiliary Controller register must be set
>  	 * for some spear13xx devices for stable L2 operation.
>  	 *
>  	 * Enable Early BRESP, L2 prefetch for Instruction and Data,

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
