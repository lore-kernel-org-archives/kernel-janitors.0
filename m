Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6324C433FE
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 Oct 2022 13:06:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbiJNNGK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 Oct 2022 09:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbiJNNGJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 Oct 2022 09:06:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B312A109D7C
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Oct 2022 06:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665752767;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2yLIl2GUxdjw1hchGpPbAzz/dx/oE6hKuMf6JCaP1c4=;
        b=d+SfKjyUru+/eJaFSkSw06PE1Lr+R4Vum51suMIVRSzOz6MCczNSeLHhVHouH24S3wRxA1
        /D5TzwO8xzE74TGL3qCaSzHJS7TggjWMpj6IxRR7JBIhkvJc52Q03FgG4OF10MuBTAx03k
        YKKimjZYxHqKAQwcJbPn3sslM9WwSiI=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-156-IGTEyhyeMEKd9KgYC4H9og-1; Fri, 14 Oct 2022 09:06:06 -0400
X-MC-Unique: IGTEyhyeMEKd9KgYC4H9og-1
Received: by mail-pf1-f198.google.com with SMTP id cu10-20020a056a00448a00b00562f2ff1058so2902749pfb.23
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Oct 2022 06:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2yLIl2GUxdjw1hchGpPbAzz/dx/oE6hKuMf6JCaP1c4=;
        b=sV7Rf24hbxpCuoRo47C4c8QQUrBrvrdGvznuRJ7oFkMWVCOVPDj4yvPJFz9YM3ml7J
         xeRiyRWXsFc4yVJsNYwqQYHNxQeRZgoMqwQztg853LKUMpq6PlWYYPrFAS22ANXdb5Z7
         w+l9hEEEZcRPTFJA7Rv3vkPmnFM+UTXKUKaikGIHLdoUJ9lyFCaCMsB4CatHxbJpAwyV
         Cr6LJfY9f0uBf0Nmb69R0Szm83mXHBt81cjRaQsLrjWvZ/qIfoHcFPWTGgYULdA/H8i+
         Zq1BH2R7yEYAZ3lZdNEIsDt6+IFaCff4skNaKRXcz6ObIR9T1bcKLqLci+zPY62rUuP2
         lcQg==
X-Gm-Message-State: ACrzQf0N0JJ+j+1j5Y0zhRHk3TeXT5L6PR5iME+qVHVO/qAO/zbd1c+b
        eZ7KheEWqDldYPIjklQcYRnW8COi/l+bUPirTmWYcx+2klOtla6tpwjwPaGToQMVjLADxa2hPwe
        16tKsazIFJDuXtWoK2zQnr7WKUsRLtDWGb2RddR1POIKbB65a00AFdxF38DvpVGnbV1RG7c0mOV
        LSHA==
X-Received: by 2002:a17:90b:23c5:b0:20b:1cb4:2ca9 with SMTP id md5-20020a17090b23c500b0020b1cb42ca9mr17594180pjb.139.1665752765773;
        Fri, 14 Oct 2022 06:06:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5N8y2bX9I4l2OjPbgrab8/LojaGdXeVUYqqHKbCKHIA+FYupUl5l4GOSqQYKKPnTPPOlOJww==
X-Received: by 2002:a17:90b:23c5:b0:20b:1cb4:2ca9 with SMTP id md5-20020a17090b23c500b0020b1cb42ca9mr17594120pjb.139.1665752765197;
        Fri, 14 Oct 2022 06:06:05 -0700 (PDT)
Received: from [10.72.12.247] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090322c400b0017f75654a33sm1677576plg.73.2022.10.14.06.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Oct 2022 06:06:04 -0700 (PDT)
Subject: Re: [PATCH] ceph: fix a NULL vs IS_ERR() check
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Ilya Dryomov <idryomov@gmail.com>,
        Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <Y0kttQIe0+2Rw+SP@kili>
From:   Xiubo Li <xiubli@redhat.com>
Message-ID: <4ab06613-4e98-4364-22e9-ae116d9e5c8c@redhat.com>
Date:   Fri, 14 Oct 2022 21:05:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <Y0kttQIe0+2Rw+SP@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 14/10/2022 17:36, Dan Carpenter wrote:
> The ceph_lookup_inode() function returns error pointers.  It never
> returns NULL.
>
> Fixes: aa87052dd965 ("ceph: fix incorrectly showing the .snap size for stat")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   fs/ceph/inode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
> index 4af5e55abc15..bad9eeb6a1a5 100644
> --- a/fs/ceph/inode.c
> +++ b/fs/ceph/inode.c
> @@ -2492,7 +2492,7 @@ int ceph_getattr(struct user_namespace *mnt_userns, const struct path *path,
>   			struct inode *parent;
>   
>   			parent = ceph_lookup_inode(sb, ceph_ino(inode));
> -			if (!parent)
> +			if (IS_ERR(parent))
>   				return PTR_ERR(parent);
>   
>   			pci = ceph_inode(parent);

Good catch!

Will merge it to the testing branch soon.

Thanks Dan.

- Xiubo


