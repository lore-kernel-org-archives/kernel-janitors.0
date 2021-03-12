Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE278C433E0
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Mar 2021 14:52:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E5C564FE2
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Mar 2021 14:52:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbhCLOwO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 Mar 2021 09:52:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbhCLOvx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 Mar 2021 09:51:53 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46E1C061574
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Mar 2021 06:51:52 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id b5so2763651ilq.10
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Mar 2021 06:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m7Vx/ddIsPR4BNmT58uRbHwh/IViH8nigao7TSFnRac=;
        b=Xk4+3VbMg7alai3rgLdPKDOW36dC67ytrWlRaefjpyShP27jRvzbbAgKwwQOH6EFVY
         mQmPN9w8yPsejlL4ZxNUzBIaBIG2KBEBsHwiQNx7AowKuNNhda+XlALuIsBpZNbQzPlf
         cTSP01A1uFKQPDZOvE+5bZ9NvewhLaDVD5N0CfFic+1ARS12pLpCKKIxxIUNzg7zxjFd
         LHqocT/+QhibpWMFSXo3O0DqXCuz3JLObVl/JCYTeGAPLX4aNfdqwlwX6SFuXYJdAfu5
         4TWhPrlONP5NMUHYK9Nk6xwj8vflfXhu6zGIz+hKlegxVVKkJRgb5gVbaXhdW+v3ZXKr
         vClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m7Vx/ddIsPR4BNmT58uRbHwh/IViH8nigao7TSFnRac=;
        b=ALHPVb2WqhhjzZzP9TIDHR6Y8hreFFeSStvzl+BbS/1h5Ay0DQ/xNJ6SaHu4KF83rN
         995B+TOX4TXi5kTiP8gcykyebDjBtVFc3Our/GjtpQb0GfW12cGme4aORLKKwdvumFck
         tQyc9exXTRRdo2Q6k5HTUHd0aOkvSe0EeHiRtajFAqiKzgOH66dNo5a7eMoUQD8EMPFp
         Zw/GJ2W4RWU8koF/cxHPY+niwacXmIGzldgczFSrjsHVbmPqEG/XOAIQ3PW0glkohRvU
         YgZqmkB6HwauIGuqIKxmN/G4za+lfxX1vbhuf26Q2FrqMgQECts+elBnYWWJIO4+0Yq3
         J5HQ==
X-Gm-Message-State: AOAM5318JB09ONUBoac5Mbr+tbCBgLXbjzM6zBuydoPdbl870nb6VKGU
        g7N+n7c16Cp8yH1S1Rwl0yYpDAOwHfV3ZCnEJXJMpO56nFw=
X-Google-Smtp-Source: ABdhPJyi+C/GJXLw1Ye/L70Riag8Dz7fHglIuvbDtif8W05AzSypld7DgkT6yIX5RarNx/CYk2uMCit+mgDAWpOmhUY=
X-Received: by 2002:a05:6e02:dce:: with SMTP id l14mr2989571ilj.102.1615560712421;
 Fri, 12 Mar 2021 06:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20210312054325.1706332-1-eantoranz@gmail.com> <CAOc6etaN0XZhXT7Dji0+aWHsQL5C10YO1RnnDHSjP=_eUTOT8A@mail.gmail.com>
 <CAK8P3a15Af-Ncit0g2bGFzPS9fyxgHv9=LE_=ioHOYwBTxhkhA@mail.gmail.com>
 <CAOc6etYJR+UzRLwkVYcvg-U3nStO1RNAu8XhGCc-UJTqQzDWCA@mail.gmail.com> <CAK8P3a0Hg5p6BVDWnKLLg2GKHF4ZswqmHSKSz+iWUgu+iZ8agw@mail.gmail.com>
In-Reply-To: <CAK8P3a0Hg5p6BVDWnKLLg2GKHF4ZswqmHSKSz+iWUgu+iZ8agw@mail.gmail.com>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Fri, 12 Mar 2021 08:51:41 -0600
Message-ID: <CAOc6etYYxJQ8xvcpyvxiTTWBc8T0Kp6nDG3QeLjf+RnP=GyKeg@mail.gmail.com>
Subject: Re: [PATCH] staging: vt665x: fix alignment constraints
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 12, 2021 at 8:32 AM Arnd Bergmann <arnd@arndb.de> wrote:
> My mistake. The normal references use 12-character IDs, but in this
> case I just missed it because it was in the cleartext.
>
> I would normally use a separate 'Fixes:' line for this.
>

Oh, ok. Let me see its formatting and then I'll send a [PATCH v2]
