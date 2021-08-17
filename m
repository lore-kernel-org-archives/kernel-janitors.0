Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F530C4338F
	for <kernel-janitors@archiver.kernel.org>; Tue, 17 Aug 2021 20:11:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CE0B6103A
	for <kernel-janitors@archiver.kernel.org>; Tue, 17 Aug 2021 20:11:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233954AbhHQUMY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 17 Aug 2021 16:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232862AbhHQUMX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 Aug 2021 16:12:23 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD87C061764
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Aug 2021 13:11:49 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id z2so43745158lft.1
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Aug 2021 13:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0ECUnJRdGhvZQ5vTa9e0gW3gLFpsPXzyagk4LktRcpA=;
        b=DTYC3ua7EePGe9OrsXz3+MkXNeZUErzxrswujVRS1A4/P0Ri3b58vvLqpMBCkEL40Y
         yAcgAAeTGUl3HdER8NO7xg0ji5zrv9uIYE5cvhXecmAMOaUFMxC/XvxiNRyaRUulqKfc
         MwrTek+xPSuQUq5u3qQ8BQ1X/XlHeXk5vqa2acgT+w3FlIFi9XInUc1+LTKnMlCs2KrW
         41u1c55x2SjUzBf5emHA41ryOhhiZLpfqIgxNKwEo778gtRZm7Ks+qaUe4Ofzl4SzIzv
         eNpxJu4jj0muaxLoUuv4WWbbN82Fv8SERSVj+LSSnUA9c3JKafuLABoPe1WKHVIjY13l
         iIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ECUnJRdGhvZQ5vTa9e0gW3gLFpsPXzyagk4LktRcpA=;
        b=joYv1K0dL7n2hVLd8nDrHl8cWeSgamLWkBdyKSnAwvgkkObtuR1XjfAu2pGm5583Q7
         lCI4SoenRzH5EQY+AMUay/SeIWVMSmn/mcoSigZFQkmoxaHRNb7D5YJmNc9CArSD/My5
         2m10ddRwxk51AFaLNw5ppjC0Yjk9+qe7H7XoKbr5crUgdH0PgFp1JLvXn78ZJqZDo6pH
         uzAMczUFZ8LpjMbjYWuleJAexS3Ah917INJVMJ0UkniEvg9IHttuKQT9Jjcir5PgIARm
         PxwX2qX45FFDBBT8SRPB5hfD+LnurLYoiY11o0CBNJiQChUR0gG4DFaD7RRs7IE8Rp9h
         XHrw==
X-Gm-Message-State: AOAM533jjz7o9c37uIiAphxgYrBsPZHrvA+Cr5/mTuQP/oUC7XZrfaub
        2BnB2TsxL3bneWwNsyht6BC4xcA6mlLBbL4OuRtJDA==
X-Google-Smtp-Source: ABdhPJxFwsBPGC+jBiacultIR42jboGDCaeK4IJ7HxVey6ekxIJCHv7HR8bP2YzM0B+ofhdgnZC6Be8jJqpMM39s550=
X-Received: by 2002:a05:6512:3250:: with SMTP id c16mr3551573lfr.465.1629231107903;
 Tue, 17 Aug 2021 13:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210817081330.9645-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210817081330.9645-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Aug 2021 22:11:36 +0200
Message-ID: <CACRpkdaemTruXS3PTz3z_hpkvBYvi802dF6VBDq+fLEyxZStrQ@mail.gmail.com>
Subject: Re: [PATCH] iio: gyro: remove dead config dependencies on INPUT_MPU3050
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio <linux-iio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Aug 17, 2021 at 10:13 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit b1fe0cf06f92 ("Input: delete MPU3050 driver") deletes the superseded
> MPU3050 driver and its corresponding config INPUT_MPU3050.
>
> The dependencies on the superseding driver in ./drivers/iio/gyro/Kconfig
> to ensure that the two drivers are not built into the same kernel is a dead
> dependency and not required anymore.
>
> So, remove those config dependencies on INPUT_MPU3050 for MPU3050_I2C.
>
> This issue was detected with ./scripts/checkkconfigsymbols.py.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Oops my leftover.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
