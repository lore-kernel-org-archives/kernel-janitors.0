Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A017C001DF
	for <kernel-janitors@archiver.kernel.org>; Mon, 31 Jul 2023 08:03:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbjGaIDT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 31 Jul 2023 04:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbjGaICy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 31 Jul 2023 04:02:54 -0400
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C4510D9;
        Mon, 31 Jul 2023 01:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
        s=default2211; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:
        References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=RJsJDzh7RH714SYe9JpxiShzFCsZRJ+MTVJssOT4ql0=; b=ziabrmiCt/ttr/GIitv/UQPDif
        svVusKVLYHPiNyig10XK3ukoKZ0g6e10gJ5XvXsAN4Bl5p88xZMC9jLo/qak/aBGFil3k1bVF5eQa
        oFDJIaF9lbATr0cDv8N7RAxN1eoZxECi9Ys3AZda7mqdYIzvEQgbtyA1DfqYt+B+mhN9ftFpNyDQn
        raTIBwEQxC53dHCwxbGjTYITWCkJXzjr8mRM1pNvpjto1F4xz62aAD9Jz8eAJVm9/uq3A/RZb/f9b
        +x3h3DGJogeL5itrJj5Pm//R6qJB16xz7UVXRruG6PDSVlE7HCSi3pc3zHMzdA3cpmaIGja+SGJu4
        AGWV6alg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
        by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <esben@geanix.com>)
        id 1qQNqr-000HB2-SA; Mon, 31 Jul 2023 10:02:01 +0200
Received: from [87.49.147.249] (helo=localhost)
        by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <esben@geanix.com>)
        id 1qQNqr-000Prd-6D; Mon, 31 Jul 2023 10:02:01 +0200
From:   esben@geanix.com
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Michal Simek <michal.simek@amd.com>,
        Harini Katakam <harini.katakam@amd.com>,
        Haoyue Xu <xuhaoyue1@hisilicon.com>,
        huangjunxian <huangjunxian6@hisilicon.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Rob Herring <robh@kernel.org>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: ll_temac: fix error checking of
 irq_of_parse_and_map()
References: <3d0aef75-06e0-45a5-a2a6-2cc4738d4143@moroto.mountain>
Date:   Mon, 31 Jul 2023 10:02:00 +0200
In-Reply-To: <3d0aef75-06e0-45a5-a2a6-2cc4738d4143@moroto.mountain> (Dan
        Carpenter's message of "Mon, 31 Jul 2023 10:42:32 +0300")
Message-ID: <87jzug4ih3.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26985/Sun Jul 30 09:27:27 2023)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@linaro.org> writes:

> Most kernel functions return negative error codes but some irq functions
> return zero on error.  In this code irq_of_parse_and_map(), returns zero
> and platform_get_irq() returns negative error codes.  We need to handle
> both cases appropriately.
>
> Fixes: 8425c41d1ef7 ("net: ll_temac: Extend support to non-device-tree platforms")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Acked-by: Esben Haabendal <esben@geanix.com>

> ---
>  drivers/net/ethernet/xilinx/ll_temac_main.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/ethernet/xilinx/ll_temac_main.c b/drivers/net/ethernet/xilinx/ll_temac_main.c
> index e0ac1bcd9925..49f303353ecb 100644
> --- a/drivers/net/ethernet/xilinx/ll_temac_main.c
> +++ b/drivers/net/ethernet/xilinx/ll_temac_main.c
> @@ -1567,12 +1567,16 @@ static int temac_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Error handle returned DMA RX and TX interrupts */
> -	if (lp->rx_irq < 0)
> -		return dev_err_probe(&pdev->dev, lp->rx_irq,
> +	if (lp->rx_irq <= 0) {
> +		rc = lp->rx_irq ?: -EINVAL;
> +		return dev_err_probe(&pdev->dev, rc,
>  				     "could not get DMA RX irq\n");
> -	if (lp->tx_irq < 0)
> -		return dev_err_probe(&pdev->dev, lp->tx_irq,
> +	}
> +	if (lp->tx_irq <= 0) {
> +		rc = lp->tx_irq ?: -EINVAL;
> +		return dev_err_probe(&pdev->dev, rc,
>  				     "could not get DMA TX irq\n");
> +	}
>  
>  	if (temac_np) {
>  		/* Retrieve the MAC address */
