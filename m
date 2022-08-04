Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A31CC19F21
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Aug 2022 19:05:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236637AbiHDTFr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 4 Aug 2022 15:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235155AbiHDTFm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 Aug 2022 15:05:42 -0400
X-Greylist: delayed 2772 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 04 Aug 2022 12:05:40 PDT
Received: from fuzix.org (www.llwyncelyn.cymru [82.70.14.225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B044513F06;
        Thu,  4 Aug 2022 12:05:39 -0700 (PDT)
Received: from fedora (82-70-14-226.dsl.in-addr.zen.co.uk [82.70.14.226])
        by fuzix.org (8.17.1/8.15.2) with ESMTP id 274IJDDB692633;
        Thu, 4 Aug 2022 19:19:13 +0100
Date:   Thu, 4 Aug 2022 19:19:13 +0100
From:   Alan <alan@lxorguk.ukuu.org.uk>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alan Cox <alan@lxorguk.ukuu.org.uk>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] char: mwave: fix return type in ioctl
Message-ID: <20220804191913.6f52bb6f@fedora>
In-Reply-To: <Yutv/mvLNJRgDtOu@kili>
References: <Yutv/mvLNJRgDtOu@kili>
Organization: is over-rated
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 4 Aug 2022 10:06:38 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This function is supposed to return zero for success or negative error
> code on failure.  Unfortunately the "retval" is declared as unsigned int
> and the function returns type long.  That means that on 64 bit systems
> it will return positive values on error.

Not sure what tool folks are using these days to figure out who to mail
about Linux bits, but could whoever maintains it stick
alan@lxorguk.ukuu.org.uk on the ignore list for it.

Thanks

Alan
