Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03F3C46467
	for <kernel-janitors@archiver.kernel.org>; Mon, 16 Jan 2023 18:44:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234998AbjAPSot (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 16 Jan 2023 13:44:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235040AbjAPSo1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Jan 2023 13:44:27 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 452F376A3;
        Mon, 16 Jan 2023 10:40:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D4F3C610A2;
        Mon, 16 Jan 2023 18:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437E8C433EF;
        Mon, 16 Jan 2023 18:40:51 +0000 (UTC)
Date:   Mon, 16 Jan 2023 18:40:48 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 24/30] arm64: cpufeature: Use kstrtobool() instead of
 strtobool()
Message-ID: <Y8WaMDK6lw7cfaZx@arm.com>
References: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
 <5a1b329cda34aec67615c0d2fd326eb0d6634bf7.1667336095.git.christophe.jaillet@wanadoo.fr>
 <Y2J0xJ61iclx6WZG@arm.com>
 <c039de1b-0412-320c-8e91-d74ab1ffbc02@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c039de1b-0412-320c-8e91-d74ab1ffbc02@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Jan 14, 2023 at 02:29:46PM +0100, Christophe JAILLET wrote:
> Le 02/11/2022 à 14:46, Catalin Marinas a écrit :
> > On Tue, Nov 01, 2022 at 10:14:12PM +0100, Christophe JAILLET wrote:
> > > strtobool() is the same as kstrtobool().
> > > However, the latter is more used within the kernel.
> > > 
> > > In order to remove strtobool() and slightly simplify kstrtox.h, switch to
> > > the other function name.
> > > 
> > > While at it, include the corresponding header file (<linux/kstrtox.h>)
> > > 
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > 
> > Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> This has been A-b 2 months ago, and I've just resent patches in this serie
> that have neither been merged in -next, nor A-b or R-b.
> 
> So for this one, it is just a polite reminder. :)
> 
> Do you have visibility on when it should be merged?

When large tree-wide series turn up on the list, there's always a
confusion on how they'd get merged. I guess you are expecting such
patches to go in via individual maintainer trees. It wasn't obvious from
to me (I can now see there was some text in the patch description).

I'll add it to my list for 6.3.

-- 
Catalin
