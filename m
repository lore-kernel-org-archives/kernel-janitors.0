Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE62C7618E
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Apr 2023 12:12:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbjDUMMz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Apr 2023 08:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbjDUMMy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Apr 2023 08:12:54 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CFB6D5B93
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Apr 2023 05:12:52 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D07C1480;
        Fri, 21 Apr 2023 05:13:36 -0700 (PDT)
Received: from [10.57.82.85] (unknown [10.57.82.85])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EEA63F587;
        Fri, 21 Apr 2023 05:12:50 -0700 (PDT)
Message-ID: <ac054e28-55fa-85c2-5865-3a44f8e7fa5e@arm.com>
Date:   Fri, 21 Apr 2023 13:12:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] coresight: Fix signedness bug in
 tmc_etr_buf_insert_barrier_packet()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
References: <7d33e244-d8b9-4c27-9653-883a13534b01@kili.mountain>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <7d33e244-d8b9-4c27-9653-883a13534b01@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan

On 21/04/2023 11:42, Dan Carpenter wrote:
> This code generates a Smatch warning:
> 
>      drivers/hwtracing/coresight/coresight-tmc-etr.c:947 tmc_etr_buf_insert_barrier_packet()
>      error: uninitialized symbol 'bufp'.
> 
> The problem is that if tmc_sg_table_get_data() returns -EINVAL, then
> when we test if "len < CORESIGHT_BARRIER_PKT_SIZE", the negative "len"
> value is type promoted to a high unsigned long value which is greater
> than CORESIGHT_BARRIER_PKT_SIZE.  Fix this bug by adding an explicit
> check for error codes.
> 
> Fixes: 75f4e3619fe2 ("coresight: tmc-etr: Add transparent buffer management")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/hwtracing/coresight/coresight-tmc-etr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index 918d461fcf4a..eaa296ced167 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -942,7 +942,7 @@ tmc_etr_buf_insert_barrier_packet(struct etr_buf *etr_buf, u64 offset)
>   
>   	len = tmc_etr_buf_get_data(etr_buf, offset,
>   				   CORESIGHT_BARRIER_PKT_SIZE, &bufp);
> -	if (WARN_ON(len < CORESIGHT_BARRIER_PKT_SIZE))
> +	if (WARN_ON(len < 0 || len < CORESIGHT_BARRIER_PKT_SIZE))
>   		return -EINVAL;
>   	coresight_insert_barrier_packet(bufp);
>   	return offset + CORESIGHT_BARRIER_PKT_SIZE;


Thanks for the fix, I will send this as fixes at 6.4-rc1, as I have
already sent the PULL request for 6.4

Suzuki
