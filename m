Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB7BC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 14 Jun 2022 19:29:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238913AbiFNT3H (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 14 Jun 2022 15:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234654AbiFNT3G (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Jun 2022 15:29:06 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF7D611465
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jun 2022 12:29:05 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id l4so8309749pgh.13
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jun 2022 12:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=m8sRbdjaWLngut7z7gVlgUwSBUU63aye8jnOzp6qH2M=;
        b=XgMzpWyS3GjTNjevMNPR6KHcV1KnEtzYTsTPCzt2HHnoRzI5Gxvo6rArgXxftkImB8
         5+XgxUWNBlFrNVbfPzyO/XWLXROuSLIJ8MpRYoUffONgcpPtsJpL6BYXq6k2BXbBeZ+7
         YX7RfGu5IgOZRN9mhVB1XXhgx9+i0tKZ0PENvVSKUhGhFYUiVqnCJBszGSWmd+vZ8Iq5
         0xFRwFZdxTgIEAaotIQftpbtFAWZNXK8v8aX/ix2/WEYrYV+biOz3rEn1++aebyy85EC
         PvpqUHPVXwLRjvkwttP/kfbSwEpfscSpDTvtvmhLMz3OkFH1JLLLgxsyxo2+0NK5SYk9
         DW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=m8sRbdjaWLngut7z7gVlgUwSBUU63aye8jnOzp6qH2M=;
        b=1DZPqWui/YYR4qMxicpFHj9A0FbcHvrguabBnNUdQteEaEDJ+/GcQBmnFrTPl4sXXI
         nwo+Ros4kOeSIRACty0bJLb/NNLDI6peKH+x1Bbhg+H97R/Ixj/Abl21d0QsNAlKh62X
         Ka5a7ACZZ4TLmCKzZLsNpHunP3okUFAkBZhIVVHocywzdBCUwMLRhWPUXM/VQ+or+b6T
         VEqwAeeMZeIrikyLKa7vkTlQg8Y8zMe5Yvtd+NSLVhZ0rUbBXn90pVbdwYjX/kZX2Atu
         fRUIUDPAwvAixFdnkp2jkldqr9nYq5SfbhfCWyMtYK9ZrduLCEsfmm/enFSNzdF5r4w8
         qyYQ==
X-Gm-Message-State: AOAM533j8iTFKoet+SNAHqspl4ySgKvKB+Erphi+19L+ZvbQWIR/3S/W
        BFEuC3rUyL+qwn85o/6ajQONpA==
X-Google-Smtp-Source: ABdhPJzixjJR7IV+cO3qB/NPWSKaVfHJnhwUbB+QxeJXWqo4cRUqxA3i998JbaHyIfQwna+qI6BoyA==
X-Received: by 2002:a63:6a06:0:b0:3fd:5a1d:85c5 with SMTP id f6-20020a636a06000000b003fd5a1d85c5mr5876118pgc.130.1655234945184;
        Tue, 14 Jun 2022 12:29:05 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id w14-20020a1709029a8e00b001676f87473fsm7590691plp.302.2022.06.14.12.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 12:29:04 -0700 (PDT)
Message-ID: <475873e3-4166-4e34-7ccc-363dd8963cce@linaro.org>
Date:   Tue, 14 Jun 2022 21:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] MAINTAINERS: adjust ARM/INTEL IXP4XX ARM ARCHITECTURE to
 ixp4xx clean-up
Content-Language: en-US
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220601050200.22213-1-lukas.bulwahn@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220601050200.22213-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 01/06/2022 07:02, Lukas Bulwahn wrote:
> Commit c83227a5d05e ("irq/gpio: ixp4xx: Drop boardfile probe path") and
> commit 155e4306107f ("clocksource/drivers/ixp4xx: Drop boardfile probe
> path") remove files include/linux/irqchip/irq-ixp4xx.h and
> include/linux/platform_data/timer-ixp4xx.h, but miss to adjust MAINTAINERS.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about
> broken references.
> 
> Remove file entries for those files in ARM/INTEL IXP4XX ARM ARCHITECTURE.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
> Linus, please pick this minor non-urgent clean-up patch for ixp4xx arm.
> 
>   MAINTAINERS | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 58e751b9346e..e0f5895feb6b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2196,8 +2196,6 @@ F:	drivers/clocksource/timer-ixp4xx.c
>   F:	drivers/crypto/ixp4xx_crypto.c
>   F:	drivers/gpio/gpio-ixp4xx.c
>   F:	drivers/irqchip/irq-ixp4xx.c
> -F:	include/linux/irqchip/irq-ixp4xx.h
> -F:	include/linux/platform_data/timer-ixp4xx.h
>   
>   ARM/INTEL KEEMBAY ARCHITECTURE
>   M:	Paul J. Murphy <paul.j.murphy@intel.com>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
