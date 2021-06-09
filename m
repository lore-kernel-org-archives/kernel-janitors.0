Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF19C4743D
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 02:21:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9F3361287
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 02:21:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232565AbhFICXD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Jun 2021 22:23:03 -0400
Received: from mail-ed1-f42.google.com ([209.85.208.42]:37462 "EHLO
        mail-ed1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbhFICXD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Jun 2021 22:23:03 -0400
Received: by mail-ed1-f42.google.com with SMTP id b11so26865183edy.4
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Jun 2021 19:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Y1FSEobOe8xalX9xjuNlZS8PBOfMBLSbk/7QTP+PmY=;
        b=iz2geq+gCBJR3+ViNyaPYvhILn4edEjWx7CTSYlzvWUeIO1YMal+71yIGRGidjTN7q
         GJB1qOWVvO6oZyI40Hmq5EoKqtmvMMfjF2YNoSHfT24XOn+IbR7A1G70dp6/+kIXUfBe
         nxvSi+o/peNnCCOSo2hgo6s9u6n6/b1FJJwM+ba16m5heHFW/1S7xcjFTHo6brGsP3y/
         lni6vJKXCa6YLNaQcAyaxBkpQr5ZTGjRmI0p/A4VrjW6FRomgaOJvk1tv2JT27HwcW02
         S/RHKpAYZUQFhpauBKN1DfbJSEvp3RWOtX229+cRzPlES72QBq2FVSnCled77EW8C8rX
         hlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Y1FSEobOe8xalX9xjuNlZS8PBOfMBLSbk/7QTP+PmY=;
        b=rxDhI0f8r4pYafSCQC7GNoYI1Lk2CtrEfsptYGZSR0NALFJlPuvapV6CsZjnyqZJwe
         yxkKyY5ssKCN3pBKWhwJOVUItqNbsI7b5zYx8SJGoTy7Tm4cwHavhE6DNwe+52xYOIqq
         7GebIkZdBXvDV9Bwaf5tuk1eU1trGpm/Dt25hiYChVaWmO4xqSFV5wpqH/MVeDaOsVdG
         guuBqeEEKkCkYhlel1lPR9R5pF8PSKnm1j52LJ86h6ndgHN6tvxq7lworZUdoNC5xYqS
         Sa9NaNW+LJrBszljH2JSdKn8rtAX/KXX8pV32gAbOX3fX4Nxj1AgghKOdqjmSlnzY2Pf
         0mhg==
X-Gm-Message-State: AOAM531bAuofpc3L+uA4CQ+2d9b2xk4DvvpuJKFxzT4PdOwmn8x72Dhc
        PXg4jJzp6tLSUxv062Po+2Vpq3Z6ygnFR2kWw9cz
X-Google-Smtp-Source: ABdhPJwvgyH7PZtXzJ1DdgVwdgA0sHZzXneK81NkEzOR+ec3Iiw+5MfM1yjqs6r5lfCPLmJTFqYK2Ouz89eiw9lKPJU=
X-Received: by 2002:a05:6402:348f:: with SMTP id v15mr16558137edc.135.1623205201671;
 Tue, 08 Jun 2021 19:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031150.2821712-1-libaokun1@huawei.com>
In-Reply-To: <20210608031150.2821712-1-libaokun1@huawei.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 8 Jun 2021 22:19:50 -0400
Message-ID: <CAHC9VhRF-tvaye00Ck-i6OqjmxCUnn8HfdwMTYAm316i=kGd3A@mail.gmail.com>
Subject: Re: [PATCH -next] audit: Use list_move instead of list_del/list_add
To:     Baokun Li <libaokun1@huawei.com>
Cc:     linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>,
        weiyongjun1@huawei.com, yuehaibing@huawei.com,
        yangjihong1@huawei.com, yukuai3@huawei.com, linux-audit@redhat.com,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jun 7, 2021 at 11:03 PM Baokun Li <libaokun1@huawei.com> wrote:
>
> Using list_move() instead of list_del() + list_add().
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>
> ---
>  kernel/audit_tree.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Merged into audit/next, thank you.

-- 
paul moore
www.paul-moore.com
