Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2D3C433EF
	for <kernel-janitors@archiver.kernel.org>; Mon,  4 Oct 2021 17:10:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05B4A6120A
	for <kernel-janitors@archiver.kernel.org>; Mon,  4 Oct 2021 17:10:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238225AbhJDRLr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 4 Oct 2021 13:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238177AbhJDRLo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 Oct 2021 13:11:44 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F476C061745
        for <kernel-janitors@vger.kernel.org>; Mon,  4 Oct 2021 10:09:55 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so22505565otb.1
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Oct 2021 10:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LT/usi9lkR3sxtPUnMf6oj+ko7WPUt1cJEJz7aELEAo=;
        b=jNuv2yE4UDv7zGbLnC2X1DrfpOfR8QizEEldj8AquaCs840VPybNgrzpOcTJLOxZLL
         gev/rFYMXb3z+cFMG6ii2ghnm6O5QaqVbwHJ9llCxcDBtjFYNZQarwwXHbWXYCHN6ElC
         LTZhRUcdXejtslpouNHiBUSt7haJ+D4guB3wPz3eC+UJRz5wzpauSt6uk5f21oRdO4YA
         oLgI0rBXgfVhMNMMq7js8RUgKXxEU6X5J7FXA6mQ4Jk+3NkiK5+VXJUlW+CUeKGASXga
         rM+viVi03SyWBRKqsI5+OpK4VTNZmXAqDoZljKbJocM9KUOuzl0zuUiiFQlBzvA/VN59
         ps/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LT/usi9lkR3sxtPUnMf6oj+ko7WPUt1cJEJz7aELEAo=;
        b=jPnsLnrZubQ5GPQWTI/PhupxZwZUedtXU1pIc5SgxMhgzJpJmRlx3w6484XY/i0RXY
         1l82rJDVqa+W+1Vh0s8SrfvM9MpGgzY/kypyiVBYZ3jJNFL8cKf91173yWTvaZpOq43+
         4q81HLP9i/Q7oBrP3ezk73kVGc4tGFoJmGL0dm1A2pVkvhT06Kplxpzz32jwBC6jKSA+
         heYl95sUew7IDgl/DBn40B/Fh3a0wLZec0SJtNxL2U85VMm5sdRV/V0u509M+RHsIkK+
         3xl5JN9ZxbTqGDrkXa8p5BqeUTO9NVwu+dMBalHprja20B+YEhrv1FzPxDhqLOTYUGYa
         oYdA==
X-Gm-Message-State: AOAM531S8C5vOjUouWQv1KFa/T2HAwPf8IeNCYr15xpCWDBVDzYdiDVv
        upUhK7nCH/EVe/k+PxsJoauj9A==
X-Google-Smtp-Source: ABdhPJzEmh/NKBdy8hoxnATcd8pF8gWRDODmc1r6BgMBZmL6hXXJa1N0WCnzDsSXHlXfIOtJrhfxgQ==
X-Received: by 2002:a9d:604:: with SMTP id 4mr10538659otn.204.1633367394493;
        Mon, 04 Oct 2021 10:09:54 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id f2sm2822824oia.44.2021.10.04.10.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 10:09:53 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-amlogic@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-remoteproc@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: (subset) [PATCH] remoteproc: meson-mx-ao-arc: fix a bit test
Date:   Mon,  4 Oct 2021 12:09:53 -0500
Message-Id: <163336738469.343640.8547254698960330092.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211004105257.GA27301@kili>
References: <20211004105257.GA27301@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 4 Oct 2021 13:52:57 +0300, Dan Carpenter wrote:
> The MESON_AO_RPROC_SRAM_USABLE_BITS macro is used like this:
> 
>         if (priv->sram_pa & ~MESON_AO_RPROC_SRAM_USABLE_BITS) {
>                 dev_err(dev, "SRAM address contains unusable bits\n");
> 
> The problem is that "->sram_pa" is type phys_addr_t which is potentially
> 64 bits.  That means the MESON_AO_RPROC_SRAM_USABLE_BITS macro needs to
> be a 64 bit type as well to ensure that high 32 bits are cleared.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: meson-mx-ao-arc: fix a bit test
      commit: faf88ed1c083017d1f4478f45c4f375e7a3f8bdc

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
