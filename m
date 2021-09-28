Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B1DC433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 28 Sep 2021 13:31:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C12660FC0
	for <kernel-janitors@archiver.kernel.org>; Tue, 28 Sep 2021 13:31:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240965AbhI1Nc7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 28 Sep 2021 09:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240833AbhI1Nc5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 28 Sep 2021 09:32:57 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66BB6C061604
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Sep 2021 06:31:17 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id o204so8431763vko.9
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Sep 2021 06:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rQfE7KZdMhHmuIeP5K8CNc8n21oMgbxVS8aHE2vpZr0=;
        b=GBJ9+DxuBZ8tnIfVluUcbn6MWwT0n0XFm9KEV4MkSZdaXPP9ywf2wceYCUeXfTmpP1
         FnH/jo9M8QKPEQFKlRcPvUOPX6i9ripLluxFJQEL/fLwObPf9h6MRTozvTh8dmK40l1g
         BETFRGBEgcxYnEUqst4gVyRz8KOa5Cs2Fzti0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rQfE7KZdMhHmuIeP5K8CNc8n21oMgbxVS8aHE2vpZr0=;
        b=uS17hmwzxvcsBr+i1Q8phEgaQbRUROTsq8bj4VmQFwZ6TCpkSIw2Th2iECTpQTF3DZ
         YlGBVrI1x/IHEj5jkkYK5b1JqYjh7jtPbJnNKgFqewICnCRuf3xZ979yQnefCE/AUPLX
         ehFQx8ofL2pOPdf0sfMk7wBHIixvxcxp8f9J98PBKGQ93XwHCQdy9vGKJVyHYi+fW9zF
         jH9R7uL56CqVjzff7uMijv5q7oM3U1NGkI9idv06E5lue7B92cWW/kO2/FDn9sB9i1J1
         W3SQ0A64bTlt1r2SjQcIBO4gGpmPN6tE4DdWU909BZPKTkXxH4t8n9bGzZu2wL3u+uzn
         YoQg==
X-Gm-Message-State: AOAM532e1jXsR+zfyZwCnX8PppJSN2b7o22FFk6zhgOUNBWBrEuEtk90
        AP+7e2yx0JsPLPvsKS1Zjpn3CyOWnGvGUo3qKlSajyW7y3h/Cg==
X-Google-Smtp-Source: ABdhPJyyl8EnZBtIDaoviw2yDgL3lnXXol+EsPgtinlw9lvoATloDRw31vE3TFI2LZd0snFAOEaao3sULK7Kul4/lZI=
X-Received: by 2002:a1f:9d09:: with SMTP id g9mr4598977vke.4.1632835876523;
 Tue, 28 Sep 2021 06:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210928123906.988813-1-colin.king@canonical.com>
In-Reply-To: <20210928123906.988813-1-colin.king@canonical.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Tue, 28 Sep 2021 22:31:06 +0900
Message-ID: <CAFr9PXnMXPmuaUnfr-VwaZDX1hY8ZDtp1+UxOau6DKpUP9FdzQ@mail.gmail.com>
Subject: Re: [PATCH][next] rtc: msc313: Fix unintentional sign extension issue
 on left shift of a u16
To:     Colin King <colin.king@canonical.com>
Cc:     Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin,

On Tue, 28 Sept 2021 at 21:39, Colin King <colin.king@canonical.com> wrote:
>Shifting the u16 value returned by readw by 16 bits to the left
>will be promoted to a 32 bit signed int and then sign-extended
>to an unsigned long. If the top bit of the readw is set then
>the shifted value will be sign extended and the top 32 bits of
>the result will be set.

Ah,.. C is fun in all the wrong places. :)
These chips are full of 32bit registers that are split into two 16
registers 4 bytes apart when seen from the ARM CPU so we probably have
this same mistake in a few other places.

A similar pattern is used a bit later on in the same file to read the counter:

seconds = readw(priv->rtc_base + REG_RTC_CNT_VAL_L)
| (readw(priv->rtc_base + REG_RTC_CNT_VAL_H) << 16);

I guess it works at the moment because the top bit won't be set until 2038.

Thanks,

Daniel
