Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28DC4C4338F
	for <kernel-janitors@archiver.kernel.org>; Sat, 14 Aug 2021 16:45:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 018CE60F92
	for <kernel-janitors@archiver.kernel.org>; Sat, 14 Aug 2021 16:45:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235478AbhHNQqA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 14 Aug 2021 12:46:00 -0400
Received: from zeniv-ca.linux.org.uk ([142.44.231.140]:38440 "EHLO
        zeniv-ca.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233116AbhHNQqA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 14 Aug 2021 12:46:00 -0400
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mEwmg-00Bk4d-4g; Sat, 14 Aug 2021 16:45:22 +0000
Date:   Sat, 14 Aug 2021 16:45:22 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Leon Romanovsky <leon@kernel.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Andy Whitcroft <apw@canonical.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] checkpatch: prefer = {} initializations to = {0}
Message-ID: <YRfzIuSjvt8Dc/YL@zeniv-ca.linux.org.uk>
References: <20210805104353.GD26417@kili>
 <1b94e688-a070-998a-3014-96bcbaed4cae@wanadoo.fr>
 <YRfVYxQ126AOuexl@unreal>
 <YRfZwrJUutB4IO+G@zeniv-ca.linux.org.uk>
 <YRfm2RRYla7Nemsj@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRfm2RRYla7Nemsj@unreal>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Aug 14, 2021 at 06:52:57PM +0300, Leon Romanovsky wrote:

> I reread gcc/c/c-typeck.c and at lest for GCC 10, I'm wrong about padding.
> Sorry about that.
> 
>    8630 struct c_expr
>    8631 pop_init_level (location_t loc, int implicit,
>    8632                 struct obstack *braced_init_obstack,
>    8633                 location_t insert_before)
> ....
>    8692   switch (vec_safe_length (constructor_elements))
>    8693     {
>    8694     case 0:
>    8695       /* Initialization with { } counts as zeroinit.  */
>    8696       constructor_zeroinit = 1;
>    8697       break;
>    8698     case 1:
>    8699       /* This might be zeroinit as well.  */
>    8700       if (integer_zerop ((*constructor_elements)[0].value))
>    8701         constructor_zeroinit = 1;
>    8702       break;
>    8703     default:
>    8704       /* If the constructor has more than one element, it can't be { 0 }.  */
>    8705       constructor_zeroinit = 0;
>    8706       break;
>    8707     }

FWIW, that reads more like "in those cases we might quietly turn the whole
thing into memset()" optimization, with no promise that it will be done
that way in future versions.

And considering the fun effects (infoleaks from stack or heap), it's not
something I'd rely upon - not without a much more explicit promise...
