Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE18C001B2
	for <kernel-janitors@archiver.kernel.org>; Sun, 11 Dec 2022 18:52:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbiLKSwc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 11 Dec 2022 13:52:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiLKSwa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 11 Dec 2022 13:52:30 -0500
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEA50BCAC
        for <kernel-janitors@vger.kernel.org>; Sun, 11 Dec 2022 10:52:28 -0800 (PST)
Received: from [192.168.1.18] ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id 4RR2pvSp33PfJ4RR2pN3da; Sun, 11 Dec 2022 19:52:26 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 11 Dec 2022 19:52:26 +0100
X-ME-IP: 86.243.100.34
Message-ID: <dd6bf955-05c7-e141-9ba6-b682163bd4a0@wanadoo.fr>
Date:   Sun, 11 Dec 2022 19:52:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] bus: qcom-ssc-block-bus: Fix resource release in .remove
 function
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <d9c9889ac01bf5656e0902ad369e8811c44c3e0c.1653222646.git.christophe.jaillet@wanadoo.fr>
Content-Language: fr, en-US
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <d9c9889ac01bf5656e0902ad369e8811c44c3e0c.1653222646.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 22/05/2022 à 14:31, Christophe JAILLET a écrit :
> These resources are allocated using devm_ioremap_resource(), so there is no
> need to call iounmap() explicitly.
> 
> Fixes: 97d485edc1d9 ("bus: add driver for initializing the SSC bus on (some) qcom SoCs")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/bus/qcom-ssc-block-bus.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/bus/qcom-ssc-block-bus.c b/drivers/bus/qcom-ssc-block-bus.c
> index eedeb29a5ff3..eaa39e08dd96 100644
> --- a/drivers/bus/qcom-ssc-block-bus.c
> +++ b/drivers/bus/qcom-ssc-block-bus.c
> @@ -356,9 +356,6 @@ static int qcom_ssc_block_bus_remove(struct platform_device *pdev)
>   
>   	qcom_ssc_block_bus_deinit(&pdev->dev);
>   
> -	iounmap(data->reg_mpm_sscaon_config0);
> -	iounmap(data->reg_mpm_sscaon_config1);
> -
>   	qcom_ssc_block_bus_pds_disable(data->pds, data->num_pds);
>   	qcom_ssc_block_bus_pds_detach(&pdev->dev, data->pds, data->num_pds);
>   	pm_runtime_disable(&pdev->dev);

Hi,

polite reminder, with updated list from get_maintainer.pl

CJ
