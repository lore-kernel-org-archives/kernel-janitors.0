Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB708C0032E
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 07:25:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232814AbjJYHZt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 03:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232777AbjJYHZp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 03:25:45 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6067DD
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 00:25:42 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39P0b9i9024280;
        Wed, 25 Oct 2023 09:25:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:to:cc:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=eZcf6Nex+okGCYfnBvOvvvKf/hhzIGIVLGg4l49To5k=; b=ha
        YMvPB/HcnM1eXeV6Iq4vJ0i3NHynFlPYJBgImJu5+pBTsGvBTPgkEzMkl09H1ysO
        eXJezuSB9Zk6YT+LnVJzslO23FbmjyUd9P7A/2XtykRpGJTHBh0vA1cpbhmZfPKB
        EUcFGvm6rJhXT9H8GNDX/Y4dMIjkcaE+98oXfGaFtTxNBfh8NDGt+b6gWgSA/VMH
        DMQyQMH7KXO2VJFOYsgPzDa74lsLQoAJMLtvRSWuGLP2nsYODP6eSPaJgt398ZbR
        zzxz5504QmQHBf+ozJ89xEFzvLJKIjKWHPEUVGUA6KI7UPgP4/qEQ6TLvWxFYXh/
        kWaLpxZp+a/KGvi4a3wg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tv3s4se32-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Oct 2023 09:25:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D64B8100059;
        Wed, 25 Oct 2023 09:25:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CEB67216EF8;
        Wed, 25 Oct 2023 09:25:28 +0200 (CEST)
Received: from [10.201.20.208] (10.201.20.208) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 25 Oct
 2023 09:25:28 +0200
Message-ID: <4b4a339d-3da4-472a-885c-745465f34d6e@foss.st.com>
Date:   Wed, 25 Oct 2023 09:25:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] stm class: Fix a double free in stm_register_device()
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Laurent Fert <laurent.fert@intel.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <kernel-janitors@vger.kernel.org>
References: <143baf7a-9d8c-471a-893a-fd827bbc7d05@moroto.mountain>
Content-Language: en-US
From:   Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <143baf7a-9d8c-471a-893a-fd827bbc7d05@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.20.208]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-25_01,2023-10-24_01,2023-05-22_02
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On 10/25/23 09:20, Dan Carpenter wrote:
> The put_device(&stm->dev) call will trigger stm_device_release() which
> frees "stm" so the vfree(stm) on the next line is a double free.
> 
> Fixes: 389b6699a2aa ("stm class: Fix stm device initialization order")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
> v2:  My first version introduced a use after free bug.  Thanks Amelie,
>       for catching this.
> 
>   drivers/hwtracing/stm/core.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
> index 534fbefc7f6a..20895d391562 100644
> --- a/drivers/hwtracing/stm/core.c
> +++ b/drivers/hwtracing/stm/core.c
> @@ -868,8 +868,11 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
>   		return -ENOMEM;
>   
>   	stm->major = register_chrdev(0, stm_data->name, &stm_fops);
> -	if (stm->major < 0)
> -		goto err_free;
> +	if (stm->major < 0) {
> +		err = stm->major;
> +		vfree(stm);
> +		return err;
> +	}
>   
>   	device_initialize(&stm->dev);
>   	stm->dev.devt = MKDEV(stm->major, 0);
> @@ -913,10 +916,8 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
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
