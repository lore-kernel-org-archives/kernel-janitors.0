Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E51C7EE2F
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jun 2023 09:42:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236597AbjFFJme (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jun 2023 05:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236657AbjFFJmQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 05:42:16 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FBE410D7
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 02:41:54 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f736e0c9a8so21261595e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 02:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686044513; x=1688636513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mw1OtvOTs4pqnPQwqkGs6h9kUAoFI81KHh1ZGaOg3OM=;
        b=xM8SOEUNXYgI2yKBIXfmL1zvOScv2PHece9Ks5ICvbTDZy8mXmukMW7svRDcCOZV8F
         EdaG+eQILS3cJZmaLrKpvHCJTbFd4KHRnOThflr9zMXG7dgBoWiaK0bjaP03FkEpEEG7
         U4CMpVSVhHILfdMiJDx3Kne0HR+SsBF6ClugcJrL8l8nwuxVoDA2aadZm6QZAFD7OnnB
         UHQJJBmLoRFohJLSPKfWCGlobj6N3XshBfbF0yiKRKgHJjB/BpXjyXyLEe+dyGMuJlBi
         nSdB/OgiaC3WkxGXtK3WkCIBKpYQ+LaBNyAhgLZoOadCOOiw1SQZC9991M7Xuri4SXTQ
         4Egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686044513; x=1688636513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mw1OtvOTs4pqnPQwqkGs6h9kUAoFI81KHh1ZGaOg3OM=;
        b=HBtBq2C86XryDzQSHd2j60FDE+IoppFK4oD4fOr9F9i7UaxmOac0DfxDCGRbCILbZ2
         Oz148Q9fdlbyRhmHk84VFYy63Jk67ZWtbprFuOxxkdnjbMuNoUNgiyy6ksqbdnu/g36z
         iTSYy19a0yvkTWAxZDzJetW1lzwJk2i/wx2WrVCDmVGpXV6tirn11nVWtNgOpMsGKgaQ
         t8l9IgC3drDGpbtJ1C8o4v/JZdbbDlH/qCWp7s9qWmOmop6l6MhRhP6fLPZv49qwSbf8
         eyfoidmcrR1SA4ONuIgQh4yWybZ32iBu/GYaoZW4HhUQCeXFlQ1njcrNJurJU8UvOZYm
         eiaA==
X-Gm-Message-State: AC+VfDyqp17Q+jWBFxe4nbChWLZTM3eoX5iP4XGMAU5Xi4lBnGZTiqf4
        rvIym81vrABRS8NnQrCath9bSA==
X-Google-Smtp-Source: ACHHUZ79oYF1EX46QtpLLI7AAjVK4DSEivHLKCQuiAKUhGKLWhpCNXspc4d8JmOr1K4nKnwXlfi4eg==
X-Received: by 2002:a7b:c30c:0:b0:3f7:310a:3ffc with SMTP id k12-20020a7bc30c000000b003f7310a3ffcmr1628911wmj.5.1686044513160;
        Tue, 06 Jun 2023 02:41:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g11-20020a7bc4cb000000b003f735ba7736sm8748460wmk.46.2023.06.06.02.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 02:41:51 -0700 (PDT)
Date:   Tue, 6 Jun 2023 12:41:49 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Raviteja Garimella <raviteja.garimella@broadcom.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: gadget/snps_udc_plat: Fix a signedness bug in probe
Message-ID: <2b40b7b9-af84-4165-9115-c006c707bd79@kadam.mountain>
References: <ZH7sIkbSZg1rAJpJ@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH7sIkbSZg1rAJpJ@moroto>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 06, 2023 at 11:19:46AM +0300, Dan Carpenter wrote:
> The irq_of_parse_and_map() function returns negative error codes
> but "udc->irq" is an unsigned int so the error handling doesn't work.
> 
> Fixes: 1b9f35adb0ff ("usb: gadget: udc: Add Synopsys UDC Platform driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/usb/gadget/udc/snps_udc_plat.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/snps_udc_plat.c b/drivers/usb/gadget/udc/snps_udc_plat.c
> index 0ed685db149d..37edd6c35077 100644
> --- a/drivers/usb/gadget/udc/snps_udc_plat.c
> +++ b/drivers/usb/gadget/udc/snps_udc_plat.c
> @@ -103,7 +103,7 @@ static int udc_plat_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct resource *res;
>  	struct udc *udc;
> -	int ret;
> +	int irq, ret;
>  
>  	udc = devm_kzalloc(dev, sizeof(*udc), GFP_KERNEL);
>  	if (!udc)
> @@ -132,11 +132,12 @@ static int udc_plat_probe(struct platform_device *pdev)
>  
>  	udc->phys_addr = (unsigned long)res->start;
>  
> -	udc->irq = irq_of_parse_and_map(dev->of_node, 0);
> -	if (udc->irq <= 0) {
> +	irq = irq_of_parse_and_map(dev->of_node, 0);
> +	if (irq <= 0) {

Oops.  It turns out that irq_of_parse_and_map() returns zero on error,
not negatives so this patch isn't needed and probably the correct thing
is to change the error check to if (!irq) { instead.

regards,
dan carpenter

