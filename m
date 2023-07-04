Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A864EB64D9
	for <kernel-janitors@archiver.kernel.org>; Tue,  4 Jul 2023 08:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbjGDI7f (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 4 Jul 2023 04:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbjGDI7d (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 4 Jul 2023 04:59:33 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D78991B2
        for <kernel-janitors@vger.kernel.org>; Tue,  4 Jul 2023 01:59:28 -0700 (PDT)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7A0003F133
        for <kernel-janitors@vger.kernel.org>; Tue,  4 Jul 2023 08:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1688461166;
        bh=Iq6cKg1bVkNflRBjs/XMRCMTTeQAcRlxHohCnato/0M=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=Og59A6FR7WX+ExOgJk+Csg97OvZpD6vpAahxqfbs2FpSiFv2A6xbREWeON6ZewV/2
         xOXY0Fea5NrvVVWrA2M332H/TObizVYvN1gKidJyoR3waKu0BRwVTJ6Jk6/MXdoH8F
         p+QQDhjh5OuUCUlUMBwo1fqqmV2BIm/LyCGyYOICJPnsgv0W7aLmRDpL8P+BPpFbRd
         khCsct6kltqDR6iMpxs+6Ju04hdx8mg53olmZbWPVo+5Mwnxes26ArlieEgplvv4s9
         NFZYq1rkGXT/O6UQlw4QvfhyCNzxwde0QAqH56Fsxtb686QNPaGcNlo4NV1EhufSyh
         dKwVMUrtr7GOg==
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-67106f598b1so4820556b3a.2
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Jul 2023 01:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688461164; x=1691053164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iq6cKg1bVkNflRBjs/XMRCMTTeQAcRlxHohCnato/0M=;
        b=Kdy43jnR6MugZT40K40RPZDBZrMjKX2sAiZc2FuRcClVIZOD9SjziqYR+QoDR24WNd
         iTpYEwdXgxwUIWFqJZ4QBhlxT7xA7BsDrGOw9jdWuwcdgRe+vTQIXy7QaPLxhDSfCrdV
         xABaZrkswaBYPjzNclKUpmhmpMu5hyhwGMTgC4UQ6q862UWwU0YOZ2pZdGdxJKJAyUYT
         y9JB9zN3v/2vWMFknxT6NJEpwm6ofsMKaSsDb0AGC0UkPxpoZG/YlVk1tAowMcJwTIaL
         wYPFkBjIJmuHHGBZgW+Riru5vLyax7F3z6VplzuDx5u2M3011NQmKF2veo7YrZWpRr3X
         Q4Jw==
X-Gm-Message-State: ABy/qLZAkWZlPAZ3Ewk6aT7j/aqQoSQySTUYKOps6tcLF+MXlbKvegrG
        t8DVRSzEzTxLtloJxJi6VYoLnyewbmaUPy3bf0ViA0MN+bs3vDbe+nNicucas8FAl+g8APiLB98
        7wJ6iwLqFDm8Bd+9HiX45a+BmeslQkd5lkbiu/chBvY5W6VxaqXTujbmkf5gY8g==
X-Received: by 2002:a05:6a00:c8c:b0:67d:ccbc:5e81 with SMTP id a12-20020a056a000c8c00b0067dccbc5e81mr13255043pfv.4.1688461164102;
        Tue, 04 Jul 2023 01:59:24 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEA4BMzE4N8gwue1FHSWScEaB/ukcJ0jLDn6CFHKEFH69V6wIcnboq78jkqkyl7LecvUNNmcVKK25UHVuk3664=
X-Received: by 2002:a05:6a00:c8c:b0:67d:ccbc:5e81 with SMTP id
 a12-20020a056a000c8c00b0067dccbc5e81mr13255036pfv.4.1688461163739; Tue, 04
 Jul 2023 01:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230703162509.77828-1-koba.ko@canonical.com> <4ec2b7d2-11a5-6ab6-087a-175ed31faca4@web.de>
 <SJ1PR11MB60839A0FC6B5E79E3E5A7997FC29A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <CAJB-X+X+09-m57JcZcb-_9dKUG3CtAbLXxGTEg7R0bB8pyJx9Q@mail.gmail.com>
 <CAJB-X+XVO29wVxVezjFrgCyXigqEJxAzb0K0wueXNto5K_x2tA@mail.gmail.com>
 <9c27530e-21f9-15ce-5116-5af5b0c25f53@web.de> <CAJB-X+VjjxLi60k-6VNcypMB8EomJ0uYpDdfwpJ1dHPWRG7Vxg@mail.gmail.com>
 <706f49e8-d536-651a-2f19-394518633b53@web.de>
In-Reply-To: <706f49e8-d536-651a-2f19-394518633b53@web.de>
From:   Koba Ko <koba.ko@canonical.com>
Date:   Tue, 4 Jul 2023 16:59:12 +0800
Message-ID: <CAJB-X+Wv6yeJLhWogopd5HyJADwLqSdmhfrh_P+-P02SEOACQQ@mail.gmail.com>
Subject: Re: [v2/v3] EDAC/i10nm: shift exponent is negative
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Aristeu Rozanski <aris@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        James Morse <james.morse@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Richter <rric@kernel.org>,
        Tony Luck <tony.luck@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 4, 2023 at 4:50=E2=80=AFPM Markus Elfring <Markus.Elfring@web.d=
e> wrote:
>
> > @Markus and all,
> > please review it, thanks
> >
> > Subject: [PATCH][V3] EDAC/i10nm: Fix an inappropriate shift exponen
>
> * Combined prefixes would be nicer.
Do you mean, [PATCH V3]?
> * Please avoid a typo here.

=3D> exponent

>
> > when get rows, cols and ranks, A special value combination could not
> > be handled so far.
>
> It seems that you stumble still on wording difficulties.

remove the previous sentence,
A special value combination could not be handled so far.

>
> > Fixes: 4ec656bdf43a13 (EDAC, skx_edac: Add EDAC driver for Skylake)
>
> You overlooked somehow to use double quotes here.

must be
Fixes: 4ec656bdf43a13 ("EDAC, skx_edac: Add EDAC driver for Skylake")

> Please provide the next version of a proper patch.
>
> Regards,
> Markus
