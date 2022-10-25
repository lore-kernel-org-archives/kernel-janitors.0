Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AADFA373E
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 Oct 2022 10:03:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232054AbiJYKDe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 25 Oct 2022 06:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbiJYKDE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 Oct 2022 06:03:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B931AE6F43
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Oct 2022 02:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666691754;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tFghtX8+5Z9fyNGGUmcZkMnf8mhBMEpYEBcGksRdv88=;
        b=b2sbpb24PVLnUResxHNZyhSEzxVGZt6LbUuau3RdWuveEwfjQN1ko68lR5yoasfXA7qwq1
        RK2vpInsXu8SfCmX6dmqU6LbXxStc7s9G7pl7YC9hTO7yIJ/plAUgkH2YIdjjDqnrCEEIA
        5+x+9ulygmy2dqNxA2IhDpl9tZ2C6WM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670-7GMuAYlgMEWC3nielaP2xQ-1; Tue, 25 Oct 2022 05:55:51 -0400
X-MC-Unique: 7GMuAYlgMEWC3nielaP2xQ-1
Received: by mail-ed1-f72.google.com with SMTP id z11-20020a056402274b00b00461dba91468so3931006edd.6
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Oct 2022 02:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tFghtX8+5Z9fyNGGUmcZkMnf8mhBMEpYEBcGksRdv88=;
        b=MTWxpWI3PiXEi6tITAB/O6I5amPUjxYJIVoPrxo56I6Tbe2FjqHQ7N/BgyFWT/KMLf
         eiOlrFCLNdqJbGna5Zewi6beEMWWVN0h0OmpgswykUrrwHdZDreqY68DZtALGplh5WZ5
         7GJO9G1Dj7CnuNgc5mvTqcrAzN/ZaOJ1xHaL6N+TptmhcjdRwzfqYnZXHucWTvzJgQY9
         JVLz6b1UqephecZ6XSdB0bQUcQlS3zxlEAB8io2nguYB7hipqra5zPAOi44BpClQ5BhE
         tQ/ubGI/AKQqCGi1j5vbJFVX7pm+XP2qtnm/K2PSuFaNBqTsSOsPs+4R21QwJjVnw2yt
         RmeA==
X-Gm-Message-State: ACrzQf0wUf/h94QwCUJppIinOvCrKtqZOEKV7LL7+/RYwtIXG6NeWi5a
        mKn2gG0xT5rgFpVLM0XYkma8v8JlUUT9vh3518FU4TLf42WcOGHPenc102rM+ZtlJbGJNsyLPpo
        s5jYEWQC7IPFP3a9Pe6WrT9c8ldLp
X-Received: by 2002:a17:907:1ca7:b0:7a7:fc67:c85e with SMTP id nb39-20020a1709071ca700b007a7fc67c85emr8492257ejc.492.1666691750764;
        Tue, 25 Oct 2022 02:55:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6nTEpm7rexwYPAJkJJ33jDDIWe6Oh3747xhMJ+MVZs2Tv73syscStw0azryhlIMUnw8W7VGQ==
X-Received: by 2002:a17:907:1ca7:b0:7a7:fc67:c85e with SMTP id nb39-20020a1709071ca700b007a7fc67c85emr8492245ejc.492.1666691750556;
        Tue, 25 Oct 2022 02:55:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b9-20020a17090630c900b00780982d77d1sm1114659ejb.154.2022.10.25.02.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 02:55:49 -0700 (PDT)
Message-ID: <b9110803-0bbe-1a54-6a29-c5e5603dc7a6@redhat.com>
Date:   Tue, 25 Oct 2022 11:55:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] vboxsf: Remove variable out_len
Content-Language: en-US, nl
To:     Colin Ian King <colin.i.king@gmail.com>,
        linux-fsdevel@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221024164011.2173877-1-colin.i.king@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221024164011.2173877-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 10/24/22 18:40, Colin Ian King wrote:
> Variable out_len is just being incremented by nb and it's never used
> anywhere else. The variable and the increment are redundant so
> remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  fs/vboxsf/utils.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/fs/vboxsf/utils.c b/fs/vboxsf/utils.c
> index e1db0f3f7e5e..7f2838c42dcc 100644
> --- a/fs/vboxsf/utils.c
> +++ b/fs/vboxsf/utils.c
> @@ -439,7 +439,6 @@ int vboxsf_nlscpy(struct vboxsf_sbi *sbi, char *name, size_t name_bound_len,
>  {
>  	const char *in;
>  	char *out;
> -	size_t out_len;
>  	size_t out_bound_len;
>  	size_t in_bound_len;
>  
> @@ -447,7 +446,6 @@ int vboxsf_nlscpy(struct vboxsf_sbi *sbi, char *name, size_t name_bound_len,
>  	in_bound_len = utf8_len;
>  
>  	out = name;
> -	out_len = 0;
>  	/* Reserve space for terminating 0 */
>  	out_bound_len = name_bound_len - 1;
>  
> @@ -468,7 +466,6 @@ int vboxsf_nlscpy(struct vboxsf_sbi *sbi, char *name, size_t name_bound_len,
>  
>  		out += nb;
>  		out_bound_len -= nb;
> -		out_len += nb;
>  	}
>  
>  	*out = 0;

