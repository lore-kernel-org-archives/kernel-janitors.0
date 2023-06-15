Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157ABEB64DB
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Jun 2023 06:35:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243854AbjFOGfM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 15 Jun 2023 02:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243849AbjFOGee (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Jun 2023 02:34:34 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 696E72945
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Jun 2023 23:33:52 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-57023c9be80so9169047b3.3
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Jun 2023 23:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686810822; x=1689402822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZ8sWmOrvIq8waWFLXgCuASTZeEJ+zlwoDAZjDpRLXY=;
        b=sZwOdz+HYW1RyLBwJv5FpAqZ/3fHatoK9ha9qk0QYWSnb/RPSEgnPBWDxKpnO14Rku
         c4u7D/jlOGpcdFumrjwUHL6wMD5ELePVg1QTvKB1QlW9Z08bX2REnMA2QxzE178q+0bk
         Cy03GwkjOF0SFnkcfzJdV13dkMeilNTc/L1wuarWkI6v6gwHNRdAGi0knEDVltg41UHM
         ObudbUHWQn1x1MQMTY8lYuAhkTknkgJDIENtkwnhNUg/Q9Si+/r9cBBp3XGOKRQJay3b
         j5lzMtZ0+u3slEv+kHtyR9x2hbhZFegeMUet7Npik9wzwYwiA3irAwktA3K7+D9ZBUDX
         Z+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686810822; x=1689402822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZ8sWmOrvIq8waWFLXgCuASTZeEJ+zlwoDAZjDpRLXY=;
        b=XJYgHREsBiWcrpHOS2OrwDbPh+6mkMlqZskixCG3pGm482XfduGLhmOPCK1Jx0OVLi
         HBIXrSNQKjkrOJvOT8sdgpqfsRfJE3LBs37jPWV6vAdkP3D4A0cYvlLKbChnptbmvxmo
         QyLg6r6eYcrwvzgvM3xRMkxQL9C1mYvWcY0705EHsECxvMzcwHbOVG39/jb7duxI3V7W
         QIETN8BTgILirk+b6eTp2Lb8g0YDSXXeTjGj06wA8NNqKk2m3xEroSmBoWkHczfrjim+
         AnAukLUlox1lOZgupQiIyBzVwQNZkR9iOXmIT5HM4qlsYtbsE3sQplEWv1p6BMg/h5cC
         tQFQ==
X-Gm-Message-State: AC+VfDzhFFgt1UaiVlOmJT+O0z37hvAl4s6wLgxuMsOAdoBgqGKSLiD5
        3IXEmVmIAhEKVdAhQ7EKaojiaO2YBdpniIhn4ALPUg==
X-Google-Smtp-Source: ACHHUZ6rMue4kNIamOiSY5UQYrDzI0yab9xvTCydCT7af7qsnesG+N6ZKe4g43aMAhhOI33yTrAKykH99CcrspzzhTU=
X-Received: by 2002:a25:504b:0:b0:bd4:e6d6:2b8e with SMTP id
 e72-20020a25504b000000b00bd4e6d62b8emr3891532ybb.50.1686810822546; Wed, 14
 Jun 2023 23:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <fe7ef901-9571-4c6e-a40e-449046efe2c6@moroto.mountain>
In-Reply-To: <fe7ef901-9571-4c6e-a40e-449046efe2c6@moroto.mountain>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Jun 2023 08:33:31 +0200
Message-ID: <CACRpkdYTcLKBq2s8_kBoM1PtzqNxxwK3wWZp6ORiY__pEkBgtQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: otp: clean up on error in mtd_otp_nvmem_add()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 15, 2023 at 8:09=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> Smatch complains that these error paths are missing cleanup:
>
>     drivers/mtd/mtdcore.c:983 mtd_otp_nvmem_add()
>     warn: missing unwind goto?
>
> This needs to call nvmem_unregister(mtd->otp_user_nvmem) before
> returning.
>
> Fixes: 3b270fac8443 ("mtd: otp: Put factory OTP/NVRAM into the entropy po=
ol")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Ooops my bad.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
