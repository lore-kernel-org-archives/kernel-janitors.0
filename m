Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B66BC7EE22
	for <kernel-janitors@archiver.kernel.org>; Wed, 10 May 2023 13:35:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237151AbjEJNf0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 10 May 2023 09:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237147AbjEJNfZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 10 May 2023 09:35:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BFD661B2;
        Wed, 10 May 2023 06:35:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CE1206115D;
        Wed, 10 May 2023 13:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30192C433EF;
        Wed, 10 May 2023 13:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683725716;
        bh=rvr/wktaXUQdbZyUNVM6L1zlwE98uUFOn7vnuHwakgo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PMx8eQdEgir55rrWh8cmLsVWjb9ETd1apymlvypdlcEhNjP3uJuBNRKo/V6+VQYaN
         VjuHIT/udJGZml2gcO1Gr0UDifQWm6Lk9M0s84e8by3b5YOSXT0U5W3s4e1wp4PMDP
         AJo7UiSVXIjj0bikAQeVvmKq3sFL3+6FTm/hCm4wUdLtFoEMiiDzMkF/ljGQ+7DmJx
         6I6eBDMokdyiK9rFpMu//KNlNWmZlcQnIzIvsfnK6g3yv2J1kRzwlKQYSX/T6Pzpcj
         wI8jfA8VHThRRWzpvL5pPoyDQzt+qsGu8Hrxq3doy3g5fuSBxX4iJuubz4cBSbx2oa
         x2BQBfUzygPfw==
Date:   Wed, 10 May 2023 14:35:11 +0100
From:   Lee Jones <lee@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Jassi Brar <jassisinghbrar@gmail.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mailbox: mailbox-test: fix a locking issue in
 mbox_test_message_write()
Message-ID: <20230510133511.GB8963@google.com>
References: <c3b517eb-3805-48bf-be89-0082bff65913@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3b517eb-3805-48bf-be89-0082bff65913@kili.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Good catch, thanks Dan.

On Fri, 05 May 2023, Dan Carpenter wrote:

> There was a bug where this code forgot to unlock the tdev->mutex if the
> kzalloc() failed.  Fix this issue, by moving the allocation outside the
> lock.
> 
> Fixes: 2d1e952a2b8e ("mailbox: mailbox-test: Fix potential double-free in mbox_test_message_write()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/mailbox/mailbox-test.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Lee Jones <lee@kernel.org>

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
