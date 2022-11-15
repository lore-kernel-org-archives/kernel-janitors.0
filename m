Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B0DC4332F
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 21:42:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238617AbiKOVm5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 16:42:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbiKOVme (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 16:42:34 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F7322E68C
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 13:42:15 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id ud5so39536723ejc.4
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 13:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Nl9X2dBBteRxXc88z+X5/Ev/rJGuG6QGv1Den2poAo=;
        b=QwtGfdLExqGEA3JBttYR2zaNYjZe26Vt6/fFPWMuk54OnoMDs1FRgye8GpGvi457VX
         Ehd3UvkUHaqnWVtNl5Yhok3ciBieqGeJ9smgarRrEGrMZD8wJ+RyK21O1kVfszahcKAQ
         1JfCR6GMKLmQcAF9S1lxq4qq8ETCraVQ14j3eil805xRkwv8JB1xNJfzM70HMHId4Jt1
         PnNeXtzsgQz4YFIlo84bs2XPdiyl8yg7hne1bsU55rk10UVgYx+/WPW3qNUlFy+MHL95
         y6N/nWy8aDChycA4rZleL+UpFoFcldr4dg3+v8PTbq1siLVeRsRHll6eGEfTe1Mtm8Mc
         kP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Nl9X2dBBteRxXc88z+X5/Ev/rJGuG6QGv1Den2poAo=;
        b=1+nZuL5bE/BKau0l+cuSJnRX6gEhNpYhooTCGW/6bm4rGekXdSvv64wN1ivL+KmQjf
         R8va07Dxc3Faq/BTowVthrYsVQHcEcHbENPJIP3jaajlAvIPaKrzQjYBt7uy06xbByDH
         O8pI0Boq8RRbXIRkPRS7d9agBeiITt21RnNIIvZXl8AOjghwwc5BjLWCuCtfCaJUryUA
         wcE9oDENlOitX/L044DE+Hlt633Wnlqx2SQq2oXPONDdQpM/z9sMEvqHuxhFpDKf+5N6
         umb9OJUPa1OfD65wEYLIOoR7oFSZih57kdChsDHupbQcXYMUDZ14VxbiAifpzxlyHR9a
         Fcsw==
X-Gm-Message-State: ANoB5plQ8Tdg5KJFZOgWTXqbrxflj0nBana8oa1i1TwnyQtvCBHtRuln
        1+sItEb3ocXtO6cK50E28WghzMNcCz0nNpESAaR02Q==
X-Google-Smtp-Source: AA0mqf4Cv2JnITywTHhrkvL/GTP6vT4b3f6IswQJeiG7a8Mg9w83igu2bpdNd9+ZL4uYMG7Wi/gfCKeZ/s/hdK39c9A=
X-Received: by 2002:a17:906:4911:b0:7ad:9891:8756 with SMTP id
 b17-20020a170906491100b007ad98918756mr15884330ejq.203.1668548533646; Tue, 15
 Nov 2022 13:42:13 -0800 (PST)
MIME-Version: 1.0
References: <deab9696fc4000499470e7ccbca7c36fca17bd4e.1668458274.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <deab9696fc4000499470e7ccbca7c36fca17bd4e.1668458274.git.christophe.jaillet@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Nov 2022 22:42:02 +0100
Message-ID: <CACRpkdY4+FtRc63GY_A2Gwr-cstMfsMvojHmQ_o2UQP0ymasig@mail.gmail.com>
Subject: Re: [PATCH] usb: fotg210-udc: Remove a useless assignment
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Nov 14, 2022 at 9:38 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> There is no need to use an intermediate array for these memory allocations,
> so, axe it.
>
> While at it, turn a '== NULL' into a shorter '!' when testing memory
> allocation failure.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Fair enough!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I have sent some other cleanups to this code only
yesterday, so they might collide and they you might have
to rebase.

Yours,
Linus Walleij
