Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC79CCA489
	for <kernel-janitors@archiver.kernel.org>; Tue, 26 Jul 2022 07:42:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238235AbiGZHml (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 26 Jul 2022 03:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238263AbiGZHm3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Jul 2022 03:42:29 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11891E01D
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Jul 2022 00:42:14 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id p5so5716172edi.12
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Jul 2022 00:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LSv0zT3hbYY0NoaOFjUySI9LkcnRa5c63eM0DyOgR4Q=;
        b=v48qZg+gkpnYGsfN7MlYTDVliXJAKPYp6VGdI8Y2dBdBkiObUrhziZXNTpAgxH3jOo
         kkdHUCnkqGzIqUQ23XEM7iTGoJfF9kNgedtLQ1nHp3UpsTqgdY3GeGP+tfjG9lky37ww
         vSpFR6IqM2jfALmsXWMXSKXA5UjGw5UhVVKM8Z43M5YoFBGQPvpssVFPa2fekJNU1uzr
         UWHViRuRA+U1AiWDl4+fsfypztg/fBvvjzg1qjUvtPePxO8eXcYXSNdWxF0KnlgEGjki
         IFkjqKMXqO/GMnyBHrj0m9A5bF0yItHwbMG8kZqSQky5nXcXdop9b/5RrmLBex0l4hds
         bazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LSv0zT3hbYY0NoaOFjUySI9LkcnRa5c63eM0DyOgR4Q=;
        b=lmSYPONx7zs8wihofLHxth7oVkVoJ6rFZno7Kzz1C+GYl4C2jzlOD3eeD5AkAXHT4T
         WIASju6q6H+pI6bsncDsqXsus5AFD2ef11LZt/CuL4DXD4l3UeKdzvXGOIh8w0ium2l1
         GV5havJ5fQHdZAryVUxaFYAkj+jyAIlXFyEZQU8wz/JtAimL7YmcM69gMD1UgxrX2hxA
         Y65IEqbcDrLoRgFj7+Awy7iavnhITDCP2nEmqkjl25VIpcGVPhnW4/0dNOZzq6vZNXVv
         /5hkNNvLzxHOc58U0MLZM57nT0j6SjkNLlU9COKJDRFhVoVMM5wOBd2B+ifxaEASvzoe
         AHcA==
X-Gm-Message-State: AJIora/ZHcuhJTht9+0FOf70TC9aF4kcO88Nf7D1e8qkatNhzpmlG+ww
        MkkoYTSfK7PIqizF12MIHLOgAP1suXK7hUtRKO0PKQ==
X-Google-Smtp-Source: AGRyM1tTFSZO4tGo0PCUFIhA8WVv02W9uMHhf8OODiEkjWYbUjWku28ujTzToAsX7ym7ilB5OhgyYpvNchLxnLnsMkM=
X-Received: by 2002:a05:6402:2696:b0:43b:eb8b:d0da with SMTP id
 w22-20020a056402269600b0043beb8bd0damr10708934edd.158.1658821332118; Tue, 26
 Jul 2022 00:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220720082934.17741-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220720082934.17741-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jul 2022 09:42:01 +0200
Message-ID: <CACRpkdbmaf1uLqs=k6yyb0twy0hp1izkWuJN-QYPJy1Gg6wJ2Q@mail.gmail.com>
Subject: Re: [PATCH] clk: davinci: remove PLL and PSC clocks for DaVinci
 DM644x and DM646x
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jul 20, 2022 at 10:30 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 7dd33764486d ("ARM: davinci: Delete DM644x board files") and commit
> b4aed01de486 ("ARM: davinci: Delete DM646x board files") removes the
> support for DaVinci DM644x and DM646x boards.
>
> Hence, remove the PLL and PSC clock descriptions for those boards as well.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Thanks Lukas!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
