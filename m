Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A85E1C001DF
	for <kernel-janitors@archiver.kernel.org>; Mon, 31 Jul 2023 08:04:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231826AbjGaIEO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 31 Jul 2023 04:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbjGaIDm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 31 Jul 2023 04:03:42 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D643E41;
        Mon, 31 Jul 2023 01:02:39 -0700 (PDT)
Received: from dggpemm500008.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RDrH409JdzNmWN;
        Mon, 31 Jul 2023 15:59:12 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500008.china.huawei.com (7.185.36.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 16:02:36 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 16:02:36 +0800
Subject: Re: [PATCH net] net: ll_temac: fix error checking of
 irq_of_parse_and_map()
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Esben Haabendal <esben@geanix.com>
CC:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Michal Simek <michal.simek@amd.com>,
        Harini Katakam <harini.katakam@amd.com>,
        Haoyue Xu <xuhaoyue1@hisilicon.com>,
        huangjunxian <huangjunxian6@hisilicon.com>,
        Rob Herring <robh@kernel.org>, <netdev@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <3d0aef75-06e0-45a5-a2a6-2cc4738d4143@moroto.mountain>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <014b3bb1-4962-2e63-8211-1fdb0b4cfbf6@huawei.com>
Date:   Mon, 31 Jul 2023 16:02:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3d0aef75-06e0-45a5-a2a6-2cc4738d4143@moroto.mountain>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Reviewed-by: Yang Yingliang <yangyingliang@huawei.com>

On 2023/7/31 15:42, Dan Carpenter wrote:
> Most kernel functions return negative error codes but some irq functions
> return zero on error.  In this code irq_of_parse_and_map(), returns zero
> and platform_get_irq() returns negative error codes.  We need to handle
> both cases appropriately.
>
> Fixes: 8425c41d1ef7 ("net: ll_temac: Extend support to non-device-tree platforms")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/net/ethernet/xilinx/ll_temac_main.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/ethernet/xilinx/ll_temac_main.c b/drivers/net/ethernet/xilinx/ll_temac_main.c
> index e0ac1bcd9925..49f303353ecb 100644
> --- a/drivers/net/ethernet/xilinx/ll_temac_main.c
> +++ b/drivers/net/ethernet/xilinx/ll_temac_main.c
> @@ -1567,12 +1567,16 @@ static int temac_probe(struct platform_device *pdev)
>   	}
>   
>   	/* Error handle returned DMA RX and TX interrupts */
> -	if (lp->rx_irq < 0)
> -		return dev_err_probe(&pdev->dev, lp->rx_irq,
> +	if (lp->rx_irq <= 0) {
> +		rc = lp->rx_irq ?: -EINVAL;
> +		return dev_err_probe(&pdev->dev, rc,
>   				     "could not get DMA RX irq\n");
> -	if (lp->tx_irq < 0)
> -		return dev_err_probe(&pdev->dev, lp->tx_irq,
> +	}
> +	if (lp->tx_irq <= 0) {
> +		rc = lp->tx_irq ?: -EINVAL;
> +		return dev_err_probe(&pdev->dev, rc,
>   				     "could not get DMA TX irq\n");
> +	}
>   
>   	if (temac_np) {
>   		/* Retrieve the MAC address */
