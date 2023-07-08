Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8211FEB64DD
	for <kernel-janitors@archiver.kernel.org>; Sat,  8 Jul 2023 06:18:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbjGHGS0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 8 Jul 2023 02:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjGHGSY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 8 Jul 2023 02:18:24 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52C91FD7
        for <kernel-janitors@vger.kernel.org>; Fri,  7 Jul 2023 23:18:23 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-579ef51428eso34666107b3.2
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Jul 2023 23:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688797103; x=1691389103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MAxk2PgUZVgl0dal721qm8ALQS71HLK1RtEb8u+Uwo=;
        b=cqyYfDxLdjqJtLxZvV2GbMizhmrYthTgcuhRwhBgYix/yKS0ibfzGvoJRBMohHf1CU
         D4lflKWn7pSexpHeftC0T1/XOT3aiEyOsA1O3sr0GIVqSZ//yR6dw4pAzp3/Z6Xakxy4
         vJWHlVelLKCKW71lwRU8+VRQA0YOVGyNyNY1D6ytfKXU2NefWlzXpTLPgZHte2JgjtpK
         wOcHmIFBYW2j2yRIMoclCzweTy2z4eWaWU6OPw16559dwTqsRYwV9l+pwsFZ+z2hbgZO
         zGuJ60uSWUm9zc9+Zl5v+qXcOdVaNZbmCBpgt4zzqgoMpPvzb8S71wdDUG9EqYYpGu5x
         w7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688797103; x=1691389103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MAxk2PgUZVgl0dal721qm8ALQS71HLK1RtEb8u+Uwo=;
        b=JwE49qDZQYVk8EYO7aUhTOHUQn0SPt1XQfKYV7nIG1yC442jzZymj1JoDDY9Eyb4Uy
         b+wVuOhrLXXcd7UTlGSYL29UqoQyt/GrqyD8TALWmhNxelAASOA7ZHvS4qq92tuY4fsj
         5vaqJ1sdVbxxjNwdvzgdZsUUO7gPqmKhIOaqKVOlTP4zPOWENyKsC//jbDXLAxiTD7hi
         KvITWOkvCsI3tpQhSrD1qTHEH/IlxSov8+k1DW5pLwAOutEz2O6RqAaRP0d4thgflewT
         JkZUGtgGL4nBfUoP6GFeFyCV498QBns3mQwM6wh7XxsE7iEXWrUt/P4cWLo14dbtmTvF
         YpHA==
X-Gm-Message-State: ABy/qLaSm+AcwUli+AFhaLooad7xXdx32Bux2zMI+5D9HB3cIYwhLvO+
        y5JvtKslvOqUH0vMrZJhuPXvDYnKphtK+TvkIdKjhA==
X-Google-Smtp-Source: APBJJlFPq7Gtkf1gegzIupdC1wtY0Z5UlJDkgN+ZBldyqD1P0gGQGWfsqFjAKdHb/f9sYflKNoiN4sM3WnrlT93J3nM=
X-Received: by 2002:a0d:e884:0:b0:56f:ff55:2b7d with SMTP id
 r126-20020a0de884000000b0056fff552b7dmr9312228ywe.17.1688797102896; Fri, 07
 Jul 2023 23:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230707043211.3682710-1-surenb@google.com> <e26c40f7-0329-c223-2544-503c64123f5a@web.de>
 <ZKhvgm6geUvLPQKk@casper.infradead.org> <CAJuCfpFj_OWi=SRgUp=f3MAhb988fZL46oWKpL1jM15i91x5Yw@mail.gmail.com>
 <b16b3a2c-4b91-de56-66b8-2f69cca6bb00@web.de>
In-Reply-To: <b16b3a2c-4b91-de56-66b8-2f69cca6bb00@web.de>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Fri, 7 Jul 2023 23:18:11 -0700
Message-ID: <CAJuCfpEX8tXMKd7BKu7JOxhSfgeVnaerJ2db6PqfrScG5cUwig@mail.gmail.com>
Subject: Re: [1/2] mm: lock a vma before stack expansion
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
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

On Fri, Jul 7, 2023 at 10:55=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> >> Markus, your nitpicking is not useful.  Please stop.
> >
> > I'll fix the nits, at least the ones I can, if there is a need for v2.
>
> Thanks for such a constructive feedback.
>
> Would you like to take any further information better into account
> for subsequent patch variants?

All feedback is appreciated. The comments you provided so far seem to
be nice-to-haves but not critical enough to post a new version of the
patch IMHO. If something more substantial is found that requires a new
version then I'll address your feedback there as well.
Thanks,
Suren.

>
> Regards,
> Markus
