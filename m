Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBF6C433E9
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 881E964DDA
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355243AbhCDAVo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:21:44 -0500
Received: from smtprelay0097.hostedemail.com ([216.40.44.97]:41356 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234736AbhCCOxA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Mar 2021 09:53:00 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 486F81800CDE0;
        Wed,  3 Mar 2021 14:51:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: crib64_1f0b27a276c6
X-Filterd-Recvd-Size: 2443
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf03.hostedemail.com (Postfix) with ESMTPA;
        Wed,  3 Mar 2021 14:51:04 +0000 (UTC)
Message-ID: <a186c9d063663ac6de66db944d1925146393bec5.camel@perches.com>
Subject: Re: linux-kernel janitorial RFP: Mark static arrays as const
From:   Joe Perches <joe@perches.com>
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        cocci <cocci@systeme.lip6.fr>
Cc:     LKML <linux-kernel@vger.kernel.org>
Date:   Wed, 03 Mar 2021 06:51:02 -0800
In-Reply-To: <a15e5c4d-a60f-14b9-90e5-4e600771aa9d@prevas.dk>
References: <053b06c47f08631675c295b5c893b90be4248347.camel@perches.com>
         <a15e5c4d-a60f-14b9-90e5-4e600771aa9d@prevas.dk>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 2021-03-03 at 10:41 +0100, Rasmus Villemoes wrote:
> On 02/03/2021 18.42, Joe Perches wrote:
> > Here is a possible opportunity to reduce data usage in the kernel.
> > 
> > $ git grep -P -n '^static\s+(?!const|struct)(?:\w+\s+){1,3}\w+\s*\[\s*\]' drivers/ | \
> >   grep -v __initdata | \
> >   wc -l
> > 3250
> > 
> > Meaning there are ~3000 declarations of arrays with what appears to be
> > file static const content that are not marked const.
> > 
> > So there are many static arrays that could be marked const to move the
> > compiled object code from data to text minimizing the total amount of
> > exposed r/w data.
> 
> You can add const if you like, but it will rarely change the generated
> code. gcc is already smart enough to take a static array whose contents
> are provably never modified within the TU and put it in .rodata:

At least some or perhaps even most of the time, true, but the gcc compiler
from v5 through at least v10 seems inconsistent about when it does the
appropriate conversion.

See the example I posted:
https://lore.kernel.org/lkml/6b8b250a06a98ce42120a14824531a8641f5e8aa.camel@perches.com/

It was a randomly chosen source file conversion btw, I had no prior
knowledge of whether the text/data use would change.

I'm unsure about clang consistently moving static but provably const arrays
from data to text.  I rarely use clang.  At least for v11 it seems to be
better though.  I didn't try 10.1.


