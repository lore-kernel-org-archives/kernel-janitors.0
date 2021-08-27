Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CEB5C4320A
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Aug 2021 14:19:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 662CE61004
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Aug 2021 14:19:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbhH0OT6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 27 Aug 2021 10:19:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:50542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232641AbhH0OTu (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Aug 2021 10:19:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B82D060FF2;
        Fri, 27 Aug 2021 14:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630073941;
        bh=ldDA9g1db1h6sOWFLUxuvCWXdNmekTYL01U7VHITjCc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=adaSf00qPRjl7Cn8RQHx8UlqiXXn2C2RZhkXbgzENJGtXso8EXwerepqVtr2gpJ8v
         vRGJ6Coa6SHFjmlC74ntnvFqRGS10wH3EKFS8vh99ijNzrPlievRPWhUBwzmDt3Lbx
         8DFylcuZh01ZCjZ/zK/aaSceWZiir4vktBFOrawE=
Date:   Fri, 27 Aug 2021 16:18:55 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc:     kernel-janitors <kernel-janitors@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] parport: remove non-zero check on count
Message-ID: <YSj0Tz8DwstOy4nG@kroah.com>
References: <20210730100710.27405-1-colin.king@canonical.com>
 <CADVatmOudaqZBr+cX_AXwKmDRd2LRTe=C=_bavEki0fdhWkADg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADVatmOudaqZBr+cX_AXwKmDRd2LRTe=C=_bavEki0fdhWkADg@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Aug 19, 2021 at 09:52:07PM +0100, Sudip Mukherjee wrote:
> On Fri, Jul 30, 2021 at 11:07 AM Colin King <colin.king@canonical.com> wrote:
> >
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > The check for count appears to be incorrect since a non-zero count
> > check occurs a couple of statements earlier. Currently the check is
> > always false and the dev->port->irq != PARPORT_IRQ_NONE part of the
> > check is never tested and the if statement is dead-code. Fix this
> > by removing the check on count.
> >
> > Note that this code is pre-git history, so I can't find a sha for
> > it.
> >
> > Addresses-Coverity: ("Logically dead code")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Acked-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> 
> Greg, can you please take it through your tree..
> I think you might not have it in your queue as you were not in the
> original recipient list, if so, I can send it after adding my Ack to
> it.

Now picked up, thanks.

greg k-h
