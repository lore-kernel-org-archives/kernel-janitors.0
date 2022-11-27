Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B12C4332F
	for <kernel-janitors@archiver.kernel.org>; Sun, 27 Nov 2022 22:07:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiK0WHx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 27 Nov 2022 17:07:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiK0WHw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 27 Nov 2022 17:07:52 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C00D24B
        for <kernel-janitors@vger.kernel.org>; Sun, 27 Nov 2022 14:07:51 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 205so11207014ybf.6
        for <kernel-janitors@vger.kernel.org>; Sun, 27 Nov 2022 14:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QTuQK++WvCw4AenD/ByjFB9xfaDXAXEdI7zL7dwhMYA=;
        b=xRmt3Iwow88UXHBQ1h1i38Y7tjZvkahSpU0bdukn+sTbwlRW6DjdetXY6xZyB0vzgt
         J0jGBR2Zc272ecTguS/7FeQhe0CbGXPm+4Nn2hswWY61EclZ7xwvQCTv2JW6ft6IEvOk
         DmW0yXNKxwyIDMjt0xX26a9ncE6SG8YTKZtIEDzAi9bB5OCttGQGof697ndPNeKvZyNw
         lF3jZH0Gidq6pxBsxQ0YTGskEXzsOekuYiA48fOukatjlG15ylaiAYoaBjzBy5l/M5Cj
         ODGBulmgjFy/6Rb1EB/nHTC6r7vverT5/NEchhk9hbali5OZ+bcvDBpxj6bSs1nnc/cg
         shSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTuQK++WvCw4AenD/ByjFB9xfaDXAXEdI7zL7dwhMYA=;
        b=Hv0XBp+l7iYNnyeKY1Qj2WraAsATfZodyfhtCac1WmFwTLerGRYpI1t6C31m87E1st
         JHeioM6kkbEz3sNE6JDBOZPJ0qutSmyWjSGF4bAb22yjDGKqwoxFI4t5vYVcd7ZHGW0B
         YDzNFuhd2ErqYCjctNQc13Xw71Njkd3hx/zO/ygtNTSkKfjT4PcO6zAvljuHzXHEAzSp
         9jgxTa3E5ypGTMuT0vmi0sL8jcOb9rTelJPiKeRBWRI+/Qp7SIuV8Jdz9H0pZ8fkz7b9
         DPOPKAazXkde+jMYv74CvYH3LR2BmasGXaObf4U7qSdRfh7b4mbdwHklYXr3koWDmXAy
         owPw==
X-Gm-Message-State: ANoB5pnsa5XMYfzzW+h5zEI+dPd42z+17mBdU36kZwcUJoORWjf31777
        2fm9gKdL6dDNk5MgX6r8hpvBmUlfI96x3F9BPHcLLg==
X-Google-Smtp-Source: AA0mqf4828ZPtJcTGa/IZef2ZjFxO4Gp3F1XLdaeCoJ+TITzHvqfT4VPRmT5o/R3Iu1aX9zy3Kf63CdiUHl6nAhnrtM=
X-Received: by 2002:a25:d8d4:0:b0:6f0:36e2:5fc2 with SMTP id
 p203-20020a25d8d4000000b006f036e25fc2mr21279966ybg.52.1669586870572; Sun, 27
 Nov 2022 14:07:50 -0800 (PST)
MIME-Version: 1.0
References: <3f75784c57dc0682b5e1758daddd93fee6bb4b27.1669585920.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <3f75784c57dc0682b5e1758daddd93fee6bb4b27.1669585920.git.christophe.jaillet@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Nov 2022 23:07:39 +0100
Message-ID: <CACRpkdZU3E_aFjC=yghzpyXPgyZGLa4xJTVr2jbLenGL1MManA@mail.gmail.com>
Subject: Re: [PATCH] gpio: Do not include <linux/kernel.h> when not really needed.
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Nov 27, 2022 at 10:52 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> <linux/kernel.h> is included only for using container_of().
> Include <linux/container_of.h> instead, it is much lighter.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This is fine.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

As Andy split out the container_of header file a year ago or
so he certainly want to ACK this too.

Yours,
Linus Walleij
