Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAA3E7C4CA
	for <kernel-janitors@archiver.kernel.org>; Wed,  4 Oct 2023 15:02:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243073AbjJDPCJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 4 Oct 2023 11:02:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243080AbjJDPCI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Oct 2023 11:02:08 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EBEEFAB
        for <kernel-janitors@vger.kernel.org>; Wed,  4 Oct 2023 08:02:05 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 364FF92009C; Wed,  4 Oct 2023 17:02:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 336BA92009B;
        Wed,  4 Oct 2023 16:02:01 +0100 (BST)
Date:   Wed, 4 Oct 2023 16:02:01 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Su Hui <suhui@nfschina.com>
cc:     Dan Carpenter <dan.carpenter@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael@kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] driver base: slience unused warning
In-Reply-To: <45027fa0-cda5-2a80-f1cd-ed805d2717ee@nfschina.com>
Message-ID: <alpine.DEB.2.21.2310041557310.61599@angie.orcam.me.uk>
References: <45027fa0-cda5-2a80-f1cd-ed805d2717ee@nfschina.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 8 Sep 2023, Su Hui wrote:

> This variable is been used but never be read, so gcc and W=1 give such
> warning.
> 
> drivers/base/module.c:36:6: error:
> variable ‘no_warn’ set but not used [-Werror=unused-but-set-variable]
> 
> I wanted to use "__maybe_unused" to avoid  this warning.
> 
> However it seems like a wrong using of "__maybe_unused" as Greg KH said:
> 
> "But no_warn is being used in this file, it's being set but not read
> which is ok.  That's a real use, so this change really isn't correct,
> sorry."

 The warning itself is a real issue to be sorted though.  Is this a use 
case for `#pragma GCC diagnostic'?

  Maciej
