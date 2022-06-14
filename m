Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70288CCA47A
	for <kernel-janitors@archiver.kernel.org>; Tue, 14 Jun 2022 18:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244677AbiFNSkK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 14 Jun 2022 14:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244259AbiFNSkJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Jun 2022 14:40:09 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7651846642
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jun 2022 11:40:08 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id y13-20020a17090a154d00b001eaaa3b9b8dso6998388pja.2
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jun 2022 11:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VMRLILcAuZfWHWL4+u5qy2fvXJUzHg7ML+JvyBdPww8=;
        b=LPePoEAd2RE5ad+qpang/x6MBZQqe8c+MY+oskJDKl0FP/nK6/UyH3T057+2dwVI3y
         jrBBsALPsRmcs+oI38K2y3wHudZ5VZg5K5mP9B0b57TJQ02kbio5YVm4Av5UWlW8Y569
         oddEFhMmMWOSO/CMHBNLXqr7HG+5V4wktBFzbDZ13TxmMOeDSyfrtOMoZitQzBUHTozt
         M1KNFkFERB9TFGK47pGCCxTGN+WS2E85nbhjZ7hSt/pll+OsxuZTX3Vx/MxH5uAlNVL6
         8wgZY8rIEydCd4lRTcMWHE6o8kiIt0sT76aCWth48oJzRMsFiVP9pUbCHQY6FwOLV9A8
         n/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VMRLILcAuZfWHWL4+u5qy2fvXJUzHg7ML+JvyBdPww8=;
        b=phKEDYl8pbwoG2DkAw44i2NgG/vVfg3S2E3zHZsqMOnC/DoXtvq/p05fle9cX2Db5L
         cfiT2AL+LAfDMzN+R+MVtPHiJA9G4RKJlgVnciQ39aqrffh30pZSxj2GodrL7LOBlsmx
         U7GcPvGnc1fklft4Pi6IKrzGN4Sv0b772AWJitJ7H+zupnKdm55sNt+E7uOz6ZBzOOqh
         QH/RLDytsh+WkRwz+uumN8JMe9rd7S1pduUmOleVepbuCNshaflsKOsDE09i3ZoWB1W6
         YY5AsDi88ePj5D/cCTgiUgY6fuB2CAhHWfjNfFlfkW4usY1lhfwgvG7SplxwZlWLS6GK
         zgfw==
X-Gm-Message-State: AJIora+ODF4kkP2MIGsoGDTMa/Mjl4xRQqrhp6fhkq+X91vkGm6wVoD9
        APmh+oYBFsnglBZrUQgmn4fanA==
X-Google-Smtp-Source: AGRyM1vbSe14m+2wgDQc5pjjUBxKw2CUwxdD7eoFuL4AQSdHu3ZD+H5HuZM3i7A/ctCS9wllK48y/w==
X-Received: by 2002:a17:903:32c4:b0:163:e765:5071 with SMTP id i4-20020a17090332c400b00163e7655071mr5579647plr.153.1655232007923;
        Tue, 14 Jun 2022 11:40:07 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id y9-20020a170902864900b00168c1668a49sm7584558plt.85.2022.06.14.11.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 11:40:06 -0700 (PDT)
Message-ID: <d427ed94-facf-e0ed-50b4-f4471fd0adfb@linaro.org>
Date:   Tue, 14 Jun 2022 20:40:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] MAINTAINERS: add include/dt-bindings/thermal to THERMAL
Content-Language: en-US
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220613124309.28790-1-lukas.bulwahn@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220613124309.28790-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 13/06/2022 14:43, Lukas Bulwahn wrote:
> Maintainers of the directory Documentation/devicetree/bindings/thermal
> are also the maintainers of the corresponding directory
> include/dt-bindings/thermal.
> 
> Add the file entry for include/dt-bindings/thermal to the appropriate
> section in MAINTAINERS.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Rafael, Daniel, please pick this MAINTAINERS addition to your section.

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
