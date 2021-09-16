Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF12C433FE
	for <kernel-janitors@archiver.kernel.org>; Thu, 16 Sep 2021 22:11:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0051D6108F
	for <kernel-janitors@archiver.kernel.org>; Thu, 16 Sep 2021 22:11:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240756AbhIPWMs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 16 Sep 2021 18:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234157AbhIPWMr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Sep 2021 18:12:47 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F54FC061764
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Sep 2021 15:11:26 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id i25so24676344lfg.6
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Sep 2021 15:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6LvSfd+oI41H6Om1rL7Jhn9kpcVwL+kRoJZVRWE5RMg=;
        b=iNZ53wr8Hb4bzCLF6PkVEFxG14WopLJYJsVixNsrZoo5Ff823mrGn+lr3Tk+9nPmUV
         5QgR0leP2yIQsq6L9/iXiNV9RjJOhHZJFQGRJXJpCNr+mTgSvoXjpleLfGB/IbvZEGjp
         QsYkD+m3Z5ySKZgERdi1pghoyA5o1+ymply0OS6+ldsL1fHiZ7HbTKmiC2QZIZWnpx2u
         KYyBs7Iwy98ITyr+GZ1B5GyStUc5Tn0DLMaZQH6X2QVnPJk69i6tB98tfyHai7Y8TEfJ
         e+XNBKwqWfuLcKm6EGmIW+yIWtrH6k+PVAAa2xly/zw+BVa4jmaQKhYTBAbte0DwNJ/2
         f1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6LvSfd+oI41H6Om1rL7Jhn9kpcVwL+kRoJZVRWE5RMg=;
        b=m64OO5IlHcKO6hosV1g2F3uDzKTRXzM8vzKUuSUWtNipaM7CfBWAqVDb7DhfDyyl/e
         PQVHUsM9AejtbjgPMzqVtJJX39qFLLHLjQlBCtudHayog7wGo5el1UCi8jRtw56nbkbJ
         3HzJi94SD91rvriiGpAHm70OYCabjIt0XCTxoW7T6bAJZO/lCHY/J1yYz99qAf4FWIKD
         h/Y+RvIBCOtArUzsSsXny8OQuHUHf5GDZDt/J1zZY5b06yo77jc/YJPngwZOSiHk/f+T
         RBK7nRaI9K22HnX0vek8YDPuRReb9pvQtLh65YbjLDPdCOPQU74OJwb0yc+RAziYQ+Bd
         NLPg==
X-Gm-Message-State: AOAM533GNSQmm8TQa3JPvWvCZIpsiq5v0lU73jroQyIOXCSycemmtrZO
        SPOeUaDVa7xSLUIpr7TVQUjlyMibq7BDV4RZGWuANg==
X-Google-Smtp-Source: ABdhPJwzHDkcJA9/P85VBxJeOWAsCoQzQpiUX95nEcEBvcAi594TiH8xGSb3V+Sxej7UbLGijHC6SzgPBXNBapvEhtU=
X-Received: by 2002:a2e:1548:: with SMTP id 8mr6691975ljv.358.1631830284908;
 Thu, 16 Sep 2021 15:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210826123516.14441-1-colin.king@canonical.com>
In-Reply-To: <20210826123516.14441-1-colin.king@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Sep 2021 00:11:14 +0200
Message-ID: <CACRpkdYDWN+7DG_93P239YD4qMa2=d8wYw9BOdgp0YpbNTiM+g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Fix spelling mistake "atleast" -> "at least"
To:     Colin King <colin.king@canonical.com>
Cc:     Patrice Chotard <patrice.chotard@foss.st.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Aug 26, 2021 at 2:35 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a dev_err message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
