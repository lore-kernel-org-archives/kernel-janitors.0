Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85698C77B75
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 May 2023 11:39:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbjEELjH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 5 May 2023 07:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbjEELjB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 May 2023 07:39:01 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2702F2694
        for <kernel-janitors@vger.kernel.org>; Fri,  5 May 2023 04:39:00 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-b9daef8681fso1481735276.1
        for <kernel-janitors@vger.kernel.org>; Fri, 05 May 2023 04:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683286739; x=1685878739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puWCJyuFf3yp6BwyAz5qUYq78oF9e+xdSzj78gCEdNE=;
        b=Y0Y/0YC+7QL81nt9H9hIuiBWkuL7s/MD2CaHmSwYjTa9/pP1nMLmCAYN5YYZLHeY+9
         QHRWhAZFPTLqMLBuQGfw3+7GQMtw8hx+rr6QOcZOEx/Q1WC8Ep7HZXRnUmuxoDm7jt71
         rgSHQqKW9BTHsYCkUySzUGBr8ro5MavFn09rFJcUazJXA1O5PIUOKhUIuM/I+cWuNTqF
         TJEGOZW422cFvc4OOlja9+727aErAFw25YusDW1D5aFJoZsjbHCzcJQTKSnq7dtz6Fe+
         TAuBu9qis9CBMPOcHnexsoS/bHvgGbNhxmXURDjYr/BOhUMysnln/dG3efrq/VdfG4hN
         jsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683286739; x=1685878739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puWCJyuFf3yp6BwyAz5qUYq78oF9e+xdSzj78gCEdNE=;
        b=LFS78sAYO3VJb0FxxpXBVUsz500c9ZeaP+6l+bk7Oat7fMc1fKORDLNCbIC+kvNmtX
         v6XnGWLemjUsOz5ses9jcel65vl/v3DCu7ktlqwTC+BgbzF61NJiaEWn0TlyoxKQNKWi
         2CxsfuMeKABTgd/5GmGGfsmjGFe1aKwEi3kKwIhxWHMp+h1OfhhY7mpLpyCnjiJCw74R
         ExdFrfISD5YuGdyaBp9CFYP3xsaVCxEWvYKiO2FUqhLeKKMEz3WkMwto1wvuv/8/ZYJi
         FwbSu9OJ6nqR7LlEzHHyvXM6cnd7Vh/w5zrNvggp1BFlnSTFsp6J0qiI5f45g8AJsgYF
         webQ==
X-Gm-Message-State: AC+VfDzmzbIrYlsoTKkfADD5Zf5KrA80gAJy6sUSSHqmmk1AnHute4LQ
        /8SAWxEExu7rkoFsvfWT6VquLrDIXgVDQ1YdR9WNwQ==
X-Google-Smtp-Source: ACHHUZ7URXttrI5x/goP9FFi/xqVcIK9Vs/9Rym9CIhV8xMlCn+jPRw8C8kuiLQGeBOCQaw3GehxNG8DWIICXQgQaeU=
X-Received: by 2002:a25:c7ce:0:b0:b95:941a:86c4 with SMTP id
 w197-20020a25c7ce000000b00b95941a86c4mr1291465ybe.26.1683286739409; Fri, 05
 May 2023 04:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <98c3b5890bb72415145c9fe4e1d974711edae376.1681681402.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <98c3b5890bb72415145c9fe4e1d974711edae376.1681681402.git.christophe.jaillet@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 5 May 2023 13:38:48 +0200
Message-ID: <CACRpkdZYeHUkFC6U-abk=-e-3MO6DwTqE4WSc+rnHv5teQcdyA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm2835: Handle gpiochip_add_pin_range() errors
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Apr 16, 2023 at 11:43=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> gpiochip_add_pin_range() can fail, so better return its error code than
> a hard coded '0'.
>
> Fixes: d2b67744fd99 ("pinctrl: bcm2835: implement hook for missing gpio-r=
anges")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied for the next kernel cycle (becoming v6.5)

Yours,
Linus Walleij
