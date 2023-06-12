Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9D0C7EE25
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Jun 2023 11:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238620AbjFLLJD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Jun 2023 07:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237644AbjFLLIr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Jun 2023 07:08:47 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A5F3C07
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 03:57:31 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f70fc4682aso28697495e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 03:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686567450; x=1689159450;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W3kmvUAfNo3YbORL99wyB9d/VkxQG+CDQISNkS7AYFY=;
        b=LbtlzcSpmCCuP4cm7gDwerVL1WTk9KNh06oHq9A0mwZTE4G+ZpxLqhwilrdo/3hoo3
         QsUrFkAy/k/STcQupiaxgaWtgyIMwXENuCeVNBBnp+k+W5tGENmphRRzKVgZx7C3okm5
         T4EfzBjd40y5kX4ueOq4j1qRqqJmz+tKshdmXy1KaYIfecHsq9EpUpIUj7HKheeRngPw
         sdMu/QClAIkcDd6hzSAdtFk3MLofcdiUtQvVd47tgEuRU8z2vbyyKm21EleT/OEidl64
         Yxdi9vCi7wltWFQfSolkQYjGOmeqxT1OoCStSey2VhEsxB2fyZu7F6cmjSe2fvngWv0K
         5Oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686567450; x=1689159450;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W3kmvUAfNo3YbORL99wyB9d/VkxQG+CDQISNkS7AYFY=;
        b=HJq5Z+3Y46Ixx+vX4S/drkodAVeB7VV+gRnh08gJXD43Z1RyjBrhgsa9DKpEpkCNd9
         Ru20yKMhAyvu6JD2l02F+XV3g/Iht1kN9Fd1n12b7PFPq6gbOPkGcdhJMGdgcZWKw0pR
         7LnNStVCF6HB66Qp50WDkrzrODl85pvJfkBmfuKCGFh97lJ+f57kHa3/S4tXJzjp8Xrj
         s7rGTEB/yXkemEQf9gcEepQmxScDG4BMcWfmRr6Marex2pDh5vr3wWKZgh7ChB2Dh7z+
         uO7yGg4DqkWPnDk1gNiUhUYkDBrjTSWNVbAvxj076kyt5EnHUDXGchjsgW57cfqkO4My
         1dow==
X-Gm-Message-State: AC+VfDzAPufda2l7kEkpdBN2DyiKHpKT5Om4jzC6fUsKGPwybUS0Md5y
        Uqu0+QIBHlu/BYRufmpp+HQ40Q==
X-Google-Smtp-Source: ACHHUZ66P2FM5CekuhNr41io1xfJ2KVdwDqa0FLk9jJsHmsoS/bE3S3iqKRvLRp1yuUtDYfNOlpO/g==
X-Received: by 2002:a1c:f718:0:b0:3f7:3526:d96f with SMTP id v24-20020a1cf718000000b003f73526d96fmr5775811wmh.27.1686567450090;
        Mon, 12 Jun 2023 03:57:30 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id gy15-20020a05600c880f00b003f7f475c3bcsm14697856wmb.1.2023.06.12.03.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 03:57:29 -0700 (PDT)
Message-ID: <b65f4d0b-cc2a-f4d6-5d9d-a14e6a9cc444@linaro.org>
Date:   Mon, 12 Jun 2023 11:57:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] misc: fastrpc: Fix double free of 'buf' in error path
Content-Language: en-US
To:     Sukrut Bellary <sukrut.bellary@linux.com>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230602113602.1271695-1-sukrut.bellary@linux.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230602113602.1271695-1-sukrut.bellary@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 02/06/2023 12:36, Sukrut Bellary wrote:
> smatch warning:
> drivers/misc/fastrpc.c:1926 fastrpc_req_mmap() error: double free of 'buf'
> 
> In fastrpc_req_mmap() error path, the fastrpc buffer is freed in
> fastrpc_req_munmap_impl() if unmap is successful.
> 
> But in the end, there is an unconditional call to fastrpc_buf_free().
> So the above case triggers the double free of fastrpc buf.
> 
> Fixes: 72fa6f7820c4 ("misc: fastrpc: Rework fastrpc_req_munmap")
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Not sure how was this reviewed-by picked up on this patch.

Suggested-by will be a right choice here.

Will manually edit before applying it.

--srini

> Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>
> ---
> This is based on static analysis. Compilation tested.
> ---
> Changes in v2:
> - Fixed the commit message.
> - Addressed the review comment about deleting buf from the list
>    before freeing.
> - Link to v1: https://lore.kernel.org/all/20230518100829.515143-1-sukrut.bellary@linux.com/
> ---
>   drivers/misc/fastrpc.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index f48466960f1b..b3b520fcfb75 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1882,7 +1882,8 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>   				      &args[0]);
>   	if (err) {
>   		dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
> -		goto err_invoke;
> +		fastrpc_buf_free(buf);
> +		return err;
>   	}
>   
>   	/* update the buffer to be able to deallocate the memory on the DSP */
> @@ -1922,8 +1923,6 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>   
>   err_assign:
>   	fastrpc_req_munmap_impl(fl, buf);
> -err_invoke:
> -	fastrpc_buf_free(buf);
>   
>   	return err;
>   }
