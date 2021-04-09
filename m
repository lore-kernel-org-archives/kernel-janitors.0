Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8619BC433ED
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 07:56:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AC5B611B0
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 07:56:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232060AbhDIH40 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 9 Apr 2021 03:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232395AbhDIH4Y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Apr 2021 03:56:24 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D19EC061761
        for <kernel-janitors@vger.kernel.org>; Fri,  9 Apr 2021 00:56:12 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id l76so3287640pga.6
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Apr 2021 00:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/psdJdZhtQxPRqP2rSeIFW0LQiIDDkbIGdh0cvYadBU=;
        b=L8z3g7hZW84h5nM/ti6IxvrqYNRpURr0QjluQ7kN299h4kGodN+i2ZqlpfZjmV2DcV
         NJdHifRZQwCvGkuyszr116EZoWi70uHJWd65wtEWaWArXY1Rp4ZzN/9ZnXegyO3vKwFY
         8NO2xJo3GGqSN9wCk+iD4DUDoM9a/YwA66QN74YGY2H1cW7vZrL5l7MdjKeR/QAsuZU2
         Ucz/7XTFcdQzbM6d/fkAnUHCM65vVA1TvrS1EIy6gM9onyU/qKkNAl3l+WgxxEO0aPig
         bhcP59/Ksf4qh7I609Y+3kN93l9mNb9wKPVKERjl2R9u6Ll9R8qVQKHkghUDQWZCnxm2
         BPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/psdJdZhtQxPRqP2rSeIFW0LQiIDDkbIGdh0cvYadBU=;
        b=N84T7ziYbrQevWr/gHGOvIZzzvELoMRHaq6pancOT2aQaQPTZEPbvjGS89tyaa4flo
         vpURb/8M98q2QhR1LtbG4NZcAp0q5tw4uZ0x/dder9JbkNVMOjFD3ZgsH88+i4s34amw
         1wam1XvFfed4LHouW+s+AN0x/z5w0vkNqwmGGRziQTuyZEy+oxELt144Xdsrh6rMBVUX
         kKr4FO6AvyWr8B7tToejK/XroqTbRs/b6DODanYf6Sci/b8r5MKtEzAansypytnH12AM
         j1UaJ7NTQGSfnumivA4Bd6pB8+4708w9LVCBikGpumIdPQEB6qx2rT9MtLgoOKYLHtFh
         uMMA==
X-Gm-Message-State: AOAM531piHqsfjnGPxDt2KYKoYw6xB1dGmkD73CmhaBft1VICV3Lopry
        iA0o/wvA3GHPo/En78wHAxFS
X-Google-Smtp-Source: ABdhPJw4y19qgIEed/3idRuicEXOdgw7PNQxmYE3f4snxddrL+3JBiwUbHv6mAxOeiF2tFwRzk92Iw==
X-Received: by 2002:a63:5458:: with SMTP id e24mr11921129pgm.170.1617954971782;
        Fri, 09 Apr 2021 00:56:11 -0700 (PDT)
Received: from work ([103.77.37.131])
        by smtp.gmail.com with ESMTPSA id k17sm1475219pfa.68.2021.04.09.00.56.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 00:56:11 -0700 (PDT)
Date:   Fri, 9 Apr 2021 13:26:07 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Ye Bin <yebin10@huawei.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] scsi: ufs-qcom: Remove redundant dev_err call in
 ufs_qcom_init()
Message-ID: <20210409075607.GF4376@work>
References: <20210409075522.2111083-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409075522.2111083-1-yebin10@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Apr 09, 2021 at 03:55:22PM +0800, Ye Bin wrote:
> There is a error message within devm_ioremap_resource
> 
> already, so remove the dev_err call to avoid redundant
> 
> error message.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ye Bin <yebin10@huawei.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/scsi/ufs/ufs-qcom.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index 9b711d6aac54..2a3dd21da6a6 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -1071,13 +1071,8 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  		if (res) {
>  			host->dev_ref_clk_ctrl_mmio =
>  					devm_ioremap_resource(dev, res);
> -			if (IS_ERR(host->dev_ref_clk_ctrl_mmio)) {
> -				dev_warn(dev,
> -					"%s: could not map dev_ref_clk_ctrl_mmio, err %ld\n",
> -					__func__,
> -					PTR_ERR(host->dev_ref_clk_ctrl_mmio));
> +			if (IS_ERR(host->dev_ref_clk_ctrl_mmio))
>  				host->dev_ref_clk_ctrl_mmio = NULL;
> -			}
>  			host->dev_ref_clk_en_mask = BIT(5);
>  		}
>  	}
> 
