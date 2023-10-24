Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3412C00A8F
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Oct 2023 08:43:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232462AbjJXInZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 Oct 2023 04:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232298AbjJXInY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Oct 2023 04:43:24 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E79FA6
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 01:43:20 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39O7tVhw031861;
        Tue, 24 Oct 2023 10:43:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:to:cc:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=ldNNG0oMniqUleFy+sdT7sBRgnmhnqh6W7a3PHqB8UA=; b=hh
        fGMPCqgKec3ycL63IFTwb/NwLXrchJlekPkO31pl+Igs1BXboy1gKZ7l+vastJK/
        /hqIhOwDO7aGrOq8+7XZVNy0n0N4qfJQMJY9O50KJZ2MzixjaM1NdHLcCGTRS5gm
        TGq/efb4xR32saai0BOrn8L4316gtLtEtgz5iASQNqHTaTsoCiDu5uRyguksEF0L
        wY87oh0e6Dilme5m99etcCzyk1RWz6AccbTQX3b+AOMjm7zdkm9uqQPYZ0B+c195
        6Bwu7+sC80mzE6kpPEZPm9U1EOrw/Z2Hn2hx9EgZBy3FXPLrz8t5qtu30Pr+EyAF
        1+8QT/G/knjUlMHx+P9g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tv5hcm9ju-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Oct 2023 10:43:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B99F9100059;
        Tue, 24 Oct 2023 10:43:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B16AD2207BA;
        Tue, 24 Oct 2023 10:43:07 +0200 (CEST)
Received: from [10.201.20.208] (10.201.20.208) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 24 Oct
 2023 10:43:07 +0200
Message-ID: <d2ea6034-738d-4161-a9fb-b2d2b1b134ae@foss.st.com>
Date:   Tue, 24 Oct 2023 10:42:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH] stm class: Fix a double free in
 stm_register_device()
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC:     Laurent Fert <laurent.fert@intel.com>,
        <kernel-janitors@vger.kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <ddaf5742-931b-4cdd-820b-72808ddf4fdf@moroto.mountain>
Content-Language: en-US
From:   Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <ddaf5742-931b-4cdd-820b-72808ddf4fdf@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.20.208]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_07,2023-10-19_01,2023-05-22_02
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On 10/24/23 07:01, Dan Carpenter wrote:
> The put_device(&stm->dev) call will trigger stm_device_release() which
> frees "stm" so the vfree(stm) on the next line is a double free.
> 
> Fixes: 389b6699a2aa ("stm class: Fix stm device initialization order")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/hwtracing/stm/core.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
> index 534fbefc7f6a..7315f7d3910d 100644
> --- a/drivers/hwtracing/stm/core.c
> +++ b/drivers/hwtracing/stm/core.c
> @@ -868,8 +868,10 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
>   		return -ENOMEM;
>   
>   	stm->major = register_chrdev(0, stm_data->name, &stm_fops);
> -	if (stm->major < 0)
> -		goto err_free;
> +	if (stm->major < 0) {
> +		vfree(stm);
> +		return stm->major;

isn't there a use-after-free of stm here?

> +	}
>   
>   	device_initialize(&stm->dev);
>   	stm->dev.devt = MKDEV(stm->major, 0);
> @@ -913,10 +915,8 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
>   err_device:
>   	unregister_chrdev(stm->major, stm_data->name);
>   
> -	/* matches device_initialize() above */
> +	/* calls stm_device_release() */
>   	put_device(&stm->dev);
> -err_free:
> -	vfree(stm);
>   
>   	return err;
>   }

Regards,
Amelie
