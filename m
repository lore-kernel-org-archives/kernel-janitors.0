Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14825C43217
	for <kernel-janitors@archiver.kernel.org>; Fri, 11 Nov 2022 17:45:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233674AbiKKRp1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 11 Nov 2022 12:45:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233344AbiKKRp0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Nov 2022 12:45:26 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B763017AA4
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Nov 2022 09:45:24 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso6055814wma.1
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Nov 2022 09:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+62/H8N3qA4fF65mShzPqInsmQ2kiFkjzX/CYayZemc=;
        b=Q7ffPBrqce2IBsKccJGRmOcJScYRhHwxyvpaRuXw1WswY+mJK8l5FrnUM7NG6Ztyvs
         9LIqjgTCt7rEv6TjSE8Rv99fkYXb+Oz9htE78k3HgWKQD939myR1+21PmWfYQHIuA2da
         TarQRlwXPB9+gorxFc8Qgc4AEH81jiJJ6P3buS3+Vb+LTallU8KtrTW1cx2VqloRROhr
         7LGlFl/Lt+Ecvjv1zSobl3RaBgY0NYhsFs2uOkCD2s1Gc9aJUZeSR0JMwWkP0kpM3/VY
         RhEYc8YqQYm7OUSPk48z1cyqz+LjES6OivohbEzfhZ0THsnqv3bf6cUEWD638B28YD5u
         sZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+62/H8N3qA4fF65mShzPqInsmQ2kiFkjzX/CYayZemc=;
        b=Yag3UP8NEEETR+wTOzLC4+vpTgvXP2zR3/osWFoHTYMy583p78KzawHooGVcEyXj2J
         zl0OA7U9R//g+RosSMVMRXieSL0ZYC1D6Q034N/asA7lcN0Jjk2XPhZJLcZK3lS/PsdV
         83nT4nUeauQf4soopWWy6qsPHo9a9DYyM3sRMqPACsif0k61Qn3i5NxbLXE6kx6sm9sN
         ruMHx8h4jzANSwD+jzmeeuGNgMFdJ4+ME7g2RsrCB/dIhOM+YQfacT5F7Ekn5VzNoA8M
         1paaCvTrBjl10C251ldgs+k658KITptbvsw64Wuip++3EUT15uayYAIEQinM+S2EbMqH
         nnVA==
X-Gm-Message-State: ANoB5plhhzNuoAFDKTQ43/VPSVZKf7Y5S/aNa9Wa6eBuTrw2u4ytSbhp
        GedK+JYVNdSC9MIiMyKl6+bHQA==
X-Google-Smtp-Source: AA0mqf7hYZrT8H8lTjcIt5xrXS0ZXCF3N2oYtMw5KTeawvnJnOnE3bGHF6HHvfTOVtaWtLwXVgCA2A==
X-Received: by 2002:a05:600c:602a:b0:3cf:b2b1:3c7 with SMTP id az42-20020a05600c602a00b003cfb2b103c7mr1987987wmb.176.1668188723319;
        Fri, 11 Nov 2022 09:45:23 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id r8-20020a056000014800b002206203ed3dsm2496790wrx.29.2022.11.11.09.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 09:45:22 -0800 (PST)
Message-ID: <a0fc3e13-3705-df71-e217-ddd5de4ae60a@linaro.org>
Date:   Fri, 11 Nov 2022 17:45:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] nvmem: Kconfig: Fix spelling mistake "controlls" ->
 "controls"
Content-Language: en-US
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221007202636.2755985-1-colin.i.king@gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221007202636.2755985-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 07/10/2022 21:26, Colin Ian King wrote:
> There is a spelling mistake in a Kconfig description. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Applied thanks,

--srini
>   drivers/nvmem/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index ec8a49c04003..755f551426b5 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -164,7 +164,7 @@ config NVMEM_MICROCHIP_OTPC
>   	depends on ARCH_AT91 || COMPILE_TEST
>   	help
>   	  This driver enable the OTP controller available on Microchip SAMA7G5
> -	  SoCs. It controlls the access to the OTP memory connected to it.
> +	  SoCs. It controls the access to the OTP memory connected to it.
>   
>   config NVMEM_MTK_EFUSE
>   	tristate "Mediatek SoCs EFUSE support"
