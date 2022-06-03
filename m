Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0075AC43334
	for <kernel-janitors@archiver.kernel.org>; Fri,  3 Jun 2022 08:20:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242783AbiFCIUi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 3 Jun 2022 04:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242805AbiFCIUf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 Jun 2022 04:20:35 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A34A1AF3D
        for <kernel-janitors@vger.kernel.org>; Fri,  3 Jun 2022 01:20:34 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id v5-20020a17090a7c0500b001df84fa82f8so6693089pjf.5
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Jun 2022 01:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D4NXs0gM6EmWNl9SZtPfrcFL6Z+go5/snO+sCnoTH3o=;
        b=OJVPOaSK5wJTmLCMhuJyeLXIlXkwAYg5vYpjvrV87ZVWAzh4cSaT6wr/ggQuS7LBKj
         SFRu4wk1Waz92BT/Utiz2+hcY/6cI2Y5mYyu+smntCrAfKCi9HxZvtWN04I8wznOrCyw
         7am54LTnDKZ6O7A3JPJeUzkc9ydHffkYzx3oS6+dLE1ooMYoIQ3fDv3QGR8W+q5WUz2+
         B8tJpbVoJBIblSD8uTt0lDqlgKnVtErwPVBrwXmtZf1eHzs0cv0f/F+96gFGmqdcPE9l
         ka+PNtLZZaRI/9ZNyZ5TkClEnZPWZCi5bSOP9R9Xoml/NUGVTVHsfwEkon7Es14bu+yS
         IqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D4NXs0gM6EmWNl9SZtPfrcFL6Z+go5/snO+sCnoTH3o=;
        b=fFN6R6/GING4q3Hj/2b7isQefMKiToMqK88VKGn0xU1UOzNKnP5uSDQTKvTijtcWIY
         WBQAvIY3mMNfA2TKAeD3gU/M4xzSZWI6opaeyFsx+dPIfcf3EllYx4TBOeaY9bXfFHBV
         zZlgLWGTmqPuWu8pMo1EzmmNrNSxz1SohpH5X5el2fpwR9GXEKKsGQ3+lVCl4Lu9LXjc
         N3+DYgpBSqOYMOYnD32Ihr0eWTGADjeDUX460Fzmd84lt5q0JtKDTJ6yVgB1mGvx/IQQ
         6w77j7XylFAnpA2+bXgxhvpl1ejE4Es1QWUgTMUIFVp9/0i1+lS0v7Z1Lu0yBuZUaPVv
         8fOA==
X-Gm-Message-State: AOAM531UN33F0Sc0e10uQdR7vimSkPqnS+aBWm+gBG2q+Ee52lh0fkAu
        FVOKgTZcbgFgtwdp7GgAeHdY81SgTDW/+GIwk0oDdQ==
X-Google-Smtp-Source: ABdhPJwvMSX7bJ0sMwvdFp20lychh+sXCuA4C/mut7/HEWAGVctaQxnXeAwtCZxAMkeOUv+YHq4v2qAr7hpIJA5Njmw=
X-Received: by 2002:a17:903:130d:b0:164:17f5:9de5 with SMTP id
 iy13-20020a170903130d00b0016417f59de5mr9406413plb.132.1654244433615; Fri, 03
 Jun 2022 01:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220521124745.8747-1-roger@norberthealth.com>
 <a728cf17-4866-1151-0740-56b06257c917@infradead.org> <CAO_iFwrHcSWJm17fL-Q83DZ5i1xr+_dkEjh5Yt3Hxso0VtnzZw@mail.gmail.com>
 <47a68855-4547-49dd-d7eb-8ef83630552c@infradead.org> <Ypjwh5f6ByoZl5YE@zx2c4.com>
In-Reply-To: <Ypjwh5f6ByoZl5YE@zx2c4.com>
From:   Roger Knecht <roger@norberthealth.com>
Date:   Fri, 3 Jun 2022 10:20:22 +0200
Message-ID: <CAO_iFwrAm-bqRgkD+1QSW8JwjV+Whp_BfNz9Bv1-9XOwy2poFw@mail.gmail.com>
Subject: Re: [PATCH v5] crc-itu-t: Fix typo in CRC ITU-T polynom comment
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        Ivo van Doorn <IvDoorn@gmail.com>,
        kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org,
        Kristian Hoegsberg <krh@redhat.com>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 2, 2022 at 7:17 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Thu, Jun 02, 2022 at 09:31:24AM -0700, Randy Dunlap wrote:
> > Yes, Andrew can merge it.
> > Or possibly Jason (also Cc-ed).
>
> Sure, I can take this.
>
> Jason

Great, thanks Jason
