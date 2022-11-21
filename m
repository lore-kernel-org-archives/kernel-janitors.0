Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD35C4332F
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Nov 2022 12:38:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbiKUMiF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 21 Nov 2022 07:38:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231484AbiKUMh7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 21 Nov 2022 07:37:59 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C783F05B;
        Mon, 21 Nov 2022 04:37:57 -0800 (PST)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 256E566029A3;
        Mon, 21 Nov 2022 12:37:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1669034276;
        bh=IMEXC4LxxXoPyMFAGux1KA8bKOkPsV70cV46Fq83/CY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=D7FOxOfderh/eib05480KpfSj18vjMjYugrxek2h0zF+7btHieBEC5crGhNLmeEpz
         0HBPZ4S20Bywu0KpkC1rm4W19GPDmemfiLfMOkCz5v1ONelvRtS5nvaWjKi73gPlKQ
         6P6zEbrA2OEQclgehQnkwWM/nDYTQ3bE3krwVeWH7JGgGdu2iv1l8J/2O1SHufTwjY
         PuOev9ffsq2gFjs7jXqWyASiJjVsVTzdtZIt5q0SxTQkMZq3zX+iurbkr/xkd+Az6h
         b/33U4bbNkHD30ixOhxHbFzY8GKHHgltHLW0k+loBw+AUJmp8qXZRolo07upCoHLc/
         PFqaei4JNyETQ==
Message-ID: <23f52a55-490c-9f43-49c4-f4c4f6b5d88e@collabora.com>
Date:   Mon, 21 Nov 2022 13:37:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] usb: gadget: function: use after free in printer_close()
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Albert Briscoe <albertsbriscoe@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Zqiang <qiang.zhang@windriver.com>, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <Y3dwwNlBoS13VcIR@kili>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <Y3dwwNlBoS13VcIR@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

W dniu 18.11.2022 o 12:47, Dan Carpenter pisze:
> The printer_dev_free() function frees "dev" but then it is dereferenced
> by the debug code on the next line.  The debug printk only prints the
> function name so it's probably okay to just delete it.
> 
> Fixes: e8d5f92b8d30 ("usb: gadget: function: printer: fix use-after-free in __lock_acquire")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/usb/gadget/function/f_printer.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
> index a881c69b1f2b..7354bfe1e682 100644
> --- a/drivers/usb/gadget/function/f_printer.c
> +++ b/drivers/usb/gadget/function/f_printer.c
> @@ -382,7 +382,6 @@ printer_close(struct inode *inode, struct file *fd)
>   	spin_unlock_irqrestore(&dev->lock, flags);
>   
>   	kref_put(&dev->kref, printer_dev_free);
> -	DBG(dev, "printer_close\n");

I think that if you delete the DBG() here, it should also be deleted in
printer_open(). Alternatively this patch should reverse the order of
calls to kref_put() and DBG().

Regards,

Andrzej

>   
>   	return 0;
>   }

