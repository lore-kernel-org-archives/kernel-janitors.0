Return-Path: <SRS0=g6hj=ID=vger.kernel.org=kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C945C433DB
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 Mar 2021 18:56:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 066DD65090
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 Mar 2021 18:56:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhCESzc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 5 Mar 2021 13:55:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhCESz3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Mar 2021 13:55:29 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A71C061574
        for <kernel-janitors@vger.kernel.org>; Fri,  5 Mar 2021 10:55:29 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id b5so2926095ilq.10
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Mar 2021 10:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wTEQ3liBaU2QUGIl3WUEaeyjObjubIWkSzWM7RalQH4=;
        b=uWPUA5bcT2kgl7CfVs+cz7k+i/utjJ8Kx4lwYEBIdDXWbRSepO5yGt3GlTDJZj29i7
         7jPN/XQgkjXzkJ+GdtNWQ9/wJ+X9opo6Co1qrx3t6LvzkE8PUphixqpJGoiYbqBLV9iL
         Vs7i+GN57PjZTmDDr0FywG502N+nV1StSMfljsm+5uqP4x1i+ZfYLr0DhC0cI6LdC1fU
         1kgeax+xHzvqH2em7fojG6AcfkHf1u+IYnbCbLI6ZPVA9JfvSFKu19T5TZ7gf/HCy/ye
         UN5STA0kCZUMC+Nu8++S7oze9fwx5sq+Oj7HLEH9CeTZce2d3u9oaLBbd7UmlvYgPo06
         nOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wTEQ3liBaU2QUGIl3WUEaeyjObjubIWkSzWM7RalQH4=;
        b=NkRZVtUVhuOGMtCJovSkNFuVazPqlSgoWuXeTI+vsEqbNiYIv4TD6vV5kfSsoLoKs8
         EnJipPxF7mrkXLuFSYMhGySlB2OQbtGLlFUhnejOW9SdlOEZ4+MnYb2g3FqSQzRMjyLR
         rPq+KUJnHP4DL7pxVMKdsK3XCD60ingh8JlO5N0OTqb6dy3n4QyrcAGsusMCs3nUB/ft
         +cncJJOjz/MezSBoVt34BT3GDN1T4QXWD3xmSA7RPNNcsz9xpc3IAG8eTvPRAD68DOGK
         s0s1QH4dB8awsxCT+36n4pffV8cyq1AjCrQUhe2ihUDNdmS+QiU0/6QbH0QzObNPHTF+
         Vk0Q==
X-Gm-Message-State: AOAM5321o4exzfZN8Kj5vxKtymP6KHRFbWezrWiYoYGH6kKDrjSg91pm
        EBpvMtQeYrNx9pM5iXaf0jnOLgMYKVIlZyj8ing=
X-Google-Smtp-Source: ABdhPJz8s/H6fe+euee/Fq4KkEckWTTD+Yvz0+tLF1gKuT8WlN+8zfV3rx7w3jlP14pm5O//glta3dEh/kNDVedte98=
X-Received: by 2002:a92:c5cf:: with SMTP id s15mr10044836ilt.149.1614970528943;
 Fri, 05 Mar 2021 10:55:28 -0800 (PST)
MIME-Version: 1.0
References: <YEHymwsnHewzoam7@mwanda> <CAOc6etYqu_SJPjZtZdp4xDX=MVB0XY67tJ-EYoDYWuLfEyjnrw@mail.gmail.com>
 <20210305183259.GE2087@kadam>
In-Reply-To: <20210305183259.GE2087@kadam>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Fri, 5 Mar 2021 12:55:16 -0600
Message-ID: <CAOc6etaxjfTdTG4s6F+OR6rybXBAk259S_XC2i4BruhbQJDrug@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8188eu: prevent ->ssid overflow in rtw_wx_set_scan()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     devel@driverdev.osuosl.org, Ivan Safonov <insafonov@gmail.com>,
        Takashi Iwai <tiwai@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-janitors@vger.kernel.org,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Larry Finger <Larry.Finger@lwfinger.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 5, 2021 at 12:33 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> It's good that you're reviewing code...

Right now watching the patches flow feels like I'm just shadowing.
Later, when I get the hang of it, I might try providing something on
my own. I'll just watch things from a distance for the time being
perhaps making questions here or there (like I just did).

Just in case, my main point was to use a min() (or MIN? whatever way
it's provided in the standard) to have only two conditions instead of
three... .to keep them on separate lines, it could be done like this:

    if (sec_len > 0 &&
        sec_len <= min(len, 32)) {

_but_ I understand if you would rather keep the 3 conditions.

Thanks for your comment.
