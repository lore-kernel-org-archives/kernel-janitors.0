Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF53C43461
	for <kernel-janitors@archiver.kernel.org>; Wed, 21 Apr 2021 15:30:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4BEB6143D
	for <kernel-janitors@archiver.kernel.org>; Wed, 21 Apr 2021 15:30:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238526AbhDUPbM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 21 Apr 2021 11:31:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:54876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240811AbhDUPbL (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Apr 2021 11:31:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E7F3761445;
        Wed, 21 Apr 2021 15:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619019037;
        bh=718R0mWssWWbm9DM0aJGix93KoNJSCbMgOXMmPJ0jgs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HxH5fExVY5G00Yaucsbs0LugLx0HsqMzgzRe+A5a2hzPz8TmXqjJMzHCTeADU0HkR
         7RlxA/xY3oakYs+jK319pxC+xUr3/kJeHqdA5nXcXWGffWzGOjq7dLNdkkcJKzIXG+
         +WExcd807ziYZQf81BKjyNGTaLRP8moTIObiHK8/w8ejsUhxy48R1C5doif/sjk5XG
         KCO8Xz3oICFV5HeAMD6quZW5gN99gIoRKA1HniF+xwrYHGRvMuwgrd0MCXgQpxw3K/
         5RzjihjAokusuvYbk+8MgkGT1tREp24kL3WIa8qR68aqU894uVAuQCcPIiCQbTzEsK
         zEk7L8uFxThqw==
Received: by mail-ed1-f46.google.com with SMTP id y3so13589823eds.5;
        Wed, 21 Apr 2021 08:30:37 -0700 (PDT)
X-Gm-Message-State: AOAM5304ZT1LY/DlbfDGykEOnHmH/ex61jA0KYaTStKZyuY+Y6CkVPV+
        lJlmzW4xnjs1WnZ4bAVXUMRiRywDzMj61RYN2w==
X-Google-Smtp-Source: ABdhPJy//f7FU1zXPNeSv6PF0tDqCIoFAQ6hiYnWTU1NluOr5ecodptHdhmZ4BdAMTUfU0qmmTi4/E9bUHTYpAsZ09Y=
X-Received: by 2002:aa7:cd51:: with SMTP id v17mr39467692edw.137.1619019034404;
 Wed, 21 Apr 2021 08:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210421143124.17873-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210421143124.17873-1-lukas.bulwahn@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 21 Apr 2021 10:30:22 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+ApYJxd2zGFy-XXBkXXYsBeZBjV55cYS_4R3+Ce4u2qg@mail.gmail.com>
Message-ID: <CAL_Jsq+ApYJxd2zGFy-XXBkXXYsBeZBjV55cYS_4R3+Ce4u2qg@mail.gmail.com>
Subject: Re: [PATCH] of: address recent kernel-doc warnings
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 21, 2021 at 9:31 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Recently, make htmldocs reports these kernel-doc warnings:
>
>   warning: Function parameter or member 'output' not described in 'of_property_read_string_index'
>   warning: Excess function parameter 'out_string' description in 'of_property_read_string_index'
>   warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     * Overlay support
>
> Address those kernel-doc warnings by simple adjustment of the comments.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210421
>
> Rob, please pick this minor clean-up patch for the devicetree tree.

Already got a similar fix.
