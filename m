Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A347DC43334
	for <kernel-janitors@archiver.kernel.org>; Tue,  5 Jul 2022 03:15:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234260AbiGEDPQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 4 Jul 2022 23:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233898AbiGEDPP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 Jul 2022 23:15:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7F1FDEE13
        for <kernel-janitors@vger.kernel.org>; Mon,  4 Jul 2022 20:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656990912;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MPiLYuaQHJ/dNIyImBUJeFklEe+TyW/wfcZITbRD1eI=;
        b=YI2rSS0aZkJKff79sKa8cJsbhM9xSs5ZFvATUpJh9Y43HKEL7Xr2bw4kk0QNw8RfJ1b61i
        5SouEEYvZDnacIOGuaeyhmUhu+oQoNugMNB3FDYFoH0hTlhjpSUpCrVB096fSexxyUeXT4
        Z7Okt2y8wgOSyr7aHc2hKdVY7S+/lvk=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-upAf-EDPMWqKbkqWgMRJcg-1; Mon, 04 Jul 2022 23:15:11 -0400
X-MC-Unique: upAf-EDPMWqKbkqWgMRJcg-1
Received: by mail-lf1-f69.google.com with SMTP id o7-20020a056512230700b004810a865709so3450056lfu.3
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Jul 2022 20:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MPiLYuaQHJ/dNIyImBUJeFklEe+TyW/wfcZITbRD1eI=;
        b=H7tJO7a0cnG/b/Q+lOsgGxjNpDx2e7fhEzIS8K0MgeCbu2Q9LYNhktna6JAaaH2Iok
         v1YTv4RaMzW8swAeLgKev6N9yYkPuj0Vbyil2EvyI2Yduf5mummrBqHhXnwKx60bev8N
         dTwZZEmggfpKT1QLHIcWiVBJRKZF9fwryQfqE7AAdLcmmTsWy9/EgpoEi04Zd/hbb0Zg
         2OvnfkA4RCesGEr3vfnV2DJ/W4ABvHYJ6RljElcscXGBlArkVjuqo1YH4R9wHEEcEjuA
         YuXk1eXJoeybjLSAbOalYuoHJX9s5eT6ud+It9SZmYHxi9bpnWoXu/Qju8n/+HSpXUyj
         PC3g==
X-Gm-Message-State: AJIora+L104axbmLPaOOVA4LamEYnZTI+gxg/VHHVLH2vz4ZML4yW6oa
        Fp5lKQ9HgImjOHrkFWjIvN7DeqzoTG5DV84lc9PKfgeJoowSHeAs/RGuj120RgJqxExWJJfkeFd
        vCBNXUaE21ypfdL1f+xNiboei0cY+DReYIqOcf2lBza4X
X-Received: by 2002:a05:6512:3f0f:b0:47f:6f89:326 with SMTP id y15-20020a0565123f0f00b0047f6f890326mr19728903lfa.124.1656990909242;
        Mon, 04 Jul 2022 20:15:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tza1pmpMAWjNhoieZO4QqKWL1/YPqUOvpoVjPyKy0BY4OsaLw+4a3jzDRxrl7JkPP/xB1zCm2drjENV6/171U=
X-Received: by 2002:a05:6512:3f0f:b0:47f:6f89:326 with SMTP id
 y15-20020a0565123f0f00b0047f6f890326mr19728895lfa.124.1656990909097; Mon, 04
 Jul 2022 20:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220704190456.593464-1-colin.i.king@gmail.com>
In-Reply-To: <20220704190456.593464-1-colin.i.king@gmail.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Tue, 5 Jul 2022 11:14:58 +0800
Message-ID: <CACGkMEsEZjmG8JV6hz4=a=hWLFxeGom6sGs7LSYzTZnoC-M7jQ@mail.gmail.com>
Subject: Re: [PATCH] vDPA/ifcvf: remove duplicated assignment to pointer cfg
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     "Michael S . Tsirkin" <mst@redhat.com>,
        Zhu Lingshan <lingshan.zhu@intel.com>,
        virtualization <virtualization@lists.linux-foundation.org>,
        kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 5, 2022 at 3:05 AM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> The assignment to pointer cfg is duplicated, the second assignment
> is redundant and can be removed.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  drivers/vdpa/ifcvf/ifcvf_base.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/vdpa/ifcvf/ifcvf_base.c b/drivers/vdpa/ifcvf/ifcvf_base.c
> index 48c4dadb0c7c..47b94091733c 100644
> --- a/drivers/vdpa/ifcvf/ifcvf_base.c
> +++ b/drivers/vdpa/ifcvf/ifcvf_base.c
> @@ -29,7 +29,6 @@ u16 ifcvf_set_config_vector(struct ifcvf_hw *hw, int vector)
>  {
>         struct virtio_pci_common_cfg __iomem *cfg = hw->common_cfg;
>
> -       cfg = hw->common_cfg;
>         vp_iowrite16(vector,  &cfg->msix_config);
>
>         return vp_ioread16(&cfg->msix_config);
> --
> 2.35.3
>

