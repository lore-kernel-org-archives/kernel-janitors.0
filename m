Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608A7C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 28 Oct 2021 18:52:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47811610D2
	for <kernel-janitors@archiver.kernel.org>; Thu, 28 Oct 2021 18:52:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbhJ1SzH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 28 Oct 2021 14:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbhJ1SzH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 Oct 2021 14:55:07 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82C6C061745
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Oct 2021 11:52:39 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id b71so5925737wmd.0
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Oct 2021 11:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n+2Ro5WiaxdU6F81hXFf+PEN6KfpVQcZNINfMQcb7Xo=;
        b=FU4x2wrgrYdYwv9cND7PXSB1uY0sQDnXx91yOSWQzHIL0IhMqrHEPt3WYCnwsoHBVX
         e/HSJ5ul0zmAGwq3ysQqyUS/QesKcZmpHcIqWehwuPLCThBOgidSYCNDf37vbXqzChY+
         ejElGG/9qcZMeqxP5LeIK6cLztdmb0d2U2WlQc0U8OLjI2T7xoQ8iJw7M+1OVRejKKGg
         T+emZyfvR+XdSmYqvEx5EKgy5qO1llTsgk0dxlyTvq/hwjZXf0wcM34ELwmVMH3T6IpD
         xA2QUVTr23GgI+amCHLtVMjLvnKe4bQFRikJFuRab+rSviLSz99xjv+AG6+xGshChJr9
         YfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n+2Ro5WiaxdU6F81hXFf+PEN6KfpVQcZNINfMQcb7Xo=;
        b=af3acy2wgwKdSh/h2qI1xJQ68b7Y6Acvs/jsMw40EpwSLyO7NofYbYS8DH9dcWNy7l
         TdUAaVDuH8esRV9syHG0EjlT0ugDgJoSiJZcADQ9KBkcmzjW7qFoONCWvLFLzXtGqUe+
         MBLoR4S5o8/IR4KiLnC/ZQGUZFuKOO+6WwnnB+0HwhPX/wKHiMsjJ+KtcvNH6bM6RA5B
         sY8ulP9ycY4Kpv1cIOPzOw6U4gkQ+ZVWfan6gr8UBuhILkSTS9WiSG0+X56bGmgaTSAx
         iedUjUuNWbZ5Br41nY5AkA7T6qbYjBlyXx9bUMDIt2BjsmFa4RBccnywxPm8TgQPMawJ
         tdHA==
X-Gm-Message-State: AOAM530m+dvPDRu4/FcYNr0VTj88BEbdebIlqkO319CC1WgdHAwTclsS
        aEObJoha3EW6K8vdKeuCN4YX0QBT2AmLgd2tqpOuvw==
X-Google-Smtp-Source: ABdhPJysUVwO6PwrXdxEyJkcGXuZ79xYuIE7gqCCaodfcHZHdA6HGzt8HMSB69ZpgJ5CQGXQL37RjyY1pbzie4+cX3M=
X-Received: by 2002:a1c:2386:: with SMTP id j128mr3853019wmj.8.1635447158349;
 Thu, 28 Oct 2021 11:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211023115209.19115-1-colin.i.king@gmail.com> <CAFA6WYMJkEPOCUMeF1EL7G1q7akBc-os5GF33Dkh6nok8fANZw@mail.gmail.com>
In-Reply-To: <CAFA6WYMJkEPOCUMeF1EL7G1q7akBc-os5GF33Dkh6nok8fANZw@mail.gmail.com>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Thu, 28 Oct 2021 20:52:27 +0200
Message-ID: <CAHUa44H++gHiiWMssT_G+tR1z1FnDjn7j+-5xC6rXCZHbWd7=g@mail.gmail.com>
Subject: Re: [PATCH][next] optee: Fix spelling mistake "reclain" -> "reclaim"
To:     Sumit Garg <sumit.garg@linaro.org>
Cc:     Colin Ian King <colin.i.king@googlemail.com>,
        OP-TEE TrustedFirmware <op-tee@lists.trustedfirmware.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 25, 2021 at 10:43 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> On Sat, 23 Oct 2021 at 17:22, Colin Ian King
> <colin.i.king@googlemail.com> wrote:
> >
> > There are spelling mistakes in pr_err error messages. Fix them.
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> >  drivers/tee/optee/ffa_abi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
>
> Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

I'm picking up this.

Thanks,
Jens
