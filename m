Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41986C433ED
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 12:04:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0D2761182
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 12:04:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233362AbhDIMEl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 9 Apr 2021 08:04:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:52422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231370AbhDIMEl (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Apr 2021 08:04:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C35B7610A4;
        Fri,  9 Apr 2021 12:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617969868;
        bh=z2Di87V6PHfFJcyBdNJcC3hjVhWKGllPObQkeoiQ25A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mc7hqcyfEjeHNT7mewY1g7SQItbES3IKuwMaNiZw8IQAftZMelvDuqAZ1B6OHKlZC
         7fh2HiGNNIzkUF5Sia05+xiSV3UZKPz0pqCnpyKKeQUChemFYkiW0Li0nd29YfkcPt
         BxxsvgvFcsfS5899Q1adz7d2eg8W+jcJmIWjTzk4=
Date:   Fri, 9 Apr 2021 14:03:01 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sergei Krainov <sergei.krainov.lkd@gmail.com>
Cc:     Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: fix wrong function output
Message-ID: <YHBCdbmPczyK3/0R@kroah.com>
References: <20210408234527.GA6893@test-VirtualBox>
 <YG/1MyfOrHgCi5sr@kroah.com>
 <20210409114159.GA3122@test-VirtualBox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409114159.GA3122@test-VirtualBox>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Apr 09, 2021 at 01:41:59PM +0200, Sergei Krainov wrote:
> On Fri, Apr 09, 2021 at 08:33:23AM +0200, Greg KH wrote:
> > On Fri, Apr 09, 2021 at 01:45:27AM +0200, Sergei Krainov wrote:
> > > Function r8712_find_network() were returning wlan_network even if it
> > > didn't match required address. This happened due to not checking if
> > > list end was reached and returning last processed wlan_network.
> > > 
> > > Signed-off-by: Sergei Krainov <sergei.krainov.lkd@gmail.com>
> > > ---
> > >  drivers/staging/rtl8712/rtl871x_mlme.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > 
> > What commit does this "fix"?  Or has this bug been there always?
> > 
> > thanks,
> > 
> > greg k-h
> 
> This commit fixes the bug mentioned. 

What bug mentioned?

> And this commit is based on staging-next and has nothing to do
> with my previous patches, for which I'm sorry, I was wrong.

I do not understand at all, sorry.

Please resend with a "Fixes:" tag that shows the commit that this fixes.

thanks,

greg k-h
