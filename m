Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DA0E95A77
	for <kernel-janitors@archiver.kernel.org>; Sun,  8 Oct 2023 00:22:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344250AbjJHAWn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 7 Oct 2023 20:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344227AbjJHAWl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 7 Oct 2023 20:22:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC98EB6
        for <kernel-janitors@vger.kernel.org>; Sat,  7 Oct 2023 17:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696724514;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DbSfTUAEYDCU58vDmK84BW1S9S18QBjaTWpuTWyjJJ4=;
        b=ZhbhweMJQC8PAL7j4WbufWbiLa7wWW+aKq/yAf3BhJRYZ7Jg9pk9TTQtUt0ZONZ+9mg9te
        uYd6F/7B7p+KwIWF9mdK2NBITeirad3y9Mfd5ArwklMaiJKG1r/ThDBL+xPHle78WiZjKN
        lhnTM1HgzM05IbyTWa1opepJikxQvdg=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-Q7SLDShUPHWUuhQvCTUMAg-1; Sat, 07 Oct 2023 20:21:52 -0400
X-MC-Unique: Q7SLDShUPHWUuhQvCTUMAg-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1c5fea3139dso29811025ad.3
        for <kernel-janitors@vger.kernel.org>; Sat, 07 Oct 2023 17:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696724511; x=1697329311;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DbSfTUAEYDCU58vDmK84BW1S9S18QBjaTWpuTWyjJJ4=;
        b=TNu+fyj4ZcXrTAPnhNU2eTCVK9EY2fq+oU6mTEPdwYXZOJrxeczBxhRxiILaW0ewz0
         GWuOlMdZqRg/ivlbg8eXMkkbUVIMQZOlwLsmMrh3k13kRle95U3hHfzqrQ3CM6ICh4/d
         9IFikiKPy27nv1PEudZdN9XzrzQcafXeXPMBCNDZrRyQypOLcjj9zYHBcdQrQEmo15HT
         vU9LGxLUN+I9EjcaTWn7vEEnixD4qC0p7Q2vED6Q9Q9jj5pk2xtBeDWUdu16UNQD5JO5
         yiajf3iYiD8YEnNZ1JSS6ocWKS+hXldUsaeOm1unxus6yRzkofSIvMUq6PnkCYLIo9k+
         67YA==
X-Gm-Message-State: AOJu0YzxqjjsdMfZRX3x2OiqtBhreMZfmSj56TvskffJkj9psVdXxYgr
        7noIgPMZwAW/fD7MRTl/GpzFf5PBrwEGJvVpq6DmWn0YLlcG/cZUnV5koss7BjnpF+Vpgg4rSME
        s0Y6rKrA53YZP+tfR/JNw8CwnMq0Z
X-Received: by 2002:a17:902:bf0c:b0:1bc:3944:9391 with SMTP id bi12-20020a170902bf0c00b001bc39449391mr9818208plb.25.1696724511698;
        Sat, 07 Oct 2023 17:21:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNGTmBIqGaiEfqliWefpMvSkpkJYgmXVVhgSkUzxFdxhaevcRlDDFL5Hy5rLo6WWtkAs2Kpg==
X-Received: by 2002:a17:902:bf0c:b0:1bc:3944:9391 with SMTP id bi12-20020a170902bf0c00b001bc39449391mr9818201plb.25.1696724511363;
        Sat, 07 Oct 2023 17:21:51 -0700 (PDT)
Received: from [10.72.112.95] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id jf2-20020a170903268200b001c736370245sm6502391plb.54.2023.10.07.17.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Oct 2023 17:21:50 -0700 (PDT)
Message-ID: <a86080f4-3a40-8ae2-9bc5-9859298b7cbb@redhat.com>
Date:   Sun, 8 Oct 2023 08:21:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ceph: fix type promotion bug on 32bit systems
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Luis Henriques <lhenriques@suse.com>
Cc:     Ilya Dryomov <idryomov@gmail.com>,
        Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <5e0418d3-a31b-4231-80bf-99adca6bcbe5@moroto.mountain>
From:   Xiubo Li <xiubli@redhat.com>
In-Reply-To: <5e0418d3-a31b-4231-80bf-99adca6bcbe5@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 10/7/23 16:52, Dan Carpenter wrote:
> In this code "ret" is type long and "src_objlen" is unsigned int.  The
> problem is that on 32bit systems, when we do the comparison signed longs
> are type promoted to unsigned int.  So negative error codes from
> do_splice_direct() are treated as success instead of failure.
>
> Fixes: 1b0c3b9f91f0 ("ceph: re-org copy_file_range and fix some error paths")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> 32bit is so weird and ancient.  It's strange to think that unsigned int
> has more positive bits than signed long.
>
>   fs/ceph/file.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ceph/file.c b/fs/ceph/file.c
> index b1da02f5dbe3..b5f8038065d7 100644
> --- a/fs/ceph/file.c
> +++ b/fs/ceph/file.c
> @@ -2969,7 +2969,7 @@ static ssize_t __ceph_copy_file_range(struct file *src_file, loff_t src_off,
>   		ret = do_splice_direct(src_file, &src_off, dst_file,
>   				       &dst_off, src_objlen, flags);
>   		/* Abort on short copies or on error */
> -		if (ret < src_objlen) {
> +		if (ret < (long)src_objlen) {
>   			dout("Failed partial copy (%zd)\n", ret);
>   			goto out;
>   		}

Good catch and makes sense to me.

I also ran a test in 64bit system, the output is the same too:

int x = -1
unsigned int y = 2
x > y

Reviewed-by: Xiubo Li <xiubli@redhat.com>

Thanks

- Xiubo

