Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73314EB64DA
	for <kernel-janitors@archiver.kernel.org>; Fri,  7 Jul 2023 20:03:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbjGGUDZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 7 Jul 2023 16:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjGGUDY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 Jul 2023 16:03:24 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8651FFE;
        Fri,  7 Jul 2023 13:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=4l5M7cRNcF+51B7hcbH/mOb7nfZ7595fttU8Ngirums=; b=lKyf77A8SIucnXsLvV29lCMVga
        +erHL0kpoq4uhvTYj9AKs+sTDZmUM7FRO3/fgRsAjEFFib+nqLUb/Bkc94md5J6M/cCwUu+nSsc7C
        bk/RFwD1w9mSySvf1E3e3LHQH36JzRI5EgiDsxDcr8TMACm2KFjoQfMlybx5oWGHJb5ZWFAHrir4m
        MuLONcaTgZoHH4fnQ3Lb7a31FtMZX+7DYZsV6GkbS9VAXfoBq29Wl0E1NoG1+Beaa3QDLf9yfW/Hn
        Nc/yby9d/7GnwsjGTFAgIbbhhGUC91oZVm91KFDKF9NYyM8K9NzqCt8Djp6zotUBFU8Y7hwHSo5G4
        /0SCLz3w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qHrfe-00CJpB-Rp; Fri, 07 Jul 2023 20:03:14 +0000
Date:   Fri, 7 Jul 2023 21:03:14 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
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
Subject: Re: [PATCH 1/2] mm: lock a vma before stack expansion
Message-ID: <ZKhvgm6geUvLPQKk@casper.infradead.org>
References: <20230707043211.3682710-1-surenb@google.com>
 <e26c40f7-0329-c223-2544-503c64123f5a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e26c40f7-0329-c223-2544-503c64123f5a@web.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jul 07, 2023 at 10:00:42PM +0200, Markus Elfring wrote:
> …
> > write-locked to prevent page faults into the VMA being expanded. Add
> > the necessary locking.
> 
> 1. Would it a bit nicer to put the second sentence on a separate line
>    in such a change description?
> 
> 2. I noticed that you put the address “stable@vger.kernel.org”
>    into the message field “Cc”.
>    Would you like to specify such a hint as a tag?
> 
>    See also:
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.4#n264
> 
> 3. How do you think about to add the tag “Fixes”?
> 
> 4. Will a cover letter become helpful also for the presented small patch series?

Markus, your nitpicking is not useful.  Please stop.
