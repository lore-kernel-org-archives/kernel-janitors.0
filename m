Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42A9C001B0
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Aug 2023 14:43:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234740AbjHGOn4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Aug 2023 10:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233976AbjHGOnz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Aug 2023 10:43:55 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 855E010FC
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Aug 2023 07:43:53 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5230f8da574so1732664a12.3
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Aug 2023 07:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691419432; x=1692024232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L1PRpPGj/okj0DH5NoLyIrETcRf3Xmh3P5Svli7tqw0=;
        b=n8W/IB+waUCBHlDebG2sL7PwDbHqSKrYnLX2qCQEfAa+yjZ1toRcI6O1vv/I8vwZYM
         2dz0WRe+/QSuxjNHa7dTgrgXx6SS2aHEs1126bU4sgoh4mT7MYhNNhVB9UPxtJx7xbsW
         WrYzYEkflwJQbBWtLcEyiLWXilVqBqqMSvsmgZZtOcoMJDxedbtx5EIJ96mh0H5GyX9u
         S+bp9T2oPlhoutNv1YMmPe9+gfxCPqEEy2faFVy+zQ2NqnNPr+FOOM8XQ/cI8JM2CpXQ
         tGw54Hh462P9nHaApd2X6OsPzK4T1mdtVW2EmLNp1A5EP+f25Z1YDfAd90pIZZ+8+OYC
         VyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691419432; x=1692024232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1PRpPGj/okj0DH5NoLyIrETcRf3Xmh3P5Svli7tqw0=;
        b=Xk7SB6ne0jPyEZHNvaxpkxNy5u+qkXuxsAc8lezj4wvEu09Px+yNh+/7TgGuqRe3vN
         X73hnq+i28UC0HU3QveTx4Z+01rEI9GShYr0ts6V5bT8TeL2g1s6EU1RYteZFCc6EIHI
         N6DdS7ooKQxs7I3Czbfky1jXklVqX6jADH6UB2yofoMWbp6CquChQ+7ZIo/wfnnYWlnY
         hgKzwQI0qBv5Dq3Y1ldBShVhtzngZX8IZczbQddg7kpdlJPS1eAQ5F1LVbruFpny3epY
         08XNNmSqRkWX8WDb/5QltB8nt0jXTHPmlwBBmTxBl/v19jzQ3iX1JJ4qC/DLM6h7aNxs
         A5kw==
X-Gm-Message-State: AOJu0YwH7d4qIFZVb3eBYnPcykixg0C9dcv1xTKldWG/WGaCjE5/PXtf
        BvS4oRMEsXADzvuVNZ9P54SeTw==
X-Google-Smtp-Source: AGHT+IE/RsFkKCYso/wVpSORIJMMxCGv+JpBmuVOlZM5EjWw1Xq0EXFbSQ5WqyohLcqr7jwCYL42jA==
X-Received: by 2002:a17:906:5388:b0:99c:3b4:9407 with SMTP id g8-20020a170906538800b0099c03b49407mr7054887ejo.5.1691419432026;
        Mon, 07 Aug 2023 07:43:52 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
        by smtp.gmail.com with ESMTPSA id l7-20020a1709066b8700b0099c53c4407dsm5326347ejr.78.2023.08.07.07.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 07:43:51 -0700 (PDT)
Date:   Mon, 7 Aug 2023 17:43:47 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v5] accel/qaic: tighten integer overflow checking in
 map_user_pages()
