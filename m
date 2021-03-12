Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98B1C433DB
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Mar 2021 14:32:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D53B64FD6
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Mar 2021 14:32:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhCLOcZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 Mar 2021 09:32:25 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:50775 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231679AbhCLOcQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 Mar 2021 09:32:16 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1My3Mv-1leq9Y0tbD-00zXig for <kernel-janitors@vger.kernel.org>; Fri, 12
 Mar 2021 15:32:15 +0100
Received: by mail-oi1-f176.google.com with SMTP id o22so17294966oic.3
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Mar 2021 06:32:14 -0800 (PST)
X-Gm-Message-State: AOAM531b1USJXjHl+sTmIv/kb1ysqpe35G+TOOAZW7m2HMLVN5Xt0Lj9
        +ZkGuRCUnRTmEQcMCAFLIMXG9xkY2CTl53ZGGNc=
X-Google-Smtp-Source: ABdhPJyLbJODkBUM11RX6oBM6FtG4DDoj62EB1qxlxJq+hP2Nm3Btay9BmL/JhEo6kER17Q7Sr7Y9vJsrwSA7ew6OZ0=
X-Received: by 2002:a05:6808:313:: with SMTP id i19mr1349014oie.67.1615559534023;
 Fri, 12 Mar 2021 06:32:14 -0800 (PST)
MIME-Version: 1.0
References: <20210312054325.1706332-1-eantoranz@gmail.com> <CAOc6etaN0XZhXT7Dji0+aWHsQL5C10YO1RnnDHSjP=_eUTOT8A@mail.gmail.com>
 <CAK8P3a15Af-Ncit0g2bGFzPS9fyxgHv9=LE_=ioHOYwBTxhkhA@mail.gmail.com> <CAOc6etYJR+UzRLwkVYcvg-U3nStO1RNAu8XhGCc-UJTqQzDWCA@mail.gmail.com>
In-Reply-To: <CAOc6etYJR+UzRLwkVYcvg-U3nStO1RNAu8XhGCc-UJTqQzDWCA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 12 Mar 2021 15:31:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Hg5p6BVDWnKLLg2GKHF4ZswqmHSKSz+iWUgu+iZ8agw@mail.gmail.com>
Message-ID: <CAK8P3a0Hg5p6BVDWnKLLg2GKHF4ZswqmHSKSz+iWUgu+iZ8agw@mail.gmail.com>
Subject: Re: [PATCH] staging: vt665x: fix alignment constraints
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Ade0b9BsZ5j6s8crma4hSLazLHik0ofiEvMbfht5jDi9rOOvtkD
 KB113pwIE8R+iXDsVrF6U9IWrzzwUW7lr16SmzJeGJSnrvdLS2L8d9mM2cvldPeuvkGNr3s
 36gjUOIzXBUYevYMyy6BosuoyMYNNgJ76gai4rC1ei71QB4WLjadi4ynSgUT3FN/xHIJARD
 vUVQE+Eyzt9RQ0XiMC7yw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kJp3cL2rscQ=:nM+gfQZPCCHmStTnWLsmE8
 00n3WRFK31nO8c+zl41s3BdcuqL7IuiaI/+PMmzAtYfYxCBit6U7PpDPyIWwghs3FA+my6C2N
 5Kf28wp3yDvth2mqwHNxKY7cPR9qiFy1G72XEtZ2DCFHbd540/vEAKOcL+HWlRLqOXPHF8Trk
 7uGZTNnGUuFPyWZbmCiYzMQvvZRE0zmFNipiCVMRBFmYNRJUVaDLy3W6zfxZlNuAA/MDflOSL
 Y/n3nVQR9tMoHFj5N1Ze+FYatk5pPRH7P0UbXJSPhHtDJQr23FxI3Q2716qo6aBpBnoCwOlqb
 vtBeLM0hZtVAE8/cW/hBgfycaohr3TgM192xiy9Y3UD3KD632Dc4SFghBV7X1RW5k+v3FLa71
 Q6dVs9FzDXWgeqDYrDEE0cNpuImD7oMCMvG4Sk/XOYbQ75OQM6dPpiW2gpc6o
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 12, 2021 at 1:56 PM Edmundo Carmona Antoranz
<eantoranz@gmail.com> wrote:
>
> On Fri, Mar 12, 2021 at 3:19 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> >
> > I think the patch description is clear enough, but it would help to include
> > a reference to my earlier patch that tried to fix the problem before. I don't
>
> Great! I did mention it in the preceding line to the section I replied
> to, though. It has it in the patch:
>
> """
> This patch is related to 2faf12c57ef (staging: vt665x: fix alignment
> constraints, 2021-02-04)
>
> The root cause seems to be that _because_ struct ieee80211_cts is
> marked as __aligned(2),
> this requires any encapsulating struct to also have an alignment of 2.
> """
>
> Maybe it needs to be formatted in a different fashion? Should I use a
> longer (like 11 chars, maybe) ID?

My mistake. The normal references use 12-character IDs, but in this
case I just missed it because it was in the cleartext.

I would normally use a separate 'Fixes:' line for this.

       Arnd
