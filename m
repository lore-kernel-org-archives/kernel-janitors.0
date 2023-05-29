Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BDDC7EE2E
	for <kernel-janitors@archiver.kernel.org>; Mon, 29 May 2023 14:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbjE2OEl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 29 May 2023 10:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbjE2OEe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 29 May 2023 10:04:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E991A8
        for <kernel-janitors@vger.kernel.org>; Mon, 29 May 2023 07:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685368949;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zJ8lVkJGMAf7X6sgK7+SzlistNxfN3tza5OmhJom+fY=;
        b=Y1d51SjuWUwuzEjZ5mG/0xDJfZbbB6AN4cds61E9HDAYALyZ/mt+NEQEWHj7Cuxcoau345
        1fHnH+FbANsrN9stLgCXPNftY2be5uIuD/lq3/rJTiOBI/sNv+YzqpUpOQlxtTc0t9/vWa
        6cXTSP9FfHjG9nSQer0mXTjIYYKQ1uI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-JX474XN-OC2VLJkKcVO-Ug-1; Mon, 29 May 2023 10:02:28 -0400
X-MC-Unique: JX474XN-OC2VLJkKcVO-Ug-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-50a16ab50e6so2767390a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 29 May 2023 07:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685368947; x=1687960947;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zJ8lVkJGMAf7X6sgK7+SzlistNxfN3tza5OmhJom+fY=;
        b=fI+DIPZ+uDi7hSTMl48UXLHTtAeenFeYLpzGEsrrKOE3wpFLOOGsD9ySf4imOYv2Mb
         Yjs28h1bbiy9QLf0ZselsVltdrBbcsDOYgaDfpCKr5q9DRgpeOQmIo18X7/QB9sPivMK
         qaJMumrhgWRS/Q0t+M6/rn1KaaXDU++ZaMaOKEjlmEgWENJbbKhUwdoMqSm2GpRBxnjv
         HRBGgXm4sGZGQYn7o29QdNa7oynJj/08WmJrMLdhVPtcJa7pMuiWT3V4P9YrxVE9Sczk
         /RCSR77uBlnVpEB26ikA+90hTIc9mOehHhVeb2y5sFPeHzidUCKaSleT5Q4BMpzv7ewJ
         PV6w==
X-Gm-Message-State: AC+VfDywyABgP9ULOXxMDuYFZQnI4X4SJZaZwd8N16Cv04biSGvkA1Us
        Lpk0WJ/VY6peGEENNeZY1SF+82kKiiIvaxZ6FPzBYGnz8jk2GZM2uMD6B0gY8H7peq861gDy5fk
        CGpAYwfOJGb7vQ6BV9K7f3RCvIsod
X-Received: by 2002:aa7:ccd8:0:b0:514:a179:b151 with SMTP id y24-20020aa7ccd8000000b00514a179b151mr1610786edt.41.1685368947362;
        Mon, 29 May 2023 07:02:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ510QWjG+RFlHmeCrPdvlqvEtFovcewTXQ5zlrjDXHvEmH5MVjEwz12mTI4MyNmn0RyD1YbTg==
X-Received: by 2002:aa7:ccd8:0:b0:514:a179:b151 with SMTP id y24-20020aa7ccd8000000b00514a179b151mr1610778edt.41.1685368947089;
        Mon, 29 May 2023 07:02:27 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id ay1-20020a056402202100b005066cadcc54sm3115204edb.43.2023.05.29.07.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 07:02:26 -0700 (PDT)
Message-ID: <d03d78be-76e6-dff7-b11b-cac82e6eeedd@redhat.com>
Date:   Mon, 29 May 2023 16:02:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] scsi: virtio_scsi: Remove a useless function call
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-scsi@vger.kernel.org
References: <08740635cdb0f8293e57c557b22e048daae50961.1685345683.git.christophe.jaillet@wanadoo.fr>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <08740635cdb0f8293e57c557b22e048daae50961.1685345683.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 5/29/23 09:35, Christophe JAILLET wrote:
> 'inq_result' is known to be NULL. There is no point calling kfree().
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/scsi/virtio_scsi.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
> index 58498da9869a..bd5633667d01 100644
> --- a/drivers/scsi/virtio_scsi.c
> +++ b/drivers/scsi/virtio_scsi.c
> @@ -338,10 +338,8 @@ static int virtscsi_rescan_hotunplug(struct virtio_scsi *vscsi)
>   	int result, inquiry_len, inq_result_len = 256;
>   	char *inq_result = kmalloc(inq_result_len, GFP_KERNEL);
>   
> -	if (!inq_result) {
> -		kfree(inq_result);
> +	if (!inq_result)
>   		return -ENOMEM;
> -	}
>   
>   	shost_for_each_device(sdev, shost) {
>   		inquiry_len = sdev->inquiry_len ? sdev->inquiry_len : 36;

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

