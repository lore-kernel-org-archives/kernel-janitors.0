Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08ABC7EE29
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Jun 2023 16:55:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236379AbjFHQzR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Jun 2023 12:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233787AbjFHQzQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Jun 2023 12:55:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3078A1730
        for <kernel-janitors@vger.kernel.org>; Thu,  8 Jun 2023 09:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686243269;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=C7Gzsm4c5VDydfTjmb7wRGtHYG5sGvTAth2UOQdT5as=;
        b=CIMZNxFQaz/jn79ylRC5/8Yb6huGhJ+L+fUalP9b8nio/p4dHmGJD4nPDifF6nbngUFAtu
        2qoyS04z8ah29GZsvR+MJX70UF5cmkZc4sxp9aphVBzWWxwvz5Kz3/5cDJxyuW4B+XrnEB
        +mBjARgMrlDLw5/CqsrgsOFDBEpVmxE=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-kbcdtAXcOM-3OiO02M45Sg-1; Thu, 08 Jun 2023 12:54:27 -0400
X-MC-Unique: kbcdtAXcOM-3OiO02M45Sg-1
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-558df3fa320so684619eaf.2
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Jun 2023 09:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686243267; x=1688835267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7Gzsm4c5VDydfTjmb7wRGtHYG5sGvTAth2UOQdT5as=;
        b=MGdesxIkiP86ZRC5C6FW9LELIw2LqhrVAwGTMB+V+YnSbnE5N7aIf6DG8FjMQf9RsR
         9T8v1d/027JVnsxPl2iZSHH4hpO9kD+Xi8XWfupM3o1/MTl4ArgAazw2eeuNftq2UJUJ
         Zzg3+giZZ7Ke2ITgWmV+KzBaXTpZgQMmxCkph/zvHu9QwmbneFSpCV9tYm0znN3fa+d9
         J5Z0k+zotcNO0lFwx1JvbbVzJ3jFBUBMd+dFgrN/W9pI346pMugFI+7m9TAvFH7ZbRam
         WwBY2Y7xMeTUGHozvWcs8GCiturGEmtuvNg2l5wJ+ki8MG5epibfYUakw2FQEJ+UTAiJ
         V18A==
X-Gm-Message-State: AC+VfDyp+8orq+gkpypwiitmUB4XwJxpMyaJUgdAWcdnIaDo4kgteife
        6euhqrNmt1IQBPOJA0jEQaml3gY8k19//0T1jERVdAvqIKHc8TR0+C+WW1Mmq+kLuZr8qe6x+em
        jIQUIUlBJMEr0T99SbA4R8ID4D254
X-Received: by 2002:a4a:d8c2:0:b0:558:fd2b:8232 with SMTP id c2-20020a4ad8c2000000b00558fd2b8232mr177810oov.9.1686243266856;
        Thu, 08 Jun 2023 09:54:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6JTBAHmdb92kjvDywymq4EZWiP3V+16ZVHXuhLLjDlkHPWSSDhtIhwSdfuR/7p2MS+ahpNvw==
X-Received: by 2002:a4a:d8c2:0:b0:558:fd2b:8232 with SMTP id c2-20020a4ad8c2000000b00558fd2b8232mr177798oov.9.1686243266617;
        Thu, 08 Jun 2023 09:54:26 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id z2-20020aca3302000000b0038ee0c3b38esm599397oiz.44.2023.06.08.09.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 09:54:25 -0700 (PDT)
Date:   Thu, 8 Jun 2023 11:54:23 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Fix an error handling path in
 dwc3_qcom_probe()
Message-ID: <20230608165423.gvcwvmgiojuvjahv@halaney-x13s>
References: <b69fa8dd68d816e7d24c88d3eda776ceb28c5dc5.1685890571.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b69fa8dd68d816e7d24c88d3eda776ceb28c5dc5.1685890571.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Jun 04, 2023 at 04:56:34PM +0200, Christophe JAILLET wrote:
> If dwc3_qcom_create_urs_usb_platdev() fails, some resources still need to
> be released, as already done in the other error handling path of the
> probe.
> 
> Fixes: c25c210f590e ("usb: dwc3: qcom: add URS Host support for sdm845 ACPI boot")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 822735814050..aa96c473f839 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -856,9 +856,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  			if (IS_ERR_OR_NULL(qcom->urs_usb)) {
>  				dev_err(dev, "failed to create URS USB platdev\n");
>  				if (!qcom->urs_usb)
> -					return -ENODEV;
> +					ret = -ENODEV;
>  				else
> -					return PTR_ERR(qcom->urs_usb);
> +					ret = PTR_ERR(qcom->urs_usb);
> +				goto clk_disable;
>  			}
>  		}
>  	}
> -- 
> 2.34.1
> 

