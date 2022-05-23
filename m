Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A02C433F5
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 May 2022 20:31:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233059AbiEWUbs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 May 2022 16:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233036AbiEWUbq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 May 2022 16:31:46 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 776E762124
        for <kernel-janitors@vger.kernel.org>; Mon, 23 May 2022 13:31:45 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 1so5220819ljh.8
        for <kernel-janitors@vger.kernel.org>; Mon, 23 May 2022 13:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wBaaj+XJRciWuzeB12Uou/3sT9TB3e1izvK2J/BvnGE=;
        b=dtDiRK5Zbt91iRXg8l3N/Bq0yx4h9NH0DItyIk9C5xS6kqHq8CLQx+mmxFi0hXgqAL
         CUICgTrYsIWayHyaEMwt/8nKiRqvWGh6ElUuzikGk/nuJp63SJJGiBkjChNAtKA5gdLB
         tA0mA8WqTpxsiHeCTA1vE0+VPWLunSHT74gIsw6GXKgqp426nxGAWMdb9TBCYXym4WxT
         tXUurH+EwydB+SxWnXDVTXLWbZwhHkziQ4ji51+bWD2JgDPoE5XbTlqdy9BQtmz2YTNZ
         Bj6tTJ3CymcZ6d6o07quXCIkFwBozaA22XGbl9jXu0TCtfY1ie0TdoVndMhFKEYPuWy0
         O7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wBaaj+XJRciWuzeB12Uou/3sT9TB3e1izvK2J/BvnGE=;
        b=qmXkOxOeXhLUvTpr7Kk92PSMi5LXoTDf6fgC6MSTeVg+c/6RUohIh5mBe+eDY5CfLk
         UijFC10/pFU3+Sl0N0ddpc7pEb9yhwftMgv54Jl2EuTV5jFqzgd4PYhy1EFyT7e/PsXp
         /BrQirTSKakYX9dlfht/+UAcUuM9Qrk+DTBLNraXsPd8n1Y7s+G+fCr8NB3R23SzF5OE
         1p6R87vXXaynaDjye51A+tNa/BXQBG9Q/gjZNOHprKx+usnZU8xSSj5CgmqlBTVYw/vf
         lp09lpid+bR/s83WSSTQr+ZuutzzSXwOULyhYx0pLF4FdUPZuLNPGGfsoStGdOOlxLp2
         KWUw==
X-Gm-Message-State: AOAM533EYovX3KN8oU5GcdDglQaq/TiZy6qBOU/ZA7A8LPIvZQZkcRFw
        nJA/v5tqR4edlykP6BWMVtSFD4ucnl/+mgld//iQuw==
X-Google-Smtp-Source: ABdhPJzAEfRy1Ql25Px8odBfL4/7wsYQ6fbK1gT9iKKGTlkCS+cnyVcBWexyK6Mk7k89J7yDzcV723I9mipNjQQxmOM=
X-Received: by 2002:a2e:98d0:0:b0:253:e3a3:ec6c with SMTP id
 s16-20020a2e98d0000000b00253e3a3ec6cmr7088089ljj.493.1653337903584; Mon, 23
 May 2022 13:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <23e0ba7863d51ab629498762a97d477645aeafea.1653123744.git.christophe.jaillet@wanadoo.fr>
 <CAKwvOdneqUvq+Nz_zPmJmuPFfAvWQgnzrw1AJt=WqQF2hThF-A@mail.gmail.com> <00061a71-4d7c-0605-80b5-3d909fc3dfaa@wanadoo.fr>
In-Reply-To: <00061a71-4d7c-0605-80b5-3d909fc3dfaa@wanadoo.fr>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 23 May 2022 13:31:32 -0700
Message-ID: <CAKwvOdnDvrYo_PtMa+JW0FhmkZVDp7eVpR_BV9L2Om-jXPbBog@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: Add an option to enable -O1 and speed-up
 compilation time
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     dan.carpenter@oracle.com, Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 23, 2022 at 1:16 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Thanks for taking time for a full review, even on something you are not
> fan on. This is really appreciated.

Of course! It's still a question worth asking, and having a lore link
to refer back to should the question arise again in the future. Thanks
for asking.
-- 
Thanks,
~Nick Desaulniers
