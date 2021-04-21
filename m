Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF321C433B4
	for <kernel-janitors@archiver.kernel.org>; Wed, 21 Apr 2021 22:51:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD419613E6
	for <kernel-janitors@archiver.kernel.org>; Wed, 21 Apr 2021 22:51:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240271AbhDUWwS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 21 Apr 2021 18:52:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37912 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235481AbhDUWwS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Apr 2021 18:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619045504;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S2eln1RiXUGbh8l5mrppZibe/ezmLkuWu5Q7gl1yH1I=;
        b=iI8BYmBUiFQx0r+/8An0h/wGvXvBwZ/aqdxhwasn55E4CwV+x5p78g/fJRsW79IsmkeIkd
        6t2M+Ij7TLelF7Bu2MkkAR+jn5POKAajp2QIQhqApk7H7tGcsB40T6mltqPA9sdfSckgmz
        4itT12gyMOrmsXnqK8f1VhBiOO2c2tI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-kd-xcCRJM6KjHMqIGpOPVg-1; Wed, 21 Apr 2021 18:51:42 -0400
X-MC-Unique: kd-xcCRJM6KjHMqIGpOPVg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 699F4343A3;
        Wed, 21 Apr 2021 22:51:41 +0000 (UTC)
Received: from redhat.com (ovpn-114-21.phx2.redhat.com [10.3.114.21])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0637F5D747;
        Wed, 21 Apr 2021 22:51:40 +0000 (UTC)
Date:   Wed, 21 Apr 2021 16:51:40 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Kirti Wankhede <kwankhede@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, kvm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] vfio/mdev: remove unnecessary NULL check in
 mbochs_create()
Message-ID: <20210421165140.52e9083b@redhat.com>
In-Reply-To: <YIAowNYCOCNu+xhm@mwanda>
References: <YIAowNYCOCNu+xhm@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 21 Apr 2021 16:29:36 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This NULL check is no longer required because "type" now points to
> an element in a non-NULL array.

I think the mdpy change is correct too, but it's hard to verify from
this commit log that it was actually intended.  Can we note that change
as well?  Thanks,

Alex

> 
> Fixes: 3d3a360e570616 ("vfio/mbochs: Use mdev_get_type_group_id()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  samples/vfio-mdev/mbochs.c | 2 --
>  samples/vfio-mdev/mdpy.c | 3 +--
>  2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
> index 861c76914e76..881ef9a7296f 100644
> --- a/samples/vfio-mdev/mbochs.c
> +++ b/samples/vfio-mdev/mbochs.c
> @@ -513,8 +513,6 @@ static int mbochs_create(struct mdev_device *mdev)
>  	struct device *dev = mdev_dev(mdev);
>  	struct mdev_state *mdev_state;
>  
> -	if (!type)
> -		type = &mbochs_types[0];
>  	if (type->mbytes + mbochs_used_mbytes > max_mbytes)
>  		return -ENOMEM;
>  
> diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
> index f0c0e7209719..e889c1cf8fd1 100644
> --- a/samples/vfio-mdev/mdpy.c
> +++ b/samples/vfio-mdev/mdpy.c
> @@ -667,8 +667,7 @@ static ssize_t description_show(struct mdev_type *mtype,
>  		&mdpy_types[mtype_get_type_group_id(mtype)];
>  
>  	return sprintf(buf, "virtual display, %dx%d framebuffer\n",
> -		       type ? type->width  : 0,
> -		       type ? type->height : 0);
> +		       type->width, type->height);
>  }
>  static MDEV_TYPE_ATTR_RO(description);
>  

