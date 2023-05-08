Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE30C77B7F
	for <kernel-janitors@archiver.kernel.org>; Mon,  8 May 2023 09:02:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233746AbjEHJCa (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 8 May 2023 05:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233563AbjEHJCK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 8 May 2023 05:02:10 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD2202349B
        for <kernel-janitors@vger.kernel.org>; Mon,  8 May 2023 02:01:09 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50bc1612940so8121745a12.2
        for <kernel-janitors@vger.kernel.org>; Mon, 08 May 2023 02:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683536466; x=1686128466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdjVB1LcK65MjUQ5lAoWWtjhBM+KfEqN5gXnbsQlIK0=;
        b=t40AGY5/zL0/XXc7pQ4Npisl0XqlgKQc9BM/f43pHyOgmLT7RrDqoFoJaUTQjSel5S
         C0hfCvVd2YeezCX1ZvEN4S8f+dCNm5R0iCkNKEVLWdx8Kj39qwAww0eq7SztqAeoKWW5
         GNipyl/sTouqc+HG67BH0X5Xl61zdJnpc6kwIIYWg2zSJKppGoghENY4OPp31mxr23Tz
         Ug+u3P37klL3iESNEiUTRQRcRZqTFA4IPjV3KWkMoE0N/5vQOBwneqBDF1YytNJHFk7P
         HwF3YwPS2hc8WhTkpkuUEgKXk+igPwAGHa7roc6GAuDn3tfjp4+k0Tkp32ehLyCNzFL4
         6PsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683536466; x=1686128466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdjVB1LcK65MjUQ5lAoWWtjhBM+KfEqN5gXnbsQlIK0=;
        b=fXNVzhe5cbTSfeYoJZvp/48kMQV7g1Upmp0+N0BPqAJXFASTtlsE1xj93VSamgHexj
         Qgfbl8Dm2HWobQ6mm9zBTXeXSpo2tKhh8pq90CePssMRPlG9aeMA5MO4n8hGfKhMTtnP
         As3T4uiSmuetigAsMnFHQp0iOxa7mzxiOXUtT97UpnOsa3+++EKT9pRPuHdKdMrXx9g3
         VLijvOruSR2Hn0uALaWi4Jzyy3ZJ1qS/58/CiXbZIFyG2bIiTFuqfkMJnPfiRxr77sO1
         0qzE4OEDhZoZ8LqW90LELpHFBLrHQ42p7SzU4vkd2l4ycZvHSHuCz3ifWUDcMYtxPCJ1
         FUgw==
X-Gm-Message-State: AC+VfDwIoLX885BtvUnsqx/dZr5xYxlab9NQryZmuNY2SBD5lSg14kQM
        roJSNJ8EBY2wgJviTdiKRM6QxA==
X-Google-Smtp-Source: ACHHUZ4HpKWDjurqiqoLaDtN/lfcKNWSX5+AEn0mGRBLeJKV/5W39K4QrEkUfS5UpnPMpO6vpYpdLA==
X-Received: by 2002:a17:907:5c5:b0:965:9edf:f0d0 with SMTP id wg5-20020a17090705c500b009659edff0d0mr7601374ejb.13.1683536466403;
        Mon, 08 May 2023 02:01:06 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id z10-20020a1709063a0a00b0094b5ce9d43dsm4685758eje.85.2023.05.08.02.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 02:01:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Russell King <linux@armlinux.org.uk>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        soc@kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: s3c: remove obsolete config S3C64XX_SETUP_IDE
Date:   Mon,  8 May 2023 11:01:02 +0200
Message-Id: <168353645813.78617.10247256011505870361.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508040433.13648-1-lukas.bulwahn@gmail.com>
References: <20230508040433.13648-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On Mon, 08 May 2023 06:04:33 +0200, Lukas Bulwahn wrote:
> Commit 0d297df03890 ("ARM: s3c: simplify platform code") removes the line
> in Makefile.s3c64xx to configure the inclusion of setup-ide-s3c64xx.c,
> with CONFIG_S3C64XX_SETUP_IDE. So, since then, config S3C64XX_SETUP_IDE has
> no effect and any further purpose.
> 
> Remove the obsolete config S3C64XX_SETUP_IDE.
> 
> [...]

Applied, thanks!

[1/1] ARM: s3c: remove obsolete config S3C64XX_SETUP_IDE
      https://git.kernel.org/krzk/linux/c/9d2edccb154bd98baf7f1e21d23f799e4f5e8359

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
