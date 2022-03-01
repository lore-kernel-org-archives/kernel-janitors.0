Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB93C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Mar 2022 18:10:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236838AbiCASLM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Mar 2022 13:11:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234019AbiCASLM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Mar 2022 13:11:12 -0500
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr [80.12.242.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3DEF45501
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Mar 2022 10:10:27 -0800 (PST)
Received: from [192.168.1.18] ([90.126.236.122])
        by smtp.orange.fr with ESMTPA
        id P6x3nfbWfEafMP6x3nCIOI; Tue, 01 Mar 2022 19:10:25 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Tue, 01 Mar 2022 19:10:25 +0100
X-ME-IP: 90.126.236.122
Message-ID: <1d24bd65-e278-5562-a097-39a68470a1d4@wanadoo.fr>
Date:   Tue, 1 Mar 2022 19:10:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] nvmem: check for allocation failure
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20220301081127.GC17375@kili>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220301081127.GC17375@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 01/03/2022 à 09:11, Dan Carpenter a écrit :
> Check for if the kcalloc() fails.
> 
> Fixes: 299dc152721f ("nvmem: brcm_nvram: parse NVRAM content into NVMEM cells")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/nvmem/brcm_nvram.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/nvmem/brcm_nvram.c b/drivers/nvmem/brcm_nvram.c
> index 439f00b9eef6..c80af8a31eba 100644
> --- a/drivers/nvmem/brcm_nvram.c
> +++ b/drivers/nvmem/brcm_nvram.c
> @@ -95,6 +95,8 @@ static int brcm_nvram_parse(struct brcm_nvram *priv)
>   	len = le32_to_cpu(header.len);
>   
>   	data = kcalloc(1, len, GFP_KERNEL);

Hi,

just for my understanding, why
   - kcalloc(1, len) and not kzalloc(len)?
   - kcalloc and not kmalloc_array, since data is fully filled just the 
line below by memcpy_fromio()?

CJ

> +	if (!data)
> +		return -ENOMEM;
>   	memcpy_fromio(data, priv->base, len);
>   	data[len - 1] = '\0';
>   

