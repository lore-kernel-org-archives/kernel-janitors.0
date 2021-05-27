Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AAAC4707F
	for <kernel-janitors@archiver.kernel.org>; Thu, 27 May 2021 13:45:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCAC1613BC
	for <kernel-janitors@archiver.kernel.org>; Thu, 27 May 2021 13:45:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236592AbhE0Nr3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 27 May 2021 09:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236561AbhE0Nr3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 May 2021 09:47:29 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329D7C061574
        for <kernel-janitors@vger.kernel.org>; Thu, 27 May 2021 06:45:55 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id e17so220573lfb.2
        for <kernel-janitors@vger.kernel.org>; Thu, 27 May 2021 06:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W+RY/ZnJxUazn0U77RqA9l4c/3Pra+EKNP8BXkqQSSo=;
        b=YqtqCpXaY77DgycIF3WQZ6O3jSe3xuuTR3mSksTjFk4UWlm9pv3ehJXzwbQxIY/2W4
         bmyONPuytS9+vrVqbbagtVTJlfD9w8zl1zSJqscaodlTRrDfm7Ok74XtnmkpIQf0xpJI
         42teqaJ5Ca9TieNzzbh2Y0LJ7WLu5JeGwaP1ZQPO4TamblRJqZNdU/X9Ubqs7CnF5zCm
         qD1DoZoo9FV15TjyCdEYJzed+PmE//6qRK9KqPtk5NdYPhT0YpzbpTeK+08hC8BYU6Z6
         dJA5NarG75cAlMf8j35puf7D/K00LVDT2oeWkdNj+fHYhQJJ2zf0yUCtrTzXsQ2VWNRW
         eMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W+RY/ZnJxUazn0U77RqA9l4c/3Pra+EKNP8BXkqQSSo=;
        b=klxWN8dRbDCFQN5sz5b+NrVp6czuZZdU4fNOc/6RYGU/pYXetpxTitKrJoHNIiicjX
         zq2wOLm2BGsu1mcMIsrArmLXSqQbtRR3QCgkiU4QVPCRSkucS2eC6SilE0FpGnRGff8I
         JMzJSNEnGBx2RRiQLhonR1BBuhQeJmgPKD97szJz0JZ4nSAkGbtJV+JwbVMJkef6y0sf
         7QZk23wo6/zZoHk+Dg6DF8Mtob+W4ikuF8BMLAi01412tQMjwiMhsLeCQ0NDhKjquj1U
         Ku3rC8sI9vrX0jpTmMpx35ihkugLAkH6xxuXKwIrvfuW1JkMlA3/E/gzfcuWvHMEJcKt
         0f1w==
X-Gm-Message-State: AOAM532KWC2PbzX07b0Huj4YIrFsr+5+iwh2oEu1Ut2lFmqMYIMRx22D
        AEbSqlkZrKIaU5b3BXjt2sjlq8Qq7EUeHoyXiQbWBQ==
X-Google-Smtp-Source: ABdhPJz0SZ/0YT2tnJ88UE0/1hK3tktsGRtCG2FJ2ldHfMYh3qCu27J6/i0yDb7Q55GDD9Ii6r4OuTTTlVAdYpBHOM8=
X-Received: by 2002:a05:6512:1185:: with SMTP id g5mr2454860lfr.586.1622123153392;
 Thu, 27 May 2021 06:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201207155106.172057-1-colin.king@canonical.com>
In-Reply-To: <20201207155106.172057-1-colin.king@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 May 2021 15:45:41 +0200
Message-ID: <CACRpkdby8f0KjJygdmHLS818z6sVxs5vkV5Fx_X3qNea41NTQQ@mail.gmail.com>
Subject: Re: [PATCH] ixp4xx: fix spelling mistake in Kconfig "Devce" -> "Device"
To:     Colin King <colin.king@canonical.com>
Cc:     Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Dec 7, 2020 at 4:51 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> There is spelling mistake in the prompt text in the Kconfig. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
