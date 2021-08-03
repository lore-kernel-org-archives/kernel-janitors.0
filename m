Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BFCDC4338F
	for <kernel-janitors@archiver.kernel.org>; Tue,  3 Aug 2021 08:56:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46FD360E09
	for <kernel-janitors@archiver.kernel.org>; Tue,  3 Aug 2021 08:56:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234823AbhHCI4Z (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 3 Aug 2021 04:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234690AbhHCI4Y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 3 Aug 2021 04:56:24 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A881C06175F
        for <kernel-janitors@vger.kernel.org>; Tue,  3 Aug 2021 01:56:14 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id dw2-20020a17090b0942b0290177cb475142so2911974pjb.2
        for <kernel-janitors@vger.kernel.org>; Tue, 03 Aug 2021 01:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2VSBHI2kOyfU03u1WdUTP9YGD6lc5dbX5FmCawILdkw=;
        b=xFyAfNKpx2lHljwdqXYLDuofUx/eI05GpD7CjNHjSTi8OzGQi6nhKb/M67VmZsIo5l
         zgZZMg9JuCvYqwMt6HwWXuvZlVcen+VNhITVZNn4VZTLdo+zZbl7k3bQocWzR1lfvnJ7
         s7/ZpmzSnx7ciwZjQm/x3Z8Q1fpQXLy31V2OBrGTPPOrUvlUGeDxFcW4pbce1HRnLZxc
         6qHPZEcN5kwzyUwpTQ2ivR8gwSTDz4lFkNNr40VrvmoFb2MOnfpLCyv2Tk8a7nPJmiAI
         xD9ScBoY0hevG7RuaXFXFPu+TS+nThE779jNPUZbARFbaoeVb/gxUO3BPVihQ5zEIpsK
         tBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2VSBHI2kOyfU03u1WdUTP9YGD6lc5dbX5FmCawILdkw=;
        b=AhiCFqHrp5G6oz43Xo3XrPlF+1lMF6UeA3VoX+ZmM/ClG9TveWCtNJZ+9QWsfJe+X5
         rP0DSm3jT5d+JXMHdMIe7lP1i9JYujcBY/7LEY9PrTrTx/IDVH5Va/+zIGVeNoDPDMnn
         5xXl1Fy/SkQRI80ZrQy2+auHrOuHdSB2FxhPxbIQtYMNE90rz+HfyucsVTInFEjFbazv
         GovSrpbssResAEIYN4n+ShtCiN/EXWECs0+5B4xt3frJuo2CoRiTiYbQc3dNscWR7A52
         dcmmuoAUk42QU/TvWMWgAmS4DG4MSmhpap0km2gvHcBoHfusCYSHc8/YueVgakPidXa/
         lPvg==
X-Gm-Message-State: AOAM531pQwp3L46D+izOfv5EG7bP6sAp0khMr5+XXQcA5cbITMn/XChQ
        pa1kEQjCp2vMOaeuucnuR9m7911A2ckmcl+o8R0rxg==
X-Google-Smtp-Source: ABdhPJzPp7C0RinR/iokila0E0mzC0TMDoH9Ys8TEaTlWqVMLd+0B6mNL7o+4jpCfMcAD5navb9xQle/6NO9/YMqSJs=
X-Received: by 2002:a17:903:2302:b029:12c:bb4f:cbdf with SMTP id
 d2-20020a1709032302b029012cbb4fcbdfmr6974312plh.22.1627980973355; Tue, 03 Aug
 2021 01:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210803071811.8142-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210803071811.8142-1-lukas.bulwahn@gmail.com>
From:   Phillip Potter <phil@philpotter.co.uk>
Date:   Tue, 3 Aug 2021 09:56:02 +0100
Message-ID: <CAA=Fs0=V_gcfDUxn1m9OkR78cht0S=j02BsHajG1A3vuGTqQJw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update STAGING - REALTEK RTL8188EU DRIVERS
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 3 Aug 2021 at 08:18, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 55dfa29b43d2 ("staging: rtl8188eu: remove rtl8188eu driver from
> staging dir") removes ./drivers/staging/rtl8188eu, but misses to adjust
> the STAGING - REALTEK RTL8188EU DRIVERS section in MAINTAINERS.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
>
>   no file matches    F:    drivers/staging/rtl8188eu/
>
> A refurnished rtl8188eu driver is available in ./drivers/staging/r8188eu/
> and there is no existing section in MAINTAINERS for that directory.
>
> So, reuse the STAGING - REALTEK RTL8188EU DRIVERS section and point to the
> refurnished driver with its current developers and maintainers according
> to the current git log.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210803
>
> Philipp, Larry, please ack.
>
> Greg, please pick this minor cleanup on your staging-next tree.
>
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36aee8517ab0..ef32c02b3e4d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17723,8 +17723,9 @@ F:      drivers/staging/olpc_dcon/
>
>  STAGING - REALTEK RTL8188EU DRIVERS
>  M:     Larry Finger <Larry.Finger@lwfinger.net>
> -S:     Odd Fixes
> -F:     drivers/staging/rtl8188eu/
> +M:     Phillip Potter <phil@philpotter.co.uk>
> +S:     Supported
> +F:     drivers/staging/r8188eu/
>
>  STAGING - REALTEK RTL8712U DRIVERS
>  M:     Larry Finger <Larry.Finger@lwfinger.net>
> --
> 2.17.1
>
Sorry, not sure how I missed this :-)

Acked-by: Phillip Potter <phil@philpotter.co.uk>
