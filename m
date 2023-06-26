Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F077EEB64D7
	for <kernel-janitors@archiver.kernel.org>; Mon, 26 Jun 2023 07:41:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjFZHlP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 26 Jun 2023 03:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjFZHlO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Jun 2023 03:41:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 091181B1
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 00:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687765225;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0Th6Q21wltoNkgg5HCn+fk29FROJ//zlxfhb4XjFHSU=;
        b=MWdgQtvfSbOrQ8I1LJojZKLbcwYCpm3WNOdUB/8R2pfBBgk6B5JnPysSG19/RT8dPfLyMb
        /4EJzRZ9+0DOjDZq/yVesfuyfGfUJ5eorLjr4LjOvvgFBDJj6WZ6h5IT7HuowJPNgn8K6i
        YlFC1Jo/vh+IhhuHvuLmwv9QwhYkIHo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-YddPZp6MNliDGd9Vu_r-0w-1; Mon, 26 Jun 2023 03:40:23 -0400
X-MC-Unique: YddPZp6MNliDGd9Vu_r-0w-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f810b4903fso18415135e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 00:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687765222; x=1690357222;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Th6Q21wltoNkgg5HCn+fk29FROJ//zlxfhb4XjFHSU=;
        b=AHsEnYN0U5eHHC3Ihcpfey9fOH2bsOmD71pyjHQIR3P2rKiXlkjBFH+w3AcApDjlXs
         7trYSAFEycf4qiakojJUJk5LoGPacVujuVc+wSFSS8SztMIyTG4BdtkKzixt9+mi2ahZ
         LHfMj4i5hH4wa9+rwHpOxZB+3WNbGSUR+FUIFrOkXc/Ee731V1JvtONB861NTm/Jv2AL
         c51qMK6VfyXJwknhwzx1YB7wwmISSyc9RBjQrHWoGQD3fiDtn+CkZz9aVyaaOBbjX3Zh
         untX1bclDu/vVx1sRqKEVdeK6EHx7YEu9JzxXHZxOfC/ibpimEts8bI9SVhvZpA73UHn
         NX0g==
X-Gm-Message-State: AC+VfDw9pzdnN7qSIiHL7QmnUBF+Ly0ry4Zyvx7anij/koodf4Y6Xx6N
        uvAKNa2idgnJ8wOlcPPMi7cDlzhnWfYPpPZheeI+lOtq0PGxFyjzUT+j71nSQx2YR+zlGANdqkr
        fmveHVLIQndazGr0YRqOyA6vnbnNw
X-Received: by 2002:a05:600c:3782:b0:3fa:889f:e272 with SMTP id o2-20020a05600c378200b003fa889fe272mr3619806wmr.10.1687765222387;
        Mon, 26 Jun 2023 00:40:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ46RMEimKMFUMFkeJmfv9ICdxrovvDfzA7wYiA3UqdmJx5S5dsL/yuz+zbda1uD3mEG62oC/A==
X-Received: by 2002:a05:600c:3782:b0:3fa:889f:e272 with SMTP id o2-20020a05600c378200b003fa889fe272mr3619788wmr.10.1687765222092;
        Mon, 26 Jun 2023 00:40:22 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74b:7300:2ef6:6cd6:703c:e498? (p200300cbc74b73002ef66cd6703ce498.dip0.t-ipconnect.de. [2003:cb:c74b:7300:2ef6:6cd6:703c:e498])
        by smtp.gmail.com with ESMTPSA id k8-20020a7bc408000000b003f5ffba9ae1sm6739278wmi.24.2023.06.26.00.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 00:40:21 -0700 (PDT)
Message-ID: <ccbe39b7-dca1-cbc5-3344-9d906f400b6c@redhat.com>
Date:   Mon, 26 Jun 2023 09:40:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 08/26] virtio-mem: use array_size
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     keescook@chromium.org, kernel-janitors@vger.kernel.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20230623211457.102544-1-Julia.Lawall@inria.fr>
 <20230623211457.102544-9-Julia.Lawall@inria.fr>
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230623211457.102544-9-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 23.06.23 23:14, Julia Lawall wrote:
> Use array_size to protect against multiplication overflows.
> 
> The changes were done using the following Coccinelle semantic patch:
> 
> // <smpl>
> @@
>      expression E1, E2;
>      constant C1, C2;
>      identifier alloc = {vmalloc,vzalloc};
> @@
>      
> (
>        alloc(C1 * C2,...)
> |
>        alloc(
> -           (E1) * (E2)
> +           array_size(E1, E2)
>        ,...)
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>   drivers/virtio/virtio_mem.c |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)



Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

