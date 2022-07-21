Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC786C43334
	for <kernel-janitors@archiver.kernel.org>; Thu, 21 Jul 2022 10:02:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233025AbiGUKCq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 21 Jul 2022 06:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233051AbiGUKCn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 21 Jul 2022 06:02:43 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E4951A37;
        Thu, 21 Jul 2022 03:02:40 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id k85so1928690ybk.7;
        Thu, 21 Jul 2022 03:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AqGmjR2+GTu1CpGAOg+QTnI8174UbE6nzrk2irtWBkk=;
        b=UEsipNb57AhFEMbDrtie9C0yYQo/yw3O51Hv1GxsNCyJjzYjLo64IEuJ5mdjntGoN1
         Z1aSdoeFvICx2Mc1y8X2hVFKgFtSaoGCjDJYgJobrWVRCaCH8heGX0W26SIhLMw3w3BC
         XizFJyTPf57DBk3NU8fAFA0DkenX3cLMFG0Y65oBHbDosTJUkapXIKWO5ZST5KeQvBVU
         o87MFpcm3s1YNuNRNMVM0d8gcDznoB24sA7miyH/FiVHx6N5D6WQfNr5tY2AnqQXCzJv
         fMuOc/o15ER+gzH5cOTvwhlwSVDxsyRPx7DXqx9fpwng0P+UI5PXK6/s/3VWBe2Qiaen
         Trww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AqGmjR2+GTu1CpGAOg+QTnI8174UbE6nzrk2irtWBkk=;
        b=HSNAqksVjz1D/VS9Kjrw5nqaE/XxUKyOFOyvuZl6T7UTd+WmzpoKBlYb+md8zjZAii
         y3WdB63LSqCyoQOmmTNnVsTfWy0qvk1vXObo5C/VslMd5imqvlZtqLJQxdJrYw+7vUuT
         6NURV5G0edL6BLNI8WUTHhSBDLAEUInjtZPjYEFcJtBo1G0dC/q/FBzDle86JJdTgJQx
         FDQqBIPyV56XTMyA9rtOZkKdQbgpgIGi/iVxksG1C5RZVlJlio+YRLP4zGteg8exEEbU
         rifwR7JtfS91K6XRTs0wcoQogilQoAhga61EAQz9dgxwu0ZtF+yZZ9s9vikoBxq8IlxG
         zItQ==
X-Gm-Message-State: AJIora/4UdIvr4tuFeMryR8+P/WKGr9S+1kUf+xqF75uJ81TLsryQaeL
        fgDuExsVI1DN703dLh0dX1ZEDbPM2ddNpKuVUYo=
X-Google-Smtp-Source: AGRyM1sYPhG7KkUxUABQ521t6KJr9aHHFwWpUoRJ1szB4zXIHwZPGPCZk1lgL+GBPGO8e5irTkSlOIxD1KeP4xI33CU=
X-Received: by 2002:a25:2595:0:b0:670:3a85:78a2 with SMTP id
 l143-20020a252595000000b006703a8578a2mr17978596ybl.389.1658397759781; Thu, 21
 Jul 2022 03:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <YtkW9awXT3nWyvts@debian.me>
In-Reply-To: <YtkW9awXT3nWyvts@debian.me>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Thu, 21 Jul 2022 12:02:29 +0200
Message-ID: <CAKXUXMy6Jwf_NmNUETq__BcYZ4SxB434YRuP4Q6+Q9hkM-+zEg@mail.gmail.com>
Subject: Re: MAINTAINERS improv suggestion
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jul 21, 2022 at 11:06 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> Hi Lukas and everyone in linux-doc ML,
>
> Thanks for your work on doc cleanup. However, there's still one thing left:
> MAINTAINERS. The patch submitters tips, IMO, need some work.
>

You are welcome.

> Here's my notes:
>
> * Nowadays most drivers (especially on embedded architectures like Arm) were
>   initially developed out-of-tree, then follows mainline inclusion process
>   But the second item read "Try to release a few ALPHA test versions to the
>   net. Announce them onto the kernel channel and await results". These
>   drivers were submitted not as ALPHA-grade, but near-production grade.
>
> * The fifth item mentioned using `diff -u` to generate patches, however
>   since 9f364b605f34e1 ("submitting-patches.rst: presume git will be used"),
>   the documentation elsewhere assumed git would be used.
>
> Thanks.

Thanks for the notes. I will take them into consideration.

Feel free to propose a patch, though.

Eventually, we might decide to delete the complete list of suggestions
in MAINTAINERS at some point. But for the time being, making the
suggestions a bit better might be worth a patch.

Lukas