Message-ID: <67e728b4-7d3f-447d-bbaa-2f69f65bb63e@kadam.mountain>
References: <e6cbc8a3-c2ae-46be-a731-494470c0a21c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6cbc8a3-c2ae-46be-a731-494470c0a21c@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Aug 07, 2023 at 05:09:34PM +0300, Dan Carpenter wrote:
> The encode_dma() function has some validation on in_trans->size but it's
> not complete and it would be more clear to move those checks to
> find_and_map_user_pages().
> 
> The encode_dma() had two checks:
> 
> 	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
> 		return -EINVAL;
> 
> It's not sufficeint to just check if in_trans->size is zero.  The
> resources->xferred_dma_size variable represent the number of bytes
> already transferred.  If we have already transferred more bytes than
> in_trans->size then there are negative bytes remaining which doesn't
> make sense.  Check for that as well.
> 
> I introduced a new variable "remaining" which represents the amount
> we want to transfer (in_trans->size) minus the ammount we have already
> transferred (resources->xferred_dma_size).
> 
> The check in encode_dma() checked that "addr + size" could not overflow
> however we may already have transferred some bytes so the real starting
> address is "xfer_start_addr" so check that "xfer_start_addr + size"
> cannot overflow instead.  Also check that "addr +
> resources->xferred_dma_size cannot overflow.
> 
> My other concern was that we are dealing with u64 values but on 32bit
> systems the kmalloc() function will truncate the sizes to 32 bits.  So
> I calculated "total = in_trans->size + offset_in_page(xfer_start_addr);"
> and returned -EINVAL if it were >= SIZE_MAX.  This will not affect 64bit
> systems.
> 
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> This is re-write re-write of the previous version.
> 
> I am not necessarily sure it is correct.  Please review carefully.  In
> particular, please check how "total" is calculated.  Maybe it would make
> more sense to write that as:
> 
> 	total = remaining + offset_in_page(xfer_start_addr);
> 
> The other question I had is should we add a check:
> 
> 	if (remaining == 0)
> 		return 0;
> 
>  drivers/accel/qaic/qaic_control.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
> index cfbc92da426f..d64505bcf4ae 100644
> --- a/drivers/accel/qaic/qaic_control.c
> +++ b/drivers/accel/qaic/qaic_control.c
> @@ -392,18 +392,28 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
>  				   struct qaic_manage_trans_dma_xfer *in_trans,
>  				   struct ioctl_resources *resources, struct dma_xfer *xfer)
>  {
> +	u64 xfer_start_addr, remaining, end, total;
>  	unsigned long need_pages;
>  	struct page **page_list;
>  	unsigned long nr_pages;
>  	struct sg_table *sgt;
> -	u64 xfer_start_addr;
>  	int ret;
>  	int i;
>  
> -	xfer_start_addr = in_trans->addr + resources->xferred_dma_size;
> +	if (check_add_overflow(in_trans->addr, resources->xferred_dma_size, &xfer_start_addr))
> +		return -EINVAL;
> +
> +	if (in_trans->size == 0 ||
> +	    in_trans->size < resources->xferred_dma_size ||
> +	    check_add_overflow(xfer_start_addr, in_trans->size, &end))
                                                ^^^^^^^^^^^^^^
This should be remaining.  So maybe it should be something like this
with a return 0 for no bytes remaining and total calculated differently.

	if (check_add_overflow(in_trans->addr, resources->xferred_dma_size, &xfer_start_addr))
		return -EINVAL;

	if (in_trans->size < resources->xferred_dma_size)
		return -EINVAL;
	remaining = in_trans->size - resources->xferred_dma_size;
	if (remaining == 0)
		return 0;

	if (check_add_overflow(xfer_start_addr, remaining, &end))
		return -EINVAL;

	/* Still not really sure why total is calculated this way */
	total = remaining + offset_in_page(xfer_start_addr);
	if (total >= SIZE_MAX)
		return -EINVAL;

	need_pages = DIV_ROUND_UP(total, PAGE_SIZE);

regards,
dan carpenter

> +		return -EINVAL;
>  
> -	need_pages = DIV_ROUND_UP(in_trans->size + offset_in_page(xfer_start_addr) -
> -				  resources->xferred_dma_size, PAGE_SIZE);
> +	remaining = in_trans->size - resources->xferred_dma_size;
> +	total = in_trans->size + offset_in_page(xfer_start_addr);
> +	if (total >= SIZE_MAX)
> +		return -EINVAL;
> +
> +	need_pages = DIV_ROUND_UP(total - resources->xferred_dma_size, PAGE_SIZE);
>  
>  	nr_pages = need_pages;
>  
> @@ -435,7 +445,7 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
>  
>  	ret = sg_alloc_table_from_pages(sgt, page_list, nr_pages,
>  					offset_in_page(xfer_start_addr),
> -					in_trans->size - resources->xferred_dma_size, GFP_KERNEL);
> +					remaining, GFP_KERNEL);
>  	if (ret) {
>  		ret = -ENOMEM;
>  		goto free_sgt;
> @@ -566,9 +576,6 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
>  	    QAIC_MANAGE_EXT_MSG_LENGTH)
>  		return -ENOMEM;
>  
> -	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
> -		return -EINVAL;
> -
>  	xfer = kmalloc(sizeof(*xfer), GFP_KERNEL);
>  	if (!xfer)
>  		return -ENOMEM;
> -- 
> 2.39.2
