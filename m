Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32117C001B0
	for <kernel-janitors@archiver.kernel.org>; Fri,  7 Jul 2023 20:08:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232566AbjGGUIo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 7 Jul 2023 16:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbjGGUIn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 Jul 2023 16:08:43 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3923EDD
        for <kernel-janitors@vger.kernel.org>; Fri,  7 Jul 2023 13:08:41 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-c5f98fc4237so2477857276.2
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Jul 2023 13:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688760520; x=1691352520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmHd/859/Bit4qucqZpPNnDSCbdMa8IL8SYbSrObhB0=;
        b=4ZKOTCpj9xlgCXUEm8oB9fxPpMW4zNUE/1LcyAtNiug/QRRgWh4T+Iz1KBomOIRU/O
         M6flWXHwnMBjPzj/2Uhhz2BIwVcH4eJN4AS6rSurgWMTk6aqExtdp/Vwvw6lZUOSSKMd
         UWnwE/qXxMW3g1yX3ibp50dDsfQj47wFKl/hMbbgxSLKsQcdSld0N5W5ZOSmzKSrfaI8
         lwYnzShPbga+2kujDZyJFveO/ePYfePz9w00ezFjkODhap/rSDvQlJ7n7lpVqMplkOYm
         I6Ok4eNQwtFh4A0Gv9HtCPUtZDhVOqV0ESqXMSOooohHHVjJdixj+5LZ8YGeI5aj53K/
         m2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688760520; x=1691352520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmHd/859/Bit4qucqZpPNnDSCbdMa8IL8SYbSrObhB0=;
        b=cyEEN7pLpI5CO5FJ/eo6QeF4TpGuqf9vuvScXilYGP+AIpQS6xTe32o/WeTWney2VH
         K89r5lJqK1olsa0szXHnDNrOMZwJypbLdS1WXd0Hh0Cu2ZlwoDBR90wfDOvpTkGlI3My
         vSZwr3BS5B/tUDj/vUnwRopfsEIQDouIXhHUqbS8jYaLnXXR4kbW2bITiSdl6yjoukuC
         JTHbVQE8FsAp3e6C/oxYsM55/TjMkSojwI/rja16t+advl7auxqP1LymDBjl2Hxzucvg
         ISEcOg6XALapHYFHQ1Hef1komJtP0xvY0gUchEDXriMwTMWummMZwBAS8Jb0eHQ7eLkl
         DX6g==
X-Gm-Message-State: ABy/qLYj7H77u3Un60yV8O/UNSCA+VKyCU6xughkYIEc55rdBU9venH0
        bF2XPuPVNbU8ZeGoej452GIZTCPCRyOLH4m2hs5cyw==
X-Google-Smtp-Source: APBJJlHLv8Tex0uCUJHNjt+PuWIzMenl4+5t76ArY9ljMJ8iMAkKtjBzDY5gKdUODpN4btNpDpQYQPxjx59FzqHs4ac=
X-Received: by 2002:a25:641:0:b0:bcb:c3d6:2b1d with SMTP id
 62-20020a250641000000b00bcbc3d62b1dmr5298177ybg.34.1688760520258; Fri, 07 Jul
 2023 13:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230707043211.3682710-1-surenb@google.com> <e26c40f7-0329-c223-2544-503c64123f5a@web.de>
 <ZKhvgm6geUvLPQKk@casper.infradead.org>
In-Reply-To: <ZKhvgm6geUvLPQKk@casper.infradead.org>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Fri, 7 Jul 2023 20:08:29 +0000
Message-ID: <CAJuCfpFj_OWi=SRgUp=f3MAhb988fZL46oWKpL1jM15i91x5Yw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: lock a vma before stack expansion
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Markus Elfring <Markus.Elfring@web.de>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org, kernel-team@android.com,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Axel Rasmussen <axelrasmussen@google.com>,
        David Hildenbrand <david@redhat.com>,
        David Rientjes <rientjes@google.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Greg Thelen <gthelen@google.com>,
        Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>,
        Jerome Glisse <jglisse@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Lorenzo Stoakes <lstoakes@gmail.com>,
        Michal Hocko <mhocko@kernel.org>,
        Michel Lespinasse <michel@lespinasse.org>,
        Pasha Tatashin <tatashin@google.com>,
        Peter Xu <peterx@redhat.com>,
        Punit Agrawal <punit.agrawal@bytedance.com>,
        Shakeel Butt <shakeelb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jul 7, 2023 at 8:03=E2=80=AFPM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> On Fri, Jul 07, 2023 at 10:00:42PM +0200, Markus Elfring wrote:
> > =E2=80=A6
> > > write-locked to prevent page faults into the VMA being expanded. Add
> > > the necessary locking.
> >
> > 1. Would it a bit nicer to put the second sentence on a separate line
> >    in such a change description?

Maybe. Will do if there is a need to post a v2.

> >
> > 2. I noticed that you put the address =E2=80=9Cstable@vger.kernel.org=
=E2=80=9D
> >    into the message field =E2=80=9CCc=E2=80=9D.
> >    Would you like to specify such a hint as a tag?
> >
> >    See also:
> >    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/process/submitting-patches.rst?h=3Dv6.4#n264

Yeah, I always forget that :(

> >
> > 3. How do you think about to add the tag =E2=80=9CFixes=E2=80=9D?

I thought about it but was not sure which patch I should list under
such tag because the rules for stack expansion changed recently.

> >
> > 4. Will a cover letter become helpful also for the presented small patc=
h series?

Not much to say other than "add some missing locking" :)

>
> Markus, your nitpicking is not useful.  Please stop.

I'll fix the nits, at least the ones I can, if there is a need for v2.
