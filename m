Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2B0C433B4
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Apr 2021 20:24:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 472896103D
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Apr 2021 20:24:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235075AbhDOUYW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 15 Apr 2021 16:24:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25785 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234536AbhDOUYW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Apr 2021 16:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618518238;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dJSt+R0xYlbKn2NDeMbvCLCunZLRZGk+vRMb3bJfoV0=;
        b=eoKepcPk6uT9YdBbMqW7eF3bQXSichXgp4cl4ZfI6/ESO3VITfrGxUc96xVK9+ECm/fhQ9
        FQJIRkX0wtLQuql3vkqyxNy/C4fHOwWKg+byXU+yNeKs/b2VFRp7pXI9Yiq4Pd13ZHPlmt
        Bi6i6ijVS8qnjMLVWpgwXawmLCQgvd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-2PyZnEO0O_GQc3g_-fTaBA-1; Thu, 15 Apr 2021 16:23:54 -0400
X-MC-Unique: 2PyZnEO0O_GQc3g_-fTaBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30F4D881278;
        Thu, 15 Apr 2021 20:23:53 +0000 (UTC)
Received: from madcap2.tricolour.ca (unknown [10.10.110.27])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 499F8610A8;
        Thu, 15 Apr 2021 20:23:46 +0000 (UTC)
Date:   Thu, 15 Apr 2021 16:23:44 -0400
From:   Richard Guy Briggs <rgb@redhat.com>
To:     Pablo Neira Ayuso <pablo@netfilter.org>
Cc:     Paul Moore <paul@paul-moore.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jozsef Kadlecsik <kadlec@netfilter.org>,
        Florian Westphal <fw@strlen.de>,
        netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] netfilter: nftables: fix a warning message in
 nf_tables_commit_audit_collect()
Message-ID: <20210415202344.GI3141668@madcap2.tricolour.ca>
References: <YGcD6HO8tiX7G4OJ@mwanda>
 <CAHC9VhQ4D25kvzjXyvk8eJFXCOAaxuzUkSyNTePSrBHONxXZwQ@mail.gmail.com>
 <20210403181850.GA4976@salvia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210403181850.GA4976@salvia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2021-04-03 20:18, Pablo Neira Ayuso wrote:
> On Fri, Apr 02, 2021 at 11:57:20AM -0400, Paul Moore wrote:
> > On Fri, Apr 2, 2021 at 7:46 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > The first argument of a WARN_ONCE() is a condition.  This WARN_ONCE()
> > > will only print the table name, and is potentially problematic if the
> > > table name has a %s in it.
> > >
> > > Fixes: bb4052e57b5b ("audit: log nftables configuration change events once per table")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  net/netfilter/nf_tables_api.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > Thanks Dan.
> > 
> > Reviewed-by: Paul Moore <paul@paul-moore.com>
> 
> Applied, thanks.

Thanks Dan, Paul, Pablo.

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

