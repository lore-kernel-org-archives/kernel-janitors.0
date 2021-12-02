Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F53C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu,  2 Dec 2021 01:33:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345979AbhLBBge (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 1 Dec 2021 20:36:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235956AbhLBBgb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 1 Dec 2021 20:36:31 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11A3C06174A
        for <kernel-janitors@vger.kernel.org>; Wed,  1 Dec 2021 17:33:09 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id i5-20020a05683033e500b0057a369ac614so16410421otu.10
        for <kernel-janitors@vger.kernel.org>; Wed, 01 Dec 2021 17:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=St7ZlQ5TKkMMGBhEXGVrQT8uIhISmmCTPfgODmJFYt4=;
        b=sBbWN38dYj4IwcUfUvDgNjWKR06ar7bK7pmch8Muh4vIrMyc2z7LQfugwQQUMCHCad
         Yuf7cR60DBLWsvGiEaqQ8t8CugUur3jqwlWbooPi3+lDjox4Ld8v9rFiA+wtZBAqP9Nm
         /FEQAGe8+ql4lb8/SS8vFIuRhxdljR+3nthE1rLXxONzgIO6HDlZhWhQw+H9J6n+MJJy
         MpM8MkUpHG5unW0jq6HF8fevjt/N+WMm+sfbqyBS2iDLQRvb1i2lWrhPi79HS6Q7HXs5
         g8732ofx22RhpcE+gT0sKdo5aQuPplz/WUKtQomd5sobq1NkFFp/YubpI9y0pH8aGSBl
         Kahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=St7ZlQ5TKkMMGBhEXGVrQT8uIhISmmCTPfgODmJFYt4=;
        b=12/yG5y8Pk1cwnT+9A9TeRDVi+GA47Q2XFhWibMrBbQGA3F08TEclaT2gGzxb0DBqt
         UVT7J8H0n9IOAix1bjBTPUa2wHXRYJvx9CXGSCKPGThZNZOdV/X6u30hInT9iAK7NYGh
         TWjBbUx16B9pxSgfX2V7j336+1IhJYBZo0uvhQmpYnkU4SGESVoB2eS9/8Vb2VvjPLuG
         bVeJQzTYuAGg7Y6ZXMEjuS2JgyLfZGL5q7huPsVl8HfYckhHD5EAUeXUUCBajDPZQeoM
         yZpg0baKmtCzIdZFoOqYMuPuxNA8MaQ8tADltRCE1L4K/dHatlQtQA9qfN4i6LXW7PUM
         FPnw==
X-Gm-Message-State: AOAM530/1FLOeFZdgS0EXjSGw8CLOwH5fxDZYza1Tyhh2dnmfnETwdFD
        aAhfxHFBG6U8VIZ7tsNRilT3bL0mOjuRCX+l7Frp6g==
X-Google-Smtp-Source: ABdhPJyud5/Vg+fpTaCK3dlNFqfobGtRMpGiSf/MMruh0S47buCuK0W37hJGSFfz7QDNDKM2gCydOdU4cRNJc7Uv0g4=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr8755400otl.237.1638408789028;
 Wed, 01 Dec 2021 17:33:09 -0800 (PST)
MIME-Version: 1.0
References: <20211127140750.GA24002@kili>
In-Reply-To: <20211127140750.GA24002@kili>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 2 Dec 2021 02:32:57 +0100
Message-ID: <CACRpkda9aKS+54aRa92xe-cfbvpkdOAkpUptGzWgDCuc67aL=Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: uninitialized variable in mtk_pctrl_show_one_pin()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Nov 27, 2021 at 3:08 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "try_all_type" variable is not set if (hw->soc->pull_type) is false
> leading to the following Smatch warning:
>
>     drivers/pinctrl/mediatek/pinctrl-paris.c:599 mtk_pctrl_show_one_pin()
>     error: uninitialized symbol 'try_all_type'.
>
> Fixes: fb34a9ae383a ("pinctrl: mediatek: support rsel feature")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

Yours,
Linus Walleij
