Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE107C433E0
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 18:31:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DFDA65139
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 18:31:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237035AbhCPSbT convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 Mar 2021 14:31:19 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:37745 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236992AbhCPSaz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Mar 2021 14:30:55 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MPoPd-1l0yQ30Do3-00Mu0P for <kernel-janitors@vger.kernel.org>; Tue, 16
 Mar 2021 19:30:52 +0100
Received: by mail-ot1-f46.google.com with SMTP id t16so9085513ott.3
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Mar 2021 11:30:51 -0700 (PDT)
X-Gm-Message-State: AOAM532HHEqz30Obo5u3deknlNXRX7zSs8wq6AziCiOGGlfSAtpxJiWA
        RuVqFMluzV3dY0hISW9H45Y1IVuwUMn1FxJYDCI=
X-Google-Smtp-Source: ABdhPJy7zf/nwXCQeopMtr6VLSjP61d4PF+is99tvboBdN67xZV3noxqUb+4ubWjTpASNmkEsYVdKhVcDoCNuseYwho=
X-Received: by 2002:a05:6830:14c1:: with SMTP id t1mr78328otq.305.1615919450777;
 Tue, 16 Mar 2021 11:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210316181736.2553318-1-eantoranz@gmail.com>
In-Reply-To: <20210316181736.2553318-1-eantoranz@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 16 Mar 2021 19:30:34 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0aBauNqKRyzZ6d4kPGBPcMYqWUWrmmLXwbROFLkBf0nw@mail.gmail.com>
Message-ID: <CAK8P3a0aBauNqKRyzZ6d4kPGBPcMYqWUWrmmLXwbROFLkBf0nw@mail.gmail.com>
Subject: Re: [PATCH] staging: vt665x: fix alignment constraints
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     forest@alittletooquiet.net, gregkh <gregkh@linuxfoundation.org>,
        driverdevel <devel@driverdev.osuosl.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:SOfk6CzGZDRiBm73n8Vi0w1RaOOpJj3u96eYMoYIynFFuFijIzD
 A8rKow+UK8b7GQHu4uawDzNaZ1cQP55gULE0Xzr/OtpTXZS4TiQ3Cp+sVJXXsKeYMO/Gyid
 vWwqUc26gkkwWH2+3uY8wM8um61zoehBK1+oNNniPDU7cSQIE0Ks0LtB42PoURwvD2KQ+Nk
 BHl4jHGBR3bWDoryyIjAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UboySpslTVw=:BSQstz2xe3ymRwTu49xyct
 Z6U+AxvDuIDvOSKcU8G9rFZI4BFu5K9ORw8Jham1rld2BIufkXp686vXhz9oaT4XnOAJfkPEx
 sDOS0udBi8ZG55pvU4bIFfj9orm9KJaLP33ISQEPUuCjGFVSigP5ArRWuR+Mb65aA8SIbmXt3
 Jr409F2sGJQ2kWHX4X/3hNW27T/ptdqWKHEtPMo91yySsKntFJuKxCNkllnUT5ZOINGHcEK+I
 eF4i+u74GALaeafp47Y5A5USsYV2PLmE7RTb9FoAa6K299WNjjCZDeSiH8a4sXZyLvo5xNG5o
 9H8Hq4RlIfkONRkjHte2sboah8CNT+44FNcEyjjs168pEinJ3ZztCDPlBNAa9x0nOBP6pGneZ
 avomj69uaSpL+yVzDg06Qvu2HxmLVYtbVusv/klEVHeToNAEpurkhVMj8SOipBSbySOii13gW
 ameTBM72kgPh2pE7w13g4uhprJRDacN/9LWnf7V7jIp0KDEREN1qevEvbxiPEJPe/4KN767Hb
 u7gGeTspqIABM24YPHpGWds8UA+O/RDoFHzW8Im2dMG
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Mar 16, 2021 at 7:17 PM Edmundo Carmona Antoranz
<eantoranz@gmail.com> wrote:
>
> Removing 2 instances of alignment warnings
>
> drivers/staging/vt6655/rxtx.h:153:1: warning: alignment 1 of ‘struct vnt_cts’ is less than 2 [-Wpacked-not-aligned]
> drivers/staging/vt6655/rxtx.h:163:1: warning: alignment 1 of ‘struct vnt_cts_fb’ is less than 2 [-Wpacked-not-aligned]
>
> The root cause seems to be that _because_ struct ieee80211_cts is marked as __aligned(2),
> this requires any encapsulating struct to also have an alignment of 2.
>
> Fixes: 2faf12c57efe ("staging: vt665x: fix alignment constraints")
> Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
