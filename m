Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6F5C433FE
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 Oct 2022 11:06:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiJNLGj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 Oct 2022 07:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiJNLGi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 Oct 2022 07:06:38 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8181CC3DE
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Oct 2022 04:06:33 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EA9xHV019178;
        Fri, 14 Oct 2022 13:06:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=MX4vQzooU9FWmgeS4cufdErYDqEDeethW/UcWxF6rlw=;
 b=X1QxtzFRW+kZ5TDf7e1M95lKCBFPkGKvMY/nCzG5mLCW9uOkKNIznPdVD5cTmi57s1Qv
 47zk4XNQDkiW2K/KCd4sWazrIV+z6av5X01Oo1+NtZ1IiS0iRkTOQuC0Y4V4zZFZ0QRe
 Aqc8pbIwYzOpq7zUqOxIyqmeZ5YpiFtV65aloDBDPpObceVm11fddD5n2DLb0zELiZRI
 WU8j7QQnjkceXMlXkOpjf0MG+md1pFv5uR4RJpv/zBi7hCVAdYR5hdzwJs42yaOzCt9p
 W2RRpdqykl2aFfJ3omKsJDsbmXoGO+noL46GXmeRN0rdaNJDYjiOl/Huc/2gEEyn4w4m 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k75sd8d64-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Oct 2022 13:06:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4995410002A;
        Fri, 14 Oct 2022 13:06:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 43CA821FEBE;
        Fri, 14 Oct 2022 13:06:04 +0200 (CEST)
Received: from [10.252.26.147] (10.75.127.121) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 14 Oct
 2022 13:06:01 +0200
Message-ID: <53b35e0b-799b-c404-66cb-4ce4307b4970@foss.st.com>
Date:   Fri, 14 Oct 2022 13:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] phy: stm32: fix an error code in probe
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
CC:     Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        <linux-phy@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <kernel-janitors@vger.kernel.org>
References: <Y0kq8j6S+5nDdMpr@kili>
Content-Language: en-US
From:   Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <Y0kq8j6S+5nDdMpr@kili>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_06,2022-10-14_01,2022-06-22_01
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 10/14/22 11:25, Dan Carpenter wrote:
> If "index > usbphyc->nphys" is true then this returns success but it
> should return -EINVAL.
> 
> Fixes: 94c358da3a05 ("phy: stm32: add support for STM32 USB PHY Controller (USBPHYC)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan,

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
>   drivers/phy/st/phy-stm32-usbphyc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
> index a98c911cc37a..5bb9647b078f 100644
> --- a/drivers/phy/st/phy-stm32-usbphyc.c
> +++ b/drivers/phy/st/phy-stm32-usbphyc.c
> @@ -710,6 +710,8 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
>   		ret = of_property_read_u32(child, "reg", &index);
>   		if (ret || index > usbphyc->nphys) {
>   			dev_err(&phy->dev, "invalid reg property: %d\n", ret);
> +			if (!ret)
> +				ret = -EINVAL;
>   			goto put_child;
>   		}
>   
