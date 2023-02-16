Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978A2C636CC
	for <kernel-janitors@archiver.kernel.org>; Thu, 16 Feb 2023 12:14:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbjBPMOi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 16 Feb 2023 07:14:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjBPMOh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Feb 2023 07:14:37 -0500
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74751BC3
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Feb 2023 04:14:35 -0800 (PST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VbogEOy_1676549672;
Received: from 30.221.132.175(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0VbogEOy_1676549672)
          by smtp.aliyun-inc.com;
          Thu, 16 Feb 2023 20:14:33 +0800
Message-ID: <cb4fb277-0e11-290c-14ed-d5ea22b38b71@linux.alibaba.com>
Date:   Thu, 16 Feb 2023 20:14:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] erofs: fix an error code in z_erofs_init_zip_subsystem()
To:     Dan Carpenter <error27@gmail.com>,
        Sandeep Dhavale <dhavale@google.com>
Cc:     kernel-janitors@vger.kernel.org, linux-erofs@lists.ozlabs.org,
        Yue Hu <huyue2@coolpad.com>
References: <Y+4d0FRsUq8jPoOu@kili>
From:   Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <Y+4d0FRsUq8jPoOu@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 2023/2/16 20:13, Dan Carpenter wrote:
> Return -ENOMEM if alloc_workqueue() fails.  Don't return success.
> 
> Fixes: d8a650adf429 ("erofs: add per-cpu threads for decompression as an option")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang

> ---
>   fs/erofs/zdata.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
> index 8ea3f5fe985e..3247d2422bea 100644
> --- a/fs/erofs/zdata.c
> +++ b/fs/erofs/zdata.c
> @@ -475,8 +475,10 @@ int __init z_erofs_init_zip_subsystem(void)
>   
>   	z_erofs_workqueue = alloc_workqueue("erofs_worker",
>   			WQ_UNBOUND | WQ_HIGHPRI, num_possible_cpus());
> -	if (!z_erofs_workqueue)
> +	if (!z_erofs_workqueue) {
> +		err = -ENOMEM;
>   		goto out_error_workqueue_init;
> +	}
>   
>   	err = erofs_init_percpu_workers();
>   	if (err)
