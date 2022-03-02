Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFEAC433EF
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Mar 2022 18:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242671AbiCBSaV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 2 Mar 2022 13:30:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234009AbiCBSaV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Mar 2022 13:30:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2767CD8855
        for <kernel-janitors@vger.kernel.org>; Wed,  2 Mar 2022 10:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646245777;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mjxXLj8rr6mOagH85zE8xjeRN36BLXJyOv2Vow+3Iko=;
        b=SOBLWlsFreRPM9eDqwcF4muymatDR8dAreRea7oVmdcOiR1GJrdqiSLmCKl0M+dz8WdhoR
        7kN4NCR0FCL3Kcf4JwHjZi8yV4EGhDTccHYjgdD7Ik0aHkf3YkoefxXB67AL/V65ZbSSV8
        Mj6+EH3wg3LO31QvJFu59lQUUKivTuY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-IxJqtS1GOeCHasuSLtHJrA-1; Wed, 02 Mar 2022 13:29:36 -0500
X-MC-Unique: IxJqtS1GOeCHasuSLtHJrA-1
Received: by mail-ed1-f72.google.com with SMTP id cm27-20020a0564020c9b00b004137effc24bso1477673edb.10
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Mar 2022 10:29:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mjxXLj8rr6mOagH85zE8xjeRN36BLXJyOv2Vow+3Iko=;
        b=2UzJVUO4HMuPM22dCeOoNRahsz4Cn4YiYOHHt8AoPghFJwoyNfvK4Grx9xNdsOEDx9
         FVIp8IbAha3kPcGvzK13lggFpr7bfJ+kDXRyu+fkqKXJuZjNioFor8D4G/gxs7f4lnkJ
         f7l2uw3hvAlg0384HAdaB9Jso5PiW1/E/xwLstxFW+f1LB9RDlclbbM7+nluErfLxAC6
         lGgukwg5kUFbzV3jst9xamcEJOU30YnTr9ucuKlL5dsz4JoiC+U0qfSpNMAr6q2XPyYr
         s1C5szF6Cmoz3r5tgiQdPiaSxxjquk3gvVjZ90O3FEb1n1pQ3DwIVOhhZj5yCPNs1yP9
         ry4w==
X-Gm-Message-State: AOAM532KUrqtudwt6bPvkB5y4vVyo1y6a06Xh+vq/DpEbFOjqNBztLXd
        6dHpzdbmV4aZvdZiKmxpiG4E5B8jeq+PIXHuH6pr5lVsheYZNJ+ThYvpqDwDJOKuWpjeqKkW9DQ
        Zzjgfx+uxT3nydX1XgRaKhvvyZY8jpAuI5TVl17ZGFjzK
X-Received: by 2002:a17:906:434e:b0:6d0:ed9c:68bc with SMTP id z14-20020a170906434e00b006d0ed9c68bcmr23152258ejm.70.1646245775074;
        Wed, 02 Mar 2022 10:29:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHDUcMifYOCkwoFjllRL4kRy+OwEBd4SDygd8H9xrln/fRsbCeSVG7U4y0FcBBR2l+QPrmM5Lpj1qKYIEzkDQ=
X-Received: by 2002:a17:906:434e:b0:6d0:ed9c:68bc with SMTP id
 z14-20020a170906434e00b006d0ed9c68bcmr23152246ejm.70.1646245774790; Wed, 02
 Mar 2022 10:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20220302175309.1098827-1-colin.i.king@gmail.com>
In-Reply-To: <20220302175309.1098827-1-colin.i.king@gmail.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
Date:   Wed, 2 Mar 2022 19:29:23 +0100
Message-ID: <CAFOAJEfS9dMY5nudeFxtwchTtLnBCh7N4qKaCdqvaodnRUFKzA@mail.gmail.com>
Subject: Re: [PATCH][next] drm: ssd130x: remove redundant initialization of
 pointer mode
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Colin,

Thanks for the patch.

On Wed, Mar 2, 2022 at 6:53 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> Pointer mode is being assigned a value that is never read, it is
> being re-assigned later with a new value. The initialization is
> redundant and can be removed.
>

Indeed.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

