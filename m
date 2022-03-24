Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B78C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 24 Mar 2022 00:30:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244949AbiCXAcN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 23 Mar 2022 20:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241068AbiCXAcM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 23 Mar 2022 20:32:12 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA4BC888C4
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Mar 2022 17:30:41 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id j2so5804710ybu.0
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Mar 2022 17:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+4QpJc7UTXQ25ijXf2+lrnAJ1ejmAWlIWrE7E1j33TI=;
        b=sm2QYz88Sv85BbdSp7wAc5CC6Vfap2Cq9y4XebXVny0JR4QYb9e9KNo/SFvPOwLosl
         mwzbQ7d9he9CGO8zrleFg96U3k6ODOL+TgiCseeneDpFrmmuQJ6QhITJ2gUXejK4cJZO
         +9L1JAd3FXWEhQBeG6IoqDowTNCS3TxIMtQesAWN3eL33dsnwicwyjghchSDKJ2kKi24
         vzXoGk0QUKC1kgbkKA1vKsljIqxDGJ7dgnlzFDebBxH/zmTNZ3EnYs7Tum5btiB3Eho7
         F2j6tTJ1COWjTbHY+1RuJF9pajtIzDt1cFlLuxtbD6p1lFbG1rw+a7X2529r8Xv3c//5
         l8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+4QpJc7UTXQ25ijXf2+lrnAJ1ejmAWlIWrE7E1j33TI=;
        b=RjYjs94sqia9i/gEqG+RNxoxiS2WOU+vOhlBTyeE804rhAMjvJmSkD2ETTn6jeiVbg
         AW9RgsNasmrbTGqbb/jgOIVjPCeH7/3V72xaawOpNwTVc4yMyCTXWe5OmFJTL+gR4Rpl
         F+Rntac41jOLease9SJEnlTo88QotCkAabBzvITK71Kolm3jrr4/pnAoXCwPm4y5yCEm
         g0+cdSEKDUdGDiAvVC58N3XL4SpIaidLW6UpjTY0XMiN2NFM1AQTcpnsVlKF5K8YtOVt
         3R1zw6MwxmqQ4OnHvtpXxpX5+F23iE6aq3JFotGTWySx5oq0Ov49exATNqnrVln2CeqN
         EMQg==
X-Gm-Message-State: AOAM533YBB7Hry5aGcqlTuOzW7EREEnD1VTBAh4trLNN8az02hEA4j64
        Jgad4v4FZ5ocVB4IfEgij/+3rYJmpCUkREJ/72+I/Q==
X-Google-Smtp-Source: ABdhPJziaumYzsskDdP1Z7xO/C1TBQ7mH4rtodDlPc2lDpMBwu8r3qc8JCK82cUNPyNzbPdp1h5GHG0MmzYCPdQlTNE=
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id
 t5-20020a5b0dc5000000b00624f16d7069mr2498519ybr.295.1648081841132; Wed, 23
 Mar 2022 17:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220318071131.GA29472@kili>
In-Reply-To: <20220318071131.GA29472@kili>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Mar 2022 01:30:29 +0100
Message-ID: <CACRpkdbuX2Prw__ka3+ns+eGuE5CtLwrqGjUyHXoy8pRRPURxQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: wpcm450: off by one in wpcm450_gpio_register()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 18, 2022 at 8:11 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The > WPCM450_NUM_BANKS should be >= or it leads to an out of bounds
> access on the next line.
>
> Fixes: a1d1e0e3d80a ("pinctrl: nuvoton: Add driver for WPCM450")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied!

Yours,
Linus Walleij
