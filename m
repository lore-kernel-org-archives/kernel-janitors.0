Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053D6E80AAF
	for <kernel-janitors@archiver.kernel.org>; Wed, 27 Sep 2023 14:04:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbjI0OEd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 27 Sep 2023 10:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232071AbjI0OEd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 Sep 2023 10:04:33 -0400
X-Greylist: delayed 585 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 27 Sep 2023 07:04:31 PDT
Received: from out-191.mta0.migadu.com (out-191.mta0.migadu.com [IPv6:2001:41d0:1004:224b::bf])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39A8126
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 07:04:31 -0700 (PDT)
Message-ID: <5710f678-b643-b22e-7c73-1d8d6ba916a6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1695822884;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/OSwsNOXWM0VgezPfw7af7Si0H/8qY1jnNwHcRl/SBg=;
        b=VRT903ZJjhjbxqVECRTdLvimf33NZh3T4eQx6dkQ2L/fz3ZcEWCrGtZn4/g/Twte9GD069
        PMhYDD4izcVHGPVMYf++2K3AaTDtyb+jSk6uEsAywhst7rADOmuWEaxgmYM2XabEDZPqgC
        m0W8NGhmbYCYFJChm38ODm9Hn3IZAP4=
Date:   Wed, 27 Sep 2023 14:54:37 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next] ptp: ocp: fix error code in probe()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Richard Cochran <richardcochran@gmail.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Vadim Fedorenko <vadfed@fb.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <5c581336-0641-48bd-88f7-51984c3b1f79@moroto.mountain>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <5c581336-0641-48bd-88f7-51984c3b1f79@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 27/09/2023 13:55, Dan Carpenter wrote:
> There is a copy and paste error so this uses a valid pointer instead of
> an error pointer.
> 
> Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/ptp/ptp_ocp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 88d60a9b5731..d39afe091a7b 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -4453,7 +4453,7 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	for (i = 0; i < OCP_SMA_NUM; i++) {
>   		bp->sma[i].dpll_pin = dpll_pin_get(clkid, i, THIS_MODULE, &bp->sma[i].dpll_prop);
>   		if (IS_ERR(bp->sma[i].dpll_pin)) {
> -			err = PTR_ERR(bp->dpll);
> +			err = PTR_ERR(bp->sma[i].dpll_pin);
>   			goto out_dpll;
>   		}
>   

Thanks!

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
