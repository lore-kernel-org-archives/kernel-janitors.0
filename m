Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6969CECAAA1
	for <kernel-janitors@archiver.kernel.org>; Tue, 30 Aug 2022 11:56:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbiH3L4f (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 30 Aug 2022 07:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbiH3L4d (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 Aug 2022 07:56:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82546D21FE
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Aug 2022 04:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661860590;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=I8GvlrYVvupK3hOQqvOdht2sIf2McSZ1h3wdQgKQ4L8=;
        b=FsEs7ym5pz3FQ0wxzlFLHTTB9KDNW1qbTzXaPhCRgXE7uqOHoG7na3qLNxauFeFd3Q4OFt
        CgkhIVQS91vsI7znJkLiD0eIEDXvOMC76/JupfrObDzXaQzMMGwAGJ1V3UTYaCzaKc6x9t
        ewOwVKe3pE8lLCM15JI1mBhZNPG5OfI=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-176-fNuwQjmVPDmkh_1V9vKCQQ-1; Tue, 30 Aug 2022 07:56:29 -0400
X-MC-Unique: fNuwQjmVPDmkh_1V9vKCQQ-1
Received: by mail-pj1-f71.google.com with SMTP id e11-20020a17090a630b00b001f8b2deb88dso11132538pjj.1
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Aug 2022 04:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=I8GvlrYVvupK3hOQqvOdht2sIf2McSZ1h3wdQgKQ4L8=;
        b=YytI22K3t/yDWpd8/7TtPkl+CWgHrgP7L8Wdkru4RGUI2hQXJwEWoNEAwDPRbuMnoj
         oRT1Q9X4XlLUp+41156rYbGhsq6BIqOPq4H1CH6aIpYwtaKgYP6bRDyPYGrAxOx9U7im
         50yN6Nk9EgRxAsro2NBwwr5FKQZtNhr6Vj1KGUJ2Z18fpI57s8UobFGTthJ3I8NtSfR7
         oei+PadJMUxLk3nirlFbniQU996ZL7DGKdHuTAHuVt4gV2/NfdlDYsGzNGZlo90EpfiG
         zRcReYt6O0ZxDU5x5JmyNPWCnir/oV7cT3nqX7iSqLXyE9SfTQk286AxzTNGLfqupy83
         OWDw==
X-Gm-Message-State: ACgBeo2eAqBGQQt3sa9UMRvH3M+t25Dzp14tC5mbEmPpT7rNX5oupvDa
        Ddnj63I3hK0NJlHhRW3VvdOfzCN6QNrXvD9xnIeEBOaI2Qv8JN9rzFko6FAokDRICF8sDGGFjF0
        0TV2EjgnhG4UfNzaKoXocxr0zVH58T4mq19H9P3pL8fNk
X-Received: by 2002:a05:6a00:1705:b0:52f:6028:5c33 with SMTP id h5-20020a056a00170500b0052f60285c33mr21026170pfc.29.1661860588542;
        Tue, 30 Aug 2022 04:56:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4qxUtpfFGljzWpROmYcOz2AJMFuKYBbL8Bx+4lKutjj90XsMterYYEJc9IMWzrnSPxCXHO1ShLAHjJfLxSqH4=
X-Received: by 2002:a05:6a00:1705:b0:52f:6028:5c33 with SMTP id
 h5-20020a056a00170500b0052f60285c33mr21026154pfc.29.1661860588305; Tue, 30
 Aug 2022 04:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <6ee2132c415db2fc90e7fa2106db427a914cc566.1655563907.git.christophe.jaillet@wanadoo.fr>
 <nycvar.YFH.7.76.2208251126010.19850@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2208251126010.19850@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 30 Aug 2022 13:56:17 +0200
Message-ID: <CAO-hwJJfncQ3jgtS=HO0atbzrTNOT_rzU66oG2yRTWTSY-L8KA@mail.gmail.com>
Subject: Re: [PATCH] HID: cp2112: Remove some dead code
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        lkml <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Aug 25, 2022 at 11:26 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Sat, 18 Jun 2022, Christophe JAILLET wrote:
>
> > Commit 13de9cca514e ("HID: cp2112: add IRQ chip handling") has introduced
> > cp2112_allocate_irq() that seems to be unused since 2016.
> >
> > Remove it, remove the associated resources and part of the remove()
> > function that frees the resources allocated in cp2112_allocate_irq().
> >
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> > Compile tested only.
> >
> > Maybe the issue is completely elsewhere and the probe() should call
> > cp2112_allocate_irq() in some cases.
>
> Benjamin, could you please take a look? Apparently you were aware of the
> code being dead due to the __maybe_unused annotation ... :) What was the
> point?
>

Looks like I kept that code around for the CI I am running on HID patches.

IIRC, I left the code in the tree because it might have been useful to
others when they need to declare IRQs on the board. So yes, it is
entirely dead code upstream :/

I am applying the following 3 patches on the current master tree to be
able to declare hid-cp2112 as an i2c-hid transport:
https://gitlab.freedesktop.org/bentiss/gitlab-kernel-ci/-/tree/master/VM

Those 3 patches can not be upstreamed because platform drivers are a
dead thing, but I have no other ideas on how I can declare an i2c-hid
device on top of hid-cp2112.  Given that we don't have DT on x86_64
vm, I can not rely on that to have my custom sensor (or maybe I can
but I am not aware of it).

So unless anybody has a better idea, I won't fight against removing
that code, but it's more convenient for me to have it.

Cheers,
Benjamin

