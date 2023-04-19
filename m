Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB100C77B73
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Apr 2023 08:53:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbjDSIx0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Apr 2023 04:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbjDSIxY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Apr 2023 04:53:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA17C4220
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 01:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681894357;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MfypgQsAQvvSjwfduKvBH962yEP7d/91W52VY+6PCr0=;
        b=MXGuNgnzUkS9CTbAsu9BJ0C2geHj0lkdy00Lb4g42vZ2Dbr/hoIyX7t4qtOTm8SIw7TTne
        WwFBNRBI7mP4ePss1+H35BawjYIN6l+qV+OxLT0AW9yHpOmdsiXX8tmcK5d0ehxmqsq/io
        0wWV63D6qJCC0h4k4c2zPpVGnB8bOj4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-SglVqmGOOqK82lKwqlLkaQ-1; Wed, 19 Apr 2023 04:52:36 -0400
X-MC-Unique: SglVqmGOOqK82lKwqlLkaQ-1
Received: by mail-wm1-f71.google.com with SMTP id p34-20020a05600c1da200b003f175d06dfcso2383809wms.2
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 01:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681894354; x=1684486354;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfypgQsAQvvSjwfduKvBH962yEP7d/91W52VY+6PCr0=;
        b=N65X9otU5tNAjDeVUYGEAVbIz0FD/OlExRBaVPOze2Vg9woATq/w2OBb/TCHFeHy+S
         +AoUyiggZxbLW7kTTEtrswYgC+r9D7aGBvp8DtqumSJLeK1N2nplU7KjBW9CEzNga0Ns
         d8G2y4NccJrVhFRPyirf7WVAQS/QymA/AVoSxSGa14rtFYhiVCTHGtxYqrnSNkG2t53q
         t7WKthk6ErOSWjrC51OgoTObVZaqPi/wHySGkzTYiX9qmiuPuIVowGRUaiHoy8qyD5Uo
         KFvX/UqYY/6aRpiZffLytQ9F56cTWrUygJljwjgyelMunfc1AoxiHmaKs7QDeq/49MGP
         w8bA==
X-Gm-Message-State: AAQBX9dYh2kv3ViHbJN7lXr49Qns4H4KnVvlFg+3snEM+h725NLA7SkR
        5AxcxOlop47SQGKrSkjwZO67YwDQx0792uDlRE0V3grF3MhnSevDkoY4+xeqfrhmtHv2o7HIpb9
        MFFarWmZT1TIHymT9nrEKRRyo3eHbj7wOpJY1
X-Received: by 2002:a7b:cb06:0:b0:3ed:af6b:7fb3 with SMTP id u6-20020a7bcb06000000b003edaf6b7fb3mr16716918wmj.2.1681894354705;
        Wed, 19 Apr 2023 01:52:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZQnCD49jcyev3aaN5LzVuV1X+Aeh6G7SGm7l6bRVobSz0tb5+piU6WxZjxdgpFEG0DgimvJw==
X-Received: by 2002:a7b:cb06:0:b0:3ed:af6b:7fb3 with SMTP id u6-20020a7bcb06000000b003edaf6b7fb3mr16716897wmj.2.1681894354443;
        Wed, 19 Apr 2023 01:52:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c228400b003f17e79d74asm1525878wmf.7.2023.04.19.01.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 01:52:33 -0700 (PDT)
Message-ID: <efa8edbb-c964-0552-8cd7-faf1b2c83cca@redhat.com>
Date:   Wed, 19 Apr 2023 10:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH] KVM: arm64: Fix buffer overflow in kvm_arm_set_fw_reg()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     Oliver Upton <oliver.upton@linux.dev>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Steven Price <steven.price@arm.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kernel-janitors@vger.kernel.org
References: <ab7b9caf-5c90-4616-8517-b38637293639@kili.mountain>
From:   Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ab7b9caf-5c90-4616-8517-b38637293639@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On 4/19/23 10:06, Dan Carpenter wrote:
> The KVM_REG_SIZE() comes from the ioctl and it can be a power of two
> between 0-32768 but if it is more than sizeof(long) this will corrupt
> memory.
>
> Fixes: 99adb567632b ("KVM: arm/arm64: Add save/restore support for firmware workaround state")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> ---
>  arch/arm64/kvm/hypercalls.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
> index 2e16fc7b31bf..4f5767fcaca5 100644
> --- a/arch/arm64/kvm/hypercalls.c
> +++ b/arch/arm64/kvm/hypercalls.c
> @@ -544,6 +544,8 @@ int kvm_arm_set_fw_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  	u64 val;
>  	int wa_level;
>  
> +	if (KVM_REG_SIZE(reg->id) > sizeof(val))
> +		return -EINVAL;
>  	if (copy_from_user(&val, uaddr, KVM_REG_SIZE(reg->id)))
>  		return -EFAULT;
>  

