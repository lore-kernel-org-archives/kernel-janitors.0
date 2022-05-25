Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D3FC433F5
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 May 2022 15:13:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234043AbiEYPNB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 May 2022 11:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245069AbiEYPMx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 May 2022 11:12:53 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE88B041F
        for <kernel-janitors@vger.kernel.org>; Wed, 25 May 2022 08:12:51 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id n145so12097008iod.3
        for <kernel-janitors@vger.kernel.org>; Wed, 25 May 2022 08:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0bQnxjKs1pIJTlibykKQy+NCTN/zN06hUmrppkpIOS4=;
        b=AccCEGTCaYA5vbnwf8qeKJXaaVYCTcXqtW09HSCF7NRrSJMEqNwbUzPBeW8Ei9plUD
         Mb+azUUjPI4Hu+fjoZZr5khoKMQqr8d9KDsyFk4dKfOoFSd36O0IfiSijchtD2CNbqWl
         aExNpRtbCT0PzvO1Y/sQnsLMTjyGCUSkkmkvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0bQnxjKs1pIJTlibykKQy+NCTN/zN06hUmrppkpIOS4=;
        b=l3bsppNQU66aPe0V7lAZvuOiYN7TTNlsgTD7Iy/58boNxUMfJpGvFX+HqOJLzzyWk8
         YmQBmF/Hr9BTdKYZFZX+EnV3UVrSX7V66wwoTrjhdg5GkC358L2qUKx13VZ2k8mzNQT6
         XPdpHgqfclkZIzLu1k35I5ox7pdafwolMkfmY5J8bJgBnm90T4UR21z2BXbLGq2WvBFZ
         suVn79KPfOOLLMcZsooH9KdMpd0cJ4UDFWmoXt+rjTxPVKjlsiBIobt/+KJ0QldNg0j9
         eD3yJJJGDgEtsUwC/eZZv+3BkTyP2tEHg/QcWmI9Gb75x7Hy+j6KkjKpjpGxNplloqA9
         ECwQ==
X-Gm-Message-State: AOAM533i2Z4dM/QkNdGy01co38GXHZmGjsTZ3Ci6hWhM4yrdAhpsL2Nh
        nbvuPqFUNFpkpQuvsB2gIyGs33wqzsnWkQ==
X-Google-Smtp-Source: ABdhPJzy5M5hjOTuZdP/RuCmpjy8lT7iHrjZQ7qALqzx6xhWxBPw2nnkRYaRXbCOETkjLNqsjTZAfg==
X-Received: by 2002:a05:6638:2042:b0:32b:c513:21b2 with SMTP id t2-20020a056638204200b0032bc51321b2mr16864739jaj.90.1653491571341;
        Wed, 25 May 2022 08:12:51 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id a9-20020a921a09000000b002d1d8de99e7sm745107ila.40.2022.05.25.08.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 08:12:50 -0700 (PDT)
Subject: Re: [PATCH] USB: usbip: clean up mixed use of _irq() and _irqsave()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <Yo4gqLPtHO6XKMLn@kili>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <5a66600c-f8b6-de5d-44ad-4f6f0eb3934d@linuxfoundation.org>
Date:   Wed, 25 May 2022 09:12:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <Yo4gqLPtHO6XKMLn@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 5/25/22 6:27 AM, Dan Carpenter wrote:
> It generally doesn't make sense to use _irq() and _irqsave() in the same
> function because either some of the callers have disabled IRQs or they
> haven't.  In this case, the v_recv_cmd_submit() appears to always be
> called with IRQs enabled so the code works fine.  That means I could
> convert it to either _irq() or _irqsave() but I chose to use _irqsave()
> because it's more conservative and easier to review.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/usb/usbip/vudc_rx.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vudc_rx.c b/drivers/usb/usbip/vudc_rx.c
> index 1e8a23d92cb4..d4a2f30a7580 100644
> --- a/drivers/usb/usbip/vudc_rx.c
> +++ b/drivers/usb/usbip/vudc_rx.c
> @@ -104,18 +104,18 @@ static int v_recv_cmd_submit(struct vudc *udc,
>   	if (pdu->base.direction == USBIP_DIR_IN)
>   		address |= USB_DIR_IN;
>   
> -	spin_lock_irq(&udc->lock);
> +	spin_lock_irqsave(&udc->lock, flags);
>   	urb_p->ep = vudc_find_endpoint(udc, address);
>   	if (!urb_p->ep) {
>   		/* we don't know the type, there may be isoc data! */
>   		dev_err(&udc->pdev->dev, "request to nonexistent endpoint");
> -		spin_unlock_irq(&udc->lock);
> +		spin_unlock_irqrestore(&udc->lock, flags);
>   		usbip_event_add(&udc->ud, VUDC_EVENT_ERROR_TCP);
>   		ret = -EPIPE;
>   		goto free_urbp;
>   	}
>   	urb_p->type = urb_p->ep->type;
> -	spin_unlock_irq(&udc->lock);
> +	spin_unlock_irqrestore(&udc->lock, flags);
>   
>   	urb_p->new = 1;
>   	urb_p->seqnum = pdu->base.seqnum;
> 

Thank you for the patch.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, please pick this up.

thanks,
-- Shuah
