Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACC0C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 Jan 2022 18:17:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346323AbiATSR2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 Jan 2022 13:17:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243805AbiATSRZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Jan 2022 13:17:25 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E75AC06161C
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jan 2022 10:17:25 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id c9so5799104plg.11
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jan 2022 10:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=7jmbFAZoe/0Han6gI2djD1GVPo4KRWYjMtQ4Zw3deJU=;
        b=f+BELza4AuuQ23XiU8+1ewgvZtVFgJgiMiFbei874Hw+syDHOYNnHcUXQ4xpw/9R8k
         TPa4c2/5kDGNk+j8nvoxsG6zcJS0ApIHl6/R2CzzZ4PWJQNebwrumXyiOX2jiqDwcNT8
         LnKcRb31H8fkVVX9vChfpJAwxj6JajBBFIMIyBHk3/iJB/QwfHV66t0OrjFdXnS848Xj
         zB9rklLTeMbpa8rKQ9MAIzgYBvV7UhBXlqnTwqXaJS+/3yUwX1bt7txkGAqS5mC9DDQK
         W/86vBAnOUCHUDR9XVNVyjLJ9EW3S7zN3hiIR+pagNuVHQKWOcqG5LTpggTIXqCfnZnt
         mLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=7jmbFAZoe/0Han6gI2djD1GVPo4KRWYjMtQ4Zw3deJU=;
        b=u80vciTl+dACn1C/1cB14CIyciJudACaf0Uh09yn5LpQ0ElER2ndylNb8WFd4u96Fj
         2Q7ZjkK689bwr5YzqlsBXqT1rmA3EGC3zfN5kAYelMoing0f2jzPyk1owFzTx99ss9UH
         HYRx2KD/uNMolWWIS/NUymfnrk6JHUBDxtD2z7LBLp2rG9JN4+JY9l/mCXwrWer3d0GV
         jifZxNNK/a57jgKhraYsQk/5ambyjBf8k9B1dROeB/mfm15cMtMli2J+X/ZlSmZCRYsB
         O7FjTTDKnWDjA1dt5xpITRkNH7rZSYsAAaLtvoymk4VJD1pmWoXwJOyy0R43vyFvInuA
         yGng==
X-Gm-Message-State: AOAM533EYQz/CsfqmcWifXxntQPhSpC8o7lt79KeUnmA1knYmINR2o8T
        eOUXiwbAVdcDao9FjFRKl6m4+w==
X-Google-Smtp-Source: ABdhPJxfyuHTlrcI/Y+aEdEmUiAgy8Du+WABE60SAYyyZx8a9UnJxCSygRQkFRFIvKDxFAWsOie3ag==
X-Received: by 2002:a17:902:a3c7:b0:14a:d8bf:4e09 with SMTP id q7-20020a170902a3c700b0014ad8bf4e09mr215164plb.62.1642702645044;
        Thu, 20 Jan 2022 10:17:25 -0800 (PST)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id i1sm2996512pgt.82.2022.01.20.10.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 10:17:24 -0800 (PST)
Date:   Thu, 20 Jan 2022 10:17:24 -0800 (PST)
X-Google-Original-Date: Thu, 20 Jan 2022 10:14:17 PST (-0800)
Subject:     Re: [PATCH] riscv: canaan: remove useless select of non-existing config SYSCON
In-Reply-To: <20211229192458.25138-1-lukas.bulwahn@gmail.com>
CC:     damien.lemoal@wdc.com, Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        lukas.bulwahn@gmail.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     lukas.bulwahn@gmail.com
Message-ID: <mhng-d060c520-cef0-454b-b6b6-0c75282bf8e0@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 29 Dec 2021 11:24:58 PST (-0800), lukas.bulwahn@gmail.com wrote:
> The config SYSCON never existed in the kernel repository; so, the select of
> that config in ./drivers/soc/canaan/Kconfig has no effect.
>
> Presumably, this was just some mistake, assuming some symmetry in handling
> and naming of configs that simply does not exist.
>
> Remove this useless select of a non-existing config.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  drivers/soc/canaan/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
> index 853096b7e84c..2527cf5757ec 100644
> --- a/drivers/soc/canaan/Kconfig
> +++ b/drivers/soc/canaan/Kconfig
> @@ -5,7 +5,6 @@ config SOC_K210_SYSCTL
>  	depends on RISCV && SOC_CANAAN && OF
>  	default SOC_CANAAN
>          select PM
> -        select SYSCON
>          select MFD_SYSCON
>  	help
>  	  Canaan Kendryte K210 SoC system controller driver.

Thanks, this is on for-next.
