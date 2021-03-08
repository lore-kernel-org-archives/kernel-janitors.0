Return-Path: <SRS0=t3v2=IG=vger.kernel.org=kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982F5C433DB
	for <kernel-janitors@archiver.kernel.org>; Mon,  8 Mar 2021 05:40:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71829651D1
	for <kernel-janitors@archiver.kernel.org>; Mon,  8 Mar 2021 05:40:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234577AbhCHFjY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 8 Mar 2021 00:39:24 -0500
Received: from smtprelay0251.hostedemail.com ([216.40.44.251]:35518 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234459AbhCHFi5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 8 Mar 2021 00:38:57 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 3521118027FAC;
        Mon,  8 Mar 2021 05:38:52 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: snake11_360cef1276ee
X-Filterd-Recvd-Size: 3958
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf07.hostedemail.com (Postfix) with ESMTPA;
        Mon,  8 Mar 2021 05:38:50 +0000 (UTC)
Message-ID: <dd39a6974e6cef241ecfd1014d683a42cc722366.camel@perches.com>
Subject: Re: linux-kernel janitorial RFP: Mark static arrays as const
From:   Joe Perches <joe@perches.com>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        cocci <cocci@systeme.lip6.fr>,
        LKML <linux-kernel@vger.kernel.org>
Date:   Sun, 07 Mar 2021 21:38:49 -0800
In-Reply-To: <alpine.DEB.2.22.394.2103072011480.2930@hadrien>
References: <053b06c47f08631675c295b5c893b90be4248347.camel@perches.com>
         <a15e5c4d-a60f-14b9-90e5-4e600771aa9d@prevas.dk>
         <a186c9d063663ac6de66db944d1925146393bec5.camel@perches.com>
         <alpine.DEB.2.22.394.2103072011480.2930@hadrien>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 2021-03-07 at 20:14 +0100, Julia Lawall wrote:
> 
> On Wed, 3 Mar 2021, Joe Perches wrote:
> 
> > On Wed, 2021-03-03 at 10:41 +0100, Rasmus Villemoes wrote:
> > > On 02/03/2021 18.42, Joe Perches wrote:
> > > > Here is a possible opportunity to reduce data usage in the kernel.
> > > > 
> > > > $ git grep -P -n '^static\s+(?!const|struct)(?:\w+\s+){1,3}\w+\s*\[\s*\]' drivers/ | \
> > > >   grep -v __initdata | \
> > > >   wc -l
> > > > 3250
> > > > 
> > > > Meaning there are ~3000 declarations of arrays with what appears to be
> > > > file static const content that are not marked const.
> > > > 
> > > > So there are many static arrays that could be marked const to move the
> > > > compiled object code from data to text minimizing the total amount of
> > > > exposed r/w data.
> > > 
> > > You can add const if you like, but it will rarely change the generated
> > > code. gcc is already smart enough to take a static array whose contents
> > > are provably never modified within the TU and put it in .rodata:
> > 
> > At least some or perhaps even most of the time, true, but the gcc compiler
> > from v5 through at least v10 seems inconsistent about when it does the
> > appropriate conversion.
> > 
> > See the example I posted:
> > https://lore.kernel.org/lkml/6b8b250a06a98ce42120a14824531a8641f5e8aa.camel@perches.com/
> > 
> > It was a randomly chosen source file conversion btw, I had no prior
> > knowledge of whether the text/data use would change.
> > 
> > I'm unsure about clang consistently moving static but provably const arrays
> > from data to text.  I rarely use clang.  At least for v11 it seems to be
> > better though.  I didn't try 10.1.
> 
> I tried the relevnt drivers in drivers/input/joystick.  I got only one
> driver that changed with gcc 9.3, which was
> drivers/input/joystick/analog.c.  It actually got larger:
> 
> original:
> 
>    text    data     bss     dec     hex filename
>   22607   10560     320   33487    82cf drivers/input/joystick/analog.o
> 
> after adding const:
> 
>    text    data     bss     dec     hex filename
>   22728   10816     320   33864    8448 drivers/input/joystick/analog.o
> 
> This was the only case where bss was not 0, but I don't know if there is a
> connection.

You really need consider using defconfig so whatever object code
does not have tracing/debugging support.

For instance, this code with defconfig and analog joystick:

Original:

$ size drivers/input/joystick/analog.o
   text	   data	    bss	    dec	    hex	filename
   8115	    261	    224	   8600	   2198	drivers/input/joystick/analog.o

with const:

$ size drivers/input/joystick/analog.o
   text	   data	    bss	    dec	    hex	filename
   8179	    201	    224	   8604	   219c	drivers/input/joystick/analog.o


