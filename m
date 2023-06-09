Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A82C7EE37
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Jun 2023 07:34:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238682AbjFIHeT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 9 Jun 2023 03:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238791AbjFIHeR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Jun 2023 03:34:17 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E0ED30D1
        for <kernel-janitors@vger.kernel.org>; Fri,  9 Jun 2023 00:33:43 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-39c4c3da9cbso383885b6e.2
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Jun 2023 00:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686295971; x=1688887971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xNK/MTbEqtX23mMEoAq+L0g1SXC7vXJ2rcTgDZ6l68=;
        b=HEbewUsNGS50ieFcyYoG1ozubQFfbhr2RNELqQTjciRhM1EaPNh3RN2Em5vLBeMtvm
         q17dOBrBd0glGLQTVF2mpHimV4pTUDg9eSLsq3qhZiotjtwxRN80c3wekpJBBfjSydTd
         zQ+M9WjPtBhtGIVsye5iaAKlqbQ27AAgvvzOyN7SVCaG1ivpDi9LKA7Tl1MNcjjteg0e
         2mVsqpj44pYPKTGjDBfxJOJSqC12umF67k3OTW5FH6DTyu2WN2DvclvhEjjU+HFYNbNL
         QvocvVaD41fqDmPXDvtRYC0SWdTy1Pzwc70k/k1WyWAIIsG7wpkN24bfOc98xto5JEXp
         +aUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686295971; x=1688887971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xNK/MTbEqtX23mMEoAq+L0g1SXC7vXJ2rcTgDZ6l68=;
        b=gvFhbR+piolMxLRdwGJUKMRQXDEJUICGy4jYuMVjvjzLCjuTJydi3EekluUEh+28W0
         e1eNSCKq1tIDJllREnoW/YTcvgEWEr8NEc1296bPLhf5kBLzl/Bft8dqAFu5hCjSGdiZ
         RzTU1ROclYPhR95jQ3RONb6A8/gbI9T+ldoyo+OMf/+1ZkxSkl6aT390DNGH1YOgMC2v
         Vlq7QX1EOBt7dca9KU7OF2R0JchyfYwXgqY0PrOqnxiwtudPUXI3TdNB/+DmIG3uQw0G
         9pePE1vNlXH5cFGfoduHbLjv2zJNPd7h3nclyHWmk1j/LLwktEdWDuq5Kavzv1M8doy8
         rEYg==
X-Gm-Message-State: AC+VfDzBRTA5kiqGlc/9MJOYrZjF7Myi9neh+9HES1aazQjvwskdjs2a
        3jwuLesu3ZoKKCOHUfC2DafHSNd2MLe3rKpSl9Mg5g==
X-Google-Smtp-Source: ACHHUZ69Qux2DZuDK2r+yE5twIynB+DgQ/vjsuJQm5q01HxqEW9suuG/ivffLDuAG/2p3WJ5Vkyh2cvCm0uHmfXNdmA=
X-Received: by 2002:a05:6808:1b2b:b0:39a:ab69:778e with SMTP id
 bx43-20020a0568081b2b00b0039aab69778emr729417oib.23.1686295971224; Fri, 09
 Jun 2023 00:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <1685277277-12209-1-git-send-email-wellslutw@gmail.com> <9ace5c4c-5e17-4207-5a02-6a47ba0aee22@web.de>
In-Reply-To: <9ace5c4c-5e17-4207-5a02-6a47ba0aee22@web.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Jun 2023 09:32:40 +0200
Message-ID: <CACRpkdbe2AjD69tpgDDJKf0ge__hoTs72OuT9M-p21_q+z3f8w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunplus: Delete an unnecessary check before
 kfree() in sppctl_dt_node_to_map()
To:     Markus Elfring <Markus.Elfring@web.de>,
        Lu Hongfei <luhongfei@vivo.com>
Cc:     kernel-janitors@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>,
        Wells Lu <wellslutw@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr,
        Wells Lu <wells.lu@sunplus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 6, 2023 at 3:26=E2=80=AFPM Markus Elfring <Markus.Elfring@web.d=
e> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 6 Jun 2023 15:00:18 +0200
>
> It can be known that the function =E2=80=9Ckfree=E2=80=9D performs a null=
 pointer check
> for its input parameter.
> It is therefore not needed to repeat such a check before its call.
>
> Thus remove a redundant pointer check.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Lu Hongfei sent a patch changing the code around this location
so I rebased it manually and applied, check the result, thanks!

Yours,
Linus Walleij
