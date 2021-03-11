Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D765AC433E0
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 17:13:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92E1664FE2
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 17:13:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhCKRNW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 11 Mar 2021 12:13:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhCKRMy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Mar 2021 12:12:54 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0181BC061574
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Mar 2021 09:12:54 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id l4so21381893qkl.0
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Mar 2021 09:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6rCxc3cHCoDd5YPWN4pdDt+yoQYGWR6uIdzRq1ahqGE=;
        b=HV5bjVcmi15S35Lbj514kbB9hfz75yA1KuMuBsQlKgkmq5CF7pInZmlb4c6KRY5aAD
         ovgWVL9N9d7rpfw9jcITyVR9dzAxwWcMA7FSYY/5FO24wnNBze2YEk/alhaeMpcuzRDq
         64L7vqz+gsF+1aguapVzhRc3XOgJT56QIQ72E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6rCxc3cHCoDd5YPWN4pdDt+yoQYGWR6uIdzRq1ahqGE=;
        b=k69VrchQ24xEy+qigPw5tx9xxzS2gw5+8SXyLipzEva1WTpPnrmhFwq4ek2V1I52qg
         L0WGhllAKhR6YfEPGK/pwF1vw9tDGemG2qgH8MuNGeom0DSjBJppf0D9fLzEWGY+oWjg
         xqS64PkBey+7ukNHmd4fGLiBgRXsSdRXfziQ3qsC93aYk0swE8usdN2COH7JU3OS6Y0F
         eyYpbkLtIX1iaUf7t1egStsOaD8ImefYPlbIIxoBIXJKiGLmWel7p3oFt1jTfyY/MjuT
         cjkRUmtbQRaZw9p+9LrNfS5t0xFvz4BKDIgKDz3ew5izrv1S7+uYYmxFMxpEtwx83r/u
         P4FA==
X-Gm-Message-State: AOAM530Pa4cWlVquOYfKUmen7FD9dcQmHkGqtwIedY9ZNXJ3W+CX4Ubr
        YYyx9G5O7YCjG+s/603egyebgdJQTB/r3w==
X-Google-Smtp-Source: ABdhPJwCaAZQ+/SvM0MiWbFIhSdsGR9KFGuOAyIy78VAz3dNSPBrQY6QNtC99HBtBnLhzZtmR/SC2A==
X-Received: by 2002:a05:620a:1483:: with SMTP id w3mr8402860qkj.339.1615482773105;
        Thu, 11 Mar 2021 09:12:53 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id o76sm2322664qke.79.2021.03.11.09.12.52
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 09:12:52 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id 133so22462466ybd.5
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Mar 2021 09:12:52 -0800 (PST)
X-Received: by 2002:a25:cf88:: with SMTP id f130mr12858170ybg.476.1615482772142;
 Thu, 11 Mar 2021 09:12:52 -0800 (PST)
MIME-Version: 1.0
References: <20210311095316.6480-1-colin.king@canonical.com>
In-Reply-To: <20210311095316.6480-1-colin.king@canonical.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 11 Mar 2021 09:12:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V5+GvMpD1FdX0-TJ=BFyyvST+oLR08pO7jL+h38G8PCw@mail.gmail.com>
Message-ID: <CAD=FV=V5+GvMpD1FdX0-TJ=BFyyvST+oLR08pO7jL+h38G8PCw@mail.gmail.com>
Subject: Re: [PATCH][next] nvmem: core: Fix unintentional sign extension issue
To:     Colin King <colin.king@canonical.com>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On Thu, Mar 11, 2021 at 1:53 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The shifting of the u8 integer buf[3] by 24 bits to the left will
> be promoted to a 32 bit signed int and then sign-extended to a
> u64. In the event that the top bit of buf[3] is set then all
> then all the upper 32 bits of the u64 end up as also being set
> because of the sign-extension. Fix this by casting buf[i] to
> a u64 before the shift.
>
> Addresses-Coverity: ("Unintended sign extension")
> Fixes: 097eb1136ebb ("nvmem: core: Add functions to make number reading easy")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/nvmem/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks! I had only tested the "u64" version to read smaller data and
store it in a u64. From my understanding of C rules, without your
patch it would have been even worse than just a sign extension though,
right? Shifting "buf[i]" by more than 32 bits would just not have
worked right.

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
