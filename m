Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2156C7EE22
	for <kernel-janitors@archiver.kernel.org>; Mon,  8 May 2023 09:01:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233553AbjEHJBH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 8 May 2023 05:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233543AbjEHJAr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 8 May 2023 05:00:47 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5F72348A
        for <kernel-janitors@vger.kernel.org>; Mon,  8 May 2023 02:00:29 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso8290137a12.2
        for <kernel-janitors@vger.kernel.org>; Mon, 08 May 2023 02:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683536409; x=1686128409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/H1upgtCnHxzYSl1fYJ5Hrcg82PV/hD+4RG2T5Tx/w=;
        b=ga1H6kuCSUMPNPsnReAPq1IRKBwHxhimLQqfDZ8m0VbslqMYFHv0Et08HvVCaziidR
         NeKaIp1yrLKZrVk3mRNwOoxuX0gtd7QQYKloBMkGIEy/VV1gLsPnVMZd79oAZ75aglVI
         FtW9AwxK2HhVjSPrp5CrIV6c7i0B0VXHjJqKD7z1ublzlNGmYKq7g4cKzk++JZ/JVejg
         CTjDcRThxud5rkz7kXbZ6y20exW1Myh8k9utj6OhNuTBnBlco56VKVHV/CjnR2+6yM6T
         eDFzfap+PdUZbPOAb4aJV5ZKWr+vVycglndWv+vnfV4cKAqP8pfP2sKsP3GQkOhxF/8P
         Tcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683536409; x=1686128409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/H1upgtCnHxzYSl1fYJ5Hrcg82PV/hD+4RG2T5Tx/w=;
        b=bddVTHSG89IHcLNKvJpKXoq5/bygk/wGqEpLGYRVOL25xMrWTjmms56ghl/k82WSp8
         Jk7PKgiOa3CrfvGo4KO11c1qyQMWlOCo6XZ41xnXX9BYl1Xqjmu7EaWqtgRJ/ZL+Ox8m
         AGqbvWNra/joDsZCj3y/u1mPsCcT7gkWoajTdfNuK58+1glSLVgN3AFXidIS5WjLdYBl
         DlXapTr5O7w0nyw0AzCXPRpfj+NY0VaPtAZ4k2hsthvcJojnlckZOfli3ZAwJNAWQ8ux
         +GPJIwwg5zriUmIacAdSXik40CavWFzCW5lzvqeckFYJV86gwVKYD0T6LDCfo+tKEmD0
         qAew==
X-Gm-Message-State: AC+VfDxSQetHsgN1JupLKR35X4HCR6FxCXs0Xpgy6Sj+aeUvnylex8jZ
        1oyedrLl73qX+s+kodooie3Cmg==
X-Google-Smtp-Source: ACHHUZ5bR0r6/D+EbmZ9e8NdsDz+4DsY5Ca1EO0SkffalMfYbwaO/MadLDP88tpBNiR8Qkl/9LfGrQ==
X-Received: by 2002:a17:907:9705:b0:953:1f45:3ced with SMTP id jg5-20020a170907970500b009531f453cedmr8751279ejc.8.1683536409402;
        Mon, 08 May 2023 02:00:09 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id jz4-20020a170906bb0400b0094bb4c75695sm4718953ejb.194.2023.05.08.02.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 02:00:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Evgeniy Polyakov <zbr@ioremap.net>,
        Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] w1: w1_therm: fix typo in comment
Date:   Mon,  8 May 2023 10:59:42 +0200
Message-Id: <168353638586.78189.1389224210896468946.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521111145.81697-6-Julia.Lawall@inria.fr>
References: <20220521111145.81697-6-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On Sat, 21 May 2022 13:10:16 +0200, Julia Lawall wrote:
> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
> 
> 

Applied, thanks!

[1/1] w1: w1_therm: fix typo in comment
      https://git.kernel.org/krzk/linux-w1/c/7f25058c96a0631f4a1ccb4c70831c52e71decf2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
