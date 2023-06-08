Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF09C7EE25
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Jun 2023 17:10:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236465AbjFHRK5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Jun 2023 13:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233734AbjFHRKz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Jun 2023 13:10:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C777272E
        for <kernel-janitors@vger.kernel.org>; Thu,  8 Jun 2023 10:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686244198;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9z7T6Wkk/SdazHdjYQuKgRjHWVMoXTStQH+SQPSaOwc=;
        b=LllZoeeJs8Y/b/K10tUZkZv3lqwDE/CbjBDwVO/Q0xGHMMMHd2rcrYwU4+MOvMTy5D13zl
        CrKT3NuJK9MLuEoj/r6/PEdl3IeYAmxEhGMID06Om+h80YpX0cONp3aNz+05NYsH03MQsd
        xHCAzRgP1r55Omihg1ucW8UguTY4uiM=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-SKa7A4tKMpW4m5xofBsOxA-1; Thu, 08 Jun 2023 13:09:56 -0400
X-MC-Unique: SKa7A4tKMpW4m5xofBsOxA-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-565d1b86a63so10139217b3.0
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Jun 2023 10:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686244196; x=1688836196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9z7T6Wkk/SdazHdjYQuKgRjHWVMoXTStQH+SQPSaOwc=;
        b=fNrvz2bXvRSsOIAktl0014VtynuM2tt57t4CRxuol/6uom3CJ/LEBeInpTrwv31kET
         B4SqEDNhlOhqAbyQnSD5wHQhbNlmzDK0723TPUCYCdwCdDgK9BNY+dgg3t6P3h6YYsXu
         pnKO4zvL7CtRRCrST2ULeHBS5TGkHg1V4I9wYQMUPV1eAev7urPcfgktCOxNPCArUml2
         K3GkMZq+Iy5+K1J5LMiBZOW0HblBEybqDC/xjhVNvQVfmlzLUK6PbNiLcvcx9VVQbtdD
         Dp8DhENT6rTXcehBZia8vpvYT4ml9ApAdwT5+q6syOr039Dz5BP0mOKtro98nRvR8o3W
         Jsrg==
X-Gm-Message-State: AC+VfDxQzuutSdEYNQd+IzEdfW55U7atzO4P5sIwo4C8FcFbpqHlr/8E
        afDS4l+6SWEMEHt+U4LNXQ86iSxpeWVe12VMMFwKzclIo5ZpBbo2E23pFzDh2qyiRfAHi0yX46J
        9l66zYbQE6R8KJrVya2hZHykoUv73
X-Received: by 2002:a0d:cf84:0:b0:565:9a3d:a3f9 with SMTP id r126-20020a0dcf84000000b005659a3da3f9mr410762ywd.9.1686244196436;
        Thu, 08 Jun 2023 10:09:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4wmKzTc3/7wkPTGewfNcd0v7EPf3urCf81xQmG/YbMBi+ovkuVi0bLM1/xnxOeu7n6SLkXsw==
X-Received: by 2002:a0d:cf84:0:b0:565:9a3d:a3f9 with SMTP id r126-20020a0dcf84000000b005659a3da3f9mr410744ywd.9.1686244196191;
        Thu, 08 Jun 2023 10:09:56 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id k1-20020a819301000000b00555c30ec361sm21993ywg.143.2023.06.08.10.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 10:09:55 -0700 (PDT)
Date:   Thu, 8 Jun 2023 12:09:53 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Release the correct resources in
 dwc3_qcom_remove()
Message-ID: <20230608170953.nbemo4cuipq5ui7h@halaney-x13s>
References: <c0215a84cdf18fb3514c81842783ec53cf149deb.1685891059.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0215a84cdf18fb3514c81842783ec53cf149deb.1685891059.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Jun 04, 2023 at 05:04:37PM +0200, Christophe JAILLET wrote:
> In the probe, some resources are allocated with
> dwc3_qcom_of_register_core() or dwc3_qcom_acpi_register_core(). The
> corresponding resources are already coorectly freed in the error handling

nit not worthy of holding this up: s/coorectly/correctly/

> path of the probe, but not in the remove function.
> 
> Fix it.
> 
> Fixes: 2bc02355f8ba ("usb: dwc3: qcom: Add support for booting with ACPI")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

Thanks,
Andrew

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index aa96c473f839..9c95f1d909ba 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -942,11 +942,15 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  static void dwc3_qcom_remove(struct platform_device *pdev)
>  {
>  	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
> +	struct device_node *np = pdev->dev.of_node;
>  	struct device *dev = &pdev->dev;
>  	int i;
>  
>  	device_remove_software_node(&qcom->dwc3->dev);
> -	of_platform_depopulate(dev);
> +	if (np)
> +		of_platform_depopulate(&pdev->dev);
> +	else
> +		platform_device_put(pdev);
>  
>  	for (i = qcom->num_clocks - 1; i >= 0; i--) {
>  		clk_disable_unprepare(qcom->clks[i]);
> -- 
> 2.34.1
> 

