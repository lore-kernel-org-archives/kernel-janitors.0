Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C50EB64DD
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Jun 2023 16:24:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbjF0QYq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 27 Jun 2023 12:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbjF0QYh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Jun 2023 12:24:37 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B5A135B0;
        Tue, 27 Jun 2023 09:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=TAIURYqyh8U3w7oftgSODC0qPbPO0+PGCUvrAj05E7s=; b=WmFvy9Kcpdm5KqN6Kg4xNHYa9u
        9NlU3eNvIjN62oO7XEwl3D6w3wfE9UfDvNSf5dXJq+MSSTHuqEcbcBpUtIzh/h9oGSKzHQcakLXeK
        cezWEUcpYYzF+nyhIsEN824gKkDPFrgab1lhD2eVB3Jr+oZrIaYveiy+x3qBffDCjhGKAKvf35+8s
        1YlsyIqqnBSuIwDtgmhubXDhliakCjcM3qByeqdMrpJRwrm1HDAUdSHVFd3xPuuqOeHLyZskEfoS1
        +f9e9N1FP018BQHbmiZcUX67HB9fElQMQY8xjxH4wSf0frazlcq3cj8rSCyMzcq6c5pBsqAEg3JrH
        bqZ4t75Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qEBUS-002skt-60; Tue, 27 Jun 2023 16:24:28 +0000
Date:   Tue, 27 Jun 2023 17:24:28 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        nvdimm@lists.linux.dev, Jane Chu <jane.chu@oracle.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Ira Weiny <ira.weiny@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>
Subject: Re: [v5 0/1] dax: enable dax fault handler to report
 VM_FAULT_HWPOISON
Message-ID: <ZJsNPKGH903AxDy3@casper.infradead.org>
References: <20230615181325.1327259-1-jane.chu@oracle.com>
 <b57afc45-6bf8-3849-856f-2873e60fcf97@web.de>
 <18ca0017-821b-595c-0d5a-25adb04196c1@oracle.com>
 <be3db57c-29d0-cfc9-f0cc-1765b672c57e@web.de>
 <ZJr+ngIH877t9seI@casper.infradead.org>
 <b46b90b5-cc1d-9311-892b-a0f8abe155d6@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b46b90b5-cc1d-9311-892b-a0f8abe155d6@web.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 27, 2023 at 06:22:47PM +0200, Markus Elfring wrote:
> >> How do you think about to put additional information below triple dashes
> >> (or even into improved change descriptions)?
> >>
> >> See also:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.4#n686
> >
> > Markus,
> >
> > Please go away.  Your feedback is not helpful.
> 
> Would you insist on the usage of cover letters also for single patches?

I would neither insist on it, nor prohibit it.  It simply does not
make enough difference.
