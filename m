Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBCFEB64DC
	for <kernel-janitors@archiver.kernel.org>; Sun,  9 Jul 2023 15:42:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbjGIPmk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 9 Jul 2023 11:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjGIPmj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 9 Jul 2023 11:42:39 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE4B91
        for <kernel-janitors@vger.kernel.org>; Sun,  9 Jul 2023 08:42:38 -0700 (PDT)
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3D1B13F19A
        for <kernel-janitors@vger.kernel.org>; Sun,  9 Jul 2023 15:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1688917356;
        bh=eQ2Re41328Au+efAy/olTNwiwLMQnq+SolRCbI7Z9nk=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=FCuyp/ShQ8vSKQQGhljoTEWQaLR9FlKddB8nGHmXMFIxkKlIDoiwiGbVhRUyZ7VYQ
         PedCf9Q21jQx/SiXtfugr0dYRbq1pJLpw1x8Og7DchvGwLzdoOpaNP5U6SyDWgRnAy
         4HnX7hLB5HWcavvmZvd/edUO/WesC1tLVNJShegsgcDIZaQAc9j9/cl/QxqTSRLCkG
         lV1r3BRFNIX/vkJPg/ltw851g/cdEVNTUrU0REPH6lq7QhLix386n1EsCu2DXZB6y8
         DghZxMKY865L4WxsJzZAs+wsJZXkb7wqcknkFyRTiDUtXsmATAyueGT70irbOgXMqU
         TBb66hWi++9Ng==
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-55bd0daca15so5706988a12.0
        for <kernel-janitors@vger.kernel.org>; Sun, 09 Jul 2023 08:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688917354; x=1691509354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQ2Re41328Au+efAy/olTNwiwLMQnq+SolRCbI7Z9nk=;
        b=jhOZaVXePp1g5YyB0hogk8LNQlm3TbgyqyHhqTdXvgEfE1VbPTqQe3IxsReunXVapF
         uiBBwJ21OyNMMWB81975HFYsgdsfwgVt4Dl/73/BRb2hgsjz9JGLA1ld70E1xzZJ+/zs
         OtVb+oahFx3/Q6zc1PykM+Nw7e7fsFz//puc53TvCAYWfzXdJBf1NRyVhL0HGN+M+tRc
         jTQnc2U4UnfyO70V6vomU5CET9VguejQ9hkpHUXnfVWIl8kWVH7HDmSFQUR3XyXbRhC+
         bPL7fYAkFjRQ/43Nk1y1c8+XTVwHYJqFkNvV2YE9DDOftuVJcplqTxAFPdiz6Ccs0DDp
         UT/Q==
X-Gm-Message-State: ABy/qLZYTVUXNEWI6AYHkAoqobBY/ubR+cG0TfCWFtgQRDRYe7fAtQOf
        UITCQrc2yPNA9GNvPi2GXRfp1T+ab/NP9xq2dhLGNqrLxDyRrKFh+JLRhaQRgms8MZdUM1b4dBE
        xqNn9Tkyc64ZLjbUgQ9YO7jnmWMYM5CSeXPC63Utjm0vZWSBPm2h67k5GeXgPdQ==
X-Received: by 2002:a17:90a:2e82:b0:263:e814:5d0f with SMTP id r2-20020a17090a2e8200b00263e8145d0fmr10758233pjd.41.1688917354215;
        Sun, 09 Jul 2023 08:42:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGsEg78pL43U82H6CgYr3QEPQ95eRNBYMptmzATWoIDcYOp+ZNDxNuLrDhBOrn8grnrP2mD7D2In1uL+SWZ4VI=
X-Received: by 2002:a17:90a:2e82:b0:263:e814:5d0f with SMTP id
 r2-20020a17090a2e8200b00263e8145d0fmr10758218pjd.41.1688917353874; Sun, 09
 Jul 2023 08:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230703162509.77828-1-koba.ko@canonical.com> <4ec2b7d2-11a5-6ab6-087a-175ed31faca4@web.de>
 <SJ1PR11MB60839A0FC6B5E79E3E5A7997FC29A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <CAJB-X+UB+eYoYOOVH2bqnnVEJcLrxaj5A7-zyfgBM7hOf4y8zw@mail.gmail.com>
 <SJ1PR11MB608383A5841E4AE8D3A64B79FC2FA@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <CAJB-X+VFYyTiQ7yhX=Z8-Q4QW-GMsGXMuEWxLjuoZ1aDB98qXg@mail.gmail.com>
 <SJ1PR11MB60832C7FFEF98EE33F255B9DFC2FA@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <CY8PR11MB713495A12DE47EDC3B7C5E20892CA@CY8PR11MB7134.namprd11.prod.outlook.com>
 <CAJB-X+X_KW=T4WOe2AS3SFFQKjt7VcQRFUCGYFcjipi5-aXdrw@mail.gmail.com> <CY8PR11MB71346D8945AAC57D3614CBE2892DA@CY8PR11MB7134.namprd11.prod.outlook.com>
In-Reply-To: <CY8PR11MB71346D8945AAC57D3614CBE2892DA@CY8PR11MB7134.namprd11.prod.outlook.com>
From:   Koba Ko <koba.ko@canonical.com>
Date:   Sun, 9 Jul 2023 23:42:22 +0800
Message-ID: <CAJB-X+Xe9H0O=-2o3hL+pz=aGdSRYX+hD0bAxUS11CZDRVZLKg@mail.gmail.com>
Subject: Re: [PATCH v2] EDAC/i10nm: shift exponent is negative
To:     "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
Cc:     "Luck, Tony" <tony.luck@intel.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Markus Elfring <Markus.Elfring@web.de>,
        "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        James Morse <james.morse@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Richter <rric@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jul 7, 2023 at 11:34=E2=80=AFAM Zhuo, Qiuxu <qiuxu.zhuo@intel.com> =
wrote:
>
> > From: Koba Ko <koba.ko@canonical.com>
> > Sent: Friday, July 7, 2023 1:41 AM
> > To: Zhuo, Qiuxu <qiuxu.zhuo@intel.com>
> > ...
> > > I made a patch below to skip all these absent memory controllers
> > > https://lore.kernel.org/linux-edac/20230706134216.37044-1-qiuxu.zhuo@=
i
> > > ntel.com/T/#u @Koba Ko, could you please verify the patch from the
> > > link above on your workstation? Thanks!
> >
> > Here's dmesg patched(Ref. 1). didn't find the previous message, `EDAC
> > DEBUG: skx_get_dimm_attr: bad ranks =3D 3 (raw=3D0xffffffff)`
> >
> > Ref. 1,
> > https://drive.google.com/drive/folders/1xym9JgZZgaJ3EqtP4ccRcVeQYoJKmV
> > lp?usp=3Dsharing
>
> Thanks for the verification.
> Your log showed that the patch worked well.

please,
tested-by: koba.ko@canonical.com
>
> -Qiuxu
