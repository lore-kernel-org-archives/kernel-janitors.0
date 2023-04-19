Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459E8C77B73
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Apr 2023 10:22:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbjDSKWj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Apr 2023 06:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbjDSKWh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Apr 2023 06:22:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8307AAE
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 03:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681899710;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6MJWc02GF36vWFoiC/4W/mdrYHVlDhjvglDB41LlD6E=;
        b=OQKpMM+NRqSNlaEX59TTM+204Yz8uRzGOHxm5IoI24PJ58r3HltRpmFXm738A8SWkVjUxo
        EJAfxw5dDYSImBiNYCOxbQDxpsGvfmr0hasexMfl8vybKy7A8py/9l/v6iyw98wGxKQ27v
        GZ+FWCQYSLiBovm1vMsZIhd/sn29h3g=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-sLv6h9vVOliESqA8z26MlA-1; Wed, 19 Apr 2023 06:21:48 -0400
X-MC-Unique: sLv6h9vVOliESqA8z26MlA-1
Received: by mail-qt1-f197.google.com with SMTP id 17-20020ac85951000000b003e4e30c6c98so19918599qtz.19
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 03:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681899708; x=1684491708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MJWc02GF36vWFoiC/4W/mdrYHVlDhjvglDB41LlD6E=;
        b=lZSuJNhwTl8bCYtTn+hCrlZQiT/tVuYwKQCykHP3qIQF1DCdH8QEF9N92RMqzcyI4I
         IQi9sIw2BjqYHB4s+0FpEl96TTs8E7xF52hq0fouqbFh6/BQnwuvOREuS2fOCj0by14z
         YgvoHi6Efcs6Gwj80Hnr47M0IVIzrcpdHYe9y8LO7Mjmc4/Yx5A3Um5We0BM3MP6LOF3
         h0gZBtuxhbKAA+Y6Yn+Zu8Q9YDdPcWO0mvR7laTbApbXJSmD32CuUqchgui7mZucdn7/
         Vhhn1XlBL42RJIqzHEVrUhhntZ63SOPX/CsWrpTNNs59xZUQfuymK9izg+ZwLuQgQ/5U
         Ring==
X-Gm-Message-State: AAQBX9e+pFnpR+Zer6I1lQaM6OcLLhuW2+OT2mmlyvgHoUmK8BtLqxuW
        otE5vnQIqXnGVSvktCPCjZLZdKfKpKjXv5tt9rVeTaGLOWujiFaPwOhkB4WdV74ZS9yJ79z17ZR
        F/1fVI2ZAucjgES5l6QZFiUHoyp1T
X-Received: by 2002:a05:622a:181b:b0:3d0:7bdf:42c4 with SMTP id t27-20020a05622a181b00b003d07bdf42c4mr5078027qtc.59.1681899708339;
        Wed, 19 Apr 2023 03:21:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350YpAI4fcVswfakOG1UiC1eLrxoW/AQvarJ7AgPwbl3dPvN82163SakVRvB7U8Rf/LzrrxVjaQ==
X-Received: by 2002:a05:622a:181b:b0:3d0:7bdf:42c4 with SMTP id t27-20020a05622a181b00b003d07bdf42c4mr5078009qtc.59.1681899708037;
        Wed, 19 Apr 2023 03:21:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id m12-20020a05620a214c00b0074ded6ad058sm2321278qkm.129.2023.04.19.03.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 03:21:47 -0700 (PDT)
Message-ID: <1cefccb2-c3b2-8c72-6c28-c6fcae0bb2f0@redhat.com>
Date:   Wed, 19 Apr 2023 12:21:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2] KVM: arm64: Fix buffer overflow in
 kvm_arm_set_fw_reg()
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
References: <4efbab8c-640f-43b2-8ac6-6d68e08280fe@kili.mountain>
From:   Eric Auger <eric.auger@redhat.com>
In-Reply-To: <4efbab8c-640f-43b2-8ac6-6d68e08280fe@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 4/19/23 12:16, Dan Carpenter wrote:
> The KVM_REG_SIZE() comes from the ioctl and it can be a power of two
> between 0-32768 but if it is more than sizeof(long) this will corrupt
> memory.
>
> Fixes: 99adb567632b ("KVM: arm/arm64: Add save/restore support for firmware workaround state")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: The original patch was okay but checking for != sizeof(val) is
>     stricter and more Obviously Correct[tm].  Return -ENOENT instead of
>     -EINVAL in case future ioctls are added which take a different size.
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
>
>  arch/arm64/kvm/hypercalls.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
> index 2e16fc7b31bf..7fb4df0456de 100644
> --- a/arch/arm64/kvm/hypercalls.c
> +++ b/arch/arm64/kvm/hypercalls.c
> @@ -544,6 +544,8 @@ int kvm_arm_set_fw_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  	u64 val;
>  	int wa_level;
>  
> +	if (KVM_REG_SIZE(reg->id) != sizeof(val))
> +		return -ENOENT;
>  	if (copy_from_user(&val, uaddr, KVM_REG_SIZE(reg->id)))
>  		return -EFAULT;
>  

