Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E2FC433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 22 Apr 2022 11:36:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383863AbiDVLjd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 22 Apr 2022 07:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242181AbiDVLjd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 Apr 2022 07:39:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 645632AE2A
        for <kernel-janitors@vger.kernel.org>; Fri, 22 Apr 2022 04:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650627399;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rfEjtIKSL4He+pHPZ91gOLL5Y9n9DhaWPlm2XzzRFok=;
        b=ZzUM+QKTJ5WomG47FuJ7beAw/qy4JTyQqsPHlU7RvRfmDWLaogVn0fZ3E3JNXm9VJFgA/4
        /m8/Jt2x9y93KThjOdUsiXeTeb20C+B/FCqxHd8CPdOKbWfYY0VUrIVOJGNqS5eaZlSnQJ
        I+wwboVI1RdBf+c6Xr5c56ddE8OfUIY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77--emEpoa4OnKPTDdYPBqaCQ-1; Fri, 22 Apr 2022 07:36:38 -0400
X-MC-Unique: -emEpoa4OnKPTDdYPBqaCQ-1
Received: by mail-qk1-f199.google.com with SMTP id m23-20020a05620a221700b006809e1fa4fdso5202766qkh.6
        for <kernel-janitors@vger.kernel.org>; Fri, 22 Apr 2022 04:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rfEjtIKSL4He+pHPZ91gOLL5Y9n9DhaWPlm2XzzRFok=;
        b=C6s6kvUCjBQhJWS0xRIXqYDewPXGi3tawLRLhDvfCBfYZujhczGkrlf1B2+mBpivNj
         66fkFYy2+IgD8PHDVCE0GIoL4CnsCi0kXE/AMf2/SLbdb0BWbn11lPgJbv5l1FGejGHN
         XZDw1oGe2GZmegvGJnmOlV/Xl5PVNFSpRB9UWo6MDLXEydpASwFzq4De5SNs76bY4w+0
         JdhzKbVIh4qsaovgdtbd/dbI+Y7c9aXDk0mTvUUwli/FW1NXDz9jBVOQnNVNqvk/7V5a
         G6OzquxepaHeg7zLZE319WuZhrUMmV22uY9P83QBcmNL3NnM+i6YGJrFITq+Iy7cioCZ
         0JJQ==
X-Gm-Message-State: AOAM5305TTiy30dvusEcmLWBsXVf7UDGh+cWO6usRcW8Z6lp1YywvLpp
        9QY/tEakHEwt1KSKZ2wgqAL814urKWmDN6ih/XuPyzDbUp5fhN9jBynGhtID1jo1RX7DBRgcW4c
        OvoSRIh/9/gihSaDOi+xWIGGYbDtN
X-Received: by 2002:a05:620a:1654:b0:69c:7035:b31f with SMTP id c20-20020a05620a165400b0069c7035b31fmr2297897qko.546.1650627397808;
        Fri, 22 Apr 2022 04:36:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGQvyIHXFTiMJN4w9uTECim1QktNe4yTDbMmuBGoP1GUhkjlyryqtd5m7Ebl2PkbUXwitfjA==
X-Received: by 2002:a05:620a:1654:b0:69c:7035:b31f with SMTP id c20-20020a05620a165400b0069c7035b31fmr2297886qko.546.1650627397596;
        Fri, 22 Apr 2022 04:36:37 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id h75-20020a379e4e000000b0069db8210ffbsm791750qke.12.2022.04.22.04.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 04:36:37 -0700 (PDT)
Subject: Re: [PATCH] kernel/irq/matrix.c: remove redundant assignment to
 variable 'end'
To:     Colin Ian King <colin.i.king@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
References: <20220422110418.1264778-1-colin.i.king@gmail.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <8016b196-6a39-8808-b1ff-286aacb2c8ca@redhat.com>
Date:   Fri, 22 Apr 2022 04:36:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220422110418.1264778-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 4/22/22 4:04 AM, Colin Ian King wrote:
> Variable end is being initialized with a value that is never read, it
> is being re-assigned later with the same value. The initialization is
> redundant and can be removed.
>
> Cleans up clang scan build warning:
> kernel/irq/matrix.c:289:25: warning: Value stored to 'end' during its
> initialization is never read [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   kernel/irq/matrix.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/irq/matrix.c b/kernel/irq/matrix.c
> index bbfb26489aa1..1698e77645ac 100644
> --- a/kernel/irq/matrix.c
> +++ b/kernel/irq/matrix.c
> @@ -286,7 +286,7 @@ void irq_matrix_remove_managed(struct irq_matrix *m, const struct cpumask *msk)
>   int irq_matrix_alloc_managed(struct irq_matrix *m, const struct cpumask *msk,
>   			     unsigned int *mapped_cpu)
>   {
> -	unsigned int bit, cpu, end = m->alloc_end;
> +	unsigned int bit, cpu, end;
Reviewed-by: Tom Rix <trix@redhat.com>
>   	struct cpumap *cm;
>   
>   	if (cpumask_empty(msk))

