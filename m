Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95C7C54EBD
	for <kernel-janitors@archiver.kernel.org>; Thu, 12 Jan 2023 09:03:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239750AbjALJC5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 12 Jan 2023 04:02:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239788AbjALJB1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Jan 2023 04:01:27 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1E84ECA9
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Jan 2023 00:57:43 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id az20so24000789ejc.1
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Jan 2023 00:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9gdt6mH2qXqR64IjGhfzVvhvZf1/l3ziFWOV6P1ug3Y=;
        b=u+8Z0AIUVl7SPy8uUbKf1dBpNEGj1vYTwpJg8g4SRaW8sS8ngIZlMMEZl2e2cmNIBE
         yA6J76BnF9v7tZarxZcwKc9voD8bfFpa3UuNKpfJj3icoUEK7M23qS5sfYcoioHOJiVf
         nYNAFWt6bFwR+PxtpLu5vBfPtlHGXoNCcfhxUeGCaYwEUX9i8uZKPz94i6AnM7ZRDfgw
         VrxCnsD7p64AnALovyjDJ2J2x1lbb43KQdiv1VVS2DKEQwiB+YePMuQfgwXBGHIMSt7/
         SGQuuj17Ppt2SP+aSPv0+A/E5qtkLOVD5GVEpfciE+d/iJ9/tzQOeZhW0bQ6Va0tSG0z
         P/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9gdt6mH2qXqR64IjGhfzVvhvZf1/l3ziFWOV6P1ug3Y=;
        b=ds2eJ2xxnOwPgHjqBVMiOEIoT3+YS4ejjBwBirL4BLDI8acnoyJrEFvIjl7htnxFlK
         mowqEIpXPpBG/OeQ9IUmfm2PoWOHm+09nRvmsTeXnU0NdaKOAomzEK/UDTu7z2qzUP/e
         g5BbUtMDBfKsIg1Oea3uOd+ZfU9GDWmoTCCQZ5NZTL2NoYp1jbc7HOvD6cRTMhShAe5n
         h9CiRBZ319Q+dIVITtkhtOdUSgStdReRSsw1oejyMvnRpSoHYhyNAFiErVQBp9iAZl4m
         q5nQVWbBogcQX9tmR/Rztjqgj7GUWg5+QOeQosCAVuPi3whaq1cyaS5Yb0jVcHVSSfmG
         5n6g==
X-Gm-Message-State: AFqh2kqVlTM0JJ5derkPtPeYKrSyqg3aGItinqsSdhNi/LcHdPYvxTIS
        K9nn95anrK2iuqIOsPf+FbC/YQ==
X-Google-Smtp-Source: AMrXdXszmAiXSd265ELT3ixgr5T5uiKMnafyv3E0Y1jt8pgRpenFeEB6jrDJ+86Qk/KRI6wMWHqG1Q==
X-Received: by 2002:a17:906:5202:b0:7c1:4a3:10b6 with SMTP id g2-20020a170906520200b007c104a310b6mr63048868ejm.53.1673513862243;
        Thu, 12 Jan 2023 00:57:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r8-20020aa7c148000000b0046951b43e84sm6921504edp.55.2023.01.12.00.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 00:57:41 -0800 (PST)
Message-ID: <772b3694-e889-69a3-7ac2-d17eea0f4fdd@linaro.org>
Date:   Thu, 12 Jan 2023 09:57:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/4] ARM: s3c: remove obsolete s3c-cpu-freq header
Content-Language: en-US
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230112083746.9551-1-lukas.bulwahn@gmail.com>
 <20230112083746.9551-2-lukas.bulwahn@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230112083746.9551-2-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 12/01/2023 09:37, Lukas Bulwahn wrote:
> The s3c-cpu-freq header was previously included by:
> 
>   ./arch/arm/mach-s3c/mach-bast.c
>   ./arch/arm/mach-s3c/mach-osiris-dvs.c
>   ./arch/arm/mach-s3c/mach-osiris.c
>   ./include/linux/soc/samsung/s3c-cpufreq-core.h
> 
> Commit a4946a153cb9 ("ARM: s3c: remove all s3c24xx support") removes the
> files in ./arch/arm/mach-s3c/; commit daf0ee583fc7 ("cpufreq: remove
> s3c24xx drivers") removes the file s3c-cpufreq-core.h.
> 
> Remove this obsolete header file.
> 
> This issue was identified, as s3c-cpu-freq.h referred to the removed config
> ARM_S3C_CPUFREQ.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  include/linux/soc/samsung/s3c-cpu-freq.h | 145 -----------------------
>  1 file changed, 145 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

