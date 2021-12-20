Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2ECAC433EF
	for <kernel-janitors@archiver.kernel.org>; Mon, 20 Dec 2021 23:18:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232907AbhLTXSF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 20 Dec 2021 18:18:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53190 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232898AbhLTXSD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 Dec 2021 18:18:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640042283;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dupHnr1Qrf5/2vVv3UmTvRv7dAC+oVN4XvKLAZ5rPaU=;
        b=W3LhIgSNORLJ34XDqmnl2UMyThhxboyl2sK66IEZlbdrgs32MZFiJVc2pxhzqvcUhbAqR9
        2bxLBED0q2j9MYoS2AXjK5AUNvpWZrUrR5xaUgTd1nVmcWf9W7EYUbJ3k8maRjk9v3Qtzm
        qGUR/4wgvZbI8GW+f1e/HHVGAyo9llY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-FUYafpi5OviGwVda7eYi7w-1; Mon, 20 Dec 2021 18:18:02 -0500
X-MC-Unique: FUYafpi5OviGwVda7eYi7w-1
Received: by mail-ed1-f70.google.com with SMTP id c19-20020a05640227d300b003f81c7154fbso8061325ede.7
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Dec 2021 15:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dupHnr1Qrf5/2vVv3UmTvRv7dAC+oVN4XvKLAZ5rPaU=;
        b=0WkEM+n1iZSfUwSvUSm3ewQIMqPVFXm8IWznqeV0Hw+raSyoXna9yHUDt8oN7rFPKF
         2oBjKsWQqkxXTwYiVSBO3t8ybZzmMxVn2VtSVAsvly2vJ3+npIkTcHljm6Q3pmiGIEV2
         Gnj5dcs0GrJvY1nc6A1HaKE6smtip7ScP6Yr9AKsuFsoQAgPORRMlfRgt0RizdLmScyg
         KOhbpLUlsccE4IML58eCKmDAjJ/v1SkKchut8iXDZKLMcuZn4bx94+yujCQVgzchbFs7
         VjisKdbu6SVaKzZl7s7qOlH+Sp/7j+5nx4xS/Gpn1WXXhglh1zTWPhZENdpTOIRCPk8/
         tckg==
X-Gm-Message-State: AOAM531qQyJxEFytSTLdzNeSqLYK+hkKvfMBPyFZIib0k9aXF3a6q1VB
        NM6nMox7EZ8DXsTW1HGZ54UHjIAyln/1TxTF8hvU/CvGeAPsqihu24apfucNrcWv3axbrtIJYLX
        uSf3aygDsArCytj55j5Rj0kVsx2h1
X-Received: by 2002:a05:6402:1e8a:: with SMTP id f10mr432444edf.52.1640042280878;
        Mon, 20 Dec 2021 15:18:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjQ1NiOLIUaKBrs0mEsvhRTd0VTcOiAycGdRQEwXY1ZWGNyFRTnIYiai77LgXzpCRFxu198Q==
X-Received: by 2002:a05:6402:1e8a:: with SMTP id f10mr432432edf.52.1640042280743;
        Mon, 20 Dec 2021 15:18:00 -0800 (PST)
Received: from redhat.com ([2.55.141.192])
        by smtp.gmail.com with ESMTPSA id z7sm137955edb.59.2021.12.20.15.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 15:18:00 -0800 (PST)
Date:   Mon, 20 Dec 2021 18:17:56 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: virtio_bt: fix an error code in probe()
Message-ID: <20211220181751-mutt-send-email-mst@kernel.org>
References: <20211215114644.GC14552@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215114644.GC14552@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Dec 15, 2021 at 02:46:45PM +0300, Dan Carpenter wrote:
> Return an error code if virtbt_open_vdev() fails.  Don't return success.
> 
> Fixes: 212a6e51a630 ("Bluetooth: virtio_bt: fix device removal")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> 
> This almost certainly goes through Michael's virt tree and not the
> Bluetooth tree.
> 
>  drivers/bluetooth/virtio_bt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/virtio_bt.c b/drivers/bluetooth/virtio_bt.c
> index 1dd734aef87b..f6d699fed139 100644
> --- a/drivers/bluetooth/virtio_bt.c
> +++ b/drivers/bluetooth/virtio_bt.c
> @@ -362,7 +362,8 @@ static int virtbt_probe(struct virtio_device *vdev)
>  	}
>  
>  	virtio_device_ready(vdev);
> -	if (virtbt_open_vdev(vbt))
> +	err = virtbt_open_vdev(vbt);
> +	if (err)
>  		goto open_failed;
>  
>  	return 0;
> -- 
> 2.20.1

