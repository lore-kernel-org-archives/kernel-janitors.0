Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2328FC433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 15 Sep 2021 09:27:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06ED16124D
	for <kernel-janitors@archiver.kernel.org>; Wed, 15 Sep 2021 09:27:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232009AbhIOJ3J (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 15 Sep 2021 05:29:09 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51756 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhIOJ3I (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Sep 2021 05:29:08 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18F9RaAp030915;
        Wed, 15 Sep 2021 04:27:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1631698056;
        bh=L7qA8i9UOkh7H/w2+e7OKsjOYkaAL9Tz5/iReGTrIYw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=foIZEGrQ2Etszsjin/s3dcHvjRZjyiATLfnxtm4wolIZIEmTCooZUUCSL4kDRDmEU
         Rf7A1WyZ82uSvtPKpiX/7SZHlEHmg/oO2DobQYdJHw5tfo16+0VtkedBOhEABXe7+Z
         zgvHnlf69dtN3g4SyyIFCj0vFGj1g1cmVX9Q0Ji4=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18F9RaXq047180
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Sep 2021 04:27:36 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 15
 Sep 2021 04:27:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 15 Sep 2021 04:27:36 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18F9RYiA016815;
        Wed, 15 Sep 2021 04:27:34 -0500
Subject: Re: [PATCH] phy: ti: gmii-sel: check of_get_address() for failure
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
CC:     Vinod Koul <vkoul@kernel.org>, <linux-phy@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>
References: <20210914110038.GB11657@kili>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <577c979d-647d-c0b9-0a0d-9ae5be47c2d4@ti.com>
Date:   Wed, 15 Sep 2021 12:27:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914110038.GB11657@kili>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 14/09/2021 14:00, Dan Carpenter wrote:
> Smatch complains that if of_get_address() returns NULL, then "size"
> isn't initialized.  Also it would lead to an Oops.
> 
> Fixes: 7f78322cdd67 ("phy: ti: gmii-sel: retrieve ports number and base offset from dt")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/phy/ti/phy-gmii-sel.c | 2 ++
>   1 file changed, 2 insertions(+)

Thank you.
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

> 
> diff --git a/drivers/phy/ti/phy-gmii-sel.c b/drivers/phy/ti/phy-gmii-sel.c
> index 5fd2e8a08bfc..d0ab69750c6b 100644
> --- a/drivers/phy/ti/phy-gmii-sel.c
> +++ b/drivers/phy/ti/phy-gmii-sel.c
> @@ -320,6 +320,8 @@ static int phy_gmii_sel_init_ports(struct phy_gmii_sel_priv *priv)
>   		u64 size;
>   
>   		offset = of_get_address(dev->of_node, 0, &size, NULL);
> +		if (!offset)
> +			return -EINVAL;
>   		priv->num_ports = size / sizeof(u32);
>   		if (!priv->num_ports)
>   			return -EINVAL;
> 

-- 
Best regards,
grygorii
