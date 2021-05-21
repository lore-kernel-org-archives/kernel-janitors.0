Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D68BC433ED
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 May 2021 12:40:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 527D8613D9
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 May 2021 12:40:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232483AbhEUMmP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 May 2021 08:42:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:58750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231447AbhEUMmN (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 May 2021 08:42:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C71A7613CA;
        Fri, 21 May 2021 12:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621600850;
        bh=Zd2uZ/NzI4g1Qu2S7+9Pwydv4FGMJZRaQ3BjjojC22A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TnzNHnR52qPTlxZGk9GFxvPYwJj7G028iLbIN+VM4lyKuxUbqvUbMkcT77k/4cXsv
         +ZA9s2QYebMeEDDVOOWjpA/Vp2ljLeoGnBSBYoREUWrTCNbELE114C0oJWeXYec5zn
         2G1q4VfyB+8jplIcisu9aCCWyXR1iq+WY4axjopo=
Date:   Fri, 21 May 2021 14:40:48 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ttyprintk: remove redundant initialization of
 variable i
Message-ID: <YKeqUBZ+Zy/mvZNQ@kroah.com>
References: <20210518182126.140978-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518182126.140978-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 18, 2021 at 07:21:26PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable i is being initialized with a value that is never read,
> it is being updated later on.  The assignment is redundant and can be
> removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/char/ttyprintk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ttyprintk.c b/drivers/char/ttyprintk.c
> index 219fa1382396..230b2c9b3e3c 100644
> --- a/drivers/char/ttyprintk.c
> +++ b/drivers/char/ttyprintk.c
> @@ -52,7 +52,7 @@ static void tpk_flush(void)
>  
>  static int tpk_printk(const unsigned char *buf, int count)
>  {
> -	int i = tpk_curr;
> +	int i;
>  
>  	for (i = 0; i < count; i++) {
>  		if (tpk_curr >= TPK_STR_SIZE) {
> -- 
> 2.31.1
> 

This is not ok for what is currently in linux-next :(

greg k-h
