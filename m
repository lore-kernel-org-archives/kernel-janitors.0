Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E49C433F5
	for <kernel-janitors@archiver.kernel.org>; Mon, 14 Mar 2022 08:50:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236184AbiCNIvL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 14 Mar 2022 04:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234157AbiCNIvK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 14 Mar 2022 04:51:10 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65CB1A3B2
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Mar 2022 01:50:00 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id n33-20020a05600c3ba100b003832caf7f3aso8033571wms.0
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Mar 2022 01:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ZkMBpAgcdIdxzeU26849eUUSSeeFFj2Wo/UieMy9a9E=;
        b=x2GtjV48948gQDq1yJMOuI5V8cHDoZ+NUWL+IZNPDR/YiOXjiqHSD4FF2/yDvuiWzM
         j8t+jjPiVKmAaKYp6SDWuREY3KZZK9eYKo6upQfYzZOC5jLOvTSWXc9rt5nkde3y3BtQ
         iEoNaZ14dtyFfuNQHT1ngjOfPNoGNPefVxzmAmiO0+Ak8ZfOr8Rfml1n7gaBfYajXuVn
         BwZ0UVXqxzIEJNHbKX5uRMF2fqCbOx0SLb0x7vvKBHiIjqpbmK/Cd2uTMEWPiviLbKdu
         aEoWamrAdm40+sZs8BZpEdrxldqvF2Wyyxc/cdDJLPPhhFZMvh/4+7ky6KVRcL8M49kX
         S+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZkMBpAgcdIdxzeU26849eUUSSeeFFj2Wo/UieMy9a9E=;
        b=BfswnrHxKrvXJx1EHXo0LeHImM/2Idl9gCQlMpPXE1UQaqdc+JgM5LQ2/96o/+8sD4
         lYvRfFagaJP5X0FathnpgCzjO1afrZIErbUNPa0WvhHO4amPDs3mzWPHYWFFlFdKDIWW
         wJqWudgahfNtlUfKSFPh5oemGepk3qnur4DZXP/6tp4nxjEWpKCppaBAFtLCiEGqka08
         zRrpPm/tTAUQWt91ln0hH2M7pKQOCTR1bWpclkmYMw/cxuzQvIIGVHErnuEeL/wwp5h0
         pogbL2QYtsj2Vyfk/kLMsqRnLzG8a44X5UdFem7nKuchgi0BS07xhCm3820rABgg3GKo
         s63w==
X-Gm-Message-State: AOAM533d8siNCGmRFaqXuMaD7hUTnLD8IM2tNwVViESVNXKwlrPfnHRO
        eymf0VG3tBYOUtHJG6KpvZIcfg==
X-Google-Smtp-Source: ABdhPJy0ZU6gwldc++XxxPShUhL3YrniIs6Tew8W4NqYNKucwN0jJcXVR8VAeuOEYjUb88cr/orFsw==
X-Received: by 2002:a05:600c:3556:b0:389:f440:50e6 with SMTP id i22-20020a05600c355600b00389f44050e6mr10479672wmq.159.1647247799313;
        Mon, 14 Mar 2022 01:49:59 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id f7-20020a0560001a8700b00203c23e55e0sm1012672wry.78.2022.03.14.01.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 01:49:58 -0700 (PDT)
Date:   Mon, 14 Mar 2022 08:49:57 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: ab8500: clean up definitions in header after
 debugfs removal
Message-ID: <Yi8BtWlhWjiUOADk@google.com>
References: <20220311145209.17346-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220311145209.17346-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 11 Mar 2022, Lukas Bulwahn wrote:

> Commit 3d4d1266597c ("mfd: ab8500: Drop debugfs module") removes the config
> AB8500_DEBUG in drivers/mfd/Kconfig, but missed a reference to this config
> in include/linux/mfd/abx500/ab8500.h.
> 
> The functions ab8500_dump_all_banks() and ab8500_debug_register_interrupt()
> in the ab8500 header, previously with definitions conditioned on
> AB8500_DEBUG, are now completely needless to define and handle at all.
> 
> The function ab8500_debug_register_interrupt() is not used at all and can
> just be removed.
> 
> The function ab8500_dump_all_banks() is just registered in the abx500_ops
> struct in the dump_all_banks field, but this is then not further referenced
> anywhere else at all. So, safely drop the dump_all_banks field from
> abx500_ops and delete the ab8500_dump_all_banks() definition.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Linus, Lee, please pick this clean-up on top of the commit above.
> 
>  drivers/mfd/ab8500-core.c         | 3 +--
>  include/linux/mfd/abx500.h        | 1 -
>  include/linux/mfd/abx500/ab8500.h | 9 ---------
>  3 files changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
> index 6a059270acdc..9049030a0c82 100644
> --- a/drivers/mfd/ab8500-core.c
> +++ b/drivers/mfd/ab8500-core.c
> @@ -328,8 +328,7 @@ static struct abx500_ops ab8500_ops = {
>  	.set_register_page = NULL,
>  	.mask_and_set_register = ab8500_mask_and_set_register,
>  	.event_registers_startup_state_get = NULL,
> -	.startup_irq_enabled = NULL,
> -	.dump_all_banks = ab8500_dump_all_banks,
> +	.startup_irq_enabled = NULL

Leave the ',' in please.  It will save on churn.


>  };
>  
>  static void ab8500_irq_lock(struct irq_data *data)
> diff --git a/include/linux/mfd/abx500.h b/include/linux/mfd/abx500.h
> index 7f07cfe44753..507e3d2f062f 100644
> --- a/include/linux/mfd/abx500.h
> +++ b/include/linux/mfd/abx500.h
> @@ -63,7 +63,6 @@ struct abx500_ops {
>  	int (*mask_and_set_register) (struct device *, u8, u8, u8, u8);
>  	int (*event_registers_startup_state_get) (struct device *, u8 *);
>  	int (*startup_irq_enabled) (struct device *, unsigned int);
> -	void (*dump_all_banks) (struct device *);
>  };
>  
>  int abx500_register_ops(struct device *core_dev, struct abx500_ops *ops);
> diff --git a/include/linux/mfd/abx500/ab8500.h b/include/linux/mfd/abx500/ab8500.h
> index 302a330c5c84..42fd5da7d8a7 100644
> --- a/include/linux/mfd/abx500/ab8500.h
> +++ b/include/linux/mfd/abx500/ab8500.h
> @@ -503,13 +503,4 @@ static inline int is_ab9540_2p0_or_earlier(struct ab8500 *ab)
>  
>  void ab8500_override_turn_on_stat(u8 mask, u8 set);
>  
> -#ifdef CONFIG_AB8500_DEBUG
> -extern int prcmu_abb_read(u8 slave, u8 reg, u8 *value, u8 size);
> -void ab8500_dump_all_banks(struct device *dev);
> -void ab8500_debug_register_interrupt(int line);
> -#else
> -static inline void ab8500_dump_all_banks(struct device *dev) {}
> -static inline void ab8500_debug_register_interrupt(int line) {}
> -#endif
> -
>  #endif /* MFD_AB8500_H */

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
