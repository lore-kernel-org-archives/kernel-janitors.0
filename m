Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC3CC433DB
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Mar 2021 09:19:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3E3A64FE0
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Mar 2021 09:19:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232506AbhCLJTH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 Mar 2021 04:19:07 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:48439 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232552AbhCLJTB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 Mar 2021 04:19:01 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MN5aF-1l3wZi2gJJ-00J0YE for <kernel-janitors@vger.kernel.org>; Fri, 12
 Mar 2021 10:18:59 +0100
Received: by mail-oi1-f175.google.com with SMTP id v192so18598821oia.5
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Mar 2021 01:18:59 -0800 (PST)
X-Gm-Message-State: AOAM533ImMtHDqLwCJ2GhSJpZeXOEIXtMd1deoYxRO7X6hcw/RvtPSrx
        ppR6sBXC7vruP7L7CTzcf1w4BEVFPVXF7SKYE00=
X-Google-Smtp-Source: ABdhPJyKYvraqs2g1WG+/kCHeeBoT0Frb5/zEGex8iIqocSzXvk7WuCUGyY8GHNC/j735LkgzRkZwvnsaTRlewSt29o=
X-Received: by 2002:a05:6808:313:: with SMTP id i19mr622887oie.67.1615540738416;
 Fri, 12 Mar 2021 01:18:58 -0800 (PST)
MIME-Version: 1.0
References: <20210312054325.1706332-1-eantoranz@gmail.com> <CAOc6etaN0XZhXT7Dji0+aWHsQL5C10YO1RnnDHSjP=_eUTOT8A@mail.gmail.com>
In-Reply-To: <CAOc6etaN0XZhXT7Dji0+aWHsQL5C10YO1RnnDHSjP=_eUTOT8A@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 12 Mar 2021 10:18:42 +0100
X-Gmail-Original-Message-ID: <CAK8P3a15Af-Ncit0g2bGFzPS9fyxgHv9=LE_=ioHOYwBTxhkhA@mail.gmail.com>
Message-ID: <CAK8P3a15Af-Ncit0g2bGFzPS9fyxgHv9=LE_=ioHOYwBTxhkhA@mail.gmail.com>
Subject: Re: [PATCH] staging: vt665x: fix alignment constraints
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:9jrsV+j9+oVsSgKuvTGdkbrdCxbJscmWd2XvWKj6cLO0nzwtgbK
 9fGg7nrz3rx1pIyXw7bU53Zjtfw9DQZM7hBuwwLrFFR8sj2x0sqxpF/2lcVL21N0V3SPvBC
 tVZgRcb6jEsvNWPI+4aFDpj0RdVNOIounO+6S5GCzqxPaQccdoQrxVG5oErEpiHkfaMrjBk
 0l4d8fNRCf1zk+mWOmrHA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mVJHz86O6uk=:gVUGdily8B6ulJnCmlPOM5
 t0YNPoriisp7wGNd7gnE8/i3fnQbppHga41cd5YcVj05fohUC0FKwuEAz+5nWdHBN2hWI+v8z
 2fVJNcvda0frPHj122tf5ViJeEkyUiFU80UkOGLfutrPnWa++wHo3cpHKYgqt1bv6M0ZXFZmf
 3UoFeoAVV7YD0X/Y8Q3HiJC9NbK+bfN8rwY+qIGn1myWEaXPPfuGAeaoFO+Wz1QOrgRAV4Vha
 LkTIuwPK87Ny8pY+XY8chsOzlN6tSNAZ0McKHh4T4TaOcNP6DXu07OFJDjnxyKiIK65QhVpmX
 YTuHVCFrNIuJDepK4z7eaj+/W10A9tfkTrjlhafduhpClntbPP8bEstaTjxs5QpJssqtpQTMn
 tcYTZpdqNQViWbyDrNgdRCWAhYjMnHIKm3KX44K9JdGwVtjmCZwOLIKkHUASBiAG/Hs4uy5vv
 /aD40qqd8Z92LPLJK+n0skf0fZLvNX4a5sKpOt8tWmW0j6dNxcB5547NBED4ceffJPXFNdyhR
 YKL34bMbbE6PMK+pNgD9hgsfNK9NSQxK1py3/FY6uMevG2ZJihKPC+WqaxPDUuWYQ==
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 12, 2021 at 6:50 AM Edmundo Carmona Antoranz
<eantoranz@gmail.com> wrote:
>
> On Thu, Mar 11, 2021 at 11:43 PM Edmundo Carmona Antoranz
> <eantoranz@gmail.com> wrote:
> >
> > The root cause seems to be that _because_ struct ieee80211_cts is marked as __aligned(2),
> > this requires any encapsulating struct to also have an alignment of 2.
> >
>
> To make sure of this, I played with an empty struct.
>
> struct a {} __packed __aligned(2);
>
> struct structb {
>     struct a blah;
> } __packed; <--- got a warning about alignment not being 2.
>
> I would guess that setting the encapsulating struct to be __aligned(4)
> or higher would also work fine, don't know if I should be more
> thorough in that regard in the patch comment.

I think the patch description is clear enough, but it would help to include
a reference to my earlier patch that tried to fix the problem before. I don't
know why this came back now, maybe my patch was incomplete to start
with, or an extra alignment constraint was added to a second indirectly
included structure.

      Arnd
