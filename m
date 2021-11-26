Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9823BC433F5
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 Nov 2021 05:30:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245600AbhKZFd6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 Nov 2021 00:33:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343974AbhKZFb5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Nov 2021 00:31:57 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC85CC061574
        for <kernel-janitors@vger.kernel.org>; Thu, 25 Nov 2021 21:28:45 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id j2so17103840ybg.9
        for <kernel-janitors@vger.kernel.org>; Thu, 25 Nov 2021 21:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HOkzClK58L9KFyLkDZDvUq7JA9AjBI1vkUpVIs5Rlsg=;
        b=B0JqtRcEypAzvY+/FM3GtMs2SwDR+GugrIk8bVkoNM8K1SXCzGgpqib7ZKYvMRokOT
         R7rz30b3vH3LuUCWsuZ30dnc5ypEcFBH/RHBLRg/jhHYLSzYPQrDlmOJQUsTvTMbLkdG
         rdfNiBkHFY6qfxgyOufYCuh2cT0tXkHbpLaUoNb2LJbfq7h0P9ayQekBkBwXXSdRa2lx
         22+GNhjntd6sbnAUGECSlq8O2Kjf5MQ3K0OAxa+iyMQ4LnrJeKKabu4/NEh/zFY6ZyEa
         i4eIW/j0LurHx4C6iixxyeoCrQ0JUkAZoUE47b3HaV6Pw/X9zB79+6VZhCHmIDVCXOrD
         dJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HOkzClK58L9KFyLkDZDvUq7JA9AjBI1vkUpVIs5Rlsg=;
        b=khxoC6lz83k93z4M+tIGDhJNW8PjIP/dXR1pg6OTh4+iEnE+v6PGoem9SuNEYkRSLF
         ypQ+5jQ2nRtj61B8a9Tx6ISGBJBQK9swVjcL+bLnmvVMM1RTh0fwx6ctsb+OP8M4zof6
         YyOg+SJdDrWp4lwr2nYKMHVcG16FllbEaIPSba6UitcsQPWOdgmLvoAN9Ui+TYdCn1ic
         1LaqVu0dHA3tK4GdA1J38T+/lXbWXXUTMumKNVSoktXSJqKt1I3yQaeNthhGhHSt++Kx
         VcdyH2CHRZF6r77dpwrC6XN5KyTgtpR5ak6xEKFg60JhLrIsv06GXznTEGgPvAes2qKr
         fExg==
X-Gm-Message-State: AOAM5333NSYzKShh6jtczmn0a/tEnABRjJQbYM/0WyPzjyMATllv7DGB
        QoxzCnX5DvqzimboqZ1cOoCYojtporgRchZqztACtQ==
X-Google-Smtp-Source: ABdhPJygl7k2S9FnANNO921zXArJzimRsOoLhvbPSNF1JaMRnN+OGWNFXRtd2+C/4j064rocKveYj1sFW4kdl40ybCo=
X-Received: by 2002:a05:6902:72f:: with SMTP id l15mr12655859ybt.279.1637904525080;
 Thu, 25 Nov 2021 21:28:45 -0800 (PST)
MIME-Version: 1.0
References: <20211125090635.23508-1-colin.i.king@gmail.com>
In-Reply-To: <20211125090635.23508-1-colin.i.king@gmail.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 26 Nov 2021 13:28:06 +0800
Message-ID: <CAMZfGtWJM_HqtTsiaNB5n6sC0P5EYyHpSOBoZvDS5SCHaUarbA@mail.gmail.com>
Subject: Re: [PATCH][next] hugetlb: Fix spelling mistake "hierarichal" -> "hierarchical"
To:     Colin Ian King <colin.i.king@googlemail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Nov 25, 2021 at 5:16 PM Colin Ian King
<colin.i.king@googlemail.com> wrote:
>
> There is a spelling mistake in a literal string and a comment. Fix them.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
