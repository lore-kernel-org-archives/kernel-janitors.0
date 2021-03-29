Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EEAC433C1
	for <kernel-janitors@archiver.kernel.org>; Mon, 29 Mar 2021 14:15:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F059E6192F
	for <kernel-janitors@archiver.kernel.org>; Mon, 29 Mar 2021 14:15:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbhC2OOz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 29 Mar 2021 10:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbhC2OOp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 29 Mar 2021 10:14:45 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52890C061574
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Mar 2021 07:14:45 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id l13so6422421vst.8
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Mar 2021 07:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9FAOlOuUwiYBAUiqr+s35YBAOEyEXtqLSoM/MErzdBM=;
        b=Icdl1OFpALPb1uL2jd9S2RjXoYKdtv9CtYeKUNLZFsa9Ox8M3IsUupWowYEX++4T2x
         fviwxKR/SCPC8tLrPrHjL88s7sU4Aqi+zXzCbMkVjOey97Nb/MbV8sWFUB8Tg6Z1bze+
         rpm5W61vCEorOshbr3m06WcE89p4o7Cg0ST3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9FAOlOuUwiYBAUiqr+s35YBAOEyEXtqLSoM/MErzdBM=;
        b=fdaryYY4y1XfjJ5Se8zCMoM6AsdJJ3dDOBDblQ92imaXnyTaWJvx1jw+J1AzunykNk
         VdC8/CrOf3H+9vKw3GXrttFVuY45JmVQrpEPVJ3+LNy1fAnQ+GGgtj1FKecqwoMVLpEn
         SIK7n5ISoH73hVv1RYlQ8FIi5EGlQWQCKQqV1TZDJRN+9WsqiQBlOm/mgT4eAl9PKKS0
         KXWGAxlJWZCjSvrnGYBtmaJmO/W64dXAPzO9kmSFi3ajPVqPcFAWudALZVT8BzGhnYEQ
         jYG0DRJw0DgeECxpEIu/ldPi1wyaHLoY0tR9TZMMPcrjtUtSIHiOW5kzwgHtQNUWoT4/
         lkeg==
X-Gm-Message-State: AOAM532OgzpsQjXnkHYC2+AJnVbic7H8Xcbz6pB3ptI4OaKMGw0wTtPB
        AdKOmSAJKrp/xUxD+kv38ojlW3aBI6asZTdnzo8tGg==
X-Google-Smtp-Source: ABdhPJxtNB7YKlHTnESe5LN5qnWdUUOtrY2Ko2VRyrY9C+PqHQWfch+yKKkdB2pD20n0/8w0WW97EXCwtELNZHzaIFo=
X-Received: by 2002:a67:8793:: with SMTP id j141mr14585247vsd.7.1617027284475;
 Mon, 29 Mar 2021 07:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <YFnq5wHUQgnw4Rga@mwanda>
In-Reply-To: <YFnq5wHUQgnw4Rga@mwanda>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Mon, 29 Mar 2021 16:14:33 +0200
Message-ID: <CAJfpegshpuwp7+SFUX_x6599w+M9vrH2Xn5xRMrRZ6pYf9iUFg@mail.gmail.com>
Subject: Re: [PATCH] ovl: fix missing revert_creds() on error path
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Amir Goldstein <amir73il@gmail.com>,
        overlayfs <linux-unionfs@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Mar 23, 2021 at 2:19 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Smatch complains about missing that the ovl_override_creds() doesn't
> have a matching revert_creds() if the dentry is disconnected.  Fix this
> by moving the ovl_override_creds() until after the disconnected check.
>
> Fixes: aa3ff3c152ff ("ovl: copy up of disconnected dentries")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.

Miklos
