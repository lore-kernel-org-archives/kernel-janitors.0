Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBEBDC433F5
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 May 2022 10:45:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234258AbiEWKpI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 May 2022 06:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234236AbiEWKpH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 May 2022 06:45:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5C7AB4991A
        for <kernel-janitors@vger.kernel.org>; Mon, 23 May 2022 03:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653302705;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ro0AbdD3qiV64NTFTkLB8uvz3K/Lp6OAyllXm8fL7es=;
        b=AiXnCWdcidetuB/cq9oQUHnGGl+aJ7M95HN25OhqQ/+gYrMXyLImvaUdxML2fuw4HcMrhC
        xyEtCrEkkadRq6r2V/fmOolt7OC+El5vntf9NUzg3QZ7TGu5DzbLwRNGefRbthsc1uCSzJ
        hY3A4GO6RoqTH81UIOewClG+6dOK8nI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-g4jBUKdFMDijhrTZ6Bf5Sw-1; Mon, 23 May 2022 06:45:04 -0400
X-MC-Unique: g4jBUKdFMDijhrTZ6Bf5Sw-1
Received: by mail-wm1-f71.google.com with SMTP id e9-20020a05600c4e4900b00394779649b1so10381403wmq.3
        for <kernel-janitors@vger.kernel.org>; Mon, 23 May 2022 03:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ro0AbdD3qiV64NTFTkLB8uvz3K/Lp6OAyllXm8fL7es=;
        b=3B3UCV4JUJCt9pmbVQWWWEukw1peVrVCvVdUnpjEpsMQkk+TsaNqjcwb7rHNdCTHjt
         sxJkeyk9b91xKwF7J2gum4eK+LPq+NC/5l+4UIgGtXJzLVv3aZxg7Z++Z97O0ZCSTgQL
         Ow9+CPgL5oSO6A47KNqm2emp2ihFKUUnfbkESmMw9Bt5gsLYObKQt0ukwGF+QZ8rnDgg
         NvzYHn2Fl5yuSHcdZqXFim3wJsiYRIh/wmBeOwJHV366Rz2HspAQtUIger4bsCf6c37s
         aP+UWnfCZB2dE5S6ZY50IW7E2lcbyw1YfxZt6fbVIXSeg+9tr+f6tMb5a2w04VoKIlni
         5Rrw==
X-Gm-Message-State: AOAM531Wk42giJO6QY3pgP64AVk9C3+fV2Nx6+mafSNQSogHQNPZyvie
        iqQCVmKum6WDigmc7S9iBAvrKrHoQBVIwxs7uP0Z5XT3+E3CSYYUe3tkc78cQ4cdTNVjWQbu42m
        2SXiJgaqBjMqRim/tVHPkAKBzuZS0
X-Received: by 2002:a5d:6d8f:0:b0:20c:7fb7:d59c with SMTP id l15-20020a5d6d8f000000b0020c7fb7d59cmr19553214wrs.77.1653302701918;
        Mon, 23 May 2022 03:45:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqmvkqQTTuxAVZdOZ/+3TrYKOlXX86OeWQQ0yzjlLLs+0xsSNUd2ZLXvr3yj3HjivcPxFqLg==
X-Received: by 2002:a5d:6d8f:0:b0:20c:7fb7:d59c with SMTP id l15-20020a5d6d8f000000b0020c7fb7d59cmr19553190wrs.77.1653302701675;
        Mon, 23 May 2022 03:45:01 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-16.business.telecomitalia.it. [87.12.25.16])
        by smtp.gmail.com with ESMTPSA id m10-20020adfc58a000000b0020e63ab5d78sm9696809wrg.26.2022.05.23.03.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 03:45:01 -0700 (PDT)
Date:   Mon, 23 May 2022 12:44:58 +0200
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Gautam Dawar <gautam.dawar@xilinx.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        kernel-janitors@vger.kernel.org, kvm@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH] vhost-vdpa: return -EFAULT on copy_to_user() failure
Message-ID: <20220523104458.exaf2zb3lua76ibf@sgarzare-redhat>
References: <YotG1vXKXXSayr63@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YotG1vXKXXSayr63@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 23, 2022 at 11:33:26AM +0300, Dan Carpenter wrote:
>The copy_to_user() function returns the number of bytes remaining to be
>copied.  However, we need to return a negative error code, -EFAULT, to
>the user.
>
>Fixes: 87f4c217413a ("vhost-vdpa: introduce uAPI to get the number of virtqueue groups")
>Fixes: e96ef636f154 ("vhost-vdpa: introduce uAPI to get the number of address spaces")
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>---
> drivers/vhost/vdpa.c | 8 +++++---
> 1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
>index 3e86080041fc..935a1d0ddb97 100644
>--- a/drivers/vhost/vdpa.c
>+++ b/drivers/vhost/vdpa.c
>@@ -609,11 +609,13 @@ static long vhost_vdpa_unlocked_ioctl(struct file *filep,
> 		r = vhost_vdpa_get_vring_num(v, argp);
> 		break;
> 	case VHOST_VDPA_GET_GROUP_NUM:
>-		r = copy_to_user(argp, &v->vdpa->ngroups,
>-				 sizeof(v->vdpa->ngroups));
>+		if (copy_to_user(argp, &v->vdpa->ngroups,
>+				 sizeof(v->vdpa->ngroups)))
>+			r = -EFAULT;
> 		break;
> 	case VHOST_VDPA_GET_AS_NUM:
>-		r = copy_to_user(argp, &v->vdpa->nas, sizeof(v->vdpa->nas));
>+		if (copy_to_user(argp, &v->vdpa->nas, sizeof(v->vdpa->nas)))
>+			r = -EFAULT;
> 		break;
> 	case VHOST_SET_LOG_BASE:
> 	case VHOST_SET_LOG_FD:
>-- 
>2.35.1
>
>_______________________________________________
>Virtualization mailing list
>Virtualization@lists.linux-foundation.org
>https://lists.linuxfoundation.org/mailman/listinfo/virtualization
>

