Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C851AC433ED
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 May 2021 13:15:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACC9861244
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 May 2021 13:15:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233368AbhEUNQ7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 May 2021 09:16:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:41242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233317AbhEUNQ6 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 May 2021 09:16:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38E1660FEF;
        Fri, 21 May 2021 13:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621602934;
        bh=ELkwNWjodHS5o8+tIb+k6kw61lBw+odKqudQ/BusQHA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RZcGe+nm9GkVGQbo4yCe1+TGsNoiyM4qPcoiPf/89zKWMcZO0qO3i0hyuFWJSaKw5
         iBjD623cTwD1b+8SKVIYjo/wZvGv4+nOw9avM1LSEAIhiBLObZvJJDrMWyMT0Nw2Vd
         nWVSpXGV6pnkhpFh9LFYhhg3fK81uQ6j8zE8E0b4=
Date:   Fri, 21 May 2021 15:15:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     arnd@arndb.de, mihai.carabas@oracle.com,
        andriy.shevchenko@linux.intel.com, pizhenwei@bytedance.com,
        pbonzini@redhat.com, linqiheng@huawei.com,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] misc/pvpanic: Fix error handling in
 'pvpanic_pci_probe()'
Message-ID: <YKeydEDcqgiAYGgT@kroah.com>
References: <7efa7b4b9867ac44f398783b89f3a21deac4ce8b.1621175108.git.christophe.jaillet@wanadoo.fr>
 <YKepSQpLUc5V17tz@kroah.com>
 <694c162e-cbd4-5c51-9b20-b66006594d75@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <694c162e-cbd4-5c51-9b20-b66006594d75@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 21, 2021 at 02:41:16PM +0200, Christophe JAILLET wrote:
> Le 21/05/2021 à 14:36, Greg KH a écrit :
> > On Sun, May 16, 2021 at 04:36:55PM +0200, Christophe JAILLET wrote:
> > > There is no error handling path in the probe function.
> > > Switch to managed resource so that errors in the probe are handled easily
> > > and simplify the remove function accordingly.
> > > 
> > > Fixes: db3a4f0abefd ("misc/pvpanic: add PCI driver")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > >   drivers/misc/pvpanic/pvpanic-pci.c | 9 +++------
> > >   1 file changed, 3 insertions(+), 6 deletions(-)
> > 
> > I see two different series for these patches, so I don't know which to
> > take :(
> > 
> > Please fix up and send a v2 series so that I have a clue...
> > 
> > thanks,
> > 
> > greg k-h
> > 
> 
> Both have to be taken. One is for -pci.c and one is for -mmio.c.

Ah, I totally missed that :(

> I'll resend both with a more complete subject and will include Andy
> Shevchenko's comments.

Wonderful, thanks for doing that.

greg k-h
