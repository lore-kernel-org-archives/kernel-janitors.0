Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94C2C77B7C
	for <kernel-janitors@archiver.kernel.org>; Wed, 31 May 2023 08:53:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234777AbjEaIxQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 31 May 2023 04:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234848AbjEaIwt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 31 May 2023 04:52:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D4AE6;
        Wed, 31 May 2023 01:52:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E6AAC62904;
        Wed, 31 May 2023 08:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AEBAC433EF;
        Wed, 31 May 2023 08:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685523167;
        bh=7blyzSvGlER5YAULyUBlu+Q1PhLaEhCVvqk8dtsJimE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B0Vk7X0y6o0Ad5WHjFxWvNXl9HBH3lMm8akSXHvdlJxWnRTAYTZTNcC1iCiF4ZhXu
         kOm8rH8UGetRujQWvbKruaxhIxAY7gZsa/5RK9HEj5d6o0j4wE/a5cg3Uba6Gv8B1x
         52NCLmtnT0lujmfJuDcHMFqTLjeGGMVpJjOO6Wo0SIzaxyncv1CUPSzmFLmThgRS+s
         Q5RSzH3zV5V1NnCX1hwOpRu3FLKjQ4G+wTtvcm8yf6988FBlkNRnQ9Y1+jjR0xp0Br
         D/lNU7yDYFsKklX+R4LeAWWCthZSIZC9SVcxi+CZJqSdLvadc/phS4Jho70lgg/0tn
         5Rj6Jjd0FpduA==
Date:   Wed, 31 May 2023 09:52:43 +0100
From:   Lee Jones <lee@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Jassi Brar <jassisinghbrar@gmail.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mailbox: mailbox-test: fix a locking issue in
 mbox_test_message_write()
Message-ID: <20230531085243.GB449117@google.com>
References: <c3b517eb-3805-48bf-be89-0082bff65913@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3b517eb-3805-48bf-be89-0082bff65913@kili.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Jassi,

On Fri, 05 May 2023, Dan Carpenter wrote:

> There was a bug where this code forgot to unlock the tdev->mutex if the
> kzalloc() failed.  Fix this issue, by moving the allocation outside the
> lock.
> 
> Fixes: 2d1e952a2b8e ("mailbox: mailbox-test: Fix potential double-free in mbox_test_message_write()")

When are you planning on sending this to the -rcs?

> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/mailbox/mailbox-test.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
> index c4a705c30331..fc6a12a51b40 100644
> --- a/drivers/mailbox/mailbox-test.c
> +++ b/drivers/mailbox/mailbox-test.c
> @@ -98,6 +98,7 @@ static ssize_t mbox_test_message_write(struct file *filp,
>  				       size_t count, loff_t *ppos)
>  {
>  	struct mbox_test_device *tdev = filp->private_data;
> +	char *message;
>  	void *data;
>  	int ret;
>  
> @@ -113,12 +114,13 @@ static ssize_t mbox_test_message_write(struct file *filp,
>  		return -EINVAL;
>  	}
>  
> -	mutex_lock(&tdev->mutex);
> -
> -	tdev->message = kzalloc(MBOX_MAX_MSG_LEN, GFP_KERNEL);
> -	if (!tdev->message)
> +	message = kzalloc(MBOX_MAX_MSG_LEN, GFP_KERNEL);
> +	if (!message)
>  		return -ENOMEM;
>  
> +	mutex_lock(&tdev->mutex);
> +
> +	tdev->message = message;
>  	ret = copy_from_user(tdev->message, userbuf, count);
>  	if (ret) {
>  		ret = -EFAULT;
> -- 
> 2.39.2
> 

-- 
Lee Jones [李琼斯]
