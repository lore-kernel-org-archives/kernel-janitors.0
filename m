Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CAFC433EF
	for <kernel-janitors@archiver.kernel.org>; Thu,  9 Dec 2021 02:35:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbhLICil (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 8 Dec 2021 21:38:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbhLICil (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Dec 2021 21:38:41 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D64C061746
        for <kernel-janitors@vger.kernel.org>; Wed,  8 Dec 2021 18:35:08 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id z5so14902791edd.3
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Dec 2021 18:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ypxKV2UGBrLHG23d4CtGXv8E22tV/v/2HrAQjHL41g0=;
        b=qF88XJYlfHijqbSQMbTBu9IP4fvdraZcgML7crQmlSBHPJNNx1Tz58OHV2upOUyUYR
         QhFL2YRrJDr+dr9+Lgz9VbfuHgYa/LJR6B6BldNC8pfeDQI5nkULrEQa9V6FAqnRb28m
         ppC5N4S0UPEgNp9rR74HeaPB6lAmjfAiytgQ3nHW08G6DTwGIrC6P3E+xRpDPQdjdFth
         HX8B+iIi2CZz8nwdqvuEcTEEA/sD7NCC4DoUan6RnVe2zwz7+rYL5uWa1YiHWxEHaM/5
         XluqPRHVxhV3JPAVhXqrjzKes4iz5FAr+Anm7n8uPQcGK9DCARa3bLmu5cdF3/H/YMxg
         x1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ypxKV2UGBrLHG23d4CtGXv8E22tV/v/2HrAQjHL41g0=;
        b=FA8tjhCn++o/tOiY0wy87iQwYYSfTtMOWUAjbZkAdHMKjB6I8NVC+EsdyP8Bn2d9QP
         Fjm11+c04QzCAoQyinMHXlpD+C+sf6slSt/mRgsU+29wpjL6ooce2XBbPlN/iYRXqXqL
         yR1znBUJ2Vu+0uU9UABibvLpcXB5FhZUoy3nrV1tkL+1YvKEp7g3DnEeRdvGs2OhgNha
         AwveMsz6X4WvSjKSGKbVeqF0w16qvTruWCZpcQcjwQAt4Dn9eYj2SMmi8+F3Gar3CWVF
         4nLXvxNgphOoKupLtO6puVfThn95fSVfEZ6forv5rq7Ko5GrTiur/yFw4zGbNVTqVDTG
         uRdA==
X-Gm-Message-State: AOAM532OEnqQIEHf1zgyTVopWaBUd+OjSTgpsKmbOfvBwha060sJPlGm
        5QZAmfDVM68kGn0DpNhMAm7NtFfc8La1pJc/pYI1
X-Google-Smtp-Source: ABdhPJwGiPrWLLuVeCL8n+Ca0eXaT+n6lSppLbNH0/koe2m8Pse4fI+kzsFGpTuCOjBzpEhWwKVBQCwiaouYho9P8E4=
X-Received: by 2002:a05:6402:d09:: with SMTP id eb9mr24539761edb.216.1639017306722;
 Wed, 08 Dec 2021 18:35:06 -0800 (PST)
MIME-Version: 1.0
References: <20211208103307.GA3778@kili>
In-Reply-To: <20211208103307.GA3778@kili>
From:   Yongji Xie <xieyongji@bytedance.com>
Date:   Thu, 9 Dec 2021 10:34:55 +0800
Message-ID: <CACycT3tsQ=_rSOdPNpwdJS_z0318L6KBj8TUKoUvzpOe4+LsFQ@mail.gmail.com>
Subject: Re: [PATCH 1/2 v4] vduse: fix memory corruption in vduse_dev_ioctl()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, Eli Cohen <elic@nvidia.com>,
        Parav Pandit <parav@nvidia.com>,
        virtualization <virtualization@lists.linux-foundation.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Dec 8, 2021 at 6:33 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "config.offset" comes from the user.  There needs to a check to
> prevent it being out of bounds.  The "config.offset" and
> "dev->config_size" variables are both type u32.  So if the offset if
> out of bounds then the "dev->config_size - config.offset" subtraction
> results in a very high u32 value.  The out of bounds offset can result
> in memory corruption.
>
> Fixes: c8a6153b6c59 ("vduse: Introduce VDUSE - vDPA Device in Userspace")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Xie Yongji <xieyongji@bytedance.com>
