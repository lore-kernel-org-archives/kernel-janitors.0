Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976A7C7EE29
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Jun 2023 12:07:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235730AbjFBMHi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 2 Jun 2023 08:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235686AbjFBMHM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 2 Jun 2023 08:07:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2591B8
        for <kernel-janitors@vger.kernel.org>; Fri,  2 Jun 2023 05:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685707586;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=r3eog2jJ180dc325mkmwjwsvnRZJ4iih8R1ZCYZSotw=;
        b=Rl3j/R+Bm4gPVp/56VMMFLpas+Sqg9tE4bHDRmeTKhoIkd32GndZY+5X00IDn7Vaskff/y
        nzn0bJi7RayrHPmzLAhoZ+WDNB48nM+RGXxz7QXs+fYKYxDaoLzxUfrFV4pQZ4rDVCAv9b
        uhbln82g2CucncyYC1+qM5BOHIG+3pQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-rPi9D3suP8md619_3IwQEA-1; Fri, 02 Jun 2023 08:06:20 -0400
X-MC-Unique: rPi9D3suP8md619_3IwQEA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f603b8eb61so11566735e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 02 Jun 2023 05:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685707579; x=1688299579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3eog2jJ180dc325mkmwjwsvnRZJ4iih8R1ZCYZSotw=;
        b=UG/OcPZM2Wv6twBq90oxpQr+kjLtTEM2cwgsRxH+WSICG9MQJaZXpTDlLF3dmbNWD6
         R/ITpi+BwmuZkhs99MD1dfbisqg2kZWDLHYGgnOD16yUU9RqevX4yIPLh2bXxQMgdLFi
         w15NQMCNRyF0g400U+JllqU/4o18csRDRc5Oh3LiMuWbRmLEraNYkOFItQA6cUCVavFK
         pO/pqoj52sj4I0yVb/sKNaGKPEBz74/a85UeWW5Ba5FY7iAGyjb57drc/aPT5e3azoge
         RMpkF/XvvUxHH5B/2BhuUQ+v7IMAweftUgzZTYUpgfnbrtl87YCeCbqEq4wIaEd4r4lN
         z26w==
X-Gm-Message-State: AC+VfDwrFuyf6gMpom2Hx8iq/LL2a5ozqSyFxg4IIcK7rajHBtnii6nX
        WkB0iTkqOW8Ay6WACmGxLmRZX+HCJbrwd41g2wIpGUdlhnSzKcYOu6cDWoYioIx/ZgYOeZROQir
        hOFliO0/g6BIXRLTzLjqkeWf0xIxy
X-Received: by 2002:a1c:6a15:0:b0:3f6:89e:2716 with SMTP id f21-20020a1c6a15000000b003f6089e2716mr1982208wmc.33.1685707579182;
        Fri, 02 Jun 2023 05:06:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5208596q5G59Oc8rJfdmFIY+/Vvnx/JmMv3Fx9NDu17J8RLqtPrBw/B/kjXPHSnF2ttJ7m/A==
X-Received: by 2002:a1c:6a15:0:b0:3f6:89e:2716 with SMTP id f21-20020a1c6a15000000b003f6089e2716mr1982190wmc.33.1685707578902;
        Fri, 02 Jun 2023 05:06:18 -0700 (PDT)
Received: from redhat.com ([2.55.4.169])
        by smtp.gmail.com with ESMTPSA id y20-20020a05600c365400b003f60a446fe5sm1760836wmq.29.2023.06.02.05.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 05:06:18 -0700 (PDT)
Date:   Fri, 2 Jun 2023 08:06:15 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Jason Wang <jasowang@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH] scsi: virtio_scsi: Remove a useless function call
Message-ID: <20230602080607-mutt-send-email-mst@kernel.org>
References: <08740635cdb0f8293e57c557b22e048daae50961.1685345683.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08740635cdb0f8293e57c557b22e048daae50961.1685345683.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 29, 2023 at 09:35:08AM +0200, Christophe JAILLET wrote:
> 'inq_result' is known to be NULL. There is no point calling kfree().
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  drivers/scsi/virtio_scsi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
> index 58498da9869a..bd5633667d01 100644
> --- a/drivers/scsi/virtio_scsi.c
> +++ b/drivers/scsi/virtio_scsi.c
> @@ -338,10 +338,8 @@ static int virtscsi_rescan_hotunplug(struct virtio_scsi *vscsi)
>  	int result, inquiry_len, inq_result_len = 256;
>  	char *inq_result = kmalloc(inq_result_len, GFP_KERNEL);
>  
> -	if (!inq_result) {
> -		kfree(inq_result);
> +	if (!inq_result)
>  		return -ENOMEM;
> -	}
>  
>  	shost_for_each_device(sdev, shost) {
>  		inquiry_len = sdev->inquiry_len ? sdev->inquiry_len : 36;
> -- 
> 2.34.1

