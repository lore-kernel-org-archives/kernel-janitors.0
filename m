Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9213C433F5
	for <kernel-janitors@archiver.kernel.org>; Mon,  1 Nov 2021 17:19:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A22260EB4
	for <kernel-janitors@archiver.kernel.org>; Mon,  1 Nov 2021 17:19:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhKARVu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 1 Nov 2021 13:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231665AbhKARVt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 1 Nov 2021 13:21:49 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 268B0C061714
        for <kernel-janitors@vger.kernel.org>; Mon,  1 Nov 2021 10:19:16 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B25EB7DA;
        Mon,  1 Nov 2021 17:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B25EB7DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1635787154; bh=W1VBPrgIwTLYR6IucWEejHcqZPKiwUe3RWwN7QzUVl4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=V9lSA+vlYs0JhcnArZ+y9KA7/QQbGTxpyAxIXUE+lCpW5/Xox42DDDGL/dwQKf6Rh
         UBu31wyaYs7nw4NxAnPqYPpFGd2lxMMh6sq1rtzr825EgmZNafqG6psuvw/XoXeCvl
         Et5tMCefJ7XG+YKUFPJQxZBHMqNlI1XaEXsEJS0S4v5T2mpJEDoEhoNfpJVcqbKnJV
         mI0PNxKkIIfGvsIpwL/FaokxnBu7VrDd22a37QTe/xmOc9sXq7FklyZPAfEgbwksg/
         SoWwAtxEolv2fo+e4LXLgAtONI34n1FBC8bamlQLYNBdxLzaboQ9Gg9MLz8LcdLukL
         qPmmagaraS/Ew==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Samuel Thibault <samuel.thibault@ens-lyon.org>,
        Colin Ian King <colin.i.king@googlemail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] speakup: Fix typo in documentation "boo" -> "boot"
In-Reply-To: <20211028182451.baizgvczghh37zfl@begin>
References: <20211028182319.613315-1-colin.i.king@gmail.com>
 <20211028182451.baizgvczghh37zfl@begin>
Date:   Mon, 01 Nov 2021 11:19:14 -0600
Message-ID: <87k0hr6bfx.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Samuel Thibault <samuel.thibault@ens-lyon.org> writes:

> Colin Ian King, le jeu. 28 oct. 2021 19:23:19 +0100, a ecrit:
>> There is a typo in the speakup documentation. Fix it.
>> 
>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

But ... we just got a kernel named "trick or treat" and now you want to
delete "boo time"? :)

Applied, thanks.

But, Samuel, while you're on the line, whatever happened to the RST
conversion for this document?  I'd sure like to get that (and the
associated license change) merged...

Thanks,

jon
