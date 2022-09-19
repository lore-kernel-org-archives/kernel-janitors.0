Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2078C54EE9
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Sep 2022 07:36:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbiISHgn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Sep 2022 03:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbiISHgm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Sep 2022 03:36:42 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 275E818E10
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Sep 2022 00:36:41 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id sb3so32802735ejb.9
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Sep 2022 00:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=LJdpyyNzLvr7q0tv893y8yCUamy2mFkSZIFkDptOKRs=;
        b=WxX1SLlG7RySGDUrJgpIvCZZPOssO0ZtizKfWPWRs+5lQjNpAmzhQqphs3N3pqHbYK
         7nfow4jfMKFVe3+BuHiyCKqnxEM5j+VZ8HfUiJrI7UqTFYXzzQS4rLeZnHCpWHW5ese/
         HcUo1WqcEx6SPwPqDNGF+wrKxjuXjkk/VyqZrmr2vFz6eYhL2RFVhJEug66zgqLKbpal
         Evs5NTiPeIGUYmGth3G4ZMFUcyreG8fLCFs9yxnxyMfumpQRuIbPCz9YRuMkD1iftHIO
         CY+Lw97wGCPjzTvP8GSeNkNnB9o8htmtUfNbkUBJGQ8GBqaGMrlCd1b0bKVWsnru7THL
         jaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=LJdpyyNzLvr7q0tv893y8yCUamy2mFkSZIFkDptOKRs=;
        b=nJ77qYSMDXZhqzhqyocPTxm1d/NsNAITdr01hkO6HpX3vyweh3aKjNYAR45fN88CVU
         5zMAcjD/yTVod6KpVyOi8ruBDQFDwaYAdeQzW9G91Zh+wx9CPq03gZ4Bg35jOGBQ8dsp
         OGN8trvX51E/wTWYWVVL5714Ua3/a75GlH+mVQzStugCmF/V5NFFgfA+MlraIfVNQEBG
         IsyF4TxyRjKc+yN31xN/bBmYdIK4epIJ625i81uEwO9ajJeOhV7Ee4S8yakCHM/dsXjH
         BoqaH967g52zksluln1XhiK/zpLuSNvgp3JB7VMHhbClRc7vz7lpyQhyTTdoC8OQCfjB
         WZpQ==
X-Gm-Message-State: ACrzQf0fSLsX0u5vr5jYCFx4SFaDzUlBkvnLlr8uB8mkgKsChBLiaaJ3
        svWq3Cfe9EckBstz2Zzzi7D0S1nxWQYnaCLCPoBSGg==
X-Google-Smtp-Source: AMsMyM6z2r0A0G+YdJLW3c67eEpmz7sjf/h+lw90SncbokiYqAFsrj/PbvoVlJmRC5aTissCILOP6IQch32RwI/lzpM=
X-Received: by 2002:a17:907:7e94:b0:77a:c48b:c80 with SMTP id
 qb20-20020a1709077e9400b0077ac48b0c80mr11281824ejc.690.1663572999689; Mon, 19
 Sep 2022 00:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220919065435.27747-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220919065435.27747-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Sep 2022 09:36:28 +0200
Message-ID: <CACRpkdbGAJ1Zcwvit1mau-mCLvCZyMhT47MVnm4nhGzVv7DMDw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: remove dead code after DB8540 pinctrl removal
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Sep 19, 2022 at 8:55 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit b6d09f780761 ("pinctrl: nomadik: Drop U8540/9540 support") removes
> the DB8540 pin controller driver and its config PINCTRL_DB8540.
>
> There is some code left-over in the generic nomadik pinctrl driver, i.e.,
> drivers/pinctrl/nomadik/pinctrl-nomadik.{ch}, that is still around for the
> removed DB8540 pin controller driver.
>
> Remove this remaining dead code.
>
> This issue was discovered with ./scripts/checkkconfigsymbols.py.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Nice cleanup, patch applied!

Yours,
Linus Walleij
