Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C773C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu,  9 Dec 2021 02:35:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhLICj3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 8 Dec 2021 21:39:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbhLICj2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Dec 2021 21:39:28 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FA12C061746
        for <kernel-janitors@vger.kernel.org>; Wed,  8 Dec 2021 18:35:55 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id y13so14712512edd.13
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Dec 2021 18:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DX/WjP+WxAwM1uaLwhVKb1R2kcyv9DFh1kSje4L7bYM=;
        b=mvLoiyR7m0mnJT56iSdYQm9G0NMNro8Jw/DkP6SILM7ufll3g2rrwwe9vNEwdk2keM
         9ZjwImwOUvt5BgoUakkpMViG57CYxfJN4P1ki4mRpPdlG9ChhNM5fjZ06fbvJcEfKcRU
         WLSfYLtNrB5wIfwfUvG0ay73jDcVPb/3be6lKm8n4REbVAI7GA7mju4KcuBlohxwiM6o
         MlPcyENFDnRX4W8grwzUZMDZYxXc9iM6QPkuX9EMAH4OcQE48vDP3vW9ovmSwI/vkUyg
         UeWerVzWzESi7EOYRKRZYRhlt6nHbok7JBoVfwNxey9+PQyxp4zQrjLiBOeXvha4Ekra
         brnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DX/WjP+WxAwM1uaLwhVKb1R2kcyv9DFh1kSje4L7bYM=;
        b=1DF7v/LeOtAyRSPm3CiskVJWxq3yAwDrS3AVYft9INBJB/4j5AgS6+RID5QE6H7rFd
         wi1nTBBf1sXKya/fXSU0eXJLw5Y6wOUG5uwgEPnSzaTrnKmTpuyfvaFroyJRFKBfgHxm
         rvnG6Goe1ZHG14rLMx33qNJwNBr/ISIKHelSKDjMz5GJNEZOWifxkaK5oYlKAemwMDMX
         FmRJw5tbO1ccEuiyPWTRd3VdvhkhWLDX/ZvAYKfPgpDuAYxodoK7d0RKW3qZjHLhApP4
         N0sNVJMkQDO5dRvzADzoCVAs2D1J8diS48HDCtX2Rd0wFzlTrt7lC/PWkhr2YwLhHxei
         AQAA==
X-Gm-Message-State: AOAM531SbFfouxDa3Lmc/tFWVA4USwZYTjTyT1REZ8HczA/h+xzDAhmC
        QbCr5fqaDPP2Z41MWXrHhK3j2U767Pr7lIRZJCc6
X-Google-Smtp-Source: ABdhPJyyLaIvdzkwXpNU9DT3kgXtEhX8xkS8vCGrE/6za1mWysUFfwUvfzuvk0FX/A+rTcmuOu+upvoxdOeRlEqsbjc=
X-Received: by 2002:a17:907:972a:: with SMTP id jg42mr12432313ejc.398.1639017354250;
 Wed, 08 Dec 2021 18:35:54 -0800 (PST)
MIME-Version: 1.0
References: <20211208103307.GA3778@kili> <20211208103337.GA4047@kili>
In-Reply-To: <20211208103337.GA4047@kili>
From:   Yongji Xie <xieyongji@bytedance.com>
Date:   Thu, 9 Dec 2021 10:35:43 +0800
Message-ID: <CACycT3un+oTFoOrYiegOrpRLw2RFyU0j4OBrVBhzGZJqU9Z1sA@mail.gmail.com>
Subject: Re: [PATCH 2/2 v4] vdpa: check that offsets are within bounds
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Tiwei Bie <tiwei.bie@intel.com>,
        Jason Wang <jasowang@redhat.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        kvm <kvm@vger.kernel.org>,
        virtualization <virtualization@lists.linux-foundation.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Dec 8, 2021 at 6:33 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> In this function "c->off" is a u32 and "size" is a long.  On 64bit systems
> if "c->off" is greater than "size" then "size - c->off" is a negative and
> we always return -E2BIG.  But on 32bit systems the subtraction is type
> promoted to a high positive u32 value and basically any "c->len" is
> accepted.
>
> Fixes: 4c8cf31885f6 ("vhost: introduce vDPA-based backend")
> Reported-by: Xie Yongji <xieyongji@bytedance.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Xie Yongji <xieyongji@bytedance.com>
