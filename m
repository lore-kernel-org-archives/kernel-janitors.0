Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1419EC433EF
	for <kernel-janitors@archiver.kernel.org>; Mon, 14 Mar 2022 18:21:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243799AbiCNSWm (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 14 Mar 2022 14:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243839AbiCNSWk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 14 Mar 2022 14:22:40 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A669A3BBCD
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Mar 2022 11:21:29 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id s25so23201798lji.5
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Mar 2022 11:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1oixq+wvjYzthzNZ1BYgX3Lz4ydO/fekdRIrbKTsbhM=;
        b=E+Jc37Qf4L7KuZZ++HrRrbaMHzs7fTmNZ3xJc4VLSrjU6m2rek2V98HZcbgjE/khdf
         FIaSgoeSe2ChD9MeFM2oTHI/U9n+mGoTvZLQRFjQzBZYRspuYdgvATFj/ixr5dPm7d15
         UDXlDF/o6mlPgO6+geol5z3gDquxFJv1VfRj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1oixq+wvjYzthzNZ1BYgX3Lz4ydO/fekdRIrbKTsbhM=;
        b=rFGc9qSbyXKjRHWI+iNRlcLjUy0PXJpuf9r/AMGkjYrSMDUDudRU1xi3JfKfe62Kz5
         tZppow+SF6vEfnw3JM+7z0UoQfysjMgiUaHW553jJwy/0huKMIaHzrmngOIJi9lE5ae8
         Fegywtc06MI6f41nFjro3+/YGalibL7/iZW7U9iUEp+nuDayzX6pRp98ZJ3JTG5qGDuq
         a7IIXJuwYQ9oMczN45RVv7brssM/c+e/4r8Zjc+XvQqW/LR5ei4bB6P/wVZ6bquHpd2Z
         LzF3AFyg8nxVx57zf2lixiG/87q3y4cq1Lv0DIQ7kenr1dlE2xiDB1lb7o6+8qEeiszU
         /sdA==
X-Gm-Message-State: AOAM533JPR1xuEK6d8ZFG3Jzqcs0R9E9x3hC3JCxf6e8bJX99HZ1uHsm
        l+gZM18ux+TSvvOar9Ec+g1QaDVcxn4vDDzT
X-Google-Smtp-Source: ABdhPJzD7WO7STglrodYDbUiWbUXwPjbPDu7ZBLQxPKGF7IYXlwM5KkmLdJHpI5T91otEsCrOYVilA==
X-Received: by 2002:a2e:b895:0:b0:247:f7ce:9cdd with SMTP id r21-20020a2eb895000000b00247f7ce9cddmr14482730ljp.225.1647282086543;
        Mon, 14 Mar 2022 11:21:26 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id d8-20020a193848000000b0044875c5d632sm2164506lfj.9.2022.03.14.11.21.25
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 11:21:25 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id u7so23131751ljk.13
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Mar 2022 11:21:25 -0700 (PDT)
X-Received: by 2002:a2e:9904:0:b0:247:ec95:fdee with SMTP id
 v4-20020a2e9904000000b00247ec95fdeemr14708357lji.291.1647282085278; Mon, 14
 Mar 2022 11:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220314154605.11498-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220314154605.11498-1-lukas.bulwahn@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 14 Mar 2022 11:21:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wju=Lx3b5NQ9KntQ=0JvvXcJfpjt_nZOMWV43OWwPrUQw@mail.gmail.com>
Message-ID: <CAHk-=wju=Lx3b5NQ9KntQ=0JvvXcJfpjt_nZOMWV43OWwPrUQw@mail.gmail.com>
Subject: Re: [PATCH] aio: drop needless assignment in aio_read()
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Benjamin LaHaise <bcrl@kvack.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>, linux-aio@kvack.org,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Mar 14, 2022 at 8:46 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Drop this needless assignment in aio_read().
>
> No functional change. No change in resulting object code.

Ack, that assignment is indeed dead. As such, compilers will remove it
and it doesn't "hurt", but it is pointless and possibly confusing.

> I cc'ed Linus as he is the author of the referred commit, but I expect
> that this clean-up just goes the usual way to Al Viro and then in some
> git pull to Linus.

Sounds good to me.

                   Linus
