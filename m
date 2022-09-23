Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B97C6FA86
	for <kernel-janitors@archiver.kernel.org>; Fri, 23 Sep 2022 08:58:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbiIWI6N (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 23 Sep 2022 04:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231409AbiIWI6L (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Sep 2022 04:58:11 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C3C12C686
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Sep 2022 01:58:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A9069CE1B5A
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Sep 2022 08:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE95C433C1;
        Fri, 23 Sep 2022 08:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663923486;
        bh=BgKVREHg5OpngvRNOlXi5PLKFAxqE0nOa1LwtGxKtOM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jbIsuQD8tcbhgx5o3LMD/9n5krtarNX2QFJ70ACjyF45Fe+N5gOA0mu/ysUjCKig+
         9HdoGdYgGKrv+WHn6NJ3A+cxGZrPTnyrs8VyMstdzJeoWnMp6WSfwKbKHnR09dq99S
         GAVQoI7+4yyts0eXfryhzdzU8FDGK3gblbm+TSTC/M9Ro5V2fUMFsTs40Yd7+06MxP
         C8PkF/jakJhB6o1i8vA1agXh2c5rWCHxz2c8YBK7DCE66dr2bOewNTbSSmPsp54SrG
         8hYwYQpaawW79BdzMetmx4o+8AGIn7Br2pKEGDkj/dgmfYkHakkRcF9WdcJMH4EN2j
         FCYX8hQGbe+FQ==
Message-ID: <d3b8754e-f888-5bef-c6c3-16c42c598421@kernel.org>
Date:   Fri, 23 Sep 2022 11:58:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] phy: ti: phy-j721e-wiz: fix reference leaks in
 wiz_probe()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Jyri Sarha <jsarha@ti.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Tanmay Patil <t-patil@ti.com>, linux-phy@lists.infradead.org,
        kernel-janitors@vger.kernel.org
References: <YyxFI8aW23IC/21U@kili>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <YyxFI8aW23IC/21U@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 22/09/2022 14:21, Dan Carpenter wrote:
> These two error paths need to call of_node_put(child_node) before
> returning.
> 
> Fixes: edd473d4293a ("phy: ti: phy-j721e-wiz: add support for j7200-wiz-10g")
> Fixes: 7ae14cf581f2 ("phy: ti: j721e-wiz: Implement DisplayPort mode to the wiz driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

> ---
>  drivers/phy/ti/phy-j721e-wiz.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
> index 20af142580ad..438ccce3d1bf 100644
> --- a/drivers/phy/ti/phy-j721e-wiz.c
> +++ b/drivers/phy/ti/phy-j721e-wiz.c
> @@ -1400,7 +1400,8 @@ static int wiz_probe(struct platform_device *pdev)
>  	if (IS_ERR(wiz->scm_regmap)) {
>  		if (wiz->type == J7200_WIZ_10G) {
>  			dev_err(dev, "Couldn't get ti,scm regmap\n");
> -			return -ENODEV;
> +			ret = -ENODEV;
> +			goto err_addr_to_resource;
>  		}
>  
>  		wiz->scm_regmap = NULL;
> @@ -1450,7 +1451,7 @@ static int wiz_probe(struct platform_device *pdev)
>  
>  	ret = wiz_get_lane_phy_types(dev, wiz);
>  	if (ret)
> -		return ret;
> +		goto err_addr_to_resource;
>  
>  	wiz->dev = dev;
>  	wiz->regmap = regmap;

cheers,
-roger
