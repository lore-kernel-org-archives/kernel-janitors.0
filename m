Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFE2C43460
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Apr 2021 14:34:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 689016100A
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Apr 2021 14:34:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232766AbhDTOen (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 20 Apr 2021 10:34:43 -0400
Received: from netrider.rowland.org ([192.131.102.5]:48471 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232664AbhDTOem (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Apr 2021 10:34:42 -0400
Received: (qmail 172296 invoked by uid 1000); 20 Apr 2021 10:34:06 -0400
Date:   Tue, 20 Apr 2021 10:34:06 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Colin King <colin.king@canonical.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: datafab: remove redundant assignment of
 variable result
Message-ID: <20210420143406.GA170810@rowland.harvard.edu>
References: <20210420113818.378478-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420113818.378478-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Apr 20, 2021 at 12:38:18PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable result is being assigned with a value that is
> never read, the assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/storage/datafab.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/storage/datafab.c b/drivers/usb/storage/datafab.c
> index 588818483f4b..bcc4a2fad863 100644
> --- a/drivers/usb/storage/datafab.c
> +++ b/drivers/usb/storage/datafab.c
> @@ -294,7 +294,6 @@ static int datafab_write_data(struct us_data *us,
>  		if (reply[0] != 0x50 && reply[1] != 0) {
>  			usb_stor_dbg(us, "Gah! write return code: %02x %02x\n",
>  				     reply[0], reply[1]);
> -			result = USB_STOR_TRANSPORT_ERROR;
>  			goto leave;
>  		}
>  
> -- 
> 2.30.2
> 
