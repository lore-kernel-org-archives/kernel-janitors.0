Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D04C433FE
	for <kernel-janitors@archiver.kernel.org>; Thu,  6 Oct 2022 09:23:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbiJFJXy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 6 Oct 2022 05:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbiJFJXx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Oct 2022 05:23:53 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874299837D
        for <kernel-janitors@vger.kernel.org>; Thu,  6 Oct 2022 02:23:51 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id qn17so3315617ejb.0
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Oct 2022 02:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=wzZ9wWp7UYvnCxIpLbO55WWroOpcvUpldPq/EJxSsFs=;
        b=BEEUurO9wMsAhS9TBQKLGHJWW5hytq8RNHB/ZSvn7H4zLhRDL114VcDLh3hj4RHf32
         WABKUMQ+iF2S1Wk9iajduFk/nC/x09LF5D5wB2p+D7ilxh9EO3aiw/m8+W5vB973WhOt
         GDvHnnXx1KsTL517mw3g390tJ765RuSzGU0CS9dkd7Nt70tMWLVBdH0OYsLzM7JjpZvd
         QWVz6dBOCdBrQUwbogS2Vi9wIEqOIpR8naXwlNWCMk8gtZuZZH8FZiJ3nPOEvuEE3IQL
         GglZqgCXS91f6YncRkwotVXnYUdVkQtKSI6bz6rGt14LRksCUUiHUtaAC1MrqVscxYDP
         KcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=wzZ9wWp7UYvnCxIpLbO55WWroOpcvUpldPq/EJxSsFs=;
        b=2qkQNZOGkSbOr+XrrtVGUD6TUBHH3/XIVBJgW1lhB8WT5rJ3nndewJ0Ko0aQoWcTJ9
         DaEtG0AP5ZhG/OsOO9HNZDiIAa+Wmh5czgBqXvZTXtSWuc2uqrZwwdqTerNA4O/vcfx4
         Ww37UKohIcqjF68Hx7m/YLcR2OgSJ8yBepe2i6LnqvjrXzlONJVBvlQOA0OoziT6I1Ta
         SORhIDW1mI/dwl+7nOUjI4R5Yo9nAJVV/PTRUAWidLJWb7XvuZzX59gRwWucpiVZmIzs
         flP/Sijxzuz0vWtZMwkas8BSYq9cLGx+yw5hjaD6pMGeRper0o6jXzVGBdrcyZ1xgZnS
         neTQ==
X-Gm-Message-State: ACrzQf16Pcybe/cyBJSJLcnVFh37IaLtpRm3UXyWZOCslQXoYw81MwjR
        +XhklY+W9eRkJhrwSJEfpE7EfHZHETVppgtkOSqSFg==
X-Google-Smtp-Source: AMsMyM5fv69bTEg7ZmHLVuLYd2+ejXhCQ+P9GFLk9dNI1COIQDqLlH9qEC5b7nVYFds/xtn+DfHLh2K3kzXsvnk5dUU=
X-Received: by 2002:a17:907:a064:b0:78c:1511:a3cd with SMTP id
 ia4-20020a170907a06400b0078c1511a3cdmr3181681ejc.203.1665048228986; Thu, 06
 Oct 2022 02:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20221006080154.5396-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20221006080154.5396-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 6 Oct 2022 11:23:37 +0200
Message-ID: <CACRpkdaVUfM23i9kWT8hbbTEWQWJ887mDyH2WUU7GqpEmDtdew@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust STARFIVE JH7100 PINCTRL DRIVER after
 file movement
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        Hal Feng <hal.feng@linux.starfivetech.com>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 6, 2022 at 10:02 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit ba7fdf88e98a ("pinctrl: Create subdirectory for StarFive drivers")
> moves pinctrl-starfive.c into its own subdirectory starfive; further,
> commit ba99b756da17 ("pinctrl: starfive: Rename "pinctrl-starfive" to
> "pinctrl-starfive-jh7100"") adds the suffix jh7100 to the driver and
> dt-bindings header file name.
>
> These commits however do not adjust the entry in MAINTAINERS. Hence,
> ./scripts/get_maintainer.pl --self-test=patterns complains about a broken
> reference.
>
> Adjust the entries for STARFIVE JH7100 PINCTRL DRIVER after file movement.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Oops thanks Lukas, excellent work as always!

Yours,
Linus Walleij
