Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84330C4338F
	for <kernel-janitors@archiver.kernel.org>; Wed,  4 Aug 2021 09:40:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D87860F22
	for <kernel-janitors@archiver.kernel.org>; Wed,  4 Aug 2021 09:40:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237183AbhHDJk0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 4 Aug 2021 05:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237035AbhHDJkY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Aug 2021 05:40:24 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B4FC0613D5
        for <kernel-janitors@vger.kernel.org>; Wed,  4 Aug 2021 02:40:10 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id l17so1873926ljn.2
        for <kernel-janitors@vger.kernel.org>; Wed, 04 Aug 2021 02:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dwt1pPxaPlppnEdG2BBARqg+gr0qeyGOYTvgq1+24I4=;
        b=TKYJ3vhtDJpHViw53658tSsP/2Ny7Dzfcrp16GZt7l3OPk+yTni2/0bxZjeZmzwQd7
         HrqTjcUJ59ns8m6fubf3plRKASTH8gGPywRiji0tdIvjGsgUQqwzPD3KGuLFpnh7PMsI
         X5yNWwVehSx22lbrTu99WnA9T0H7GV9G9CWKu0+EW7g6AVj8dx5ysX5uVxSpqNLRwwDX
         cTj8AowCzEDRLOd/nAT6kJfLGgvF09C6GAPX79TZVZKZlMszZlXDxE8YM0HOetbCaNo9
         Dqui4J7H3FZN2kjmtyXjlFxeZnUpuvnSc+uBFuEwgBG0gooNc7/DA4g0Bt74pWOFjvhI
         1Okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dwt1pPxaPlppnEdG2BBARqg+gr0qeyGOYTvgq1+24I4=;
        b=XGHtWgMzPxOn21hC1IncXgFKVDeqhn19Ifel06h7O3fMvVaz/ONoe5JF0igTPVSC56
         8GdSs97NaYyUNbd5v2XcNPRls11gfdnTk9rGGkKS3fmqYNppXghWChPGdOfy+DvBkqHV
         OM5WyTGngBMWlhHPxJ0uLKWsKo2Ebfe7nQpTirC3TCfomg0KAefiIU2HQ3FMe1UI1uQH
         UlStnfGvqeD5lSb6HgugGH/806mUcvBhW0tM3GI1TfkNg/5m4DfiND10YyYOxYaPyqcP
         H9OmdoSCThYt8cQz50uy4tEAGybyEhe6g1E16qtlAUxF/9/TSqDVkFGZ5QPbJngu0S0j
         M1jg==
X-Gm-Message-State: AOAM531B2YsxsLhzU5pb/VLqCzKSx7Yf3XlqE3yLkvINb89irwb7nj8d
        IVhIGje31ixNT9GYWRcv3mQklV9Wi/NFtNu5t1U8Mg==
X-Google-Smtp-Source: ABdhPJx0yVHn+0/LjY8mjyTRVXlhmqLZHqwyttvFKqsMg34/DYMTPoH4VFFhU/I9ApQLOL5R/669b4+a7tzG2XXVjxE=
X-Received: by 2002:a2e:b819:: with SMTP id u25mr6449140ljo.438.1628070008760;
 Wed, 04 Aug 2021 02:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210804082348.GA32730@kili>
In-Reply-To: <20210804082348.GA32730@kili>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 Aug 2021 11:39:57 +0200
Message-ID: <CACRpkdYfc7oRV9OWQayATU90fcP_q0fQZEgY7C1hLBxpvszezQ@mail.gmail.com>
Subject: Re: [PATCH] brcmfmac: uninitialized variable in brcmf_fw_get_firmwares()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Arend van Spriel <aspriel@gmail.com>,
        Franky Lin <franky.lin@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Chi-hsien Lin <chi-hsien.lin@infineon.com>,
        Wright Feng <wright.feng@infineon.com>,
        Chung-hsien Hsu <chung-hsien.hsu@infineon.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>,
        Zheng Yongjun <zhengyongjun3@huawei.com>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        brcm80211-dev-list.pdl@broadcom.com,
        SHA-cyfmac-dev-list@infineon.com, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Aug 4, 2021 at 10:24 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "ret" variable is used without being initialized when "alt_path" is
> false.
>
> Fixes: 5ff013914c62 ("brcmfmac: firmware: Allow per-board firmware binaries")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan!

But yesterday I sent another patch which incidentally fixes
this too:
https://lore.kernel.org/linux-wireless/20210803232746.3389570-1-linus.walleij@linaro.org/T/#u

As you can see in the last hunk of that patch ret is now
unconditionally assigned on both forks of the
if/else-clause.

Yours,
Linus Walleij
