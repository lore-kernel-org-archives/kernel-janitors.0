Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72E4C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Dec 2021 22:17:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237693AbhLUWRz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 21 Dec 2021 17:17:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235085AbhLUWRy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Dec 2021 17:17:54 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F4EBC06173F
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Dec 2021 14:17:54 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id bn20so574071ljb.8
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Dec 2021 14:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dsxFBdm2QviBZ29N5dveyQzOQKlgfiIrc+0yxADMNCQ=;
        b=NXGLxSCpObD2flRKPbCq9IFPdHnTLn2G9uiMQbiGfRWzwaeJ2bD8taKQdDhT7vmYJQ
         XKN0OrMjsTFtN4wpAuKb0rktrM3wvPlOc/x9PIKTiD8RUbXS7EVGu5eZV8Z593A+RmdE
         f/WyA0N9jfdkw5Fk7b/SMzwK11A0I6YzbkyPgQz1mxFDG+9fP4JmVDpjEC44R3vUzr8R
         Q3z5exdX1Y33rGrCOUViS3xHKetapJhi7PURL5aohZDHl9JqfMHvdqUGgZtD7eupsRMU
         4RT7vvBNqyV+J7FlzlcUCHul5Xo7HG73kaTCwJR/I68a5eFShE1J6AwN1ZfI4UMCSl/M
         SBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dsxFBdm2QviBZ29N5dveyQzOQKlgfiIrc+0yxADMNCQ=;
        b=IpIk4nG/U4AgijJEjrEx6bnMldp0zIn6AeFUiXZCwuP2by6kA46LBHEBcYI876tfK2
         XzT3CqhVdWTLoNw5MFlK/q05Qr8fys5fRG2G4m4k9nX2l/8q2QQlk9nPk7f6VseoSaLh
         t5aePTF1r8FTUr1WVA/6vOLbzeYzwk/t1YkJ+8y1BBBxsIJztUkhi8er+aMgwi5GmjEt
         V43W8D9nbVPfo3T0yH6BiGTpIwSDzeZzb2MZXtZYoRpQ+tdRIonCklD5rmnA8oYYXMOH
         xh68ox+7iNdiX1yKmIZ+r4cvmviY/SE6ppXHirBvQFCSlQ72B79GB7mgei4sa1hGnhvI
         qaeg==
X-Gm-Message-State: AOAM533IgCDTu67GW4711nkY/Q/8hNU1J86aaoU2NW5Bn8rRoK9E83Bd
        jkM4p46NJo9wWdvvd0Zt7TXiaHEI7zrbwaeknbcs3w==
X-Google-Smtp-Source: ABdhPJwwMIZzbtN/WFjr6/Ly3vHEn6ix3T31OaNoEmwDcGRQg/3sYZ7JNkTLTnzGEzM47tPaVs915sWc4CTh4BE+7YI=
X-Received: by 2002:a2e:b6ce:: with SMTP id m14mr315614ljo.128.1640125072220;
 Tue, 21 Dec 2021 14:17:52 -0800 (PST)
MIME-Version: 1.0
References: <20211221184501.574670-1-colin.i.king@gmail.com> <YcJLFQh9IA2XzXu3@bombadil.infradead.org>
In-Reply-To: <YcJLFQh9IA2XzXu3@bombadil.infradead.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 21 Dec 2021 14:17:41 -0800
Message-ID: <CAKwvOdnK2Zc72tw6CdQkz=VxoRC0voWpda8Tgo38LaiRukDfKA@mail.gmail.com>
Subject: Re: [PATCH][next] kernel/sysctl.c: remove unused variable ten_thousand
To:     Luis Chamberlain <mcgrof@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Colin Ian King <colin.i.king@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Xiaoming Ni <nixiaoming@huawei.com>,
        linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Dec 21, 2021 at 1:46 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Tue, Dec 21, 2021 at 06:45:01PM +0000, Colin Ian King wrote:
> > The const variable ten_thousand is not used, it is redundant and can
> > be removed.
> >
> > Cleans up clang warning:
> > kernel/sysctl.c:99:18: warning: unused variable 'ten_thousand' [-Wunused-const-variable]
> > static const int ten_thousand = 10000;
> >
> > Fixes: c26da54dc8ca ("printk: move printk sysctl to printk/sysctl.c")
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>
> Acked-by: Andrew Morton <akpm@linux-foundation.org>

Just double checking; I don't think I've seen someone supply someone
else's Acked by tag in a reply before. Was there some discussion off
thread that I missed? If so, do you mind linking to it?  Was this a
typo, perhaps, and you meant to supply your own Acked by tag? Are
"Luis Chamberlain" and "Andrew Morton" aliases? :^P

-- 
Thanks,
~Nick Desaulniers
