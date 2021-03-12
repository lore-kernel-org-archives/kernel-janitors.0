Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B74C433DB
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Mar 2021 05:51:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C72364F7A
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Mar 2021 05:51:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230475AbhCLFuw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 Mar 2021 00:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbhCLFun (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 Mar 2021 00:50:43 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57BE0C061574
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Mar 2021 21:50:43 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id u8so24483460ior.13
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Mar 2021 21:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2r5+HpYMcrFK52PYRpaLgZR5qSglJDpc68xEq9qPVek=;
        b=KOt+fF2+U8ZYchpHrW4B87WZB0SVhGVNRfjV1khQB3D22+LORttlLiljcVN037hkn6
         kq0to12GARcE9L4whU0P/U7DwiWj5UQmjkQtWNxXIc/CRvzryOH+CobxndiucOIeqWG9
         oKPfDLp0ABI0rSwZoFMxeqhr5JNQo1JFp+xAKWZAyimUnIoRJXxsDSbLU4FSZd0N374B
         /Lf8coVRKxDPyOVtTGSl6zFA66POED3EH1QezWwqCAq44bQLfODRIMuhu9H4VCxUOHqF
         eiFRpAt+/hvcnh+0Ic0PC3+/U058ZzIjzObCDKSPqGDlz9wQX1yMR0oUK/rbjhLJXwCJ
         gnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2r5+HpYMcrFK52PYRpaLgZR5qSglJDpc68xEq9qPVek=;
        b=hiveEGSkZKddxU0FaBPuP+a7fChULWmRvd132uS8RxMCJI73guXrzDC3qt/HnCx4Ow
         fVv1ht5JfYjjk/7NVpdZ4Mf5oG7am8x+EsIYfZ3OWdT1Qc0jHRNUYkLISS86yqwkv70M
         E483ZcQ8LL2vbeNEliPnOfGWwVrPDWndM5wow9eH8RN4ooF73HqfFEu3tXOzJu7bpeko
         3HjFUrapuYGONfwYQxGvRJloh3S4Z2nxm+8pDFIThaFpkqwj2mjgNN9WARqv+01g+wPo
         hoPAanUkPcrHDxaTBCb2qGPeGEWyELxta/lwC4a1l70puLQfppLfF1FNh7JuYVd6QkmB
         zQDw==
X-Gm-Message-State: AOAM531oN6H97lBF9FXi9sQ3MzAmymIMFh6PZ7wpRpUxeElLcF6Pqrxf
        6gN8uH671vn/rZJRrHADuZROmwvJEvay6Dtuw7YtJHCt46g=
X-Google-Smtp-Source: ABdhPJzGFT130/mw4ROn8GThI4qO/hvC1TC74ZQQb1OWFLeNPs/0SUxOjR+wO9byb5/fsrcj8kjqGXYfNAYbjvutoPo=
X-Received: by 2002:a02:cb8f:: with SMTP id u15mr6862620jap.45.1615528242201;
 Thu, 11 Mar 2021 21:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20210312054325.1706332-1-eantoranz@gmail.com>
In-Reply-To: <20210312054325.1706332-1-eantoranz@gmail.com>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Thu, 11 Mar 2021 23:50:31 -0600
Message-ID: <CAOc6etaN0XZhXT7Dji0+aWHsQL5C10YO1RnnDHSjP=_eUTOT8A@mail.gmail.com>
Subject: Re: [PATCH] staging: vt665x: fix alignment constraints
To:     kernel-janitors@vger.kernel.org
Cc:     arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Mar 11, 2021 at 11:43 PM Edmundo Carmona Antoranz
<eantoranz@gmail.com> wrote:
>
> The root cause seems to be that _because_ struct ieee80211_cts is marked as __aligned(2),
> this requires any encapsulating struct to also have an alignment of 2.
>

To make sure of this, I played with an empty struct.

struct a {} __packed __aligned(2);

struct structb {
    struct a blah;
} __packed; <--- got a warning about alignment not being 2.

I would guess that setting the encapsulating struct to be __aligned(4)
or higher would also work fine, don't know if I should be more
thorough in that regard in the patch comment.
