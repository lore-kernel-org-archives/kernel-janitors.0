Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD95C3A5A7
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Dec 2022 16:40:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbiLDQkY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 4 Dec 2022 11:40:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbiLDQkW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 4 Dec 2022 11:40:22 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 346A814D19
        for <kernel-janitors@vger.kernel.org>; Sun,  4 Dec 2022 08:40:21 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id h11so15266262wrw.13
        for <kernel-janitors@vger.kernel.org>; Sun, 04 Dec 2022 08:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wbNKJgqamf76QS4A7riHRQ/K/kQjFtOAWIhBQTumKHQ=;
        b=xHGdBi84weUIxIzDT1mYhxwPaFtjMpVnPXMwVxTFMk7BsowhXoG0D+2gWtYa8z4h2d
         3pEmiAP1v1p4mmjjSOtZOGg8n+9uQpo+6sRaaVXtEntR5fdes3m/JKSvT8+uxrHweGoe
         xxHls0AWWr+ZGFrCoaOlcl8qcHF2zKEAhhGKxH5NDD/b/6tSrRV3DvBOBqXnMaTllqu2
         ZKLKy/5zkflIEB8bAC2OOjVpa4tfCvqJ/Ln07AZlgU2zlwc4FEplE+qgZGtLZGqrF703
         PpM8kVKCZTuYhdaLowtdnOkoBwiv/2O1WTpfzT95IJh0yfUXUWdspjLiqzgSYPobxVRl
         wBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wbNKJgqamf76QS4A7riHRQ/K/kQjFtOAWIhBQTumKHQ=;
        b=VaCsNzCrPhIUn67Ndoc/ceRckkC52MmscRhVwSHVSXZEXQ7Aoj7UWZz9J2it7Rd2FK
         b/78WQl4+kjxo/bTTE2DobqzIEsg9D/QJ8TTOA76hxsZhV+8GmZAsHGMM5jppb3PPecw
         AeU8Gsuf+rcgQqJK33SBxclb3o84QeulJaAtgtUw5FlQYU51KPKE5R0YsHvRfXz9ftki
         qzMFMRyy5AN4edsCJqNWXKWO1rJyEeTgk/MU7tgx6W3jGM36H8UmgqZN2x6Ao/qUgfVP
         sZ0VmESqY4e4qP/LNGNs+qKpCD6TnaY1bEPfPHoY+WtJixvdNlV5KxAfs8beZU5AeO5e
         XkLw==
X-Gm-Message-State: ANoB5pkeqgrzVU50nXJLxAfRj1Zh4aoIrok+kLFst720+yHh2eXooIC4
        MAoJ8RFC/2qHA7zC/bWRPZYSog==
X-Google-Smtp-Source: AA0mqf5pX7sHWt7L7PETaiw7GUTCGcD+YISEEYnvFmfUMY9ugjib98oKRwTOzTkkFV1fgorTt7rgbw==
X-Received: by 2002:adf:efcb:0:b0:242:5ff0:6d8a with SMTP id i11-20020adfefcb000000b002425ff06d8amr1553837wrp.135.1670172019766;
        Sun, 04 Dec 2022 08:40:19 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id l9-20020a05600c1d0900b003cf878c4468sm21165858wms.5.2022.12.04.08.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Dec 2022 08:40:19 -0800 (PST)
Message-ID: <c2155e23-d381-c4fb-f98f-be505665f49a@linaro.org>
Date:   Sun, 4 Dec 2022 17:40:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] thermal/core/power allocator: Remove a useless include
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Lukasz Luba <lukasz.luba@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <9adeec47cb5a8193016272d5c8bf936235c1711d.1669459337.git.christophe.jaillet@wanadoo.fr>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <9adeec47cb5a8193016272d5c8bf936235c1711d.1669459337.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 26/11/2022 11:42, Christophe JAILLET wrote:
> This file does not use rcu, so there is no point in including
> <linux/rculist.h>.
> 
> Remove it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

