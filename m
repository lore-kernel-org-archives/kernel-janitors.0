Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204A5C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Nov 2022 16:27:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234154AbiKVQ1a (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Nov 2022 11:27:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233207AbiKVQ1Z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Nov 2022 11:27:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3891456577;
        Tue, 22 Nov 2022 08:27:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C9F9E6179A;
        Tue, 22 Nov 2022 16:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E698C433C1;
        Tue, 22 Nov 2022 16:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1669134431;
        bh=zXyzyWOZJN5DBM4Mj3eUsRU/gc9UChE0JDpEx0fy4OI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pb7xWTpMqAYfmpMD0gWqT5Enyp2habDuSTTARl7YeI0d2KpcwTEAQKH9di9Qi8UuP
         t9i6lxgy0JZLmMWAq7wawA3V17ZrmWhFkTYvjJGTFfCHE96glmeVpCDXrJ1PaDmk1x
         qU0/Pb1E0eTh4M553jI2xZZ+5MPOdmiJ20QRHgn0=
Date:   Tue, 22 Nov 2022 17:26:46 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: fotg210-udc: Remove a useless assignment
Message-ID: <Y3z4RrPaNENoujtJ@kroah.com>
References: <deab9696fc4000499470e7ccbca7c36fca17bd4e.1668458274.git.christophe.jaillet@wanadoo.fr>
 <CACRpkdY4+FtRc63GY_A2Gwr-cstMfsMvojHmQ_o2UQP0ymasig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdY4+FtRc63GY_A2Gwr-cstMfsMvojHmQ_o2UQP0ymasig@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Nov 15, 2022 at 10:42:02PM +0100, Linus Walleij wrote:
> On Mon, Nov 14, 2022 at 9:38 PM Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
> 
> > There is no need to use an intermediate array for these memory allocations,
> > so, axe it.
> >
> > While at it, turn a '== NULL' into a shorter '!' when testing memory
> > allocation failure.
> >
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Fair enough!
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I have sent some other cleanups to this code only
> yesterday, so they might collide and they you might have
> to rebase.

I fixed it up, no need to resend.

thanks,

greg k-h
