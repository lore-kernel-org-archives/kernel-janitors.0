Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F18BC433DB
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 15:21:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3790A650DB
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 15:21:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236470AbhCPPU5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 Mar 2021 11:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236259AbhCPPUp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Mar 2021 11:20:45 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B6CDC06174A
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Mar 2021 08:20:45 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id c10so13009627ilo.8
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Mar 2021 08:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/UuHH6S4omvQNoGnOZZcOzpsfa36837+ZEHidcXAcWw=;
        b=loZe3z+af1yfMIH0fw3UB2IGXE+CmY8/A95xgriNOJIbxuIlwa5bc8FvnfBNgb8922
         T0KBAlkgeALEbR4LAj2ro+BTlEwtGWZ4D3mULr+e9aSk+NT8lKjOdN+Ch1Xe98Leqqc1
         Ly1UgUxzxhqU0OGD+zULrZDoYz16jcA9hJeUOPKiuzPzWKDFlI2KDvSn3H1SqqZpI8m+
         8/R/JKZ9rCkJrT4JJrObcKMdvEfXqhyeCgjcEY2AFOxuDsWYCTm01IBhXAFet4XIbGRH
         OgJ1+bmWFf8Ql4unwAAVZxDhHudqKKpWfNBARi++93F62j7pxtnb/HY8GxAe1GIgC2bp
         seGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/UuHH6S4omvQNoGnOZZcOzpsfa36837+ZEHidcXAcWw=;
        b=UXnZ6+PdC240PEkl+x4Uz2uusB1CF0TMkrmUV+VLcpO2UGcWoYoGFR9mRqJHRRuBQN
         WYmQSnXmT/lEJYLF1XMQx+GNWeJ4XzDYqi4+PfqhmgHaf68e1krcZlAo12xORDYuU8Yy
         lAlpdYeP8uEsT3idu/+PyQBdYpBdDTesJGetYZnCtSGYLvcFOYgmh9l9Zpepf8SaUTfJ
         ieps/kB8TekUgPRWYwukzKHiSRn6apfLhNGszUc2eqmKYC88Eu6o7KA3GJItR5DnLIw9
         YgnlDg3PeVe/l0rQoiKU0T5sgb+2m+Kh+6psEKgyNuxDdtAoH6gtlW6amvw8D3yzBuVo
         0Rbw==
X-Gm-Message-State: AOAM533b2zv0O1ECzBHcNDlYpkVZ9p83DFedj3PGmf5dEEfxQca+MHNQ
        d5/9szWKCBaSpc6yjDEKSfGnfwww9D7raBi6MxdFy+tDbMh5Gg==
X-Google-Smtp-Source: ABdhPJxqff8ICXxTLf0yk+k/1lQbmw7jOPvSxKxc8CZ0u3km2lP6GuCfPoFrofMM8Ux5M5/z87PntFHj3bFpIC56bBA=
X-Received: by 2002:a05:6e02:dce:: with SMTP id l14mr4097286ilj.102.1615908045036;
 Tue, 16 Mar 2021 08:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210312145941.1721627-1-eantoranz@gmail.com> <CAOc6etaLJdGJHk7F6Vm3iCVW=OzKiWZ2vCFAc_sZn7VAGM4Dyg@mail.gmail.com>
 <alpine.DEB.2.22.394.2103161557150.2872@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2103161557150.2872@hadrien>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Tue, 16 Mar 2021 09:20:34 -0600
Message-ID: <CAOc6etaqF3uBzkNr9rcMf4P5LZPwqCo_ZgcG4VjgsNnT+qi6dA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: vt665x: fix alignment constraints
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Mar 16, 2021 at 8:57 AM Julia Lawall <julia.lawall@inria.fr> wrote:
>
> Whoever is the maintainer for the driver should be included.

Right. Will send a v3 patch with him included. Thanks!

>
> julia
