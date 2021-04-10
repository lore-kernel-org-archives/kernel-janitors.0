Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A46FC433ED
	for <kernel-janitors@archiver.kernel.org>; Sat, 10 Apr 2021 08:58:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6558610A3
	for <kernel-janitors@archiver.kernel.org>; Sat, 10 Apr 2021 08:58:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231279AbhDJI60 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 10 Apr 2021 04:58:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:32940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229591AbhDJI6Z (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 10 Apr 2021 04:58:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3442B610CD;
        Sat, 10 Apr 2021 08:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618045091;
        bh=MDEEwk4xA/g1bJh/pmzvQ0+agfOwNiIO6s3rDzG0Qto=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bPIa4aGlWfNtEkXQxsAdoz/WId69zqC0oZitbP9+tg0T//tW4WtZ44t8D1nC8zgAu
         vB6WBG3pe0ic4WWXy+PrY7jjEYABBQkxsq/prU8n6YCaPvDmwZGOg3FYu8+0TODNX4
         rMG8JYTVG18bq2RdgKN4s7f72Zma97HSygSgXxec=
Date:   Sat, 10 Apr 2021 10:58:09 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ye Bin <yebin10@huawei.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] char: xilinx_hwicap: use DEFINE_MUTEX() for mutex
 lock
Message-ID: <YHFooZWlC+PV1kV0@kroah.com>
References: <20210409095136.2293754-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409095136.2293754-1-yebin10@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Apr 09, 2021 at 05:51:36PM +0800, Ye Bin wrote:
> mutex lock can be initialized automatically with DEFINE_MUTEX()
> rather than explicitly calling mutex_init().
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ye Bin <yebin10@huawei.com>
> ---
>  drivers/char/xilinx_hwicap/xilinx_hwicap.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/char/xilinx_hwicap/xilinx_hwicap.c b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
> index 067396bedf22..4d586233dfa4 100644
> --- a/drivers/char/xilinx_hwicap/xilinx_hwicap.c
> +++ b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
> @@ -111,7 +111,7 @@
>  /* An array, which is set to true when the device is registered. */
>  static DEFINE_MUTEX(hwicap_mutex);
>  static bool probed_devices[HWICAP_DEVICES];
> -static struct mutex icap_sem;
> +static DEFINE_MUTEX(icap_sem);
>  
>  static struct class *icap_class;
>  
> @@ -857,7 +857,6 @@ static int __init hwicap_module_init(void)
>  	int retval;
>  
>  	icap_class = class_create(THIS_MODULE, "xilinx_config");
> -	mutex_init(&icap_sem);
>  
>  	devt = MKDEV(XHWICAP_MAJOR, XHWICAP_MINOR);
>  	retval = register_chrdev_region(devt,
> 

What actually does this help out with?  Why is it wrong to explicitly
call mutex_init() instead of a magic macro?

What good are these changes causing?

thanks,

greg k-h
