Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9D8C433FE
	for <kernel-janitors@archiver.kernel.org>; Mon,  3 Jan 2022 12:06:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbiACMGM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 3 Jan 2022 07:06:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiACMGM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Jan 2022 07:06:12 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0608C061761
        for <kernel-janitors@vger.kernel.org>; Mon,  3 Jan 2022 04:06:11 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id t19so54694590oij.1
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Jan 2022 04:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qMtHzyhEWbqbm19bVoiJeE6YWmveNNAe5Zu3E0UI3Oc=;
        b=uzTrsZk/Rmjx4CCFEqq2hfEJjdD2M2PyV2u8dBo/tqhMOUK8y334ojBAN9M4XYew6A
         as5dUkU4jhbxm4reTdOgCk6X2kPvp49Vu648qKO3NxL7xhXT0H/8iu8DFzPH0KPmz798
         AbkjwYRJweLAljUKAVCAZaM0DrMg0PmkKtw1YYmwejal16FiuDQSE0v3kmOhM3XbVKAW
         cBD6DdaWGkx7EPXnM+CUR6rneEJI0q1umXTc0oyGz9BwEmvhVZDcONI/f3Y2Fi4a5vkn
         GJPM5aGsDvcvvpdKWy18YJXweyCsMaNPE54RwFvcSO/ctiAjSYAjn9XpZgjpUTZJrK5C
         5kow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qMtHzyhEWbqbm19bVoiJeE6YWmveNNAe5Zu3E0UI3Oc=;
        b=gJG0g1nWZI6z8PmCUu/yCJf4qajcpHKjWFN6YoJKBtPe1xhilTHJBVCsfl/PtW3vNo
         BRnUIO68DIeEjXPkaoRBa67aiudnagkHka8MQ6WJyKBZh1whd9WECvUkLptOQtnVGxzN
         +Xe5ulnrq3BOouwp2FG2UK9EFNcajrm5f16ZieF0xikmjlJYF7AwzgjP9fB9/I3py7cv
         Ufnd7wNrPdYF6jdKV4VxXKTjdKTig6XFwGCOe4UX5xelKXMYJmDwSOPaoC8J54tNnYgR
         ZsYbt4njZba1y9s6F5VtEk0uxU+rEVpjpFFVTVQhFKO2fyuADs/epNPo7yUQdqC53rz8
         Girw==
X-Gm-Message-State: AOAM533an7xyR85oCTEL/pmJeiFsS0P6tLXKRi3Jna38d0qxCmo4AZTM
        gLOz6xfeIyDDUYldw5y1uPUmVyPZfCxo68sqMqxvrTLfU5M=
X-Google-Smtp-Source: ABdhPJxMNNhtiBRZB7BYPRF5RRlNnz8lpBlpxtTV6Loaqhq3INx3P1wTddJQAxYXRUYIn5lE174L8pzu0iHYTyzNchY=
X-Received: by 2002:a54:4613:: with SMTP id p19mr34543676oip.162.1641211571365;
 Mon, 03 Jan 2022 04:06:11 -0800 (PST)
MIME-Version: 1.0
References: <20211229184854.3466-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20211229184854.3466-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 3 Jan 2022 13:05:59 +0100
Message-ID: <CACRpkdZCnbBvzo6KkAQa3T793OVt680DLGrKx6b1OrmeCvKneg@mail.gmail.com>
Subject: Re: [PATCH] arm: pxa: remove dead and obsolete IrDA initialization
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Paul Parsons <lost.distance@yahoo.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Tomas Cech <sleep_walker@suse.com>,
        Sergey Lapin <slapin@ossfans.org>,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Dec 29, 2021 at 7:51 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit d64c2a76123f ("staging: irda: remove the irda network stack and
> drivers") removes the Intel PXA2xx Internal FICP driver, and the config
> PXA_FICP and the config IRDA.
>
> Further, this removes any proper effect from the setup functions in the
> file ./include/linux/platform_data/irda-pxaficp.h. So, delete all users
> in arch/arm/mach-pxa/ and this header file.
>
> Clean up radically various left-over of IRDA in the ./arch/arm/mach-pxa.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

I see there is some noise from the kernel test robot about some missed
lines of code, but with this fixed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

IIUC the future for IrDA is in BPF for the people who want it, so if someone
wants this they need to go and fix it that way.

Yours,
Linus Walleij
