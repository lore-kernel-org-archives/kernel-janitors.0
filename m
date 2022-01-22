Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FC9C433EF
	for <kernel-janitors@archiver.kernel.org>; Sat, 22 Jan 2022 02:43:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbiAVCnT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Jan 2022 21:43:19 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:16728 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiAVCnS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Jan 2022 21:43:18 -0500
Received: from kwepemi100015.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JggSH0H9VzZfcs;
        Sat, 22 Jan 2022 10:39:27 +0800 (CST)
Received: from kwepemm600019.china.huawei.com (7.193.23.64) by
 kwepemi100015.china.huawei.com (7.221.188.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 22 Jan 2022 10:43:15 +0800
Received: from [10.174.177.210] (10.174.177.210) by
 kwepemm600019.china.huawei.com (7.193.23.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 22 Jan 2022 10:43:15 +0800
Subject: Re: [PATCH] mtd: phram: Prevent divide by zero bug in phram_setup()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Joern Engel <joern@lazybastard.org>
CC:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <kernel-janitors@vger.kernel.org>
References: <20220121053836.GA27293@kili>
From:   yangerkun <yangerkun@huawei.com>
Message-ID: <00cdcbbc-c74e-e7d1-f751-93aac5113eee@huawei.com>
Date:   Sat, 22 Jan 2022 10:43:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20220121053836.GA27293@kili>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.210]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600019.china.huawei.com (7.193.23.64)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks for the fix!

Reviewed-by: yangerkun <yangerkun@huawei.com>

On 2022/1/21 13:38, Dan Carpenter wrote:
> The problem is that "erasesize" is a uint32_t type so it might be
> non-zero but the truncated "(uint32_t)erasesize" value *is* zero. That
> would lead to the divide by zero bug.
> 
> Avoid the bug by delaying the divide until after we have validated
> that "erasesize" is reasonable.
> 
> Fixes: dc2b3e5cbc80 ("mtd: phram: use div_u64_rem to stop overwrite len in phram_setup")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/mtd/devices/phram.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
> index 6ed6c51fac69..d503821a3e60 100644
> --- a/drivers/mtd/devices/phram.c
> +++ b/drivers/mtd/devices/phram.c
> @@ -264,16 +264,20 @@ static int phram_setup(const char *val)
>   		}
>   	}
>   
> -	if (erasesize)
> -		div_u64_rem(len, (uint32_t)erasesize, &rem);
> -
>   	if (len == 0 || erasesize == 0 || erasesize > len
> -	    || erasesize > UINT_MAX || rem) {
> +	    || erasesize > UINT_MAX) {
>   		parse_err("illegal erasesize or len\n");
>   		ret = -EINVAL;
>   		goto error;
>   	}
>   
> +	div_u64_rem(len, (uint32_t)erasesize, &rem);
> +	if (rem) {
> +		parse_err("len is not multiple of erasesize\n");
> +		ret = -EINVAL;
> +		goto error;
> +	}
> +
>   	ret = register_device(name, start, len, (uint32_t)erasesize);
>   	if (ret)
>   		goto error;
> 
