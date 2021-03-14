Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B067AC433DB
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Mar 2021 16:02:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E52264EB2
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Mar 2021 16:02:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234277AbhCNQBo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 14 Mar 2021 12:01:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:48078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234519AbhCNQB1 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 14 Mar 2021 12:01:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0C4264EB3;
        Sun, 14 Mar 2021 16:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615737687;
        bh=+kh3fb1ANVI+FCnv50sRJTlbkHOhA4nUAh4oOjOsrj8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nU6f/VcUjMXaQEmANcPDsUAYfd730u9tINQYuKzJpkWr0fWVu9eE1E5UE45pyK9NY
         p/q0imqcz9F9Y8WWH1lvbl0fB7hQGwJl95s+Jnk5OV18H9f9pE49stFOQ7PZspTxgH
         cB676GsGfUGw4T5M5sYRUNu1kCMTqxSTaT3Vaap0=
Date:   Sun, 14 Mar 2021 17:01:24 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next 1/3] staging: vt6655: remove unused variable
Message-ID: <YE4zVDlsYzB/CqkW@kroah.com>
References: <20210314145943.1933245-1-eantoranz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210314145943.1933245-1-eantoranz@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Mar 14, 2021 at 08:59:41AM -0600, Edmundo Carmona Antoranz wrote:
> Since its introduction in 5449c685a4b3 (Staging: Add pristine
> upstream vt6655 driver sources, 2009-04-25), the values
> stored in variable byData have never been read in the macro
> PCAvDelayByIO. By removing it, we are getting rid of a warning:
> 
> drivers/staging/vt6655/upc.h:45:16: warning: variable ‘byData’ set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
> ---
>  drivers/staging/vt6655/upc.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/upc.h b/drivers/staging/vt6655/upc.h
> index e086ec6e77f7..f00d0fd90003 100644
> --- a/drivers/staging/vt6655/upc.h
> +++ b/drivers/staging/vt6655/upc.h
> @@ -42,14 +42,13 @@
>  
>  #define PCAvDelayByIO(uDelayUnit)				\
>  do {								\
> -	unsigned char byData;					\
>  	unsigned long ii;					\
>  								\
>  	if (uDelayUnit <= 50) {					\
>  		udelay(uDelayUnit);				\
>  	} else {						\
>  		for (ii = 0; ii < (uDelayUnit); ii++)		\
> -			byData = inb(0x61);			\
> +			inb(0x61);				\

Are you sure that the compiler does not make the inb() now go away?

This is being done like this for a very specific reason, the value read
does not matter, but you have to read something.

thanks,

greg k-h
