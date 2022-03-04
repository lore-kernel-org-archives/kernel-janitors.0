Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F126C433F5
	for <kernel-janitors@archiver.kernel.org>; Fri,  4 Mar 2022 14:24:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237986AbiCDOZk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 4 Mar 2022 09:25:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbiCDOZj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 4 Mar 2022 09:25:39 -0500
X-Greylist: delayed 400 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 04 Mar 2022 06:24:51 PST
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id AE8141BAF19
        for <kernel-janitors@vger.kernel.org>; Fri,  4 Mar 2022 06:24:51 -0800 (PST)
Received: (qmail 1315410 invoked by uid 1000); 4 Mar 2022 09:18:09 -0500
Date:   Fri, 4 Mar 2022 09:18:09 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Adam Cozzette <acozzette@cs.hmc.edu>,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] USB: storage: ums-realtek: fix error code in
 rts51x_read_mem()
Message-ID: <YiIfoU7vVIf6Bbrz@rowland.harvard.edu>
References: <20220304073504.GA26464@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304073504.GA26464@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 04, 2022 at 10:35:04AM +0300, Dan Carpenter wrote:
> The rts51x_read_mem() function should return negative error codes.
> Currently if the kmalloc() fails it returns USB_STOR_TRANSPORT_ERROR (3)
> which is treated as success by the callers.
> 
> Fixes: 065e60964e29 ("ums_realtek: do not use stack memory for DMA")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/storage/realtek_cr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
> index 3789698d9d3c..0c423916d7bf 100644
> --- a/drivers/usb/storage/realtek_cr.c
> +++ b/drivers/usb/storage/realtek_cr.c
> @@ -365,7 +365,7 @@ static int rts51x_read_mem(struct us_data *us, u16 addr, u8 *data, u16 len)
>  
>  	buf = kmalloc(len, GFP_NOIO);
>  	if (buf == NULL)
> -		return USB_STOR_TRANSPORT_ERROR;
> +		return -ENOMEM;
>  
>  	usb_stor_dbg(us, "addr = 0x%x, len = %d\n", addr, len);
>  
> -- 
> 2.20.1
> 
