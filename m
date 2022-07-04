Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05335C433EF
	for <kernel-janitors@archiver.kernel.org>; Mon,  4 Jul 2022 10:59:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233824AbiGDK7C (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 4 Jul 2022 06:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233626AbiGDK7B (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 Jul 2022 06:59:01 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C57DCF
        for <kernel-janitors@vger.kernel.org>; Mon,  4 Jul 2022 03:59:00 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id u12-20020a05600c210c00b003a02b16d2b8so5431508wml.2
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Jul 2022 03:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LLYbxrZtIqfELBGb4abToz3pncc8eBo0EcrsRbqn6h4=;
        b=E/BApPeUVGI9ICTP2Guwsd/BSF96qPqrw1LrbDKXmQPx/xE/ig3iSHH9yjwSQxCQF6
         TaS750DYCNsRX19zIOvD18HYg3dfm4i5FDtgweNj3a/ksI81HJL45czbU9wn43ICs4EH
         t7hc0LvBEJebbUgPC09uNlHHUlhWkrIkGu5Fr7IMhV73OjrwyI5AS02uZcMK6fOnWLM4
         NHz2ZOHg2R117kAr3iK/paeworG0WrP3zxmacu7l7DV/i08n5lFCuBuSDxmf55ZVqdIw
         8x7wwugGuGfunM0S7iaZR5PT8+W1o8t8cG/VJRyegt4ZjqcqqUdJOANn9lel30jnx3NL
         yo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LLYbxrZtIqfELBGb4abToz3pncc8eBo0EcrsRbqn6h4=;
        b=wBUvB/Poc3hs4MIPNBHhYiZ3UPsHRsVbGwrrrQI5ZtyOkiNx2SBXqO3hz1AQDPAZFU
         Oj2Ron+1ewq2e4WqvwFhdGhPoNZHgUWeGGuOnys1YDF51TVO4rWJEQRf43aCv7nV6o5N
         oxzC9JyGTYq1n2uiKqbZnPMOiwi8q669sbY+rH4eurWtAq+lE1V0z6rKZX01SOA5Y2ug
         o+psnh9qOTj0LAAlxPUbT36sxgJe+l7tdemJs63Z07Rti6SXxa1xLCjYo+fvphglAhA0
         V0rrTGXPPwNBWaG5IRKyKfGTeK0m84GY7sw83hCiKQN7CobbO3dftZb8KX737Ws61GoQ
         Hc+A==
X-Gm-Message-State: AJIora+GpYKStyjQzczhzDOpJyBku4BIMXRrBkf641f3WT4Qjf5N4erg
        KvwcF0IHSIbmdEwk4dtRJXD5YA==
X-Google-Smtp-Source: AGRyM1sVgWrqJrM6Wz6XZqjJEMcIpjkNMYwcvTKHCtG3UbEwjJ7tiIlfsNRw9XaVGLgoWIX0Xt0YsA==
X-Received: by 2002:a05:600c:203:b0:3a1:9726:ad85 with SMTP id 3-20020a05600c020300b003a19726ad85mr11247742wmi.180.1656932338677;
        Mon, 04 Jul 2022 03:58:58 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id x2-20020adfdd82000000b0021d62e30a62sm5901474wrl.50.2022.07.04.03.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 03:58:58 -0700 (PDT)
Date:   Mon, 4 Jul 2022 11:58:56 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Fix spelling mistakes in documentation yaml
 files "is is" -> "is"
Message-ID: <YsLH8EOwVG+oqFGS@google.com>
References: <20220704105307.552247-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220704105307.552247-1-colin.i.king@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 04 Jul 2022, Colin Ian King wrote:

> There are several occurrances of duplicated words "is" on the documentation
> yaml files. Fix these.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml   | 2 +-

>  Documentation/devicetree/bindings/mfd/ti,lp87524-q1.yaml       | 2 +-
>  Documentation/devicetree/bindings/mfd/ti,lp87561-q1.yaml       | 2 +-
>  Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml       | 2 +-

Can you separate these out please Colin.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
