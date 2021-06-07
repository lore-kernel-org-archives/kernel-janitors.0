Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE023C4743D
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 02:23:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B53F2611C0
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 02:23:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbhFGCZk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 6 Jun 2021 22:25:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45250 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230127AbhFGCZj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 6 Jun 2021 22:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623032628;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gKXQKEfV2Z4yTGR8/n9HJ/fY1JTpc1iMUdaLmNCWqcU=;
        b=VFyjAR/t3PW0eQWlze4oNRB1LmGYe83Ll0I8WzQThvhBXsC5oCjy594yjWdjt4M7yzNpdl
        bXjxoTm2EisAK7OSjVI7LrO2iLizRItaibdUobWNNEXuOgyFAnRNpB406wFSsB4mYv5mDi
        4o0NJAPAkyhzNVKLlOBPVuIawRWv67A=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-UsXfkggRPsu7NgUhVG_Xzw-1; Sun, 06 Jun 2021 22:23:47 -0400
X-MC-Unique: UsXfkggRPsu7NgUhVG_Xzw-1
Received: by mail-pf1-f200.google.com with SMTP id j206-20020a6280d70000b02902e9e02e1654so6965622pfd.6
        for <kernel-janitors@vger.kernel.org>; Sun, 06 Jun 2021 19:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gKXQKEfV2Z4yTGR8/n9HJ/fY1JTpc1iMUdaLmNCWqcU=;
        b=co4u013QTl8IuIFyybTUkqmvOSJuZZOrVeT1YUueWkeyPPawd9fAZR+D9580/t0inM
         KYJpA88bImgrFVgTWlHnYJ9bqSMDohKAyROosSzGwpUnQxqGS7r6AR7z0COBUNqgE/dp
         EqBD7MSBvkVpFCjZXjMCWIjoEAS6ssmZPgc3QGvqYlU2qxl8nduo0vguWWhPCqafdNDW
         EdeW7weWz4ZgU6srsF4j9/MtbfMPFA+vca8YPtyUZ1w8dbJc1VaRtjh2A5/4TMTQS1u3
         r6HGyELwQYmVG9zUaHzmltFhsOO0neJiPRB+9Wj2R9MiEnbgFzP41ZsORJ/D0dbwASMp
         hU7A==
X-Gm-Message-State: AOAM533whIRwRw+W0TxvEUPxJOjwnC1EZ3dGaJI+buAPnyk/q8YYMK5p
        fyqHK/ejfTa7v1jnXSoraPziEZBKAKaKKygwhjlSOz80eEL15qVBHFcSAtDuNfTjY44Wco+Vs6t
        Mi3MWOwgmbVk7cEd9qXxFC0fa4ldswIpKr+FJHC6PSFE8ypohxpUGZw7yeMWovAoeOpVc2oqY4D
        mbUB9L
X-Received: by 2002:a17:902:a5c4:b029:111:18bd:8b9a with SMTP id t4-20020a170902a5c4b029011118bd8b9amr7788427plq.80.1623032626637;
        Sun, 06 Jun 2021 19:23:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4hl64MAtqUwyJpFoEpAwj72OAst9tSIBLMe3jlFWSYqIDArB4IxgsQ4l52vekWbHlXbl3CQ==
X-Received: by 2002:a17:902:a5c4:b029:111:18bd:8b9a with SMTP id t4-20020a170902a5c4b029011118bd8b9amr7788408plq.80.1623032626311;
        Sun, 06 Jun 2021 19:23:46 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id p1sm2741244pfn.212.2021.06.06.19.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jun 2021 19:23:45 -0700 (PDT)
Subject: Re: [PATCH] vdpa: fix error code in vp_vdpa_probe()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Eli Cohen <elic@nvidia.com>,
        Stefano Garzarella <sgarzare@redhat.com>,
        virtualization@lists.linux-foundation.org,
        kernel-janitors@vger.kernel.org
References: <YLtyYE8TinOl3IhO@mwanda>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <696c510d-b9af-60a4-e517-b2f749a10f41@redhat.com>
Date:   Mon, 7 Jun 2021 10:23:38 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YLtyYE8TinOl3IhO@mwanda>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


ÔÚ 2021/6/5 ÏÂÎç8:47, Dan Carpenter Ð´µÀ:
> Return -ENOMEM if vp_modern_map_vq_notify() fails.  Currently it
> returns success.
>
> Fixes: 11d8ffed00b2 ("vp_vdpa: switch to use vp_modern_map_vq_notify()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/vdpa/virtio_pci/vp_vdpa.c | 1 +
>   1 file changed, 1 insertion(+)


Acked-by: Jason Wang <jasowang@redhat.com>

Thanks


>
> diff --git a/drivers/vdpa/virtio_pci/vp_vdpa.c b/drivers/vdpa/virtio_pci/vp_vdpa.c
> index c76ebb531212..e5d92db728d3 100644
> --- a/drivers/vdpa/virtio_pci/vp_vdpa.c
> +++ b/drivers/vdpa/virtio_pci/vp_vdpa.c
> @@ -442,6 +442,7 @@ static int vp_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   			vp_modern_map_vq_notify(mdev, i,
>   						&vp_vdpa->vring[i].notify_pa);
>   		if (!vp_vdpa->vring[i].notify) {
> +			ret = -ENOMEM;
>   			dev_warn(&pdev->dev, "Fail to map vq notify %d\n", i);
>   			goto err;
>   		}

