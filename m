Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2275EC433F5
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Nov 2021 04:52:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09913610E9
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Nov 2021 04:52:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242890AbhKIEzL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 8 Nov 2021 23:55:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242878AbhKIEzK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 8 Nov 2021 23:55:10 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66893C061764
        for <kernel-janitors@vger.kernel.org>; Mon,  8 Nov 2021 20:52:25 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id n66so8005049oia.9
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Nov 2021 20:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fIi/8rMsntaI+OsdfCjYQbsx+2Ak2wriMzRfxygR1FA=;
        b=YQj7Lj4xuXVPjaiPI91CCtrxG/QPQj2KuOiKL+6EOLjbFP+68Vxjn6VP2zgEb2WPng
         gttNnAewxd5Q/UnXavsCgAkGKGIEbb33rE4NhkJJwqkxwFRhuPZCRsRcTBkyg1ci6l+p
         44XDT98JjjfF2Fxepkrnx37rkhjKXElHvjzb/Gqhkszf6RfXX4y/0ob89EC2VrnNdSc/
         1nm23L7eBmUcFVVMMs/v7wWh4CWub/fbwqoWPo2N+7amnOteVZmuDAnDE9qWXU/pgWKI
         vyF86ekPDv40KLWl074BU5pae8QhuZ+dmVAIJewsWnmy1sT0cZ0QQfCqG1tw9GMURM91
         aDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fIi/8rMsntaI+OsdfCjYQbsx+2Ak2wriMzRfxygR1FA=;
        b=S3RFFxvncWfy/E63rEhJ4tPFCCcD3xri3u0HjkQAJEzp/U0KHIpKpXw5VOGunUQtuh
         Hadkm8SRAoRx6t1kxQWCcgfvhTrYujQ3cF07a+1jbMA9PEGmm2mUh7glNWlBTySWp/iY
         Lj4R0pRoXgiH7C8J2XqU/4VDTewAA5Jdf0gkS5zrfMY/ONDAbsVD6GNcAwuzIobAehoU
         CjUgUJd/eM6CKgLl7Xlqunhcu8uoQVRC1LmOSbg9uo/fX5aN4iK7AgkBl6P7usqNeUKH
         W41gNSf7s5bNZK39l9qHXqqGb0+fPt/8Va475eIWbVe3T6K24J3xxAfwpjRv801q4nKG
         RqwA==
X-Gm-Message-State: AOAM532Pi2+MkvnEnYlALyhLfeUajOhnCDJX2aq92ZC+W6Qi0FBifSnS
        Kod6/RkYUhiqR1FQa0gc6lSBHQbKE9Y4+8VGupdszw==
X-Google-Smtp-Source: ABdhPJw/PXJeyQlLBQdKl4Na77Zir0MpynV5/VfDEG0JbF81ciPHPaSAILPbfcUgMwRqhqiiszKinPesveK3xnr+A3A=
X-Received: by 2002:aca:120f:: with SMTP id 15mr3151848ois.132.1636433544821;
 Mon, 08 Nov 2021 20:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com> <20211028141938.3530-14-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-14-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 05:52:13 +0100
Message-ID: <CACRpkdYm2Da3W63T4KTnFzESNBrgvZGZsVZYqFN_16NGfpWm2w@mail.gmail.com>
Subject: Re: [PATCH 13/13] arm: pgtable: refer to intended CONFIG_ARM_LPAE in comment
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linusw@kernel.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 28, 2021 at 4:20 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 5615f69bc209 ("ARM: 9016/2: Initialize the mapping of KASan shadow
> memory") adds some nested ifdef's in ./arch/arm/mm/pgd.c, and follows the
> good practice to annotate the endif's with a comment to indicate the
> corresponding ifdef condition.
>
> One comment annotation refers to CONFIG_LPAE, whereas the config is
> actually called CONFIG_ARM_LPAE. That imprecision in a comment is probably
> tolerable for all human readers.
>
> However, the script ./scripts/checkkconfigsymbols.py, which checks the
> kernel tree for references to non-existing Kconfig symbols, identifies and
> reports that the reference to CONFIG_LPAE is invalid.
>
> The script ./scripts/checkkconfigsymbols.py has been quite useful to
> identify a number of bugs with Kconfig symbols and deserves to be executed
> and checked regularly.
>
> So, repair the comment to reduce the reports from this script and simplify
> to use this script, as new issues are easier to spot when the list of
> reports is shorter.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please put this patch into Russell's patch tracker!

Yours,
Linus Walleij
