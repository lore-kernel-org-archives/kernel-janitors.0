Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C969FC433E9
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Mar 2021 13:27:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 835146521A
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Mar 2021 13:27:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbhCIN1T (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 9 Mar 2021 08:27:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:48942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231127AbhCIN06 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 9 Mar 2021 08:26:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 310F764EBB;
        Tue,  9 Mar 2021 13:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615296417;
        bh=K27e2MuTBLShtG4BbakNEwRL0Q+kaRxqlgtHK8Aq1kM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1E6W7dqhM1v4Jip9EqQPHqw3PGLUEmpEZcOujfJewcB6I0LLI4g2JH1NURvz8G6U9
         uebFRA3OGMWrKsacPjhejHI99M6ErhJKWbYdLCJ8OcQr+iH8aP/3kGvIM4poaKWGFt
         Act9etKvQXInhpF2z+/H7tJfdQtxjWZbs4cvfheg=
Date:   Tue, 9 Mar 2021 14:26:55 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Rob Springer <rspringer@google.com>, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org, John Joseph <jnjoseph@google.com>,
        Simon Que <sque@chromium.org>, Richard Yeh <rcy@google.com>,
        Todd Poynor <toddpoynor@google.com>
Subject: Re: [PATCH] staging: gasket: Fix sizeof() in gasket_handle_ioctl()
Message-ID: <YEd3n/vbIzRr5vnA@kroah.com>
References: <YAroue0qiuf35rkS@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YAroue0qiuf35rkS@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jan 22, 2021 at 06:01:13PM +0300, Dan Carpenter wrote:
> The "gasket_dev->num_page_tables" variable is an int but this is copying
> sizeof(u64).  On 32 bit systems this would end up disclosing a kernel
> pointer to user space, but on 64 bit it copies zeroes from a struct
> hole.
> 
> Fixes: 9a69f5087ccc ("drivers/staging: Gasket driver framework + Apex driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is an API change.  Please review this carefully!  Another potential
> fix would be to make ->num_page_tables a long instead of an int.
> 
>  drivers/staging/gasket/gasket_ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks like this driver is dead, with no response from anyone from
Google.

Should I just delete it?  The goal of using normal apis and getting this
out of staging seems to have totally died, so it shouldn't even still be
living in the kernel tree.  Even if having it here actually finds
security issues that the authors missed like this :(

So, any objection to me deleting it?

thanks,

greg k-h
