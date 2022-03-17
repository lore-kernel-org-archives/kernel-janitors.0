Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B52AC433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 17 Mar 2022 16:00:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234261AbiCQQCN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 17 Mar 2022 12:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233224AbiCQQCK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 17 Mar 2022 12:02:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1D4091B60BF
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Mar 2022 09:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647532853;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RBbDy367kWrGSBoXbYBN/Kvf/xHJKwcAv/IFsfAX7P8=;
        b=ggVxBAwOhMAyKtwUuHxPBIkpsn3PegUGxR/lNdyqywbk6YWT2ZwW/v0mBnoQZ49XJEkBwq
        2rPStXmHR/lpTwe1+hFadx1BuITRB0SYJSlVnjS527f4uQKRhY2yzX9ptTo4t5/tov43UX
        0Epp6MnzwQ6zWFZ6McLCJ6P45/533i4=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-_yDun0E2Ngq7uF0MIZ2jJg-1; Thu, 17 Mar 2022 12:00:52 -0400
X-MC-Unique: _yDun0E2Ngq7uF0MIZ2jJg-1
Received: by mail-io1-f69.google.com with SMTP id f11-20020a056602070b00b00645d08010fcso3403196iox.15
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Mar 2022 09:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=RBbDy367kWrGSBoXbYBN/Kvf/xHJKwcAv/IFsfAX7P8=;
        b=YcvnV/WREfypQuFUbKsQ+fPXncbcBr9ILavw5OrBuCq61ElV28uhHs2IgdH8hFz+tO
         z9IO1Nnn+ylyQoxcSe4neebxCSoMvay4t36yjXdCj/AAEurSBo+67YEn3n0gnK6vCOnY
         +AaWbpGWc1W4abMnQitPCjiWrcC+k/sXFHtnwbtbxZOEUnDAlBxGGkqPKv2kh16YHhHS
         o30qCcB/pPf45QED/mN71gsS3hmruck45ZHp7pfltzUnLYoGp4dCsKaumOBJHIl0pXnf
         CWIacvPdYY5dgePMhWEh+JYY06xKjpibu0AY3B6AB+275suS2YzKdjaUqVJKQseXpKs6
         iyFQ==
X-Gm-Message-State: AOAM532fVzQgT3mbiILnh2yHvAs3nJfvoJIHPN0M59gFgF5vEovLypui
        N0C20f0a9+SRqmXZA2kaAG+1p7+be8QusSwTtTy+cQJCI4rGGMHJbVLpqiOW//HQExS6M/W6Vvy
        snS1wfsbYcETIKJ4feRrEYdbgmOhA
X-Received: by 2002:a05:6e02:216f:b0:2c7:7a3f:2a94 with SMTP id s15-20020a056e02216f00b002c77a3f2a94mr2462961ilv.267.1647532851084;
        Thu, 17 Mar 2022 09:00:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxq6DeC5RvP84Jp8XIKwkiiRG7CXxw/wSac9zA/J5rHz7wKILVwB0AdOAiqXkXniBbu4npQaQ==
X-Received: by 2002:a05:6e02:216f:b0:2c7:7a3f:2a94 with SMTP id s15-20020a056e02216f00b002c77a3f2a94mr2462938ilv.267.1647532850763;
        Thu, 17 Mar 2022 09:00:50 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id r15-20020a056e0219cf00b002c77a3f2a85sm3677624ill.6.2022.03.17.09.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 09:00:50 -0700 (PDT)
Date:   Thu, 17 Mar 2022 10:00:49 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: adjust entry for header movement in
 hisilicon qm driver
Message-ID: <20220317100049.27d7a476.alex.williamson@redhat.com>
In-Reply-To: <20220316124224.29091-1-lukas.bulwahn@gmail.com>
References: <20220316124224.29091-1-lukas.bulwahn@gmail.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 16 Mar 2022 13:42:24 +0100
Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit ff5812e00d5e ("crypto: hisilicon/qm: Move the QM header to
> include/linux") moves drivers/crypto/hisilicon/qm.h to
> include/linux/hisi_acc_qm.h, but misses to adjust MAINTAINERS.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
> 
> Adjust the file entry in the HISILICON QM AND ZIP Controller DRIVER
> following this file movement.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Alex, please pick this minor clean-up on your -next tree on top of the
> commit above.
> 
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 845b36c0f0f5..963d7001f2ce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8852,9 +8852,9 @@ L:	linux-crypto@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/ABI/testing/debugfs-hisi-zip
>  F:	drivers/crypto/hisilicon/qm.c
> -F:	drivers/crypto/hisilicon/qm.h
>  F:	drivers/crypto/hisilicon/sgl.c
>  F:	drivers/crypto/hisilicon/zip/
> +F:	include/linux/hisi_acc_qm.h
>  
>  HISILICON ROCE DRIVER
>  M:	Wenpeng Liang <liangwenpeng@huawei.com>

Applied to vfio next branch for v5.18 with Shameer's R-b.  Thanks,

Alex

