Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677EEC433ED
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Apr 2021 23:54:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37B4E613BE
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Apr 2021 23:54:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344829AbhDFXyZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Apr 2021 19:54:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25050 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344778AbhDFXyY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Apr 2021 19:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617753256;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Z9Bynhk5jx9PpUNdN9ForbiWm+KTPR+Iguq3N1bBzvE=;
        b=L2KsMbGcy0Po0DMLxH6Q/j2VhBbC60kjw1WKl8/orDDyTIg0+HQJex1mqjempGoG6NY6iw
        wGWX38H7zsyjBN1bMW2Dhq7Pyku0klm5O+WZa04Euu0OOMoAd/kZGji1sSdU9ZPnU5r92I
        sxYNVnry6IjzSt+g/RR1s3fiBwJGmLY=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-Knr-kGyvO1et1bjEM1RV3g-1; Tue, 06 Apr 2021 19:54:14 -0400
X-MC-Unique: Knr-kGyvO1et1bjEM1RV3g-1
Received: by mail-pf1-f198.google.com with SMTP id n8so11625407pfd.23
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Apr 2021 16:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z9Bynhk5jx9PpUNdN9ForbiWm+KTPR+Iguq3N1bBzvE=;
        b=BE/cW79pZV46sGJSM6yH+pDgLLL4a64FRG1Vb9ql6YNf7LRlRUO6d1OLxTZg4g59dD
         Ec4Uqz0Wi0prhwmnq3MMwx5is4jJiMpB7yHKwgzjmgSJ2/hi4kpLIPHmMejQ0Ml3TjXB
         fzxW65d4iOkw7hReuA+LzquvA5eawgjKseVELoaP+NqOLbysj0Ibdw+8MAAifa1jiE2R
         yYMC34Gd0l/UBEqj6mcEiT/rwTrpnqp32Ulig9CVzeeKO4qZA51T1zEVSGeVrv2ZmbF/
         XyUcjiqdGaWCh+Wkqn4rqmILck7udSmBwN+4nmFgywjr2FXn2J5oTwImau8c8xlr7jLw
         /tDQ==
X-Gm-Message-State: AOAM5339X0GaITsZwieJypWJD88DtxKNECzdY8Uq7BFZUmpKK6Vz80T2
        sQezbXmJiuIYMz/RmUOg4UrGYhX61nuh9PtEQBErraI4vHA4WsTipZip8O4sVsTk7hCWzrbQN7y
        gsbAdpRekBC+ohuH1mc68y2N5RnNj
X-Received: by 2002:a17:90a:8907:: with SMTP id u7mr607115pjn.114.1617753253129;
        Tue, 06 Apr 2021 16:54:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvaMBT8JgaLEReC0ssyotJOmen93GjLT0Sh1CDVdMUhYnY+Tzw3Y4/zdNqq/R55VEG7Om6rw==
X-Received: by 2002:a17:90a:8907:: with SMTP id u7mr607098pjn.114.1617753252878;
        Tue, 06 Apr 2021 16:54:12 -0700 (PDT)
Received: from xiangao.remote.csb ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id u17sm3263331pjx.10.2021.04.06.16.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 16:54:12 -0700 (PDT)
Date:   Wed, 7 Apr 2021 07:54:01 +0800
From:   Gao Xiang <hsiangkao@redhat.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
        linux-erofs@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] erofs: fix uninitialized variable i used in a
 while-loop
Message-ID: <20210406235401.GA210667@xiangao.remote.csb>
References: <20210406162718.429852-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210406162718.429852-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin,

On Tue, Apr 06, 2021 at 05:27:18PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The while-loop iterates until src is non-null or i is 3, however, the
> loop counter i is not intinitialied to zero, causing incorrect iteration
> counts.  Fix this by initializing it to zero.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 1aa5f2e2feed ("erofs: support decompress big pcluster for lz4 backend")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thank you very much for catching this! It looks good to me,
Reviewed-by: Gao Xiang <hsiangkao@redhat.com>

(btw, may I fold this into the original patchset? since such big pcluster
 patchset is just applied to for-next for further integration testing, and
 the commit id is not stable yet..)

Thanks,
Gao Xiang

> ---
>  fs/erofs/decompressor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/erofs/decompressor.c b/fs/erofs/decompressor.c
> index fe46a9c34923..8687ff81406b 100644
> --- a/fs/erofs/decompressor.c
> +++ b/fs/erofs/decompressor.c
> @@ -154,6 +154,7 @@ static void *z_erofs_handle_inplace_io(struct z_erofs_decompress_req *rq,
>  	}
>  	kunmap_atomic(inpage);
>  	might_sleep();
> +	i = 0;
>  	while (1) {
>  		src = vm_map_ram(rq->in, nrpages_in, -1);
>  		/* retry two more times (totally 3 times) */
> -- 
> 2.30.2
> 

