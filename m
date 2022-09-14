Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F55ECAAD3
	for <kernel-janitors@archiver.kernel.org>; Wed, 14 Sep 2022 10:24:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbiINKYO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 14 Sep 2022 06:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiINKYM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 14 Sep 2022 06:24:12 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AB97B1DC
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Sep 2022 03:24:08 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id m3so1685444eda.12
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Sep 2022 03:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=cEOY86r4oJ9dG+dY6gFKjMyCCLe5WdgdPOCSwvF8n+4=;
        b=kijWTtrs6ynnic9VTdde5xeuO+1B4o2a0m7MCwMHZwPuVuTBv0UaxW9hAicCcSfqQo
         eKJzNVrd+p8Uxh5HXVgDTjRJ9Td/kGbI2Fj+2eQPRvz1WAYAgmOcZI79MFN3LinhPURs
         yQDCn/t3OGjLCgWIvGqlaDmI6JWaR2QtyIRS6X4oZyK8Ty8aU8dC+qcC697zbeCITDGM
         ZxsPjY9FULL5AmVkKvxMb+ZCktAtZR1fwp2U7c9xtdtcboMJQ2b9Dh2sdWQKPNPhtG8u
         I+BT0CkTp6Aw4IO7cGgbDrHjOy3voPVjYE0h6TMVP1jPmdKzw7TJ/Fiao4m0f5Ts1ap5
         qe5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cEOY86r4oJ9dG+dY6gFKjMyCCLe5WdgdPOCSwvF8n+4=;
        b=FIk/YX731Z5Ij2DIENjaATLRRLCLyUzxPZE8DW4nFLuvtHuuDY5DYQLqPJZkb9p+QF
         pT6TroR/t6I8mNy32H/x3l2895jcdgIiOgGj7vUzNsvMxPsnxBr2HcPZpyR4TbIssJka
         BtUuspNSh8rp4+4TPE4TJA5qCJVfJEjH7DNR5TAK1FA0uE/ud4ASPP5y/IUqgntlptLH
         0oipenB+hRmjOCIodt4xuot1pMtWWmyNCntOTkykFly3NeuGyLYBwKLPlRzd5nuT6jFT
         ksi0CtF3VW4sfeo37YDLHM8TGgdX/kbRBZOt4Ly70TcntzyRTCSwbnD2duS7cKkqUbmx
         lKkA==
X-Gm-Message-State: ACgBeo1eQt2BZOSYeRLbfqF+YPMgtcuFF9o8PSIU8e9KRzpKarJRvbLp
        HsUJt2xllOWUZxQB14vphcsLoWWSr78FZuvIdzBvUw==
X-Google-Smtp-Source: AA6agR7rCMfwCFbu7eOJQgVzPOx5xJvdUFsVLXdhChnO5WCdop5AwG82PCXBZc6QQpS6OBmvtNOELTTHheJUOo2dac0=
X-Received: by 2002:a05:6402:f07:b0:450:bf95:59e9 with SMTP id
 i7-20020a0564020f0700b00450bf9559e9mr25103503eda.46.1663151046746; Wed, 14
 Sep 2022 03:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <3cdc2e776dea77b07c75694ba1410bd21e8ed749.1662902045.git.christophe.jaillet@wanadoo.fr>
 <fac99d27-2e28-3c08-4cf3-c97afec99b77@wanadoo.fr>
In-Reply-To: <fac99d27-2e28-3c08-4cf3-c97afec99b77@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Sep 2022 12:23:55 +0200
Message-ID: <CACRpkdbA4m87swhTSGibMz9WUdpffdMkQwodZh2wknLOw9jmOQ@mail.gmail.com>
Subject: Re: [RFC PATCH] checkpatch: Check check for places where
 dev_err_probe() would likely be better than dev_err()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Sep 11, 2022 at 3:21 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> Le 11/09/2022 =C3=A0 15:15, Christophe JAILLET a =C3=A9crit :
> > Some functions are known to potentially return -EPROBE_DEFER. In such a
> > case, it is likely that dev_err_probe() is a better choice than err_err=
().
> >
> > dev_err_probe():
> >    - is usually less verbose
> >    - generates smaller .o files
> >    - handles -EPROBE_DEFER so that logs are not spammed
> >    - automatically log the error code in a human readable way
> >
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> > This patch is only a PoC to see if there is some interest in such a new
> > check.
> > The hard coded '5 lines of context' has been chosen because a typical
> > pattern is:
> >
> >       clk =3D devm_clk_get(dev, "clk_lcd");
> >       if (IS_ERR(clk) {
> >               dev_err(dev, "Error meesage\n");
> >               return PTR_ERR(clk);
> >       }
>
> (adding Linus Walleij)
>
>
> I forgot to say that this patch is a try to address the comment from
> Linus Walleij at [1].
>
> It would not help "fixing a gazillion dev_err_probe()", but it could
> help not having more to fix later :)

Needless to say I am a big fan of this patch!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
