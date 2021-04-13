Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46517C433B4
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Apr 2021 02:50:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BE6C6135B
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Apr 2021 02:50:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241586AbhDMCup (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Apr 2021 22:50:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27341 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238431AbhDMCup (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Apr 2021 22:50:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618282225;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YyE+pkrv5YpxkS266b/YlxpyGvd3ASdLwkFrSnEarAM=;
        b=DYa6yFG4o6IAg5JYQcSyV/RPOdwN0PtFTjTo6tWHwQmzXPGUCGO4L6EGaDBEDb/cphpg77
        c4nC71soAwdq7j64NOwzaQhUsgQ3Be1Gb4l5fLRumUxL8drgjcHzDkDsw57Mtjibn6ep8a
        E/d9w9a/yWdpgzLwfqHQUEcCksesA68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-vXD9VxVfMLC2zkix_baDKA-1; Mon, 12 Apr 2021 22:50:23 -0400
X-MC-Unique: vXD9VxVfMLC2zkix_baDKA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B73AB6D249;
        Tue, 13 Apr 2021 02:50:22 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-128.pek2.redhat.com [10.72.13.128])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A247C19D61;
        Tue, 13 Apr 2021 02:50:16 +0000 (UTC)
Subject: Re: [PATCH][next] vdpa/mlx5: Fix resource leak of mgtdev due to
 incorrect kfree
To:     Colin King <colin.king@canonical.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Parav Pandit <parav@nvidia.com>,
        virtualization@lists.linux-foundation.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210412162804.1628738-1-colin.king@canonical.com>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <fac15f54-2c25-0017-f92a-bec88a28dea5@redhat.com>
Date:   Tue, 13 Apr 2021 10:50:14 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210412162804.1628738-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


在 2021/4/13 上午12:28, Colin King 写道:
> From: Colin Ian King <colin.king@canonical.com>
>
> Static analysis is reporting a memory leak on mgtdev, it appears
> that the wrong object is being kfree'd. Fix this by kfree'ing
> mgtdev rather than mdev.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: c8a2d4c73e70 ("vdpa/mlx5: Enable user to add/delete vdpa device")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/vdpa/mlx5/net/mlx5_vnet.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> index 10c5fef3c020..25533db01f5f 100644
> --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> @@ -2089,7 +2089,7 @@ static int mlx5v_probe(struct auxiliary_device *adev,
>   	return 0;
>   
>   reg_err:
> -	kfree(mdev);
> +	kfree(mgtdev);
>   	return err;
>   }
>   


Acked-by: Jason Wang <jasowang@redhat.com>


